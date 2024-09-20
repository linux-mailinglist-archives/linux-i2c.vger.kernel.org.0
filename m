Return-Path: <linux-i2c+bounces-6910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5697D8AF
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 18:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA7E1F23E17
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA12183CA8;
	Fri, 20 Sep 2024 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RdPrm6Hk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196CB181B82
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726851406; cv=none; b=g92y+ZLinxw60H8hSC/Z4A6s/T3dqcxuSPr/im61tm/30ewy6WGBR/3A5kDlCaDHPef9YfaJjUetZ/3gnUD4UW5WPeK4uKhvYUpott8GFCdJRzhiu5gw4zeTYgYMuVpBpp+auw8WOsQOaxq1X1o2lvvjf9APVvp4XKKK/J7+8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726851406; c=relaxed/simple;
	bh=QpVJBo6AefOUWvNpmFftVebK3qfyElh+j43cpBzSL/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxTz9dsNSDGakre4fWNTVE15MP2FkhBnSEjDEDKJa6XdChS46CMWn9AHcZ69bFWIAUnj0QaYIP8uEQ12Jp7erAqGbI+QMtDE38w8Oa8Kr/2P268yYja1n24rv/NeMZ1j8EE0T7xrh5NjNM+ndzntlnpFUJrh7dKW5Td3cBzS04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RdPrm6Hk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso19116205e9.2
        for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726851402; x=1727456202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjvvM/7UJHAuVZ4e2Oa/jMPK8WTgX9Pf9wWjXoc/Cpo=;
        b=RdPrm6HkcXKoEd82mnyOkKBa+sfcYg94z5DSAO/WbyarFLC3klTeagt+FuBw8Nn9M/
         xBDqYt19CHRi/RHOPd4sFH2ofNU6Mi/9j5XixfqVJ2ObIwpsVSTGYoR263TGFFeFyAkl
         0Rf8m/f4M8oQUaXV6ap2Ml4PjxX3TH0qw+CxRjhGZqW/3W/LJubB+giS21gHaCe8El+6
         267qs+gejnfgtHbpIcTpQIZrnS8GgruZp4WFpusTdFoM9cFoYyrZSSzNTY+ycwfy8dDS
         Qb+/mHndV0RSoBXsm3UHCiWGxO1C+BDWDRUK6xEW/nZi7wW7Bev2FR4IU5685SAzsF/Q
         07mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726851402; x=1727456202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjvvM/7UJHAuVZ4e2Oa/jMPK8WTgX9Pf9wWjXoc/Cpo=;
        b=a9pJwVYfaeWxXQJH+nbP4EeeGOxvry2hRPKmGa1DF2G4ByPMKELhNC/YgpPsC0w4Yk
         FaICTd0gtxtlxAb6NFJgIhOg7u69T04O4IcSHBSzShtNk6bvyfIPbIubHZviqEihPQH/
         9Q0p/PP9lIu5AnC1h/9fv2Umms+sRCUfD+eojABs5FeNMHBddfGsGszSfRVMgRzeHlUQ
         TuRu7M0F08Jrk5zj9TK7dhRuaLeVgLbnjKEely0bZ3jUSxUXwt3sgm7QTAPYhDQMyOtp
         p/BRNW1SwUr5tL1nfwBYwC23yP+M+AxT8PhFwj1Fp+JaKmt+HH+F7Hj2S9xSMxg+nTbq
         3nsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyAYyeQ+e3R/COIGV+rzkslOMLRetOAz6jeAH3Rpr2gL5gUvGAoWj0rtSBalKtZenuvKxiRyBL0vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLCKZubfyVdWdGodaf/ScUTbCwaaG/2sGNz5jwl2GOdXpIH9X
	19/divqy89r/c6pVGQWZQ/43GXgi0Y9pcnV+a6pwUOd2SE9zkuH3FzUB9/nYDh0=
X-Google-Smtp-Source: AGHT+IH3OrCKS6nPhrhOtVVDF8gyheAa9GItjud96OF3Jvd8F+nSPpXH0s904DhbGS3A8yz8CbWlGQ==
X-Received: by 2002:a05:600c:4f82:b0:42c:bdb0:c61e with SMTP id 5b1f17b1804b1-42e7abf9544mr26979775e9.13.1726851402449;
        Fri, 20 Sep 2024 09:56:42 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e6c718e40sm97430135e9.1.2024.09.20.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:56:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:56:13 +0200
Subject: [PATCH v2 2/3] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-tps25990-v2-2-f3e39bce5173@baylibre.com>
References: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
In-Reply-To: <20240920-tps25990-v2-0-f3e39bce5173@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QpVJBo6AefOUWvNpmFftVebK3qfyElh+j43cpBzSL/4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7alFcFQJCIwUE1MfCfCwTPYj+zUQdLsFaI8l8
 l7yq6lsfgWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2pRQAKCRDm/A8cN/La
 hYTgEACph1nn+IciFBhB446btaoatticqFHbw/bg5qD1/+lFE47xPfFQGGZhoAhXryflwphL0GU
 H7D0APBjZCoG3qMrIQzZrhKZzGJAidKBC3D2Jy0k+VBhN+EvX8/U2L1e3wmsF0qFo08RGogNTQE
 QTYaacSxMo5z6Fb9Vjsj9uZfUHNzAufDcq0HMLLnz+WvioLv51MA82xpgs2VIO3pwV4wkKVFKkd
 b9D4HqqlwqNrKvHsuKmLEbzxvMbHRHpCr2p4bfFyb7QPsEOJv5oKvYcXrdhdosQ8EguBcLZXXBC
 mNGTYayNjBdAJTNAkQlW78G7mq98vIrf5rGyHyPFuyCmPSTbaj5OoCbtyBG2KTbEbuVGRq4Lyeh
 rmhmbkLh53lj2w3T+GhRptW3QvciVM3GXrATEP8+j1H7uBuNlUVr8KAVaNiil1Jpq3YHxoP847p
 yUN6fIoOW1+AV41QpS4qeiI6nIK336MNNTiGyqDVRpUpknqxqh0Ngzm9JUYCktjPVWefjVNz1/r
 IZzzpmgZqpTPHCgQg52l9I8WAMdoig9l08TWXL8mfWBXvNSTZLRZwYwm1ikAU80CaUlDhU22eEQ
 TvKl6o7ieh3oaaAT2Tq9HIYYUdEcq9YXKCr/ojYxM9xrIiMCG8Y3vPZNg7MO5STQDbMqgAM748a
 gI9CPi/DjrgoPnA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

pmbus_write_smbalert_mask() ignores the errors if the chip can't set
smbalert mask the standard way. It is not necessarily a problem for the irq
support if the chip is otherwise properly setup but it may leave an
uncleared fault behind.

pmbus_core will pick the fault on the next register_check(). The register
check will fails regardless of the actual register support by the chip.

This leads to missing attributes or debugfs entries for chips that should
provide them.

We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.

Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
avoid the problem.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 0ea6fe7eb17c..a16cb527e71b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3268,7 +3268,12 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 
 static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
-	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	int ret;
+
+	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	pmbus_clear_fault_page(client, -1);
+
+	return ret;
 }
 
 static irqreturn_t pmbus_fault_handler(int irq, void *pdata)

-- 
2.45.2


