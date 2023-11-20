Return-Path: <linux-i2c+bounces-336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79E7F1F6C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B7628205D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6E738FAF;
	Mon, 20 Nov 2023 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5VtFHtw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2013D8;
	Mon, 20 Nov 2023 13:46:29 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32fa7d15f4eso3780962f8f.3;
        Mon, 20 Nov 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516788; x=1701121588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=h5VtFHtwSYDoDenYVurUanZG/UlMACjpgIUuqsqH13Hu2SG9OYGib3t+j+pMeKj5bT
         yNaGGFRhPCVmk1vfEhqN60bCfcS3xJ6fgQYTsljIwdW67lHt1F8DB4tlLYehVmqVKUpY
         VjCPBG2CLQ3afEfsGJss77pHS6zRYYpKJoABkT3lTDtsI+8ePj+LjpPGPdkhhqpu7PPo
         4zlpe+SzeSLObKpQhC9b/ghpLHDFJuJQrsshgRL+7V4J9VMqcSrFxB/RDiLXako3n8Sz
         0vXVltQ3ry7dZgkQYB+A/vDuNGpJmqFOQPdbWdRq/ryPQX0EM8cF0bSQaemeaxTUGzFd
         1hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516788; x=1701121588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
        b=CUQXvxh/TrEjJdw3Fxi/3WyiMO8ZYGmjQJtpE2SkV9AfXcyIP5FYAiLaBrQ3VyA7nh
         r5AhULJvKGwd2yKJKdW3Ls894kVSE1fOtoQYB24TdOOSmlQc389bMAHRroqc41d+cutr
         bSpK9kw0Ld7ed9qAR8RuMXA0I5byINlfYuiuOo3kYzKmJ5qrfalHJmi2d3Tgc9NpZ31q
         MqST0Co74wCv7/Bwghn9BCdnT6riAy/M2n3dTrgNyAZkKKxHWkZRYbvMdGBZFHkl2e9j
         f/dT12NQ1uV7lndyFAPfdUFqTA0uU9acGCjt+01hfRBSpbXxaoOukdPcxaHBiXOiid1x
         avSw==
X-Gm-Message-State: AOJu0Yy3F7RFGz5iuoBLxxNUD+ptoEBj1TOpEdlqjkkdjhIQr8Lz5icf
	xWrDuO92Pprqm+vmbdNftrw=
X-Google-Smtp-Source: AGHT+IHp3LoF2DOrCwbBP5ZAP28MyKKAznq0CT/uy4NViD6EoST7Z+71CXBfeYQKBX9yVV00pAiniQ==
X-Received: by 2002:adf:e9cb:0:b0:32d:9d3a:d8c0 with SMTP id l11-20020adfe9cb000000b0032d9d3ad8c0mr5215561wrn.60.1700516787764;
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-fbdev@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>
Subject: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:03 +0100
Message-ID: <20231120214624.9378-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5
v4:
- more ack and review tags

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
 drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
 drivers/video/fbdev/core/fb_ddc.c                 |    1 -
 drivers/video/fbdev/cyber2000fb.c                 |    1 -
 drivers/video/fbdev/i740fb.c                      |    1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
 drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
 drivers/video/fbdev/s3fb.c                        |    1 -
 drivers/video/fbdev/tdfxfb.c                      |    1 -
 drivers/video/fbdev/tridentfb.c                   |    1 -
 drivers/video/fbdev/via/via_i2c.c                 |    1 -
 include/linux/i2c.h                               |    1 -
 31 files changed, 9 insertions(+), 47 deletions(-)

