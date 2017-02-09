/*
 Copyright (c) 2017 yvt

 This file is part of OpenSpades.

 OpenSpades is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 OpenSpades is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with OpenSpades.  If not, see <http://www.gnu.org/licenses/>.

 */

uniform sampler2D u_Texture;

varying vec4 v_Color;
varying vec2 v_TextureCoordinate;

void main() {
    vec4 color = texture2D(u_Texture, v_TextureCoordinate);
    color.xyz *= color.xyz; // sRGB to linear approx conversion TODO: use hardware acceleration!
    color.xyz *= color.w; // alpha premultiply
    color *= v_Color;
    gl_FragColor = color;
}
