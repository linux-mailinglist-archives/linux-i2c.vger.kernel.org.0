Return-Path: <linux-i2c+bounces-7797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E9A9BD3F6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 19:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DFF1F22D5D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13561EBFE2;
	Tue,  5 Nov 2024 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SmaFCG6N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0C1E7C2C
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829554; cv=none; b=deS0dTDShQ7p0hv0lL7bhQVpp1iJveyY2hyzdfth565h6y+6PVJYqE8Pa76+ZMBQXzartyn9ZjtIY8SbAIDuip4Ir+CKNlvnjFodrO7UgI+xSQCNxFK7eQJ2glk8wQXP64mZWr7ab8rr6COgaRa756Cuv1JUXwZ1k+WwWjpepR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829554; c=relaxed/simple;
	bh=3ST615/WKBOUP7DVs97z4oxIoplQnIGJh9CorU8thlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjDrZNY0dqG8y1Pu4mKS6tav+zo4BiCmProXjibP2VpVBave+QYXgU6U+NjSv0zTlM5HHJR/Xl8Zl0iXByQorpsRtJdibf5kqm8mJjdf+qrQtLdg3VtJ04xdh0fn38Zy/zbtKr8BZCLYtzhlCYuX2pu4L/mrDNHSJpC3Cu8z6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SmaFCG6N; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so4189667f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829550; x=1731434350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwqNpmvgjUkGiS2uMPA2izOqYYRfRdFZCIk57WKV4D0=;
        b=SmaFCG6NdEZ644t0OONTXI5cAuXyXcWWOp+hgWdH1spbJtLbHX7PZMBMn3u7gWnpOg
         06fQVSJKfVCDjChfE+yalTkf8dgZvsVhOtqUtAGnTuKfr0E79c6Xc37Aw9oFqvfL2Mi6
         m4EWvws+nMi9RFlOenyUVQWQs1axLHAhf2SJS1F2ObUy560893p4kpUh/vCESKAslmJK
         1UzrsEPKTlWGgoRZe+qiuCvoOU7b/vRDun4YYgpXMdq8Jv3iiGPsVm0CjjWmB0TCVMS0
         1iZN2/swRCWtW8vNVdfd0mEVwNJgATFyasQSppHsbO7tVOqkWSxPRFzd8zWy7yMATKUt
         GXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829550; x=1731434350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwqNpmvgjUkGiS2uMPA2izOqYYRfRdFZCIk57WKV4D0=;
        b=mrM/sTTQC+b/9Xx/8f9cTfliUppOGQ7kR+bMtimjHqhS5nMaus51huht3CRZq9Ei9K
         BkclNCPAuiYn0ayorFFFHYOSZ+u17vvZdQQ3pnGHXsLndG1/doZ22zKQBowY/OZ4flZJ
         +bPD88ZuZgK7TWY7hhPmUT7zXTNIrFlSniCewscBLZrddr51rtNUFODH6ZMHISBpru9y
         RXAZByd+Pc0vWOQiYz7XRnLoBS7pWYc/g2TTwLdE8xdGH6vwEXDG99ZkP53wrB9yGMTQ
         660lAD0whCwyxlyBIC4m8MdWbnmUuQn6j+IO8wP7pLEy3leT4bviCzY2z6+DEj/Lovt6
         UG5w==
X-Forwarded-Encrypted: i=1; AJvYcCU40e74kv/zj7NYI2jDz2BWASGBMlTg9DR2sVseBPJVckY4ozM5C7rYypyRPbYSEN74NKf+wzhhVTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDO9aWf89YUlo7ZYSLN3IBptXdIBDVolrll5aHEmPgc11Ma0X
	3dVWvOUjPEzBKqrSDgFfgWORdTR8P50+4uGB0ZWBTCb5tD5l/ZVyLmzQDCUgVJan1Y9gAFdHb4I
	d
X-Google-Smtp-Source: AGHT+IGvNe8IqS9e7Lmw7xrZyZhUqojjNTzHoxPSQVUkUzGKVRzmb/Of4Bq3RH4GRZFjMxf1vbusnQ==
X-Received: by 2002:a5d:6da9:0:b0:37d:5035:451 with SMTP id ffacd0b85a97d-381be7ad026mr17660775f8f.10.1730829549749;
        Tue, 05 Nov 2024 09:59:09 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 05 Nov 2024 18:58:42 +0100
Subject: [PATCH v4 5/7] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-tps25990-v4-5-0e312ac70b62@baylibre.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3ST615/WKBOUP7DVs97z4oxIoplQnIGJh9CorU8thlg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlzl5gi1TYDIejCzu8R3vp4mgID+tO+zMWZcw
 3kSCGwK7MSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc5QAKCRDm/A8cN/La
 hcHVEACekBfX8Gky+nw3t3qYZF5f4bzKlqw0jcUoo+LdWGbdoZ+1+kzRGyYMpUJGnjZDCR17AIG
 ojHD0aiQuEQR1bI9PivcUmQtJsPOZyKxeGJPkYuCZw9XOpWPR9Ii58Hmq+JyQ/awtVxZkfbeLFl
 M5Wct3k9+Vm7EiaOG7sCRYLJRTfecDb2xfoaR3Kh6Uc4omh1ily7C0IZhUVfypmQvwFGS7vlbc9
 b6dj20qRZ+BPlIqrgn3VdktjH7Ig5wUcQ2Xrl5vTl3lF/N0HCWiEsvpR9qKSQIN0LC5prMctZaL
 S5rSD4bbAswYTTyfs+UBKnDxiHPsEscQ0325B349J/8Epttqml0VkQ+Ydhf5SbNbZyzQvlzRn30
 XQZ9CWenf8t2D0Z6VBcSW05+2HGjMrdef2SA68wYPe632QZnVRLdcrRIPa42Ish9U4AfiOsclSq
 P/KQn0A6AgUerOvdsUqdNJVc6auU6Rme6HcNZi/RuhQxwCeGtaG2Awl6kGmbhKwOeChPvTXk4BZ
 35ORx1S8vx/1U9kPzmbwKZHREYy7Uch6eLWzPDnY0m7PqPA3W8KsfYanWjaM3ACRpGcdyf3/PL6
 kWF4CBfg4TF6yuXb9pzvhF8f40Rbi2ieWHt4BoFWxtv4/rtnrXO64kkhULz3aKxlDf7rjr6XbO1
 eUKRtRtPvhVURug==
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
 drivers/hwmon/pmbus/pmbus_core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index d355e3fb0d6b7bea392c7dd5551a1c904a05f21b..55167e195e2a22154ae8fee693169d6f0829ffca 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3346,7 +3346,17 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 
 static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
-	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	int ret;
+
+	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+
+	/*
+	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
+	 * is not supported by the chip.
+	 */
+	pmbus_clear_fault_page(client, page);
+
+	return ret;
 }
 
 static irqreturn_t pmbus_fault_handler(int irq, void *pdata)

-- 
2.45.2


