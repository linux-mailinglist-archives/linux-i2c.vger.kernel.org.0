Return-Path: <linux-i2c+bounces-7555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A549AEF5C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 20:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EC3F2825F6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 18:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4F202643;
	Thu, 24 Oct 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zhZ093l2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5E2022EC
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793472; cv=none; b=RdwUZsxADbuHsOKMBbhPPxkIa+vAzxGkX51JDZ2xApckbkYrIeHp0pR1U928Uh5Uj7GwfkivLM8Z8EA+dAU00hTgvn7RJO7xcGdie0MrT5IU2Auj4mIKRyy48HUPj7phpOdqz9BVA2i9JD6+j3YEMBzbVvHcYQ6mx/D/p9Nh9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793472; c=relaxed/simple;
	bh=1RUvmeu4nLIw4F/R4FU3E8L2fpBrm/KNeTkrcWULZz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERqJ5It8ujs9l1FbqbomHYpQnqpjQeUScK+AS5QaKwaRJYdz19QFM9adaKNPbfkfTLA1GW4Jqv0+CzmGut0Nak08IMnsJjehjRdw/btvqUAj4sKW1x81b3TGMFVN/7K+CIkx+TgMpZMQWOOZ1Vg6a+IJAGOSghrqUo7tBKgQOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zhZ093l2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so790912f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793467; x=1730398267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eOmi43Jby+szoL0o0TudIR+Wk2BylfVEIJOGm6GajI=;
        b=zhZ093l25vd54dJPG9i1i7L7xuIoImFfGqDUpchrcaKuy3uhK17kpDjPepddUazbNg
         eIwJBRlavMm8OnCTDXVH3wBgdth0TGiS+QNLhHKkOox4QUtWkXNqz+VIGGzUrygvd+9F
         KvNZUIGsE8Zo/kJIrzasvCz/LM8fm5akO0Af33qXRss0JtUcPwm4YBU9Vp4ZvNBebu3Q
         xBlk+T4vsQAgPRM0nWUsU8z4X5HmyVVgrCaPiD5M7EKTmA7eCI0uy6Zv1YwFD+xQqQ8S
         JlMxFqT8tiXjRBQF8aktAZJVtVqA9A3i66YupL0bxFTvHZ5Lrxlg/vig55OCXWtDE9Z0
         E6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793467; x=1730398267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eOmi43Jby+szoL0o0TudIR+Wk2BylfVEIJOGm6GajI=;
        b=mbCC+Lbmfb9LM1r5cRrm2689fLoeaRxx4RGLa7EK32h1OpZoeoSGW83+g5OapI5l0/
         /YxGZEjEArgZW0c1nWXG5eF179u3993CS5Q9rvez5s70nyHOevS/hTjUvrfu+uKhyp4b
         9aTtU0bD+gQVGQ2hHNdmOU9+9bJdF5W/oaMf+G9x/fyVOR9VPfkLx7j0ZKP3yawVmOEG
         TLHA9+4BmZvc0sBSyuUsbKLfQ1LhNzGM03u3opPmnEOHJuYdRk5Q/kKIzeFkClxy6LV5
         zD6jFK2NEPFrzqLp8pClcuwTX9coEVnAFOQqmXLlTsTX5ZlsZAsp3SrHi3XvGAAJ2BpW
         9s9A==
X-Forwarded-Encrypted: i=1; AJvYcCU89w2sf8WIgDQfUM/vhNCrH2QaodQGLXiuguBZeRHewf5QawwUNrxjQvGPIbHZvaIBlbMN7ulLk/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbIfRs3m5YgfdIpSZPGXhM4ZxoQpT4mJfJdPQfReJle7UwcWU
	ddQ3wmQH+0+xJyhU/VHdOOBaaSkIVSmoQhUGIO/kmLp7EIEsimenka5MOxLgzHM=
X-Google-Smtp-Source: AGHT+IFLZgWsGUPyWhrcipgaMB5PPuZFsd4gBEIEpZg9BK409FgjZ9vFaXq5SD7emAtHfO/sPfR5TQ==
X-Received: by 2002:adf:e311:0:b0:37d:37b8:3778 with SMTP id ffacd0b85a97d-37efcf8460bmr4558854f8f.45.1729793467135;
        Thu, 24 Oct 2024 11:11:07 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Oct 2024 20:10:37 +0200
Subject: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
In-Reply-To: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1RUvmeu4nLIw4F/R4FU3E8L2fpBrm/KNeTkrcWULZz8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2x9dk7+jpaxTWiAk61vydnQ6U77tni0qxKx
 dgiMCLMPK2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNsQAKCRDm/A8cN/La
 hcS8EACMq9Gnoa8PyayjPvYHtF8zQaQktxGrW+pGWTERlZCNM/QSiUU12WlScMwXfp7bBlZ9crM
 9H46BLLbqkNLIjDDUdEeSg/HKqCc8fCN82efJ8dh+UxknRYQLo8hQsW8u+FOXORcVoS0fG5TJmF
 qvSws41TL7TGuaRC5VqeN9KQ2fIT58VxjVqViOJxSVZy/aqENZbMM0xG3oDKGoEr0KXWI3Ir1Jw
 KE7KRLtytyjznNiYhwHXhks1VRXdInUXKPqtLO/i5yWtGQCwoOxl54BduXSfgyhdATK6oYBbNKG
 QdYb9X1oykTzkgMX7ExNp18WEP/wWZ55mh1TgU0t+kkxSdfXmj6JN7jODVWnghhLNNrwl4kRYBy
 7smnJ7zPVY3aDxShzjjJ7etNALkoSzflsiCwjxCsTpRqS4zZOVjV0PHSuGcwINXmLfnnZbI2FDb
 M0WeEGmbpasGCC/NPDVqho9FzIcta8WJbPRNV7K/5j6XNdsjSjfDOw+w6rt95DZJ778LK44YdYE
 BZhsXh2a1falIF4ukLu1cTaqUXLz73NmaBJmK4WPDs9UsvWk5v4gl2XxnEayfEAyNs/7LMzl8h6
 Kz9PuCnwLi1pRF9KtAXRzHsKnhoQ3HmKc3LjU8uyu1tgQKGkYuDVbVjwks7v/iCm8U3mhIcTx9F
 koUs+9ok3zDRGBg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a module parameter to force the write protection mode of pmbus chips.

2 protections modes are provided to start with:
* 0: Remove the write protection if possible
* 1: Enable full write protection if possible

Of course, if the parameter is not provided, the default write protection
status of the pmbus chips is left untouched.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ++
 drivers/hwmon/pmbus/pmbus_core.c                | 74 ++++++++++++++++++-------
 2 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe2237f1d577df5656339d6224b769be..aa79242fe0a9238f618182289f18563ed63cba1c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4733,6 +4733,10 @@
 			Format: { parport<nr> | timid | 0 }
 			See also Documentation/admin-guide/parport.rst.
 
+	pmbus.wp=	[HW] PMBus Chips write protection forced mode
+			Format: { 0 | 1 }
+			See drivers/hwmon/pmbus/pmbus_core.c
+
 	pmtmr=		[X86] Manual setup of pmtmr I/O Port.
 			Override pmtimer IOPort with a hex value.
 			e.g. pmtmr=0x508
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7bdd8f2ffcabc51500437182f411e9826cd7a55d..ce697ca03de01c0e5a352f8f6b72671137721868 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -31,6 +31,20 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
+/*
+ * PMBus write protect forced mode:
+ * PMBus may come up with a variety of write protection configuration.
+ * 'pmbus_wp' may be used if a particular write protection is necessary.
+ * The ability to actually alter the protection may also depend on the chip
+ * so the actual runtime write protection configuration may differ from
+ * the requested one. pmbus_core currently support the following value:
+ * - 0: write protection removed
+ * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
+ *      registers. Chips essentially become read-only with this.
+ */
+static int wp = -1;
+module_param(wp, int, 0444);
+
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
@@ -2665,6 +2679,45 @@ static void pmbus_remove_pec(void *dev)
 	device_remove_file(dev, &dev_attr_pec);
 }
 
+static void pmbus_init_wp(struct i2c_client *client, struct pmbus_data *data)
+{
+	int ret;
+
+	switch (wp) {
+	case 0:
+		_pmbus_write_byte_data(client, 0xff,
+				       PMBUS_WRITE_PROTECT, 0);
+		break;
+
+	case 1:
+		_pmbus_write_byte_data(client, 0xff,
+				       PMBUS_WRITE_PROTECT, PB_WP_ALL);
+		break;
+
+	default:
+		/* Ignore the other values */
+		break;
+	}
+
+	ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
+
+	switch (ret) {
+	case PB_WP_ALL:
+		data->flags |= PMBUS_OP_PROTECTED;
+		fallthrough;
+	case PB_WP_OP:
+		data->flags |= PMBUS_VOUT_PROTECTED;
+		fallthrough;
+	case PB_WP_VOUT:
+		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+		break;
+
+	default:
+		/* Ignore manufacturer specific and invalid as well as errors */
+		break;
+	}
+}
+
 static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
@@ -2718,25 +2771,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * faults, and we should not try it. Also, in that case, writes into
 	 * limit registers need to be disabled.
 	 */
-	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
-		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
-
-		switch (ret) {
-		case PB_WP_ALL:
-			data->flags |= PMBUS_OP_PROTECTED;
-			fallthrough;
-		case PB_WP_OP:
-			data->flags |= PMBUS_VOUT_PROTECTED;
-			fallthrough;
-		case PB_WP_VOUT:
-			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
-			break;
-
-		default:
-			/* Ignore manufacturer specific and invalid as well as errors */
-			break;
-		}
-	}
+	if (!(data->flags & PMBUS_NO_WRITE_PROTECT))
+		pmbus_init_wp(client, data);
 
 	ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
 	if (ret >= 0)

-- 
2.45.2


