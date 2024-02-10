Return-Path: <linux-i2c+bounces-1684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340048504F3
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 16:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A13D1C21B83
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 15:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0915BAE8;
	Sat, 10 Feb 2024 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtpnkUvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB445BAE2
	for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707579074; cv=none; b=ojN0E7/llsNwjaQ54NU5vVpL+UC4EBeN22I0vUuCXYFNaRaUxnHpB1ytDZV5dw05OZpgIccvG5L/+x40ENDvoYMRvEZKjtwUfOzO8W1bcgn/ojflAq8lkRZBPvO86x6lxCN1GQP5sT0aS5OMzShe+Vc60AybJ2Nnl0Ts1Y6ROhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707579074; c=relaxed/simple;
	bh=XND5jxMyXzeXIIBm1aM65GbeOmD0tbef9c5XIb2j738=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nl4udZNJKTlO9f6dc699JZNCYMW/n4HQMi/8RjL2E3FKQ9rYeMyoBBRIwzNMbm+xFmKhvlZr4DNrjzL0lsSm03MxMHQ0bXTWVdEorTTZsCSPv21dIIk3ki3YUR1vHlhES03vH1SYr/3GYoFDf/5RhdsjYxW4UzoMcRN+oSAgYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtpnkUvh; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so2534978a12.1
        for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 07:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707579070; x=1708183870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4TR93Z+epYC3IzPljlWW+negHoj8omyRWaO9e5+QSGQ=;
        b=HtpnkUvhoJ9CU1NXAm1Jx8c1AeAr7s4ybnZEbonFUNbgMoJrMVtQBMjmi1Cz+gjSOZ
         2J+6sAcb34Q8LYQ8ki0ZBxUtA/2niz4phFtWz3jkFEhwk9OEdoA3SWHAuGPv8zgE1zlA
         IPXfL1IWB/ruk2atbPJJhp8j8chVoR+FrIdjv6beL6SwaAVBgHHYRUFHfIJ+I3SyzKbR
         Rc1m1THoe5DkPVHbgcPjz5XQt8nApOhSyONoljVZRGZ7mI7Eo1GMcwxss3AmJGkhyQ8C
         TQKMzIdpsNGkjHyN/THuZOm4EOHIQpaD2rcUrn2JE+dVAqe56sh+dr1y2HV+LtU1rlmy
         0PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707579070; x=1708183870;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TR93Z+epYC3IzPljlWW+negHoj8omyRWaO9e5+QSGQ=;
        b=iRh12NxUHqjeJzkknB6jdxVtUiOK01KhMUcpsGq8OK0FWHeaoLB/LOfJj1Um6CLTiE
         ovu0u9vvFzVpHD/al99veQEdk0cVyQEjPnFk3US7i3Rd4R1InjH4UqNplwTaWIbow5MU
         +uBnP6sjFptfbiQxtd/ExTssT3awMHLahwznQqBlk/iGe44k73MW9RCZBPDX2mYEk/Ha
         p9VIqlx0DIRWCiPICSxpNo6eJLbXzam+XnDrh+KFCAdhURNamwYNwbOU/L21jSMTc+t1
         E6zh+MBqKMIix6VK2hueGbffBGfv58EgZrT9QQFqq40idz/NWL3cigElrH/w/fUa8/Jm
         xlmQ==
X-Gm-Message-State: AOJu0Yyu+MGq7m511IokxdhCFKgWwdmCQ3Cj1kQWpwlkamBT/CiFxQS9
	D3TTTHU2e11klWuSuWhaKVsZBqcLMloinTVGPesxfnkz5EpOX4/KDyge/VO+
X-Google-Smtp-Source: AGHT+IFThiMybdE0jyVToIPOxFOV46YNKbh2e6MjjTOaaje/pigUFfTFj/nn5qqzw+C5PmBo/fIVtQ==
X-Received: by 2002:aa7:d8c7:0:b0:561:1364:bd06 with SMTP id k7-20020aa7d8c7000000b005611364bd06mr1342916eds.29.1707579070296;
        Sat, 10 Feb 2024 07:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi+t7Zj0V93g9PfeB4v9j7AkZMJLtX2bJoONPatj6+tQzLoCX6p1aWxeQYrGTnhq4U+S9KjmFUBQEUfBurFViyP6dCBMo=
Received: from ?IPV6:2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8? (dynamic-2a01-0c23-c5e3-d400-ad36-06b8-178b-1fc8.c23.pool.telefonica.de. [2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8])
        by smtp.googlemail.com with ESMTPSA id l14-20020a056402124e00b005611917ebabsm826536edw.47.2024.02.10.07.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 07:31:09 -0800 (PST)
Message-ID: <c92061e4-20bf-4ace-b04f-fc7774f11e11@gmail.com>
Date: Sat, 10 Feb 2024 16:31:10 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] i2c: i801: Improve too small kill wait time in
 i801_check_post
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In my tests terminating a transaction took about 25ms, what is
in line with the chip-internal timeout as described in 5.21.3.2
"Bus Time Out" in [0]. Therefore the 2ms delay is too low.
Instead of a fixed delay let's use i801_wait_intr() here,
this also facilitates the status handling.

This potential issue seems to have been existing forever, but as no
related problem is known, treat it as an improvement.

[0] Intel document #326776-003, 7 Series PCH datasheet

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 751b7c6d2..5a84eb1a6 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -435,12 +435,11 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		pci_err(priv->pci_dev, "Timeout, terminating transaction\n");
 		/* try to stop the current command */
 		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
-		usleep_range(1000, 2000);
+		status = i801_wait_intr(priv);
 		outb_p(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
-		status = inb_p(SMBHSTSTS(priv));
-		if ((status & SMBHSTSTS_HOST_BUSY) || !(status & SMBHSTSTS_FAILED))
+		if (status < 0 || !(status & SMBHSTSTS_FAILED))
 			pci_err(priv->pci_dev, "Failed terminating the transaction\n");
 		return -ETIMEDOUT;
 	}
-- 
2.43.0



