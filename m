Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1C007ABA30
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 21:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjIVTmo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 15:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjIVTmo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 15:42:44 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31C4C1
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:37 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3215f19a13aso2610360f8f.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695411756; x=1696016556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/TIlUAnIJQI2qk3es/6nOwCf87TBbsLDeequcDWBmd4=;
        b=lgjkthfHowA6p1+iTHt64hH8UxT1VI7absoA3SBiYAMhBsVlo0IVvsBW0mdFMySS+u
         TcFG4Nq6hiNSrv1xtKvBEXP5xVtJPeVzjyXvADDPeaTcZn14A6UeZdkWoyKhZsi94UEd
         ehK/g0JJMEy3OPda9IhVqjUXHS9uM0cYH9Navplgb6+2owOA9eFKS/9QGSg/luQJJ7Vg
         s3FhDBh5gV0Jqfbs6uGWjpd3r573WyIRGo6vw3RA2kuN/zTroWScEKytjXTw6/C9ytte
         IOqCI5N5kXtce6vH+HnxmXVuaM5OAndpf7QEta2FOsjZz4o4WiPkRwXp+GaL0dsD+KNl
         0teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411756; x=1696016556;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TIlUAnIJQI2qk3es/6nOwCf87TBbsLDeequcDWBmd4=;
        b=H8ivEOOJAJaicP9ScgAoih3Mlb+VvxG2aY50YHJbDQ+nQeIYMgBUMajw+ZUbovEcLe
         9EVElJdDiJLfwNYpAp84cfEiZZ656fgTXyJyg1KSUTjzSDn17JKPKUeXdP1zlzu3ZJZx
         7ENerzEOtXTYHJ1V0ztRBEcNjpyhIiwdcGos6fbrgKBs61VJl+nKp7VApbM1/Nn3Adon
         1nxT0ryPtGvcdWHOduL5r/mfnvXMSsAv0X1Xv+/4VIGzhkMZbPzh618oYwIP3CL84flK
         hBJCGyaMNQprgM/B1IVaTVtzuWQo38pkmy0Sb8QByKberO67le8Sd5sc8DEqlJFZM8aY
         Zbtw==
X-Gm-Message-State: AOJu0Yxwb0dPcjcXFV18hji6vE/ZwHqmm+KZTAW2Lgc2cbV4FVcxJYFw
        4FE+SQpDXysvbYGmPpi5Ryg=
X-Google-Smtp-Source: AGHT+IGatLtZfe0lUDxOs5GgFC48Yv3NMIoDaEmVyY8UR0RBohJElt4DhzYZajjxybrYTQItj0hd+w==
X-Received: by 2002:a5d:4570:0:b0:31f:d8b3:ea06 with SMTP id a16-20020a5d4570000000b0031fd8b3ea06mr575435wrc.0.1695411755949;
        Fri, 22 Sep 2023 12:42:35 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:3475:142c:c3cb:ba32? (dynamic-2a02-3100-9589-7c00-3475-142c-c3cb-ba32.310.pool.telefonica.de. [2a02:3100:9589:7c00:3475:142c:c3cb:ba32])
        by smtp.googlemail.com with ESMTPSA id t16-20020a5d49d0000000b0031c5b380291sm5174077wrs.110.2023.09.22.12.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 12:42:35 -0700 (PDT)
Message-ID: <dbc384aa-488a-4fe5-ab7a-a92e2b1f1b3a@gmail.com>
Date:   Fri, 22 Sep 2023 21:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] i2c: i801: Remove unused argument from tco functions
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Argument priv isn't used, so remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 880e98734..cea8aaba0 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1464,8 +1464,7 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
 #endif
 
 static struct platform_device *
-i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
-		 struct resource *tco_res)
+i801_add_tco_spt(struct pci_dev *pci_dev, struct resource *tco_res)
 {
 	static const struct itco_wdt_platform_data pldata = {
 		.name = "Intel PCH",
@@ -1496,8 +1495,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 }
 
 static struct platform_device *
-i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
-		 struct resource *tco_res)
+i801_add_tco_cnl(struct pci_dev *pci_dev, struct resource *tco_res)
 {
 	static const struct itco_wdt_platform_data pldata = {
 		.name = "Intel PCH",
@@ -1537,9 +1535,9 @@ static void i801_add_tco(struct i801_priv *priv)
 	res->flags = IORESOURCE_IO;
 
 	if (priv->features & FEATURE_TCO_CNL)
-		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
+		priv->tco_pdev = i801_add_tco_cnl(pci_dev, tco_res);
 	else
-		priv->tco_pdev = i801_add_tco_spt(priv, pci_dev, tco_res);
+		priv->tco_pdev = i801_add_tco_spt(pci_dev, tco_res);
 
 	if (IS_ERR(priv->tco_pdev))
 		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
-- 
2.42.0


