Return-Path: <linux-i2c+bounces-1610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF68468E9
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 08:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C943528DC92
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 07:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5711B18E11;
	Fri,  2 Feb 2024 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRleRLL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882EE18E12
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706857341; cv=none; b=QhfPAtsQaovR4nQwRbY0j4tj6hKws7h9BNxAypVSPUVFv8zRai4/CyIIXSY9yGTO+a5vMM9BshWYs5PH/wL8UJkQgLhWh478Cv3BF7gtzNjaLeSyfaKunfDyvoOhVLWgYKxf3jNsYVgaGmKJgzkNaaxehok9eMGuO+hO90E1uZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706857341; c=relaxed/simple;
	bh=fve07InBj9wYw56bY6g1yshIjEjacjDwh16fxJqt19M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FnQfGqIanbeAQPBLVL8tm0G2bJS0rEacl27NZ/f8dcCslMnzdD9fXlYghtxMYsF+zRWKxrxXZqBMnfwLIiQSu4CCIi5BcAsvXAM+2OE3jRHyj5MFOsDBK4jZ5Fo9uC4EYOxK704gwg+KdW7poac2ikEiYv4SlN9gaLoJAVg+J0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRleRLL4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a364b5c5c19so290576866b.1
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 23:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857338; x=1707462138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cnOacyhJglkzROB1Zm6vEH9B1X6rxEKHJsPgyQcXjH8=;
        b=fRleRLL4dIVni2+1yD5RQvQ2n6EdgebK6aFdaEZa+QhqGZjW+8r3bU/Mezs83B0ewL
         1/zoIQbKckY2ROluO/esMf5OISx++vRzUwtdYPq9kID9bZvmFv2/bq1a4OTQUSiynHD2
         xD75gncVykvYq9+DyUXsEgPyfBv9OGuREjV4nGo7aTC2xaJLj6HVdDV51eAaED2ssfhH
         vipAtVCt/SZf+EN4qrZnH6vb1o6ommtVHu2qWRT9ZAL7JQHc1XPETL98LbvlR5jHQM9r
         oV/MiFk/cpDmFANld4jbwYbzvw0oNBoze/Dqph3VlP5BDUFORFEes3SyiVIgVkvTtnR0
         MYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857338; x=1707462138;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnOacyhJglkzROB1Zm6vEH9B1X6rxEKHJsPgyQcXjH8=;
        b=u8kNjpqcl8a0djJ6WZr6FJ4sQTLm4ypBFcX7y+oe14ciLryQWQirC/Cde7cGT9eqae
         /AzPfVV76VbUF8K7Fa99GZor8sAwwgDgVUUPajSyGEk5uSThpmLubMkXsHIRKIyfiPW3
         HdxtWi5OaLj1swurM2CKiajqQUFShloCEsiXkFUrpwJMZtBZCOP2i+YMNy7Bs0BnXAVy
         Lz9HAe7LAByqQWpzYKRbnVFAnfUD9KSGyI+D+OQa19t4/9C3/5PS4luJo06GBhawKLqM
         ZDPr1e4IschTFKj2fZI4HQFRIBkFC4iOn0NExvES36ej/qzjqqYJwxhwNuG57my9Mw/R
         Ckzw==
X-Gm-Message-State: AOJu0Ywh5lZ6hiWt/xPU5LpMnIGcAlAqXc9kos4wqFF/X13VAJoUR3v7
	QansKor0ZPlmQSoquAsjlUPm2O9FYCtBcEbFufnBCCJdr3FnvM/zMtcj8obK
X-Google-Smtp-Source: AGHT+IGkgilOMrh+kOrz0Xzsh+mCkYYuow4rCfb/pFA4oZKFOgP0vu0Tan3Los+eaiH63BEXoYIprg==
X-Received: by 2002:a17:906:e0cd:b0:a35:3bed:6cb4 with SMTP id gl13-20020a170906e0cd00b00a353bed6cb4mr4864758ejb.66.1706857337576;
        Thu, 01 Feb 2024 23:02:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNPtJCPkcJt1Wn3u8BzMqEhdynRfeD/eM8JNyw4QjuHOmVaE5jrthrSHva4+KKe4ULB8mRzTRULiTULJvgPoTRiPjf92hB/BteBTA7i4k7IGB5XJWD0l69r7KuKSXxymxRw/Z60AFT5A==
Received: from ?IPV6:2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea? (dynamic-2a01-0c22-7392-d000-5c1a-bcfc-a8a4-5bea.c22.pool.telefonica.de. [2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea])
        by smtp.googlemail.com with ESMTPSA id c3-20020a170906340300b00a35a659cab5sm563728ejb.179.2024.02.01.23.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:02:17 -0800 (PST)
Message-ID: <e97f8214-bc10-4cdb-8ac4-788c4b4b6f88@gmail.com>
Date: Fri, 2 Feb 2024 08:02:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/5] i2c: i801: Add helper i801_check_and_clear_pec_error
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Avoid code duplication and factor out checking and clearing PEC error
bit to new helper i801_check_and_clear_pec_error().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-i801.c | 38 ++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 44ae6326d..156bace92 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -328,11 +328,27 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static int i801_check_and_clear_pec_error(struct i801_priv *priv)
+{
+	u8 status;
+
+	if (!(priv->features & FEATURE_SMBUS_PEC))
+		return 0;
+
+	status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
+	if (status) {
+		outb_p(status, SMBAUXSTS(priv));
+		return -EBADMSG;
+	}
+
+	return 0;
+}
+
 /* Make sure the SMBus host is ready to start transmitting.
    Return 0 if it is, -EBUSY if it is not. */
 static int i801_check_pre(struct i801_priv *priv)
 {
-	int status;
+	int status, result;
 
 	status = inb_p(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
@@ -353,13 +369,9 @@ static int i801_check_pre(struct i801_priv *priv)
 	 * the hardware was already in this state when the driver
 	 * started.
 	 */
-	if (priv->features & FEATURE_SMBUS_PEC) {
-		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
-		if (status) {
-			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
-			outb_p(status, SMBAUXSTS(priv));
-		}
-	}
+	result = i801_check_and_clear_pec_error(priv);
+	if (result)
+		pci_dbg(priv->pci_dev, "Clearing aux status flag CRCE\n");
 
 	return 0;
 }
@@ -408,14 +420,12 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		 * bit is harmless as long as it's cleared before
 		 * the next operation.
 		 */
-		if ((priv->features & FEATURE_SMBUS_PEC) &&
-		    (inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE)) {
-			outb_p(SMBAUXSTS_CRCE, SMBAUXSTS(priv));
-			result = -EBADMSG;
-			dev_dbg(&priv->pci_dev->dev, "PEC error\n");
+		result = i801_check_and_clear_pec_error(priv);
+		if (result) {
+			pci_dbg(priv->pci_dev, "PEC error\n");
 		} else {
 			result = -ENXIO;
-			dev_dbg(&priv->pci_dev->dev, "No response\n");
+			pci_dbg(priv->pci_dev, "No response\n");
 		}
 	}
 	if (status & SMBHSTSTS_BUS_ERR) {
-- 
2.43.0



