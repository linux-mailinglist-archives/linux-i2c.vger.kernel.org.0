Return-Path: <linux-i2c+bounces-227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A23217F017B
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D091F22FFA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BBF19BAC;
	Sat, 18 Nov 2023 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0XmnWa2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6459D70;
	Sat, 18 Nov 2023 09:42:38 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4084095722aso5382615e9.1;
        Sat, 18 Nov 2023 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329357; x=1700934157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=E0XmnWa2S0Biqjy0o2CvvVF06vaVemff5CWbChB1OfNbKBT4oqa/XQgCOlQ520gMPa
         n6wZ29pYvYEiKOZM7og7O0cqBUdhQah/y5SI9CcImOV9Yxoz7vaOz5ST2IApiHdnXXHb
         gb61ZZ/hCLeS783lVKwFA8ZevmSKQGWh2d0Jkdc/jwH/5IUsS+wLJ2aU4gQR/I9vuquc
         YPyG7W47135v9k4thS/fbVNIdCYvX1ynvZUQ94Kk+NUuPhbD2wlEfRimjfDjklmhq6aI
         7LdToQpmIXQtrBcEEV0YJa16dZQ1V7SZriMRej7yezZ7QNkiDlvuVOmqRcraI9Pszaks
         Ku5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329357; x=1700934157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
        b=uXunttRN+KNdpGUCXkcBhXJD6Pmc7ivuXsgRnl3yqul1k0gw3rFzJcfJZBVrYCYPd3
         w+HZjaAuhBSTb/C9no/8Fok3iubwLJI2ZOhvQv0x+qQOb6/Ap63qOglMT+YcRSyyi9OC
         nv5HMrRyuA9j1S9k7o/TZ745lC47ZSmuBia5V5wlqJPLp6gPGm6Q3c0oLdMCPYMGLXGa
         wPDNiRmNPJugoGt5apzaTzCFeGkMHEL8jc+M/UwYa0P/QkdC/HKsclNu9Hrg4FQywSxW
         UmAlOjJGyasKMYqB8Ih6e/13mU3Rfn7/U72ap1+6h1k3tKxKNqsZGqFIPf8Ek9vLjpNH
         pRmA==
X-Gm-Message-State: AOJu0YzzOrl3dgSSAoe2Ki/eETSNsPlu/w0jHJ67odyQeweARu0cY5Ez
	yETirvYRNTjQZXeMDvcyI+U=
X-Google-Smtp-Source: AGHT+IEYtipVOmHkmNUNcpfhd7yRWRn/fCm6xuayGvnoz64EspqjxwBcgwutFlkQhj/M1VwINT6WNw==
X-Received: by 2002:a05:600c:470a:b0:405:4a78:a892 with SMTP id v10-20020a05600c470a00b004054a78a892mr1927675wmo.9.1700329356850;
        Sat, 18 Nov 2023 09:42:36 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:36 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:11 +0100
Message-ID: <20231118174221.851-12-hkallweit1@gmail.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;


