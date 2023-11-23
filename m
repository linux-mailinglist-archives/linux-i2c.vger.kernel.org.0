Return-Path: <linux-i2c+bounces-401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682197F5B38
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA164B20FEB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708121119;
	Thu, 23 Nov 2023 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRH8dsZZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAE3BA;
	Thu, 23 Nov 2023 01:40:46 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a02ba1f500fso90820566b.0;
        Thu, 23 Nov 2023 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732445; x=1701337245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=YRH8dsZZk9QnOAjpL+Bw8Bdsz+fwftkhXCrw5yvpX4ix/rCwoVVTpEh3y4q0hUx7Ym
         3pn1d2GyeELiSW3O/4eYHW8rd5z02SURbiu6by+8i3+Yq/l5VZEuYgzapG6bDIqC5Uzl
         Xf9v/LZJfAJYcSSiJNFk3Cc1MFLNB6sS6KHQrx+KgmtkfC77+e/K7BSCT40olvzWSg4P
         DdFerLQknXvU3nK91kIRDYwwNs4jeeWVLlhIM8nt2PiRVFankhNFNrUYo1PjlFbZ7Kxu
         usdRP7bAS8KiLMJf/FauUyisdsnmzJlHVOS74eA2j3ceuNxETf00LWFT9T+4rhnnZyel
         Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732445; x=1701337245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrHROUSPlT4bN2lnsfzxw2GPuZ9Bx12dzaePQbmqgMk=;
        b=S/YxKJzfQlexp7Jc4goQwd5Fzww7imgsgWzDyRSJJFThsUI8BRR8odwWcPauJLr7Xd
         7rE31cDT6koIdkl0aWk7/yiyn2RjT2ICq9MYbqvKeKWNYFEhSkKTV1kqpQEj2fTwcSQb
         5lavIuDaRCndseIJVm4BhSJ4z++i6xooePE6An0QDDOwWUsAjBhhSAwvuHfRAGPBtPv8
         /VY8DNTb+DVTxhpMKSt2bmz1Rv9nJ7ltr548GS0gILRlRCvkBsAmMuJTALf8oH6mOWdJ
         Fzs9XpYzBk8Acpo1D/Trew0So+dRQaUGh+ci+KKBQMHnaBxC/osl5nMhD5fIRsoJ8z5e
         4nmA==
X-Gm-Message-State: AOJu0YwjnkDMK0GZCpF+YreMO6KEN8V8I3MXaNF/Kykgr6aQCGvAZBq9
	rfHEqZFc24PG4VDH+/QRfJU=
X-Google-Smtp-Source: AGHT+IH3UA4nrdAqScERrRmQjf0/m1eRztQQIu3xcCY1PXQ8GvVHymqtee93zJ05NL2jqGs5ig2nmA==
X-Received: by 2002:a17:906:290:b0:a01:b9bd:878 with SMTP id 16-20020a170906029000b00a01b9bd0878mr3573689ejf.14.1700732444513;
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:44 -0800 (PST)
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
Subject: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:20 +0100
Message-ID: <20231123094040.592-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
v5:
- more acks

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

