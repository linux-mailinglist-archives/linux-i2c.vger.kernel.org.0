Return-Path: <linux-i2c+bounces-10577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6EFA9846E
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12ED63A61B9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A5022AE7F;
	Wed, 23 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ddu0I8dn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB521FF38
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398554; cv=none; b=hC8yQID6Jar+bnuXjFYXijxczQBvAlCNRGA7WVfGAncCAzvBpWvdBrS/tRjPMECWu2+D7uh8cQrKtWPiFxuhFbY9S8lOvHKPOjanD4cNHl0y0+fIs7eiY+9n/j9P+vJYq7VsPmWpqY6pOGBbNvUIxlNoHr63L8ziFPyQDk9jKRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398554; c=relaxed/simple;
	bh=f4rrBUhgOpzh+3JNJavQZupBM4prajM1lFEhWvBf/dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMyGC+H1/Mf64kZXrTqqOnNzpUhmu8LUn551pg7uIRQP4OSwAt7Y3j8KXAJPnmuriZCRt9eFiRa8OoMFTXUg7hET407GifDgtMYSJ+4NNKW2AoKRzuJ0BaiYnYlIfSqpWkbKmdh5moh4hh7xcS1jExyJTTpDbtcQWAhM2/WHX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ddu0I8dn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso39843995e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398550; x=1746003350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T58djad3er5CX2/ar9SOlYcvYjsbC23ijgjbnHoCio=;
        b=Ddu0I8dnEEUsPiWP4S6nIT1/WKgOapc0FxG4EVNJbl34/rNY9phUFsQxZc+GmKekhz
         iwdOiPpwUicpJDC8CBgpFHSTy4e8CgD1tuhHImUYnuZRfA5SNuIW4EFZ5yw7GUv6lbLU
         ySsXYEsDoky2rrdixkJdACw1b0ER7CV/rjpCldoJt9DqOnzpAuQFIw7qAp0DDmDnlQZd
         5QdhEYLSla5vp3tzGKapcQScRiwsNN0QEHhukOJG3Z+nGimaNcRYmmUEx6+ggmDRA4ZU
         LDMllrrW5e36pPwJlcb1N/q/opLKBpxrZRJGzuhRVzqtkmUvoQ6dySwANtCVQHYE6zU8
         xciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398550; x=1746003350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T58djad3er5CX2/ar9SOlYcvYjsbC23ijgjbnHoCio=;
        b=ElNvqeJ/lZtH4o4Vp6E0Jcrm31Rew5zBsVxRrgO5wZ+mFPpQb/oZzk3iT+hZ65irV/
         12sQKnGDdOGtC1vGsg9pvPZ99xZKsUKlRKmXi6d1K57xNAyA9TKcS4tpNOehCZnC0W08
         65Cap9FePMk1BOQlC8XoIlnr8S44S0xZQCIL6blkYWyzBAKSeLunnjSxyIcyb1o2jnqw
         k90ih8GJb/CJ7iXxTRCLQBQ6g4zkd5hSaj9wsPbT4rt4MrMO0Hs3sRhChsCxMS9mjCB5
         qMwLBWdaWmBKbCJdTaVNEN809EokoRaMFpKn4LitRBcCB9ryJTEuscNn58UZpvRheACd
         nbqA==
X-Forwarded-Encrypted: i=1; AJvYcCWAeA6IAId7pL7hLVDGcGKcM2PWPLOCi8DvJnbsQeorK50MGrEnzJCVTkF0Xr+bR/p2DoFm25suYK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vktCMfkBKfLE+is2YkfOf1Sv2CtNpgp6K30M2uHefyzJbi4Y
	fUS/1GEjO0SeZ70IycTpW+3GeKHMWrdtqvBnuqsdZuha0uLS2DQoqLJKZE+x880=
X-Gm-Gg: ASbGncusmQ6LzfRt2WeJhHSwnvXQFQD0BuYvuJ9OdEWHl/db5rZKfOLfJmyTw0rpyQa
	h4mvMaUjpP6dDW37Ex6LWnbFgGoXwY1hxM6PO1Ks3V4t0huInjkV+xXc+fc7YsnCNqsERekTBgQ
	lgXqZjhAOudGkNUYlRUCSqt/GHrWAdS+37QwfithJj1K86S1gWw/axweW9J54RY7teIt0GoAfCp
	oV45VkLx1Ol3JsX0VKNAJ9CGbOM4ePlkkXxwMulS487gyC1WhuII/TLmF1zsETuWzEV17R+w5A2
	Vz2WB81Std+Mrtdd6HaedIc/BC3EBmwfQqXD8255r+Cb
X-Google-Smtp-Source: AGHT+IF/Wfdl1Qet5R9XddWiu7o4ixM4STVgqh7+MB0HBGcE1HZ2xR6oPyuHIcNqh3yLZhRhP8ed7A==
X-Received: by 2002:a05:600c:54ea:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-44071595935mr109726675e9.13.1745398550153;
        Wed, 23 Apr 2025 01:55:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:40 +0200
Subject: [PATCH 2/6] hid: cp2112: hold the lock for the entire
 direction_output() call
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-2-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zPoDCiOhyCgx1msLMUahYgfSgpd80S2g0PWtxRTsrIE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsRU+49zvvyqzGeZcgBld9BLOfQq2/dLbC3y
 2+6Mrd00UyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEQAKCRARpy6gFHHX
 ci3AD/43IoK7gttMN3PmI+yZb/IlQkEI6XN8ZywPHTt0PMLtMTdXsQkjdJBzt3HXbf5NXD+eKEO
 3yiU8gMCoD/rqIzJDXI0B4ymD0oEHwGeBESbLxKap0uG/eWUfOlXqc94d0+aHkm16QRv5yKBCbe
 YS8EyYrVz/59Mc0ks4AeUe8LFvGEM5bfIW0k8eijRcEFo/SZYK9rUi5VVCL4NjseuNyWy7f+rIi
 2SZyLWw0Iv/a6zV2V/v+mGDheG5YdrNMXbY0TFL7Dcj8f0PRs0jU6pGJEPtPqzAvu/WsKsV+Zms
 vjudmut4pu9im8FS3KSAiNg576WBU+F+HWZnv3NRRe5XBPVXIQpCAEitvRamvlYukv4CPt0mQYG
 DoNowICkVaIes4g/+9QtzGMGPgKqpAttht3O2DQI6DZx+cJ0f0P5geh8O+kavOKhhiOirhnol4q
 2X98FwSEAzv5wS03AQyjHrEmCXj7ixiJtBMv9NoAMBb17ioHVUW09/MASvZ9fpb7IrCOfS0iZRj
 dUWgLl7dpHhAPhX/1hqx/OjnEnf9Z3NfcEwciWY1lsHK9JG92i22supc3+Nfp9ZksS09CBm/gau
 5mgie0LSYS204glpj7kGSXI+TBZD30lLs2jLQg1xHIHW2a/3xjcRWcLG7BEPuDAZh5f8i4WM0nX
 IveqQJE+6cPNVLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently take the lock, set direction to output, release it,
reacquire it and set the desired value. That doesn't look correct.
Introduce a helper function that sets the value without taking the lock
and use it where applicable in order to combine the critical sections.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index a001b9acd2d4..408c865efdd4 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/hid.h>
 #include <linux/hidraw.h>
@@ -218,15 +219,13 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void cp2112_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
+				     unsigned int offset, int value)
 {
-	struct cp2112_device *dev = gpiochip_get_data(chip);
 	struct hid_device *hdev = dev->hdev;
 	u8 *buf = dev->in_out_buffer;
 	int ret;
 
-	mutex_lock(&dev->lock);
-
 	buf[0] = CP2112_GPIO_SET;
 	buf[1] = value ? CP2112_GPIO_ALL_GPIO_MASK : 0;
 	buf[2] = BIT(offset);
@@ -236,8 +235,16 @@ static void cp2112_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 				 HID_REQ_SET_REPORT);
 	if (ret < 0)
 		hid_err(hdev, "error setting GPIO values: %d\n", ret);
+}
 
-	mutex_unlock(&dev->lock);
+static void cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
+{
+	struct cp2112_device *dev = gpiochip_get_data(chip);
+
+	guard(mutex)(&dev->lock);
+
+	return cp2112_gpio_set_unlocked(dev, offset, value);
 }
 
 static int cp2112_gpio_get_all(struct gpio_chip *chip)
@@ -306,13 +313,13 @@ static int cp2112_gpio_direction_output(struct gpio_chip *chip,
 		goto fail;
 	}
 
-	mutex_unlock(&dev->lock);
-
 	/*
 	 * Set gpio value when output direction is already set,
 	 * as specified in AN495, Rev. 0.2, cpt. 4.4
 	 */
-	cp2112_gpio_set(chip, offset, value);
+	cp2112_gpio_set_unlocked(dev, offset, value);
+
+	mutex_unlock(&dev->lock);
 
 	return 0;
 

-- 
2.45.2


