Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB2F462490
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 23:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhK2WVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 17:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhK2WTy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 17:19:54 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85966C0423BD
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 11:53:25 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d24so39375046wra.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:references
         :content-language:subject:in-reply-to:content-transfer-encoding;
        bh=psZKX6rfnkaTjO+ZgWVRjGvuXVTl6p4350BG6K7/WK8=;
        b=lENhKabPaeNYcqAtdJLeEgu7iDflQYQWxVqqi6n4Dt5sHQzl1FW16kHAG2mNPKIPV6
         6pZGxqmD7YdA8bbIw0h9WtI4WuMhlm6Lr1yhvW7UywBnmrNmDsehtXN6PU2cddVGYTRG
         d/SUxIBtUyE2o/ptOBi7Fkd+OzkcTP1qusrIICSNmeD2pmAPCEG5twSD7P7qIamRQ01K
         +miAbOMAbEQoV9gAoSmx/fLwAzSXAkEswgZafyO517bdR11uXw+w56o2ulWTi/Jct4O1
         P7I+eMf6Q49+b4Lca8PaWMfxCPgg4DMmxYiP70Ft1+woWU9mUAo6cqK/wSDn3UgxkCMK
         vVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:references:content-language:subject:in-reply-to
         :content-transfer-encoding;
        bh=psZKX6rfnkaTjO+ZgWVRjGvuXVTl6p4350BG6K7/WK8=;
        b=Ctq4j8jilV9OYvg34JZlU7MxocuauSnKnQkl1hNHCxSjEEVZLCSC6SrP+1d60j47zR
         idE20Naklkm+ihVD8dcUz32yg9kWrvVFAhsI4nsu/9kVvV3PWDq41dTC38tJ3C9J7Qjl
         JeS5yswScpJLRsXHnJhCoFsBsWUuRnJ18u5R8EHjwI+sHFNKYvGbVWljQkl6iAYybv9/
         IwW6OB2gMhyIycU8PsIFCMpoZWJzXOM43j1r87zp3/zOF+rUmgkh58GpxiZ8KluDYtXU
         GDl4Wbj/nAvk6II7BBDAbAvqcoIasZAqjRwAAb/yLWX/1vzdRAGPrYmdpuUtn9cIiGWs
         MueA==
X-Gm-Message-State: AOAM533/egjz5LTrxAwlYLdp+lNQtLrrL18Z0VowfF1eM6w3SnOVLWPm
        QTl95pDM/l77MJjrSNv9qjnWf1HaBAM=
X-Google-Smtp-Source: ABdhPJzbaKSghDIR8d7GLOKFiKgLrz2NHxEfiuiRseWiAyqDafHqAmrm86gSKNTmodIklWfQXMmBhw==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr36342516wrs.207.1638215604089;
        Mon, 29 Nov 2021 11:53:24 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:8596:696b:f4cd:9c8e? (p200300ea8f1a0f008596696bf4cd9c8e.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:8596:696b:f4cd:9c8e])
        by smtp.googlemail.com with ESMTPSA id x4sm240525wmi.3.2021.11.29.11.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 11:53:23 -0800 (PST)
Message-ID: <85361e7d-f2fd-6199-71f3-3f7a749b1677@gmail.com>
Date:   Mon, 29 Nov 2021 20:53:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Language: en-US
Subject: [PATCH v3] i2c: i801: Improve handling platform data for tco device
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The platform data structures are used in the respective i801_add_tco
functions only. Therefore we can make the definitions local to these
functions.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- rebased
---
 drivers/i2c/busses/i2c-i801.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8c0695956..cb6e55758 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1463,15 +1463,14 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
 }
 #endif
 
-static const struct itco_wdt_platform_data spt_tco_platform_data = {
-	.name = "Intel PCH",
-	.version = 4,
-};
-
 static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
+	static const struct itco_wdt_platform_data pldata = {
+		.name = "Intel PCH",
+		.version = 4,
+	};
 	struct resource *res;
 	unsigned int devfn;
 	u64 base64_addr;
@@ -1514,22 +1513,20 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	res->flags = IORESOURCE_MEM;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 2, &spt_tco_platform_data,
-					sizeof(spt_tco_platform_data));
+					tco_res, 2, &pldata, sizeof(pldata));
 }
 
-static const struct itco_wdt_platform_data cnl_tco_platform_data = {
-	.name = "Intel PCH",
-	.version = 6,
-};
-
 static struct platform_device *
 i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
-	return platform_device_register_resndata(&pci_dev->dev,
-			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
-			sizeof(cnl_tco_platform_data));
+	static const struct itco_wdt_platform_data pldata = {
+		.name = "Intel PCH",
+		.version = 6,
+	};
+
+	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
+						 tco_res, 1, &pldata, sizeof(pldata));
 }
 
 static void i801_add_tco(struct i801_priv *priv)
-- 
2.34.1

