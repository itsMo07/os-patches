/* TwAttribute.vala
 *
 * Copyright (C) 2015  Daniel Espinosa <esodan@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Daniel Espinosa <esodan@gmail.com>
 */

using Gee;

public class GXml.TwNamespace : GXml.TwNode, GXml.Namespace
{
  private string _uri = null;
  private string _prefix = null;
  public TwNamespace (GXml.Document d, string uri, string? prefix)
    requires (d is TwDocument)
  {
    _doc = d;
    ((TwDocument) document).tw = ((TwDocument) d).tw;
    _uri = uri;
    _prefix = prefix;
  }
  // GXml.Namespace
  public string uri { get { return _uri; } }
  public string @prefix { get { return _prefix; } }
}
