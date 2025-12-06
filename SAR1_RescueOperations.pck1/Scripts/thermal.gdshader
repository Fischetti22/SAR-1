shader_type canvas_item;

// Full-screen thermal post-process
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

// 0.0 = normal view, 1.0 = full thermal
uniform float thermal_strength : hint_range(0.0, 1.0) = 0.0;
uniform float background_cool = 0.15;

// Palette colors
uniform vec3 heat_low  = vec3(0.02, 0.05, 0.25); // deep blue
uniform vec3 heat_mid  = vec3(0.00, 0.60, 0.40); // teal/green
uniform vec3 heat_high = vec3(0.95, 0.80, 0.10); // yellow
uniform vec3 heat_hot  = vec3(1.00, 0.25, 0.05); // orange/red

void fragment() {
    // read the screen
    vec4 src = texture(SCREEN_TEXTURE, SCREEN_UV);

    // luminance (brightness) and slight contrast boost
    float lum = dot(src.rgb, vec3(0.299, 0.587, 0.114));
    lum = pow(clamp(lum, 0.0, 1.0), 0.6);

    // cool down bright sky a bit so it doesn't dominate
    lum = mix(lum, background_cool, step(0.95, src.r));

    // subtle noise
    float noise = fract(sin(dot(SCREEN_UV.xy, vec2(12.9898, 78.233))) * 43758.5453);
    lum += (noise - 0.5) * 0.05;
    lum = clamp(lum, 0.0, 1.0);

    // map brightness to thermal palette
    vec3 thermal_color;
    if (lum < 0.33) {
        thermal_color = mix(heat_low, heat_mid, lum / 0.33);
    } else if (lum < 0.66) {
        thermal_color = mix(heat_mid, heat_high, (lum - 0.33) / 0.33);
    } else {
        thermal_color = mix(heat_high, heat_hot, (lum - 0.66) / 0.34);
        thermal_color += vec3(0.2, 0.05, 0.0); // little extra “hot” pop
    }

    // blend original → thermal based on thermal_strength
    vec3 final_col = mix(src.rgb, thermal_color, thermal_strength);
    COLOR = vec4(final_col, src.a);
}
