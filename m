Return-Path: <linux-i2c+bounces-4870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F123F92DF7A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806441F2200F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5C5FB9B;
	Thu, 11 Jul 2024 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="m2E39IdP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A4442042;
	Thu, 11 Jul 2024 05:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675690; cv=none; b=Q0vdqqShPIez8RwfmgUNpLNfQ8qlbFlnEcvPLLFnOTvER6WyhJJRz/Pf1INRf5BD8FpPdXhFBbrCOMo0VEv3Y0rEYR1iHBIsY908BRdn6TiS+zvKcG4jksh5KmMtELs9JPQdkxeP4B9A/B0+VWY1qZ2BPZ/YYZNQYKHv/ACBvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675690; c=relaxed/simple;
	bh=9wRMpcR2MTSNEmVYFkWaKPhYyo8CtH0UOqW5Xg3dUQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h9m40L95RF6YPH4rOwVtXdnFEebIxO1DIuEH7iOZYYEc4PyuLXbDGSbsHArKAL9PMpgdN9nrGfQZhuMJrArXoLy0Uqm+/6nhuM9tJu2pFkqbAHLTUSXgh7bft6qTo4ADNDJ6SDPAarI0UL9ZULaOKZDmFzCf/uw5W8d0yQ2qra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=m2E39IdP; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id D421F20B7165;
	Wed, 10 Jul 2024 22:28:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D421F20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675681;
	bh=/zshC6CTq+p0Y7ChToV4TV9M5RPtsazYfEI083x3oo0=;
	h=From:To:Cc:Subject:Date:From;
	b=m2E39IdPBUTRvZ4piku11ncWJGVGW3Cx7ZGEg/DZClj2TV24nD13DjwvbhaPJDkXW
	 rRdDvE2G4nAAXUZN3DKrvGDlwCiEgN+p94Znkb4QRLnPlinFLrLdFqiKRiyXJOnlIz
	 7JJMERvS7m/Q6aPY+I78kIODviKbAGR/ZfHeivyI=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v4 0/6] Make I2C terminology more inclusive for I2C Algobit and consumers
Date: Thu, 11 Jul 2024 05:27:28 +0000
Message-Id: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
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

Since v3 of this patch series, we have settled on inclusive terminology in the
i2c subsystem with Wolfram and Andi in commits d77367fff7c0 ("docs: i2c: summary:
document use of inclusive language") and 20738cb9fa7a ("docs: i2c: summary: be
clearer with 'controller/target' and 'adapter/client' pairs")

This series is based on v6.10-rc7

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
----

changelog:
v3->v4:
- v3 link: https://lore.kernel.org/all/20240508234342.2927398-1-eahariha@linux.microsoft.com/
- Settle on inclusive terminology in the i2c subsystem with Wolfram in commits d77367fff7c0 ("docs: i2c: summary: document use of inclusive language") and 20738cb9fa7a ("docs: i2c: summary: be clearer with 'controller/target' and 'adapter/client' pairs")
- Rebase onto v6.10-rc7

v2->v3:
- v2 link: https://lore.kernel.org/all/20240503181333.2336999-1-eahariha@linux.microsoft.com/
- Drop drivers/media patches [Mauro]
- Pick up Acked-by Alex (modulo typo correction, hope you don't mind) [amdgpu, radeon]
- Pick up Acked-by Thomas [smscufx, viafb]
- Revert eDP change in drm/i915 [Jani, Rodrigo, Andi]

v1->v2:
- v1 link: https://lore.kernel.org/all/20240430173812.1423757-1-eahariha@linux.microsoft.com/ 
- Switch to specification verbiage master->controller, slave->target, drop usage of host/client [Thomas]
- Pick up Reviewed-bys and Acked-bys from Rodrigo, Zhi, and Thomas [gma500, i915]
- Fix up some straggler master/slave terms in amdgpu, cx25821, ivtv, cx23885

v0->v1:
- v0 link: https://lore.kernel.org/all/20240329170038.3863998-1-eahariha@linux.microsoft.com/
- Drop drivers/infiniband patches [Leon, Dennis]
- Switch to specification verbiage master->controller, slave->target, drop usage of client [Andi, Ville, Jani, Christian]
- Add I3C specification version in commit messages [Andi]
- Pick up Reviewed-bys from Martin and Simon [sfc]
- Drop i2c/treewide patch to make this series independent from Wolfram's ([1]) [Wolfram]
- Split away drm/nouveau patch to allow expansion into non-I2C non-inclusive terms

Easwar Hariharan (6):
  drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
  drm/gma500: Make I2C terminology more inclusive
  drm/i915: Make I2C terminology more inclusive
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
 drivers/net/ethernet/sfc/falcon/falcon.c      |  2 +-
 drivers/video/fbdev/smscufx.c                 |  4 +--
 drivers/video/fbdev/via/chip.h                |  8 ++---
 drivers/video/fbdev/via/dvi.c                 | 24 +++++++--------
 drivers/video/fbdev/via/lcd.c                 |  6 ++--
 drivers/video/fbdev/via/via_aux.h             |  2 +-
 drivers/video/fbdev/via/via_i2c.c             | 12 ++++----
 drivers/video/fbdev/via/vt1636.c              |  6 ++--
 62 files changed, 275 insertions(+), 275 deletions(-)


base-commit: 256abd8e550ce977b728be79a74e1729438b4948
-- 
2.34.1


