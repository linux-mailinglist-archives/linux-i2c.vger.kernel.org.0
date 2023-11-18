Return-Path: <linux-i2c+bounces-221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B40E47F0167
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B261F22F8A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943481A700;
	Sat, 18 Nov 2023 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHVClbWI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9528DC0;
	Sat, 18 Nov 2023 09:42:31 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4084095722aso5382045e9.1;
        Sat, 18 Nov 2023 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329350; x=1700934150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=dHVClbWIFrqtDIsILUa03+MNvi4GMqwCifqU6ut3SDKlcbuI4T59uZmKHkiaC3UjfY
         NQKn+ADjkwXsjnmwq+Oq2gcQtOLmG9zZgFlN1bm1/k3mqz6fOEqVnabZMFVbQ+udTPuv
         URuA9NZJC5bLQmzD2wqDeqJDyQHaB6Ts2RJUmNZ0WHYujnr46rtzxeLr0GU8/C5DNr7u
         17B1MaogtFT0/3faNYmQczqaje85E7nsyfxXLhNiRbrpokwa/M5eaxKPUp/KXjnSrXSd
         qV1d/qeOJiR16TX1sQ//30fN19VkbUoxcgisxPp2uK5ds1VA9S47HRxLN3Op3dKSqeMm
         TsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329350; x=1700934150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A7KgJeMP1lI74vlMRztf0ZeAIQKlR0j/L1YwdkkguA=;
        b=Ai/CLLhegzV1I9UdMSmUUhtgtVXXmkKTDRcRTighqm+OLhU4AQkec1zjbrpn0Gs2CO
         NBZP0TRltJJx/p1arLtv3FjU5da/eInLKvcz116XnyI+7OGZN3qwvCiHSBRL4hQ05kwF
         /G1XwbXJbq9ng+1Dgiik490NeZF1hyfx7lZza/kI23BjGTMD5TL/cLVfI3+7H+VbTIf8
         1WKDTOUdNn2hsKxm+QxUwMgrQkqqWGmzZRqJ/HYEErJBTL+C2nJtgGIkXivZMJMz6n8I
         2gjcRotRLdJDlg4b09NvANgw6yXR0igCXrsGFoWFiDdqp1Ea/eCJqz73a4ZZxILBVC8n
         80eg==
X-Gm-Message-State: AOJu0YwrKGhlxD+Ta768x9PFVCLqN90T5uF4a2PK1oFxswCVg42UOO/v
	gy5Q1Af3zSigshrcaT2mLAk=
X-Google-Smtp-Source: AGHT+IFhcmh+HF8fxApZE0ppjzudwwON5aQtR0W323i40dvMUD5YGJYLj4L/jEO65VvDn1fpwc/WhA==
X-Received: by 2002:a7b:cd97:0:b0:408:3b8d:f7e8 with SMTP id y23-20020a7bcd97000000b004083b8df7e8mr2221493wmj.33.1700329349862;
        Sat, 18 Nov 2023 09:42:29 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:04 +0100
Message-ID: <20231118174221.851-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index d1a65a921..f5f62eb0e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 		return -ENOMEM;
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
 	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);


