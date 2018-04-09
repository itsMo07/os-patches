/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 0; tab-width: 2 -*- */
/* ObjectModel.vala
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

/**
 * DOM1 Interface for XML Processing Instruction sections.
 */
[Version (deprecated = true, deprecated_since = "0.18", replacement = "GXml.DomProcessingInstruction")]
public interface GXml.ProcessingInstruction : Object, GXml.Node
{
  /**
   * The target for the processing instruction, like "xml-stylesheet".
   */
  public abstract string target  { owned get; }
  /**
   * The data used by the target, like {{{href="style.xsl" type="text/xml"}}}
   */
  public abstract string data { owned get; set; }
}
