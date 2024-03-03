Return-Path: <linux-i2c+bounces-2120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9986F46F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 11:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 700A628359B
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 10:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9705B664;
	Sun,  3 Mar 2024 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gh1Aa/t6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB20B653
	for <linux-i2c@vger.kernel.org>; Sun,  3 Mar 2024 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709462727; cv=none; b=BC6hCsI4QMnYls2bRuvhafVrRlz9zLOUJifeZW6kImarlMLx1jerY2UMYoKi1WT83Re5UmwH/gYh/tWzYNrJrGsB2h5BD9uwhZ2Wn0WaztaTbidBdUjB75CWbxNL6Dr79iGgi6a2Hs45N0ltmNtMpY3UXusRdOiwhCHBk6kEu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709462727; c=relaxed/simple;
	bh=xiR5u5gnbZlSravefIOHPpLN0+Y00zQi6Rge7HYVP44=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fu7iTfKIDaeyBzXl2c/1/qEUdLHNqAByJpnoB3otLKMDEWEBs6NzrCmO2q5h9DLVNpr7VFuBGA8vmyIDzZ6Df5pVgBOnIKU6RfnWPVEBtDKcjWfzPyAM3LoZS483aEV9nLGzkP100tcOL/c0ULycY9wScfv9VmJO+4HMlCC/Erw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gh1Aa/t6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412dd2722a5so3427415e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 03 Mar 2024 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709462724; x=1710067524; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U22v0TIDotidtr0xTuwsjj2rosRbJcGCHyiG0PADqk=;
        b=gh1Aa/t6EdeZ2qHUCzsYkb0IDUaEyHF+59AKwYwstGUcTx2a+7YhNRknDLDreM2ZE1
         X+WH/O7W8VoGAZltu84IT1ju+aYq+1Bm5THv6lA6R3QZrHX/uja1COn0jzdkGDIr7dBo
         CWPGj660x2xuBACkQvHaqfovj1R61zBbt1dj+xU5ICC+r56kG5x7+fDndIFsxXF4dmo4
         4eEjCNS6rsdVjaMU3M1cXWWFN2kXLeqmAQmpNKw6gXlpksJZoqXCaMbu1TA3XWBIb2Rx
         DQCACsq+6tP2JiOCsZH2brBuLDRaCAnV9ITBpBlv/e5EoRJLCvgMKUM4qQOMHaZY+O/x
         PCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709462724; x=1710067524;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U22v0TIDotidtr0xTuwsjj2rosRbJcGCHyiG0PADqk=;
        b=BgY/WqRbXhFCRAmdfJPH8ka++c4YHBF/OlSJ4axEMfVEUr6JevMod5m/wMZ+KWFSPC
         3wVDp+1HhXuydl8soGypGJZELCZko7LGfeh781FqvIJy18kU2bGWkrhBAmT02i+FG2Zw
         uYO5ZT0szuCCAweM1oWSNQHSgZYW0BRTAaU4X1c0j8OWeiHpSETXivtTkqDz1YvLusIy
         gDp+MKmFL19FFvmFE4Gn6eFTbkWS9Fxz6hgHgzclHrTENuBZ+epjo/JaXCXkt2bDeD2d
         Bz2yuKMDk/97FKCNZyS6ZXK4o2gmRmeZBdVVowZiRTemkehCrZoS8vqWlGBtscXjbInD
         oPMg==
X-Gm-Message-State: AOJu0Yzw0HU1NT9JUAPGP3CJqzml7HQWHNL+xi6lNMYiNXGChvJPTb0d
	dmt8MCAyTvMMNCd+MtryuiYgS73/cVU9jS67DZ+XgluW16PtJeAuh91b5H6c
X-Google-Smtp-Source: AGHT+IF+EBI6Y78pjXh8mZNNbRdOp1UcNoowVreyvMiW0gjn4E/AaLsqMUyIIpqzls5kZht0QTMmFA==
X-Received: by 2002:a05:600c:3645:b0:412:b30b:e47b with SMTP id y5-20020a05600c364500b00412b30be47bmr3866925wmq.27.1709462724096;
        Sun, 03 Mar 2024 02:45:24 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e8f:5600:94da:8563:d193:d5c4? (dynamic-2a01-0c22-6e8f-5600-94da-8563-d193-d5c4.c22.pool.telefonica.de. [2a01:c22:6e8f:5600:94da:8563:d193:d5c4])
        by smtp.googlemail.com with ESMTPSA id u5-20020a05600c00c500b00412dbf5d6e3sm785072wmm.1.2024.03.03.02.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 02:45:23 -0800 (PST)
Message-ID: <6db1e4ad-14b5-4d0e-ac06-46541970ce0e@gmail.com>
Date: Sun, 3 Mar 2024 11:45:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Fix using mux_pdev before it's set
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i801_probe_optional_slaves() is called before i801_add_mux().
This results in mux_pdev being checked before it's set by
i801_add_mux(). Fix this by changing the order of the calls.
I consider this safe as I see no dependencies.

Fixes: 80e56b86b59e ("i2c: i801: Simplify class-based client device instantiation")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- cc stable
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 223cd2b84..8e95db95c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1762,9 +1762,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	i801_enable_host_notify(&priv->adapter);
 
-	i801_probe_optional_slaves(priv);
 	/* We ignore errors - multiplexing is optional */
 	i801_add_mux(priv);
+	i801_probe_optional_slaves(priv);
 
 	pci_set_drvdata(dev, priv);
 
-- 
2.43.2


