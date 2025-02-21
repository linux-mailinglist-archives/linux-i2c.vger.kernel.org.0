Return-Path: <linux-i2c+bounces-9525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827EA400EF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF38B19C5108
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 20:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB47B253F0C;
	Fri, 21 Feb 2025 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biQgwvMm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88DB253331
	for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169717; cv=none; b=Ue66URISatosl/8AQM19g+FVypbsKrQOQjsYLrygcMbHzH73FhIvikGnEPqTC6hcbkGMoElZbhE/65xTHlEG/wM73uiZGjXN6UIBM99xoiuUT/j8Z2r7/P5ZV13z4ektZDSSMeuC79urqWSTpkMNM6nlfvCE62b3EDIpfW8Nsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169717; c=relaxed/simple;
	bh=uElLq3u87H7/x2+y61YQPjLWPd+Dw+wMfhkNZtcD7LE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PvOdGHnomqNL7kDj2cxZOWxGaUcblmusy468tWsY7FDUbrBk4/JjFWdp0AuN7mjlEW1RPk+ltHTiCNBLVfbZHDVferd2Kit1rQHcGpMgh7M3dwJJl+OLH6J/uceS2U4UWyLGi3w3+0XimYEiCE9/+KdL+MoekY6mL+cIBANKGiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biQgwvMm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so15492595e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 12:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169714; x=1740774514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C1jDvM8SDjc5MrZ7z7/Lc3QzVT2dE13jH1UwHurT6uM=;
        b=biQgwvMmotEoiAvvpEWqhLrX1T8gEpZmWd83lrh2XKCMyYPQKgEpeZEiJzeulAtD6L
         FpWpkq3lgnmnfUXossf3/Ds8Ra/5iXeDx3ZkXAKoujI0sS8VhcEw4DgZzQulWb34g3sW
         Xb99QbO2aAj1/15h4eHhFCqqQ5Z99+T/HQqIvfBcUTnq5oEXTdSF+ER1UM/Te7BInKfW
         INI6XBp1JN/SYWf8CKd5gnYpm7gCTnyVtcCcxfTUrtnSKZJePZQPBQmlbU0MJweJt5t7
         Z1hR4TNts46d2ll4nYDNF+EUG14eF2jFdBdYQs2seTitzeAqay1jKm2CSMM/N/0VfuJB
         ZivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169714; x=1740774514;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1jDvM8SDjc5MrZ7z7/Lc3QzVT2dE13jH1UwHurT6uM=;
        b=hs8AcsBXZ15lx+rQv1x6/IO8xB6vShsID7eMKE2tigOF88FWSENwITnxy5165izoLZ
         agq2Zu5lrLkbsU4UdghrQaGz6kuC47LUwhiuGvz9MwaeZTAQ6SdtvLxoghATA7N7CxjR
         f7B4iKhzHOWQca0eRYc7HkLszQbXbNgdVsxnka7LxkuNzwhdkbbKYEbTi1hCuwOrmmgV
         G8sGn4VpNTIUmmOQZJ6fvxq35VShBHrQxmreYSIqomz2JhxwvxeGxK8cpCcvh3o/bZOG
         pZj3uoH6FuOK9dEaNg2Au766ZAQmJ4AUWRhcg0RIcjRd/OKGNClQ15Mtu/gYp9m6jhTS
         vCag==
X-Gm-Message-State: AOJu0YxaxfBSFKX0KdZ5Ea/4m921VZ+GU/vHRd8v0EoNI9uoASl0v89I
	n7vrVTfJHxkdyMeeWF1TPRmARbVekIRc1GwbtC1W8JLSw8HEqLWZ
X-Gm-Gg: ASbGncusfRyKRq3a8gIGdQLHUtDsjAkiQTgYmbLHNI1Lm1PYolBy3xfNa0+KMFTROiX
	JZKVVvdYQ8BBEhJ2+BpltR13bGNuf69lxjY45qNArMI+MfhbAxrG4LS/azQ2c6RLuRNxZ84MfJp
	IU0qETyexzFkRRAUc61RWBkWaLc3tDOmRzBlhpvz3zduVADXM+iaiUpAAi2jotHeVnMnMAKsiG8
	afaZ58iZ/24p+S/67xn+mTBCMOca7HsjwZB/EuVUrOWDJsor2BKtc2aIkSvCOmLrjY2G75HJmV5
	6KBhuUzxAf+57HpD4uzYqra8cDnlsS4j/Edx5QnX5Cg5CvDWSmyL6+ymfx4uADirW9ZrHwhVAEH
	fY/9+TR4TTMLdIXyLd2iec3VGyaNOz1TdXXDdvHCl7V/EfOzrSk8Prbkq3Dv/n8xYR7GFAClqX4
	hFOsBKssZMIPlb
X-Google-Smtp-Source: AGHT+IGE7ZnaYj3IDu6SQ6NhVCzr5rzI8RTwR+M3d1ilCO840lDGtuUSxQ9OEv3sU74Fn5pmHDwDlw==
X-Received: by 2002:a05:600c:1f8c:b0:439:8634:9909 with SMTP id 5b1f17b1804b1-439ae33f748mr41187465e9.14.1740169714024;
        Fri, 21 Feb 2025 12:28:34 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:9dc2:647a:dfc:6311? (dynamic-2a02-3100-b29e-0900-9dc2-647a-0dfc-6311.310.pool.telefonica.de. [2a02:3100:b29e:900:9dc2:647a:dfc:6311])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f259d5ee2sm23978701f8f.80.2025.02.21.12.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:28:33 -0800 (PST)
Message-ID: <a60ee54b-c5e8-4bdb-9f1f-8889f4dcd114@gmail.com>
Date: Fri, 21 Feb 2025 21:29:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] i2c: i801: Move i801_wait_intr and i801_wait_byte_done
 in the code
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move both functions to avoid forward declarations in a subsequent patch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 68 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a3d79a5ab..9097bb9cd 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -337,6 +337,40 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+/* Wait for BUSY being cleared and either INTR or an error flag being set */
+static int i801_wait_intr(struct i801_priv *priv)
+{
+	unsigned long timeout = jiffies + priv->adapter.timeout;
+	int status, busy;
+
+	do {
+		usleep_range(250, 500);
+		status = inb_p(SMBHSTSTS(priv));
+		busy = status & SMBHSTSTS_HOST_BUSY;
+		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
+		if (!busy && status)
+			return status & STATUS_ERROR_FLAGS;
+	} while (time_is_after_eq_jiffies(timeout));
+
+	return -ETIMEDOUT;
+}
+
+/* Wait for either BYTE_DONE or an error flag being set */
+static int i801_wait_byte_done(struct i801_priv *priv)
+{
+	unsigned long timeout = jiffies + priv->adapter.timeout;
+	int status;
+
+	do {
+		usleep_range(250, 500);
+		status = inb_p(SMBHSTSTS(priv));
+		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
+			return status & STATUS_ERROR_FLAGS;
+	} while (time_is_after_eq_jiffies(timeout));
+
+	return -ETIMEDOUT;
+}
+
 static int i801_get_block_len(struct i801_priv *priv)
 {
 	u8 len = inb_p(SMBHSTDAT0(priv));
@@ -453,40 +487,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	return result;
 }
 
-/* Wait for BUSY being cleared and either INTR or an error flag being set */
-static int i801_wait_intr(struct i801_priv *priv)
-{
-	unsigned long timeout = jiffies + priv->adapter.timeout;
-	int status, busy;
-
-	do {
-		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
-		busy = status & SMBHSTSTS_HOST_BUSY;
-		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
-		if (!busy && status)
-			return status & STATUS_ERROR_FLAGS;
-	} while (time_is_after_eq_jiffies(timeout));
-
-	return -ETIMEDOUT;
-}
-
-/* Wait for either BYTE_DONE or an error flag being set */
-static int i801_wait_byte_done(struct i801_priv *priv)
-{
-	unsigned long timeout = jiffies + priv->adapter.timeout;
-	int status;
-
-	do {
-		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
-		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
-			return status & STATUS_ERROR_FLAGS;
-	} while (time_is_after_eq_jiffies(timeout));
-
-	return -ETIMEDOUT;
-}
-
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
 	unsigned long result;
-- 
2.48.1



