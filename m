Return-Path: <linux-i2c+bounces-10579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E956AA98470
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26F21440CB3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDBD221FBA;
	Wed, 23 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JeTIT23d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45D223DC5
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398555; cv=none; b=UmitmA1DtUtyW7MpxlaZOGIIG2ZoRu6JcMQZhcD8gXeGtnsP4zMI3ZbtSAavsVUG/c0f2W0MXjwQU758ZkV/kJYh2UcW21Yg7DB2UgjNUuuFHhJZYHXNpNyzLRHZcQMPgpWsZRqkJVClXF5mxz42QO0OIpQWLhN1tcIOVU4LuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398555; c=relaxed/simple;
	bh=78erSKRClsMeZtwbiQK/eYXqLE0Qi/RfkYG5lQRg06g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQM7HYgn+NVGrALmP7jPDZmr4WS9w1uqGO7z3tj0DIP7ddbeM/zCqX3Z6k1sPMZqJM3gdHIHU1XTbVDnA1Hzt+Z50s5IBEVOSw8HXBy+CNdGxTOLOZq8okTB/mZPHB+/fZihW5CyRTUq07CaRM8ybT32QUurmfxqpjDXmK5o8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JeTIT23d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5087235e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398552; x=1746003352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU+q6B+KeVc9Dotp3+HXW8/M81FKVZlxFGFb0G5Bpbg=;
        b=JeTIT23dk7LAG2SWSF6CwlCSARH6KAk7Cf6JJHcGQN383WsvbCa8Nfn6F3qgYc4sSJ
         YZAeFOerEfqoDMaePDdsSMhOOcEVYFae4VU2V4IoX0i7q9NXp74rJIRIsgQvgsycsm+o
         +aMPAus02h25P5RJmBqxerrrTwREelDdfNb7HWiHSls0yx0qdRgsuu6TrJYiSBCIBmu4
         COzblGKAmUcyvuN0FHvsKp7gYf2JUFzpll2R42iERYc99stuYQJ9IzJ+k2BqBWOmEUS2
         rjjQ7ouZh11YLoklx1zkGoolGTTSjo0cHZdgiNEtNlSl6GKgADA1USevhsaOhg7SG4XF
         LHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398552; x=1746003352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU+q6B+KeVc9Dotp3+HXW8/M81FKVZlxFGFb0G5Bpbg=;
        b=vYCZzumGB/tdzR+AUzoYQQABSKHxeQmYFDatHL8RNfpC3ZfEo4OVwpOtNGrEcn7ISw
         vZK4HHV7bFhrIPvk5CCRGGoCAPpLYufkm/1WztmQZMP5C5165WocQJE1VEHNXyz/Schd
         uwhItuq0qrThSOMuqfvMuz7ar5aiVz0TMAOmxuq74HDokR4PjtG0lmecImiSPUcdeHW1
         PsTxze54iZOIR0Gr5jiq798I5IxOaJlsEHIb2gcwifW1PLZRwsLm7vB+iQSP+vjMqSKg
         uAou9Yca/ZEATCpRp2Sh1okG4jktPZtNtXANEF8ILHYB+Xt5RCJK5yjMXwdyvi0EPEhy
         Qbtg==
X-Forwarded-Encrypted: i=1; AJvYcCVNAXwxqYld1DXF1/hRFgQOkfmjdmneNxshUOCRYRYovOzaLOEMoMIHhxPlA7JySo2BMxE7XWwKLlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvUVvgnr4N3pcSuPBH4g7IuwG3KxZ8ix0t8n3Rodl+BZXN5Fyf
	ptAPLrZoVU3vhkoxUzWC9aJEz7f2JbiM76cHPRKZZ1Q1LYsTMzGYkWrSPIR+urI=
X-Gm-Gg: ASbGncsVUtA0vLJ1Mg0KOfVJln3v2lfNJSNELjtxioFhsi4o+86W62Zp9Z3d1xoq6bJ
	MukyfiLS3HoC+tQdSTbwUH8o/YdQbiz9WwrNqERVzlGRCfmSPPNRDOtBwgy0Qz8iTEoJupHWI2g
	Tn3DNGP2PdqbzTHnjrfOwM6nvogbv35EYe0AxMdgCbphMOQ/igwPaBN+ej8iJHzkz7KE2DqJud4
	4oJ2fbaYfCrptAyWtH6TXGDQBtTJzP+vN+zfRyXaRHiqn+cCJVrhTbhnFEvdcrRl/vLbx/VzNoB
	jpcUhXkN2VJLaOyFeqPVcffnGkarZyEVuA==
X-Google-Smtp-Source: AGHT+IFsnUHyXLc/V2ofKcW5mQzbrMR2fSz2s4gn5/R5CVyacBF7IB9KCUsiHcaRQw+s8v12JkDS4g==
X-Received: by 2002:a05:600c:1d1f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-44091eaec9cmr18708095e9.2.1745398552009;
        Wed, 23 Apr 2025 01:55:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:42 +0200
Subject: [PATCH 4/6] hid: cp2112: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-4-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3m9eD5np0PCYm6CXzEmoZHY1+lpcLzL/5hTmqHLPJkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsSzMLGtDZLUYWUDyAUa7jdtk9GnBimJcQX2
 SoTdL2SZ1aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEgAKCRARpy6gFHHX
 cgzCEACfhjBYKX9WaY4Rj6j6dY6Nsm8jaTIw+76AGZPtpSCeseU5lPyTyVk0kfxUseBanQoYcsy
 AJC2ReKiFWZ8x93TDQCuXc0HPRpsJxSwH58DQZmdSpeWtYl36D40pjvVdlaUKJPEGh3M81IY53y
 W7qPcBz+CaA5O3p8ijVymEwJxGcVD9Q5YzGouWP/rQnIJYavqitbMr/C6D11wOvpbkcCr76KKvT
 LOFuNGZ9qvyg/7GpRGoDw/nPyndmQOLAZFqk2LWwM6IITlvVRrCx/w0wFk89EqrbfVbUaPdg1bn
 PiQ7G4shFXnhl2te1Ts5uSr8mFglwLYo9HuUbFHPelb4YxR9w9Y/o/NET046Br47Ejn7dbtH/0p
 XEylhaW2+63qWgabCRvfC4LKks4CH/W2gx1svepYJawFK/YJWdxJYuClSrWGCvxqWuV27CjDncD
 3pfif/fk6my5n0ECt+XOhz6FCENCaHRHwp+OxEdOt/Jr19MKGn/Z+d6DdU5Po9KIvdTtxz96kwL
 WCuyuLyXkDvxs6LinqpRNdlMT495MVXKhtk5FlCz5yVm7t6R+69y8MJEo6HL9djCLhUWmq6renD
 i6iTn5Byw618DT5kDY57X1Cz5FA+I5u6CLVjKjWu8FMcc/8+SlH4Sb+MgpTQrkxwn+gG1U+6sY9
 TfYmnorS8l3zKfg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 92dd891b7b59..234fa82eab07 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -215,8 +215,8 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
-				     unsigned int offset, int value)
+static int cp2112_gpio_set_unlocked(struct cp2112_device *dev,
+				    unsigned int offset, int value)
 {
 	struct hid_device *hdev = dev->hdev;
 	u8 *buf = dev->in_out_buffer;
@@ -231,16 +231,18 @@ static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
 				 HID_REQ_SET_REPORT);
 	if (ret < 0)
 		hid_err(hdev, "error setting GPIO values: %d\n", ret);
+
+	return ret;
 }
 
-static void cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct cp2112_device *dev = gpiochip_get_data(chip);
 
 	guard(mutex)(&dev->lock);
 
-	cp2112_gpio_set_unlocked(dev, offset, value);
+	return cp2112_gpio_set_unlocked(dev, offset, value);
 }
 
 static int cp2112_gpio_get_all(struct gpio_chip *chip)
@@ -1286,7 +1288,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.label			= "cp2112_gpio";
 	dev->gc.direction_input		= cp2112_gpio_direction_input;
 	dev->gc.direction_output	= cp2112_gpio_direction_output;
-	dev->gc.set			= cp2112_gpio_set;
+	dev->gc.set_rv			= cp2112_gpio_set;
 	dev->gc.get			= cp2112_gpio_get;
 	dev->gc.base			= -1;
 	dev->gc.ngpio			= CP2112_GPIO_MAX_GPIO;

-- 
2.45.2


