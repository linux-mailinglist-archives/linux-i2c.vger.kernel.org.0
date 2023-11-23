Return-Path: <linux-i2c+bounces-404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C057F5B3E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939A028185F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAC02137A;
	Thu, 23 Nov 2023 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRT6B5vN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C05BA;
	Thu, 23 Nov 2023 01:40:50 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9fd0059a967so341008766b.1;
        Thu, 23 Nov 2023 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732448; x=1701337248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLxIO8jymMsGgax9WMIUOf53Q8UCr/7PCCK8+C8vDXQ=;
        b=KRT6B5vNb9OZULnQ00nQuAakY609BlZAiS4YXcROouyRv/7TkV0a5KpDTN++L+vZZs
         e4u2Rt2l0OKLrtQgtsGyIsaPQzuWR6eeAqSm71gEzU0FxQWX+Fqb+FE3hSXuZ4uzndrC
         T6gUay806gaoyKUNcmH9uit8KUNTJtyu+HfHgGjhsUhXcn6pu3SRFZ7dNh29IU2hj0qD
         9lW9L8m9QnY4l1UjWLcf1K1JmlxqG7e5u5SyAZ1oj/3n80YgF6T+wcy3Qe3uRJNLHkLE
         YWzp/NsZvWOE9tVAewFjEtKBk+yaA+FzL1Fv9DLUjL+PeH4n9nTPqTzJGuQ+tZ9gmqd1
         vbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732448; x=1701337248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLxIO8jymMsGgax9WMIUOf53Q8UCr/7PCCK8+C8vDXQ=;
        b=xUBP9mgihqxaNMYDqTMxdMDsxSZi+RK92M6VqyKz3/MLsQaSsTUC3lRgTqqpgDTOfx
         KFHkB5EtorjmPFGZlWCTQDNE1tJcrtiGJt2+q0TuA0rETi9KHR2Kh+91yNzyUx7hawae
         dwhK1nJGPDT5JHEgsifdj7xmgoUOAXnw5bmvznR0mWBrFEoC2Y5SKzC9L4lAvipI8H5h
         caKMu/S0eOsIUDO5FdJb3nYwIF5Os8IWqZYRIbvxrPmfgoLw2fjmlyS7vBKSOpABaDOa
         dyidd1YdLl6j3T4x18QIMKOOWR5TnePvon/1BepffwY++VH4aklRStG+7ZcMEoHuITHO
         tKUQ==
X-Gm-Message-State: AOJu0YySMAEW5Yq8YeFMMf6CthenJA8+FOJoVmprvjMeb0jvNuqeIGxu
	GtvVVq0K1c89H74HAJ/PVVs=
X-Google-Smtp-Source: AGHT+IHAAgtMNPgGG8plHKbnTsqENUj/FChwDuBx+Jt1UJ0zF6uKp2U1sG6bXy9dBnLTJPdZkoeP/A==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id l12-20020a170906078c00b00a04e1e7d14cmr1773863ejc.32.1700732448312;
        Thu, 23 Nov 2023 01:40:48 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:47 -0800 (PST)
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
Subject: [PATCH v5 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:24 +0100
Message-ID: <20231123094040.592-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


