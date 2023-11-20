Return-Path: <linux-i2c+bounces-337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2F7F1F6F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA0C1C214F6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C9638FB8;
	Mon, 20 Nov 2023 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjCcrtF4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F44A4;
	Mon, 20 Nov 2023 13:46:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso13258405e9.0;
        Mon, 20 Nov 2023 13:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516789; x=1701121589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=gjCcrtF4veDEJj9rFtx23LKukgs/iHodLwzuV9Hl+bF5vUjD4DzqCoIjhA9xERZngR
         FhYWhU+QVko82Ayj6ZqbhsXd302ufhF6s07LS1keUHcxGXZKDD8BC6XlwJORUhuTv81X
         UQU7XVpSVmbgVrN8Os/H89S9XWolzelFgMgFVlsd8zeVvmyuxhbZYLyLnLqVU/HCnLlO
         5fs1d7U1qbpmhS1tOSQSd/1BJIUiFQwzBiFS15n79NMxfsZH0ubas9BtXGfZFofO67E6
         VRQIBBuZOe7B5tjw4SmKxYn5rTMxDWtOY/Brlwx6ZO8XlEXWVnPdqVzPInt9dtj06SI7
         C01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516789; x=1701121589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=bHo18SZnFg/5YJvIzVb+vMwUTUmfxVN1Pz2MTSkpEU5GdLBE4LoMb+2BK6swlMVSc9
         BiUU/L2AXa66h/XV2Fa1yQ11fmbRBWI0ksyAS54M7gSBsyYyvr/zcQaUJhzAuQdoYSDc
         MLM7hMAvmoToSQZ/OA3KC4CQbLFg9iAqXDbMnAX1fBBxln1lfnrFjQdsapeEGmB34udj
         oXTa3je0i8cXDtNUmJTDBdxBFkC/g27hV+JDamSgJ0d15yoOaoCaf8nH/WZtdpjnjwdP
         xbsYF8GNe4/X5v+b0r67GhGAVlFH1hc7FK0qZUEL0dz3e+5xfYxW2fmHAxNndwkBTaj1
         oUCQ==
X-Gm-Message-State: AOJu0YxySbPTk03vnmzqlRa8eHIXieppw7j4MOY+K19BqKirutL+saOb
	rUZVfgdVawW7hsHwT6WvAvk=
X-Google-Smtp-Source: AGHT+IE5KIoURghYVkvfU5wQxiGM06yHQWDaD6hu7bxfA9LnXbZJ41nQqt1tLyyxToNmpgxikLPPeA==
X-Received: by 2002:a05:6000:156f:b0:332:c432:b7aa with SMTP id 15-20020a056000156f00b00332c432b7aamr663360wrz.2.1700516788640;
        Mon, 20 Nov 2023 13:46:28 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:28 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:04 +0100
Message-ID: <20231120214624.9378-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/rockchip/inno_hdmi.c   |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a1..a7739b27c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -793,7 +793,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fa6e592e0..7a3f71aa2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -725,7 +725,6 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	init_completion(&i2c->cmpltn);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;


