Return-Path: <linux-i2c+bounces-12937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C7B55EEE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 08:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1DD71C27787
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF142E7647;
	Sat, 13 Sep 2025 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmXKjmB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F271A9FA8
	for <linux-i2c@vger.kernel.org>; Sat, 13 Sep 2025 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757744772; cv=none; b=l+IvUw8glaOtSje1GhM8Qk6IhSxCwbttFezJa76XZITMoAszb5G4qOHC672fJBxWINxxJI32kBf83aYqExecDZwla1e+Ggr98D4CRcH9CNYu0idthTYOWGcg/vPu2nrnhwN1KOOQS9yDP7iLlcO2QdvWv65naSAOlSmg2V8JTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757744772; c=relaxed/simple;
	bh=eSwL1MT+q6WDO2KrNb5iM6MU935ElZHmEA8e3Mn7/nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GbGhE0OwIWpdvOEbzXeUSwaSzWi0IqD/Y5EqTzBqBDDVoD96MSLpTtNTIR+HKxZ2kEwJSsVViCWrXE7Mr5TW1NroGoK62xlaFrlQHoO2k+UL80c7TmNdWgB4ntYacF7INrRSTOZWfGRp1S8gRN9RPWMYv2yoOiiZYkwGwN2IXAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmXKjmB5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5720a18b137so261565e87.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 23:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757744769; x=1758349569; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9qLE3qXnOG94GvXjkAQataKE5t2lJhXnQe1G4RxJtU=;
        b=SmXKjmB5RH4dlidD+bccQb1UDAyGP0cy7Eyv1im+74PMlQ1Vt2b/EsDveAuMs8gX5j
         K6dV2ncpaBllqP8DEnf2ddOEeQpf/pQFxjOXhL4H7VJSqnDzBa0YPefMYEiS9PpaaQiO
         lswpkJgYgVQNq6B3eJjb/qTIRItTJomgvppBp3SmZZLK8qpFrSAnHTt/QLYRBsNqdJqC
         CxgpISZJNLQWJhTdcZ28D9T/ii3lvzLR6PPmqlmbu9a7TKCuftVouC4V2qfbkMqODEdW
         6f9c1eehNcQNFjjrM4K/jzqOOvqy05ACXbLWfdCnPmQDKVUCFC+pW4bdsgcvRhoAVEId
         QWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757744769; x=1758349569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9qLE3qXnOG94GvXjkAQataKE5t2lJhXnQe1G4RxJtU=;
        b=YmGj1z5hiS10IX9pPpNTwJteRg2L5+lAIEC6BQyVntAP/eJQuPZimK5sNLMyvDsThg
         MAxvpBustfiw7Ku4pS38ObX+YkpVE+3xwHyWkPJ+Likj80il7FLMrgW+fY5F+giKG/pl
         orNThlzmdTWxkSSs9+Xm/GZ5ZANofKHlwCZcp039mixUiQbbXEJUagkSrRi6D1tm9dCk
         QRfGUSarq/P8oDe/daXTeQ1IINm9a19Xxc8a+Dn2PXf4OMeEFkAZBN91NrswVnqCzQ+z
         72hF0ACGvAxuB9cp/+ARoVKA9Q2I9HKE0N4S683uqG7HdJOEwCDkX5YrhIn/jPleSUij
         KmUA==
X-Forwarded-Encrypted: i=1; AJvYcCVb7U6EYRBNTsr+h4ErSGcagoWRjzSYaP8CXMdxCi8HK7DH1X9a8nsI3CqbKreUjPtWRO3pJJ9+NTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9sYTsYdplO0DEGk31dJaHIJwxwifLOECFeYb5+Yii39ylCKD
	/8QjIOp0ZVjgHlE/WYearUE92lpKa7XHnk7KQQVAWpw5LMVkAt9Dd17h
X-Gm-Gg: ASbGncuM7ydy9HUdv4B1y6yFactB5B2MNmQpjvmqEeY7k+0d45dYcYCaALDM5xmlN1g
	klB0VVe9WnBKdAo/zZTXBJc7T3flLz2lhYcI3pSlZr/oGSN3cmSajEau1+kugmEfh8vFWef0JlG
	42WbFSSFM+0/Zf/xnbbbtmkxg6YW6WFV2ALY0WEeYjsXULd7kp2xZdForTbRSu3k1oiXGX2gGO3
	PNN0i9WpBfNuuv8m4Q0ELXHvxx2tVskgT9Da7g1uYivQ5V5T4vq+iyvsNfdzP9cBt2VSk1Jc/wm
	wUnvtZB+6D0iZkMJyqWitTui1yhfHDempa2kkhdkfgmPuC0oXG9wtP+IvKnJZXeh+jO+8oNVi0h
	F0yMSxukazZ1ISrwCaIhD5bG/lGeO1S+r5aEsy49RHhqThB9L85jWrmNhGtePTGhXybd4obWSVl
	Vn5kzMmJxahPgV
X-Google-Smtp-Source: AGHT+IGXM12xzNIqaGKxCqfh8qmw0eeDtRkYW2hR/ijX7NGKH1pUtKyn6LBcL/b8EiiJAqLbSVqMAA==
X-Received: by 2002:a05:6512:798:b0:55f:51b3:9410 with SMTP id 2adb3069b0e04-5704f5b1386mr1148904e87.49.1757744768758;
        Fri, 12 Sep 2025 23:26:08 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cd7sm1744097e87.90.2025.09.12.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 23:26:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 13 Sep 2025 08:25:59 +0200
Subject: [PATCH] i2c: davinci: use I2C_MAX_STANDARD_MODE_FREQ when no
 clock-frequency is set
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-davinci-i2c-v1-1-d18849aeaaba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHYOxWgC/x3MQQqAIBBA0avIrBPUqLCrRAuZmWo2FgoSiHdPW
 r7F/xUyJ+EMq6qQuEiWO3bYQQFeIZ6shbrBGTcZb0dNoUhE0eJQEyGGOeCC1kMvnsSHvP9t21v
 7APx/YPhdAAAA
X-Change-ID: 20250913-davinci-i2c-ddcca6ac7c19
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eSwL1MT+q6WDO2KrNb5iM6MU935ElZHmEA8e3Mn7/nE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBoxQ55acVadW/3JXh++wdkm/MMo+xEeExE4KLXa
 1ln8cAoNKmJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaMUOeQAKCRCIgE5vWV1S
 Mu3AD/4j6iYh68lIRfTr4SdGIuhIMu4tCtdY/vcHUsBEqxwlDXDPZZ7kZlm3bjzMr8t5rU0viwi
 KAz/5t/s2uCkouGjs8/F6T8OYMi2j3hlNV9PmTny4YimZOeukv6LZk1clR+JKW2/HL51IJ0qpz9
 NOYKFw/np7GMR+sxmPwZb6igEjg9CJujOv3cs9eWuGU0pZswSlQl8FnI8Hhwu2j7U71IVZC2CUp
 kyMBGC+2qTSUhPQuT0JSC3edAzwipCHfyPWslq1rNdQhEhphqhZRzvw9ASFjuVpVW6dJDpoI7zM
 3AKasQBnhKrhoIXrbf9OIb86jJe+HPPCyNhpQgnIFQ7VTSHM0wlTH3n86jYlQr43tGD0YLq4hgd
 kTIWbCzUx+QFgvWHqoSKOSUR37j5pEcMRv8Iux/nqdLGebE2j55OLhQ6ZlKAEb4YYf1FbJ/vPbQ
 9HGj18sf44harGe7U24Y3hNsR4ADy0MQJ5dBJ1O75eAukxRcukdGRfRe+alYl9/O28YSVReDctN
 +UMbx7ZXMT327WBmbctcKVjHY3WRrsprGViTGC03nPB0L1SvhAEnibz7E3S7F4c4oOmttUCKcY7
 /zR11Eq5Gov2VX01GeBD8BcFPSx7Cqh3bDV0zo2bFMpALCwjtJ2Anu30SA8UB9isIRxSHovG7v+
 Z6m6TN4mMddXhlA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Go for I2C_MAX_STANDARD_MODE_FREQ instead of a custom variant if no
clock-frequency property is set.

Besides, the calculation to kHz does not work for
DAVINCI_I2C_DEFAULT_BUS_FREQ as it is already specified in kHz.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..c6d81efdb9e4dabeb5ac40e9fd9f1a2189619e71 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -761,7 +759,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
 	dev->bus_freq = prop / 1000;
 

---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-davinci-i2c-ddcca6ac7c19

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


