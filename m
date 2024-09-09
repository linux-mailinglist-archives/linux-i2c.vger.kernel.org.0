Return-Path: <linux-i2c+bounces-6417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35066971E46
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6B31C22BE3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B926A502BE;
	Mon,  9 Sep 2024 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3btQtouZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C660150288
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896365; cv=none; b=riPw1OvV7MM6/stYOzHkL34RS9AHe8+lRdRqv4DovN+hWEPpfjgUpYkQnorKqoCOz8J2+v8/JT03yYoxQTtjqM86YXPKuDHYk7HIu1f7MvLgBNrUs/xn2WKd/D2TtA8dFRz7rypEDuB51pv9l1/rdP+TDtIUwTj4H2rzYUCvUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896365; c=relaxed/simple;
	bh=vJ4BQU0XZIcK8J00Oopy9XQQFvb4Ue39E+Oh6NKsto8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOQJT19u9K5NK7XT5h4n5c89L/eDlplxdRv5KWngfW8ZlHFpPGH1nZFd9jctnePyk1RPfdBoCC7h9pmMcZ+BD6tNvc4YsbYARykrto0q5km08UBSULthq97dA8bhg7uxqtMlOm47eWbyMPDv9zgediasv4yaFmXAIqJH24jKYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3btQtouZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374c7e64b60so2635724f8f.2
        for <linux-i2c@vger.kernel.org>; Mon, 09 Sep 2024 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725896360; x=1726501160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhtRCE6PbFntlTL0HxjwIxBidPbr+PaAQPsqAyH1vys=;
        b=3btQtouZjSEFEJhEddG4Hj8fI2+k7OH9YwCXiRTo/W7VDen/Uf8Sfx/bx3vEDxHgTE
         W1OuqNYmCcXxunfLDwjyDzK8fkJ1++KU3/3RnAll2O5l31LZ9CkURsELvwu6tn1Z24OG
         5nifKFfUVebXABpkMf0dz4IXRUrS1HhpHSOLxlXwcPqKP/yl5j0JV9aEj43ojmk3Mr0e
         /Kel3EzaykHvm/7JmFedq/c8Bj5YXWBUYo6CD9D14i2anaINwJapAOwcqtnYdaZm4Cuq
         A8xpMp6t2JZ+9cPTYF/l4oWFonvkp0DaUdiIdVNMRaNDSjjah0Ue5mKj+1aOQA6UxkLN
         0pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896360; x=1726501160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhtRCE6PbFntlTL0HxjwIxBidPbr+PaAQPsqAyH1vys=;
        b=mkxaPua4UkqvB+PIYZ5wFgjMEp1qb+wukOrid2Sb/Yhs/DPgdbhimgbtu7SwDAnxE7
         yqEZEtXBr4fipauGcfoXbGXdxcsIziH9o89RGmfSN3p+8pj3xISdsFT21whL4xxhmLIx
         I6O6ykVS1M5XDnxhhl3LCCnr5iTyOnChReC+f28LEy9c+QTGEr6u6+DMS2NoWgA+jWMq
         7MXbXCo6sem4p5jZvK20NWoK3osuSJHmSE4kq9/mqBU7AtPEhw+LTexZDzdvZOCt2NmD
         QkPBmpFk6S8slp2hcXkAIQbIMxLTYAXtB3YCLALu/5N2RaLNMYIzxCUJTSEYQ9G3jmzT
         boOw==
X-Forwarded-Encrypted: i=1; AJvYcCW9nGpNU6ydv62HlYZdXpeabUtMvGEhCT4VpwsrW6hfsNCDamSeUv5RmxlUkEbXhrImL4oKzMmJSCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqoqD/PJ2FlsOBKMdGH3HbTCHfqX+w9NzYPiH5U7Rq2TcJ8WcG
	WggWCP1mmudQguxhPmWiR0/S1aTwH0KziDbfjUcCFMexknb5JQ0Z8xu5aq4nZbT+JiuFq0VRIQe
	B
X-Google-Smtp-Source: AGHT+IEJgxPHK8MMMPe3LUlF7ZdETXabJsvUYuGFTUOiVywij0WZCN5KQkmE2azknuKxQLLKoQwBnQ==
X-Received: by 2002:adf:f206:0:b0:371:8ca4:1b76 with SMTP id ffacd0b85a97d-378896121f2mr7228196f8f.32.1725896359182;
        Mon, 09 Sep 2024 08:39:19 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm6305145f8f.18.2024.09.09.08.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:39:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 09 Sep 2024 17:39:04 +0200
Subject: [PATCH 2/3] hwmon: (pmbus/core) add POWER_GOOD signal limits
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
In-Reply-To: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vJ4BQU0XZIcK8J00Oopy9XQQFvb4Ue39E+Oh6NKsto8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm3xairYSGGaLEKh/WnARwotxDj4C2L/d3Tc/6d
 XGKzwAM2g2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZt8WogAKCRDm/A8cN/La
 hTWrD/sH/ZzBTCRaI5fuZQnDD53t6rP5XdAGe//eiiyh0tbtCh+pDxadxfodQU3qq5nDnVCAvXN
 aL5SPFf9V//nKQ6cc2z5OsLTkZ0LgQsKWiad2LAuh9o2vTkM8D48Kwd2DEZWs1z4rxcqD05JtFK
 cJzC47s3Lpu9YsDmkGVbG18lsNiYLMaN7LeqpkVSWfPyo/OBv+PzlILrQ4YOt+9xb+HjkshEj0q
 8yc0bhBOT6gku0d4au/aAkkpTyVZ/AWMUjLn28yG0FpKXY86bmBrVRkX3pTSIphmB/gP7ZIAJgE
 qT8B1KWLajtWj612KdAYlXeJmQellE/vBpqL6EoVfvNDqrJmE7T0T8qf3k5mLdqISHMc+zq5fTY
 3nfb/ahqgVbnr6dqYPDgWnDOZp7NKlNJ5+rN+sOXA6ucZbS27vIvOPk6hZM5RsFsryULFmR/wei
 /gvpr/DQLt8+8l7mbD9TanXkcBGqKySK+MpHhR31nE5h7m7f0HTWcUTdI4IgqI/DroSAbB+i8Hz
 a09NrA4s7XGzsl2BW5p/TRLIXlX0ITIMYudIr8ArWi8a6GfU2fLpGvUj6IQp+IC6LGqvEv+5WM4
 WfWTnzNzCdV9ij4jCEVwVmEv+1j1pDZqQGEbEPyld+O3lsKhvNd7bm6lcZv4n2gHLtcGMjkIBuf
 WHdzx7vbPcc9N8Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus commands.

For PMBus devices that offer a POWER_GOOD signal, these commands are used
for setting the output voltage at which a power good signal should be
asserted and negated.

Power Good signals are device and manufacturer specific. Many factors other
than output voltage may be used to determine whether or not the POWER_GOOD
signal is to be asserted. PMBus device users are instructed to consult the
device manufacturer’s product literature for the specifics of the device
they are using.

Note that depending on the choice of the device manufacturer that a device
may drive a POWER_GOOD signal high or low to indicate that the signal is
asserted.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 3 +++
 drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 5d5dc774187b..e322d2dd9fb7 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -78,6 +78,9 @@ enum pmbus_regs {
 	PMBUS_IIN_OC_FAULT_LIMIT	= 0x5B,
 	PMBUS_IIN_OC_WARN_LIMIT		= 0x5D,
 
+	PMBUS_POWER_GOOD_ON		= 0x5E,
+	PMBUS_POWER_GOOD_OFF		= 0x5F,
+
 	PMBUS_POUT_OP_FAULT_LIMIT	= 0x68,
 	PMBUS_POUT_OP_WARN_LIMIT	= 0x6A,
 	PMBUS_PIN_OP_WARN_LIMIT		= 0x6B,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 0ea6fe7eb17c..94ddf0166770 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
 		.attr = "crit",
 		.alarm = "crit_alarm",
 		.sbit = PB_VOLTAGE_OV_FAULT,
+	}, {
+		.reg = PMBUS_POWER_GOOD_ON,
+		.attr = "good_on",
+	}, {
+		.reg = PMBUS_POWER_GOOD_OFF,
+		.attr = "good_off",
 	}, {
 		.reg = PMBUS_VIRT_READ_VOUT_AVG,
 		.update = true,

-- 
2.45.2


