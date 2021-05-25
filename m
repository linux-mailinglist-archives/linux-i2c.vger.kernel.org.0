Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64093390A52
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhEYUJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhEYUJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 16:09:02 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5583C061574
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z17so33490077wrq.7
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qvKiuBDY+VgAAoPV6KAc3s0HADINjeNcDBw9g070Usg=;
        b=OqqieHDcXRSSiTgYAMgaFC1ODM/uLnfZ/GapIWcoMKaXmqsl1LA9ZsMQlcnbOTEZ7M
         +bJ8Ys5uTIas1pARKKiH/zpaq48VUsUyTQ0p2VXiZg+A1MRzPrskKsAjgJi4fWIGmaSO
         I5IlSsGb8RTWAT+0rc50bkDjYAshSSOc9h0N6mgrD+BNHViE/ZF12USfOy4JuDmuTg+L
         zFfsV6K9zM2K/fp8wSiFoMevZbxkQVYWLbcf6b5CSyBVw5Ith3qkGhKlndtI4wZlhvbb
         emBnFuY+rQlIO/tYOKm8RQTcAum8ZQW1ZQdhyp79x+5bwk876cz9hWjZbCDD7RqKAn+B
         Nd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=qvKiuBDY+VgAAoPV6KAc3s0HADINjeNcDBw9g070Usg=;
        b=FWLyDPBGmTQDF47Y7hmNWYyCSZhQ++xpeV0+aqgJIXXIYtpeJ9p/NNgkn3ZFflQhvT
         TpPU/DlOAhVGaGLaXaT7kDEhmMBKDT36wW/tdvnWnEM+F35XBtdSoKt8bPTFpDzEqbcK
         T/nQnLB3oEa9O7TAPFeFBbLvx6B/XDR+F1ItmvDjKx4pMQZ6XC/qdBlsjTEnLV2yce39
         PB/IUPCoeYOmV4sIqazgL3wlL/W+sFDnWTslVyIZo60yI/WtXawxapIUf/eR0oqpPvyl
         WTiL72eJn8sPbRTnbj35Nm/8Cp2lvPpzoO9kr8n0Jx9EggAEscSdUTbh1LkGT0V/TTKH
         BzlA==
X-Gm-Message-State: AOAM532VepcpbEVgtD9ylnGGT2wVGg+NrPgTsF9i5YDpyuUGemuc3o4i
        RWvCCxlZeo+Wb1EEa6v+EIUa2QdSKzk=
X-Google-Smtp-Source: ABdhPJwLwWapt5KsxLJKMEU5vOIz9pdy5scH/9+K1P8hM8zkigxwQaJ4+SjP0MqFPS+Rkg1StC3F4w==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr28757946wrt.386.1621973250024;
        Tue, 25 May 2021 13:07:30 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:a053:ef5d:7e3e:e120? (p200300ea8f384600a053ef5d7e3ee120.dip0.t-ipconnect.de. [2003:ea:8f38:4600:a053:ef5d:7e3e:e120])
        by smtp.googlemail.com with ESMTPSA id r14sm17071816wrx.74.2021.05.25.13.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 13:07:29 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Improve i801_setup_hstcfg
Message-ID: <d5ec9de2-dd54-6ee2-a791-13ca510bcd43@gmail.com>
Date:   Tue, 25 May 2021 22:07:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i801_setup_hstcfg() leaves the bits in priv->original_hstcfg that
we're interested in intact. Therefore we can remove the return value
from the function and use priv->original_hstcfg directly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 54d84b9ef..047f73f1a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1692,19 +1692,17 @@ static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }
 static inline void i801_acpi_remove(struct i801_priv *priv) { }
 #endif
 
-static unsigned char i801_setup_hstcfg(struct i801_priv *priv)
+static void i801_setup_hstcfg(struct i801_priv *priv)
 {
 	unsigned char hstcfg = priv->original_hstcfg;
 
 	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
 	hstcfg |= SMBHSTCFG_HST_EN;
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
-	return hstcfg;
 }
 
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	unsigned char temp;
 	int err, i;
 	struct i801_priv *priv;
 
@@ -1827,16 +1825,16 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &priv->original_hstcfg);
-	temp = i801_setup_hstcfg(priv);
+	i801_setup_hstcfg(priv);
 	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))
 		dev_info(&dev->dev, "Enabling SMBus device\n");
 
-	if (temp & SMBHSTCFG_SMB_SMI_EN) {
+	if (priv->original_hstcfg & SMBHSTCFG_SMB_SMI_EN) {
 		dev_dbg(&dev->dev, "SMBus using interrupt SMI#\n");
 		/* Disable SMBus interrupt feature if SMBus using SMI# */
 		priv->features &= ~FEATURE_IRQ;
 	}
-	if (temp & SMBHSTCFG_SPD_WD)
+	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
 		dev_info(&dev->dev, "SPD Write Disable is set\n");
 
 	/* Clear special mode bits */
-- 
2.31.1

