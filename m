Return-Path: <linux-i2c+bounces-3394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E88BB239
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF7A2839B0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7773A1586DB;
	Fri,  3 May 2024 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DNUkSqts"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B135541A80;
	Fri,  3 May 2024 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760042; cv=none; b=a3Mp31wRLkH4uGmaSRGiUAizhNkLhYhohUYoyEk5gZFmYWKXXYX8h2e8DtbPWLQbDgzcUbvrELxSm6pxEjLGxqKAESKWcQtd2ICealce0tKstqbKHDy1e+FqapLo/O6jzAjyb4watBWuStNxhJn0cxeeJM8Aj3ez5rZaBhLYuPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760042; c=relaxed/simple;
	bh=5krfrUCEeWficu1QJGsQsOe283vA8jy1feYZfvpZZI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOmXH16E/KXOu5Taij+kOM/GoE0I1ye3GvjM/rr/3mFQP5a/aX6xaNX2Fjc5u9uLCjxHRK+v0fpFXWplvBMXehVg/Jnj0XKC3Pymzh6dCp+H/4/u25v5H+yX6p9nc3FQRRnoyStMeTMyeBIIIRzI6foE0tHTfc+iqtxBJSDvgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DNUkSqts; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1DBB620B2C82;
	Fri,  3 May 2024 11:13:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DBB620B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714760039;
	bh=t+bej/Nszfp4Y3aAKK+ve+PXcHDiGLvMwGoKGwruaU0=;
	h=From:To:Cc:Subject:Date:From;
	b=DNUkSqtsm6b3XI7FuFq/j+HJpnUQJ32mAJ++/DwNJ3GGcuMwqkilZaB6IiZlNPSmm
	 ldOTvkNccJ4qVk3MI2EkzRUpVxeU8sfwD6q5LTxBNrYdg9CFW+jmdjvWvwGxkImQR7
	 ulzhaJogqcXmtU4cfYAaVycpjIavI6G7SrciLi7M=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v2 00/12] Make I2C terminology more inclusive for I2C Algobit and consumers
Date: Fri,  3 May 2024 18:13:21 +0000
Message-Id: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of the
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

Please chime in with your opinions and suggestions.

This series is based on 3d25a941ea50 ("Merge tag 'block-6.9-20240503' of git://git.kernel.dk/linux")

[1]:
https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
----

changelog:
v1->v2:
- v1 link: https://lore.kernel.org/all/20240430173812.1423757-1-eahariha@linux.microsoft.com/ 
- Switch to specification verbiage master->controller, slave->target,
  drop usage of host/client [Thomas]
- Pick up Reviewed-bys and Acked-bys from Rodrigo, Zhi, and Thomas [gma500, i915]
- Fix up some straggler master/slave terms in amdgpu, cx25821, ivtv,
  cx23885

v0->v1:
- v0 link: https://lore.kernel.org/all/20240329170038.3863998-1-eahariha@linux.microsoft.com/
- Drop drivers/infiniband patches [Leon, Dennis]
- Switch to specification verbiage master->controller, slave->target,
  drop usage of client [Andi, Ville, Jani, Christian]
- Add I3C specification version in commit messages [Andi]
- Pick up Reviewed-bys from Martin and Simon [sfc]
- Drop i2c/treewide patch to make this series independent from Wolfram's
  ([1]) [Wolfram]
- Split away drm/nouveau patch to allow expansion into non-I2C
  non-inclusive terms
----

Easwar Hariharan (12):
  drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
  drm/gma500: Make I2C terminology more inclusive
  drm/i915: Make I2C terminology more inclusive
  media: au0828: Make I2C terminology more inclusive
  media: cobalt: Make I2C terminology more inclusive
  media: cx18: Make I2C terminology more inclusive
  media: cx25821: Make I2C terminology more inclusive
  media: ivtv: Make I2C terminology more inclusive
  media: cx23885: Make I2C terminology more inclusive
  sfc: falcon: Make I2C terminology more inclusive
  fbdev/smscufx: Make I2C terminology more inclusive
  fbdev/viafb: Make I2C terminology more inclusive

 .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 ++---
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
 .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
 .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
 .../display/include/grph_object_ctrl_defs.h   |  2 +-
 drivers/gpu/drm/amd/include/atombios.h        |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++--------
 .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
 .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
 .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
 .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 ++---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  2 +-
 drivers/gpu/drm/gma500/intel_bios.c           | 22 +++++++-------
 drivers/gpu/drm/gma500/intel_bios.h           |  4 +--
 drivers/gpu/drm/gma500/intel_gmbus.c          |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h              |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h        |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  4 +--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       | 26 ++++++++--------
 drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
 drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
 drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../gpu/drm/i915/display/intel_display_core.h |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
 drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
 drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
 drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
 drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
 drivers/gpu/drm/radeon/atombios.h             | 16 +++++-----
 drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c       | 28 ++++++++---------
 drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
 drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
 drivers/media/pci/cobalt/cobalt-i2c.c         |  6 ++--
 drivers/media/pci/cx18/cx18-av-firmware.c     |  8 ++---
 drivers/media/pci/cx18/cx18-cards.c           |  6 ++--
 drivers/media/pci/cx18/cx18-cards.h           |  4 +--
 drivers/media/pci/cx18/cx18-gpio.c            |  6 ++--
 drivers/media/pci/cx23885/cx23885-core.c      |  6 ++--
 drivers/media/pci/cx23885/cx23885-f300.c      |  8 ++---
 drivers/media/pci/cx23885/cx23885-i2c.c       |  6 ++--
 drivers/media/pci/cx23885/cx23885.h           |  2 +-
 drivers/media/pci/cx25821/cx25821-core.c      |  2 +-
 drivers/media/pci/cx25821/cx25821-i2c.c       |  6 ++--
 .../media/pci/cx25821/cx25821-medusa-video.c  |  2 +-
 drivers/media/pci/cx25821/cx25821.h           |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c             | 20 ++++++-------
 drivers/media/usb/au0828/au0828-i2c.c         |  4 +--
 drivers/media/usb/au0828/au0828-input.c       |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c      |  2 +-
 drivers/video/fbdev/smscufx.c                 |  4 +--
 drivers/video/fbdev/via/chip.h                |  8 ++---
 drivers/video/fbdev/via/dvi.c                 | 24 +++++++--------
 drivers/video/fbdev/via/lcd.c                 |  6 ++--
 drivers/video/fbdev/via/via_aux.h             |  2 +-
 drivers/video/fbdev/via/via_i2c.c             | 12 ++++----
 drivers/video/fbdev/via/vt1636.c              |  6 ++--
 79 files changed, 321 insertions(+), 321 deletions(-)


base-commit: 3d25a941ea5013b552b96330c83052ccace73a48
-- 
2.34.1


