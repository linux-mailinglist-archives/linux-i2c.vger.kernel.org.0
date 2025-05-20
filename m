Return-Path: <linux-i2c+bounces-11078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF54ABE3EF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F15B87A53EA
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A4C2820C2;
	Tue, 20 May 2025 19:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU04eAnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA3211710
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770256; cv=none; b=iS36VlUGm8C5BshG0OjG9iOdAOLHyzIkBbBSYJsYGk76NX6q4WHoVYDlZjK7WG0PgpJkNPz2OYwnHIFWaSRsdSI9xOPEg0HtbdSIuh/4OkEdBgvZWaCJxZjmwvxOMaRxtvpm7JkTqwDMH2HbuUCeOmxjuPDnOF3oP/XA4/CJJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770256; c=relaxed/simple;
	bh=wR9auhATL6wnlfrWjsXykx9UKqMr86UB+LIXzCuL/BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITeLAxzIg4Xx3/Q48gxL5DbVW9LR8R3ZU5wGEeCkcg3K7v5a5H43HZiBdWFjAZn3m+5F8zKktH49aIlFTO3W9qi+RfkYrkSdMsi9cM4Yhh/zmXRBhibLoSZ+TEiM1wxSQowuWx15gmuOQz17r2FAVRk7pjhfb799+zf/MAdq9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU04eAnz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6015f8d4b7dso1283240a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770253; x=1748375053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RCCW4FNzoeNvxVglIw2r9Xf1QUNgZrscpO4kdi/4Lo=;
        b=QU04eAnzktVsr7ZKjee7Se4fcR6OxnD2jUVghg57Gfw15RtcM2XRCCtfQvpiCWmXzB
         UVqHxou5aTHzDhJ0yKP45m1RUvgHkBDyKb3sPIEHgNRNK//8JmGKv2ZSzVWxw+8PuRr4
         CgXuXfQKGoQfKruoSHYUeikPPW7ulvUM+1mdgomdR6wh3C6ltc8gRfJdiEhPPJXR7ysu
         CkK9vwYJGekQpOgmalUEoTjbxZyONvfzjyYxmE2P8H9v6jk2lyQ9X0MbSk5cxnqStL/y
         haQCIn/2nUezCsNjwjkJ/b74C2R+nCCxJG1V1QIZPIzPMFSZ+WlrzvWAX5sgm2izezHo
         ScLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770253; x=1748375053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RCCW4FNzoeNvxVglIw2r9Xf1QUNgZrscpO4kdi/4Lo=;
        b=m7enuDQ6GzEVSxDEehG+qkT5CziJr1mCc35LG2GtQ1lZQVCCax+l3n+S5NJW4DRJ4C
         P54+yNFEShpSZ5z6hJrAvpHgs1PKo/HjzFdlxwuPPzWVy/QQMVhc0ztmG1DMU0v5+cae
         YQ5+Zbr/t4k0gLeoz2995gqo5RrPVEZPljtOp2Zz189LvUA7q7fimJ5dhuDqbnOuOahQ
         q8GoAWe1KymRpc+exUZFq/73AQyzENI7FnX3Lmj0FYezzrHF2Zuoyj/nMbXiaqA3sNSx
         7AkEWQPHUDYaqu6lTzWPKcxIftygGhZiO3F5ipbY9TfSUVbfSfVxqD9/4CNnJI0hA9K8
         gfCA==
X-Gm-Message-State: AOJu0YzwDQK4/5mmvM3AqOer0+VtYDA54F4W5KBJCV4ipKdeMuQ6+KJQ
	B+eG2aIlY9yAm4mv/FE8H9xBVj59YfJC4JjsOlHzGMOOKOst2htjweCWvi80Rbx9mYU=
X-Gm-Gg: ASbGncv+7NAnDvfUrB34i/09A33uumYjIYt/H2jW9+DZkqtjDQnQog/k3deZa4zfzC6
	74IIYydy8Kp3E67f6VzbK3TLMp62JmEnYO+uI9DjUWAburv8pEHG9FFAzYsYqBl/lWXUUE0Hroz
	BG+FhPMZnD/g6t7I29O0QGQhE89laFD5FQt5DkSCpAbXoJW7j/aGplc+VR7u3n4bNyjqPOXFcjH
	WadWBG7KUFyakqIbWzTkRQ1y8+7mkPnquUwidXfcFDqC32NFeiJAJed3Kk3YZl5wEZf7be6ux4q
	1iGMoOmnS/jT3Y6sVTnTdnqOtDj8ObX5ZyPb2hDxWikIWwSlF7KIgy+2aNX5hljt1UVW/iFFRpp
	IaSMtqw==
X-Google-Smtp-Source: AGHT+IFTrjA+H/FCGX1AEec8OkYZb304WlZRq+zsYBOIw8r/blP5vxAXT8Cbudjjmr7xmlyeJjhSXQ==
X-Received: by 2002:aa7:da1a:0:b0:601:89d4:969f with SMTP id 4fb4d7f45d1cf-60189d49957mr10859561a12.32.1747770252671;
        Tue, 20 May 2025 12:44:12 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:12 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 04/10] i2c: stm32f7: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:54 +0200
Message-ID: <20250520194400.341079-5-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 78 ++++++++++++--------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 973a3a8c6d4a..1a9d727b0ce6 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -480,28 +480,22 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	int ret = 0;
 
 	specs = stm32f7_get_specs(setup->speed_freq);
-	if (specs == ERR_PTR(-EINVAL)) {
-		dev_err(i2c_dev->dev, "speed out of bound {%d}\n",
-			setup->speed_freq);
-		return -EINVAL;
-	}
+	if (specs == ERR_PTR(-EINVAL))
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "speed out of bound {%d}\n",
+				     setup->speed_freq);
 
 	if ((setup->rise_time > specs->rise_max) ||
-	    (setup->fall_time > specs->fall_max)) {
-		dev_err(i2c_dev->dev,
-			"timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
-			setup->rise_time, specs->rise_max,
-			setup->fall_time, specs->fall_max);
-		return -EINVAL;
-	}
+	    (setup->fall_time > specs->fall_max))
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
+				     setup->rise_time, specs->rise_max,
+				     setup->fall_time, specs->fall_max);
 
 	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
-	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
-		dev_err(i2c_dev->dev,
-			"DNF out of bound %d/%d\n",
-			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
-		return -EINVAL;
-	}
+	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX)
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "DNF out of bound %d/%d\n", i2c_dev->dnf * i2cclk,
+				     STM32F7_I2C_DNF_MAX * i2cclk);
 
 	/*  Analog and Digital Filters */
 	af_delay_min =
@@ -566,8 +560,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (list_empty(&solutions)) {
-		dev_err(i2c_dev->dev, "no Prescaler solution\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no Prescaler solution\n");
 		goto exit;
 	}
 
@@ -623,8 +616,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (!s) {
-		dev_err(i2c_dev->dev, "no solution at all\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no solution at all\n");
 		goto exit;
 	}
 
@@ -673,11 +665,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 
 	i2c_parse_fw_timings(i2c_dev->dev, t, false);
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		dev_err(i2c_dev->dev, "Invalid bus speed (%i>%i)\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
-		return -EINVAL;
-	}
+	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "Invalid bus speed (%i>%i)\n",
+				     t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
 
 	setup->speed_freq = t->bus_freq_hz;
 	i2c_dev->setup.rise_time = t->scl_rise_ns;
@@ -685,10 +675,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	i2c_dev->dnf_dt = t->digital_filter_width_ns;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
 
-	if (!setup->clock_src) {
-		dev_err(i2c_dev->dev, "clock rate is 0\n");
-		return -EINVAL;
-	}
+	if (!setup->clock_src)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "clock rate is 0\n");
 
 	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
 		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
@@ -697,8 +685,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to compute I2C timings.\n");
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to compute I2C timings.\n");
 			if (setup->speed_freq <= I2C_MAX_STANDARD_MODE_FREQ)
 				break;
 			setup->speed_freq =
@@ -709,10 +697,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		}
 	} while (ret);
 
-	if (ret) {
-		dev_err(i2c_dev->dev, "Impossible to compute I2C timings.\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(i2c_dev->dev, ret, "Impossible to compute I2C timings.\n");
 
 	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
 						       "i2c-analog-filter");
@@ -2174,10 +2160,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	setup = of_device_get_match_data(&pdev->dev);
-	if (!setup) {
-		dev_err(&pdev->dev, "Can't get device data\n");
-		return -ENODEV;
-	}
+	if (!setup)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Can't get device data\n");
 	i2c_dev->setup = *setup;
 
 	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -2278,7 +2262,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 		ret = dev_pm_set_wake_irq(i2c_dev->dev, irq_event);
 		if (ret) {
-			dev_err(i2c_dev->dev, "Failed to set wake up irq\n");
+			dev_err_probe(i2c_dev->dev, ret, "Failed to set wake up irq\n");
 			goto clr_wakeup_capable;
 		}
 	}
@@ -2304,9 +2288,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->smbus_mode) {
 		ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus Host-Notify protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus Host-Notify protocol\n");
 			goto i2c_adapter_remove;
 		}
 	}
@@ -2314,9 +2297,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
 		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus alert protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus alert protocol\n");
 			goto i2c_disable_smbus_host;
 		}
 	}
-- 
2.43.0


