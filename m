Return-Path: <linux-i2c+bounces-8953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A7A04AF4
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 21:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4552018878F8
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 20:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1121F4723;
	Tue,  7 Jan 2025 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UatNsQ8Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095581DF97A
	for <linux-i2c@vger.kernel.org>; Tue,  7 Jan 2025 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736281752; cv=none; b=UPk9b/jpbx4Rn/SDT09NbrWDHfucp8wNt3tHiPTBOD9y6GNBFIyi+EKI5qa01/JoxyJ47hePRHowzEWjeLuQ8hKkf0wURLu2r+mQ6N0GLxxGqGsLRiMUk+2ayx5ke2AkCjidnP689MMMVyuBKA9gGcQMHjj3Akii3VasLTg6/ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736281752; c=relaxed/simple;
	bh=2XGFJytdmS/NtJyoaleiW0ZJAoK4VUyYwOdAZueyHvk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=o9J21Od/y99CQaRYPEAdF+aT3gx+aBIViwjMYLNdWN7dDppoZn12YPSC/DAoFM1HCGt0GoXIiWV9TnGKJ4F88mdiffk4zI7ZvAvU4gdJWY8OVgL99utBW84MiTnO7kDmLxYDmLPoXBb94q3jxob0prPdbZorKkWBCahAIb86TTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UatNsQ8Q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso983150666b.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2025 12:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736281749; x=1736886549; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHBW8mI5qAP2AyOhRCw18RUOfoPUQh68OaQcaqyMUEY=;
        b=UatNsQ8Q+57mmjCozsxZBrL8Urz/HTHW1uFuHZOSJyNDQCtiTCyem5f5Xuq4MpeDl0
         pABXPD6MGBvOA9vrhJymHyU1bLU1TBFU/QaDcIp+8i9NTYBimIs+YTFfNIh/6xMnq+0D
         uNh1B/qR81ZTM7r3idAklfawxvUTmUqodlDf88ulhAMZ2CNTkPgdPDsiidHsEZ8s6DS8
         WyoiYjrvzpJDLc1AON8CDxj3/TBxPN6AkbUCv1ckOX1qsPlU0lhYVQ/FKWDbu8Vmqr2b
         kv8QBdPy+JKGw2Wi8c72XUe4kjAwMtsvhVASvydFHMj4dxvFoSQuILaEeA8oSY5EaGd7
         A3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736281749; x=1736886549;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHBW8mI5qAP2AyOhRCw18RUOfoPUQh68OaQcaqyMUEY=;
        b=QDZeMHJaVMsNT8KpVdBxNPgUoSiW51vqXsW1Ko6mFtO7py3UisJaGl9K+UTzqAm7GI
         x0LEWeHLiwBshrJPHZe/MCIIl20T8RWRjtVC02PAmhJsgy+9Xz1UUE9IuQiS5WRgGZe2
         0Mh2QtCCAYfrhaJuGBRaj7a9vMPZwA5UbiAbM+rWiK7QGbrNpQxAeJV5a/hBoxM/avqV
         PLOl7KWV3hFWj2SFF1uj0EvKLoVYhgUjEqaZdrY/ZG5hH0/knY+Wesi/4rSO/uP2UnCA
         g8GbeV/aNtVlYNoDcnwuYFyUyRhWEJL8Hv+/utItEzu9aOtNMjKpAj6YQF/UAnqc9eMz
         0+Ug==
X-Gm-Message-State: AOJu0YxC3PP/Jy1wypkrZysuQlWLJym/1ahoPocpaazz7eir3zndnJOR
	a/s+Vc+5AnxUsAIFaaOSw6jbuVO0/oQeKkGm2YDLw65eCpO2kxDK6sFhdQ==
X-Gm-Gg: ASbGncuTcChS5DKE+ZCDqFxOu+q2zZomi/5eu4HdE6N3wJPV6WpMHUUNUz9XCTkwvnE
	JB749drRyOrAW875QPfKe2RwZoqB9LfXt3j4H4yq4OGz2MGmFZqWIlX39iDL94BdnEJbUDqsC4g
	a9fzRGY5K41WJidiI+RDpSTEAzSVDylvZx0FpVLf0FTSOkdWUmG1y048KOgcdApiYSRCraxf71q
	HvojprbZK5qD8t/VGtbdrA1cX7DOy3wGaWS1tGX1irzFGqorxSWrjZSuu7VyUbdbIf+fPmmXsqE
	1dGe9KxE8qnMKaqqPKvx9xn09ch+msCr8lZetMT3gzaN738Qr8xjNl8oxcxWH/Luf+V/Kk2wgeX
	t8ZNdJe98AiWH7SEet9vwWaYKvqSEGkwFhXQkVDEvVc3tI3aP
X-Google-Smtp-Source: AGHT+IE4S8xAd1cqTkEw+2MCu+mKjl+eoXMmY48HI1qeE1X1fDEP6Q8AIJ3GAkJe4LuvAyhCe31E/g==
X-Received: by 2002:a17:907:3e9e:b0:aaf:86a2:651f with SMTP id a640c23a62f3a-ab2abdc0a2emr15667166b.38.1736281748929;
        Tue, 07 Jan 2025 12:29:08 -0800 (PST)
Received: from ?IPV6:2a02:3100:a00f:1000:a57d:a6cf:6f93:badf? (dynamic-2a02-3100-a00f-1000-a57d-a6cf-6f93-badf.310.pool.telefonica.de. [2a02:3100:a00f:1000:a57d:a6cf:6f93:badf])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e8951ebsm2402956666b.71.2025.01.07.12.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 12:29:07 -0800 (PST)
Message-ID: <f4110289-f7e9-471a-bb91-941c85bfb43e@gmail.com>
Date: Tue, 7 Jan 2025 21:29:07 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: core: Improve i2c_new_scanned_device
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Simplify the logic in this function. And as we're no longer limited to
C89, move the iterator variable declaration to the for loop.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 4a858b1ae..f3b1106f2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2507,12 +2507,10 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 		       unsigned short const *addr_list,
 		       int (*probe)(struct i2c_adapter *adap, unsigned short addr))
 {
-	int i;
-
 	if (!probe)
 		probe = i2c_default_probe;
 
-	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
+	for (int i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
 		/* Check address validity */
 		if (i2c_check_7bit_addr_validity_strict(addr_list[i]) < 0) {
 			dev_warn(&adap->dev, "Invalid 7-bit address 0x%02x\n",
@@ -2529,17 +2527,15 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 		}
 
 		/* Test address responsiveness */
-		if (probe(adap, addr_list[i]))
-			break;
+		if ((probe(adap, addr_list[i]))) {
+			info->addr = addr_list[i];
+			return i2c_new_client_device(adap, info);
+		}
 	}
 
-	if (addr_list[i] == I2C_CLIENT_END) {
-		dev_dbg(&adap->dev, "Probing failed, no device found\n");
-		return ERR_PTR(-ENODEV);
-	}
+	dev_dbg(&adap->dev, "Probing failed, no device found\n");
 
-	info->addr = addr_list[i];
-	return i2c_new_client_device(adap, info);
+	return ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_GPL(i2c_new_scanned_device);
 
-- 
2.47.1


