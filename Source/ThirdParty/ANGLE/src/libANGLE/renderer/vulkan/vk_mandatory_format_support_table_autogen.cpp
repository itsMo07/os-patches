// GENERATED FILE - DO NOT EDIT.
// Generated by gen_vk_mandatory_format_support_table.py using data from
// vk_mandatory_format_support_data.json and the vk.xml file situated at
// /third_party/vulkan-validation-layers/src/scripts/vk.xml
//
// Copyright 2019 The ANGLE Project Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// vk_mandatory_format_support_table_autogen.cpp:
//   Queries for full Vulkan mandatory format support information based on VK format.

#include "libANGLE/renderer/vulkan/vk_format_utils.h"

using namespace angle;

namespace rx
{

namespace vk
{

namespace
{
static_assert(185 == kNumVkFormats, "Update kNumVkFormats");
constexpr std::array<VkFormatProperties, kNumVkFormats> kFormatProperties = {{

    /* VK_FORMAT_UNDEFINED */
    {0, 0, 0},
    /* VK_FORMAT_R4G4_UNORM_PACK8 */
    {0, 0, 0},
    /* VK_FORMAT_R4G4B4A4_UNORM_PACK16 */
    {0, 0, 0},
    /* VK_FORMAT_B4G4R4A4_UNORM_PACK16 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     0},
    /* VK_FORMAT_R5G6B5_UNORM_PACK16 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     0},
    /* VK_FORMAT_B5G6R5_UNORM_PACK16 */
    {0, 0, 0},
    /* VK_FORMAT_R5G5B5A1_UNORM_PACK16 */
    {0, 0, 0},
    /* VK_FORMAT_B5G5R5A1_UNORM_PACK16 */
    {0, 0, 0},
    /* VK_FORMAT_A1R5G5B5_UNORM_PACK16 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     0},
    /* VK_FORMAT_R8_UNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8_SNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8_SRGB */
    {0, 0, 0},
    /* VK_FORMAT_R8G8_UNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8_SNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8_SRGB */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_UNORM */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_SNORM */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8_SRGB */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_UNORM */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_SNORM */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_SINT */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8_SRGB */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8A8_UNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8B8A8_SNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8B8A8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8A8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R8G8B8A8_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8B8A8_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R8G8B8A8_SRGB */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     0},
    /* VK_FORMAT_B8G8R8A8_UNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_B8G8R8A8_SNORM */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8A8_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8A8_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8A8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8A8_SINT */
    {0, 0, 0},
    /* VK_FORMAT_B8G8R8A8_SRGB */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     0},
    /* VK_FORMAT_A8B8G8R8_UNORM_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A8B8G8R8_SNORM_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A8B8G8R8_USCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A8B8G8R8_SSCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A8B8G8R8_UINT_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A8B8G8R8_SINT_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A8B8G8R8_SRGB_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     0},
    /* VK_FORMAT_A2R10G10B10_UNORM_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2R10G10B10_SNORM_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2R10G10B10_USCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2R10G10B10_SSCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2R10G10B10_UINT_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2R10G10B10_SINT_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2B10G10R10_UNORM_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A2B10G10R10_SNORM_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2B10G10R10_USCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2B10G10R10_SSCALED_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_A2B10G10R10_UINT_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_A2B10G10R10_SINT_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_R16_UNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16_SNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16_UNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16G16_SNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16G16_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16B16_UNORM */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_SNORM */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16A16_UNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16G16B16A16_SNORM */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R16G16B16A16_USCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16A16_SSCALED */
    {0, 0, 0},
    /* VK_FORMAT_R16G16B16A16_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16B16A16_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R16G16B16A16_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT},
    /* VK_FORMAT_R32_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT |
         VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT | VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT},
    /* VK_FORMAT_R32_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32_UINT */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32_SINT */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32_SFLOAT */
    {0, 0, VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32A32_UINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32A32_SINT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R32G32B32A32_SFLOAT */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT | VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT |
         VK_FORMAT_FEATURE_BLIT_DST_BIT,
     VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT | VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT |
         VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_R64_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R64_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R64_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64A64_UINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64A64_SINT */
    {0, 0, 0},
    /* VK_FORMAT_R64G64B64A64_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_B10G11R11_UFLOAT_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT},
    /* VK_FORMAT_E5B9G9R9_UFLOAT_PACK32 */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
     0},
    /* VK_FORMAT_D16_UNORM */
    {0,
     VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT | VK_FORMAT_FEATURE_BLIT_SRC_BIT |
         VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT,
     0},
    /* VK_FORMAT_X8_D24_UNORM_PACK32 */
    {0, 0, 0},
    /* VK_FORMAT_D32_SFLOAT */
    {0, 0, 0},
    /* VK_FORMAT_S8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_D16_UNORM_S8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_D24_UNORM_S8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_D32_SFLOAT_S8_UINT */
    {0, 0, 0},
    /* VK_FORMAT_BC1_RGB_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC1_RGB_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC1_RGBA_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC1_RGBA_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC2_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC2_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC3_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC3_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC4_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC4_SNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC5_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC5_SNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC6H_UFLOAT_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC6H_SFLOAT_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC7_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_BC7_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_EAC_R11_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_EAC_R11_SNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_EAC_R11G11_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_EAC_R11G11_SNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_4x4_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_4x4_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_5x4_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_5x4_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_5x5_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_5x5_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_6x5_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_6x5_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_6x6_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_6x6_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x5_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x5_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x6_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x6_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x8_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_8x8_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x5_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x5_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x6_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x6_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x8_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x8_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x10_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_10x10_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_12x10_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_12x10_SRGB_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_12x12_UNORM_BLOCK */
    {0, 0, 0},
    /* VK_FORMAT_ASTC_12x12_SRGB_BLOCK */
    {0, 0, 0}}};
}  // anonymous namespace

const VkFormatProperties &GetMandatoryFormatSupport(VkFormat vkFormat)
{
    ASSERT(static_cast<uint64_t>(vkFormat) < sizeof(kFormatProperties));
    return kFormatProperties[vkFormat];
}

}  // namespace vk

}  // namespace rx
