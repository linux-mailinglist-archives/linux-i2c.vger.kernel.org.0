Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D083E30E3
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238898AbhHFVTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238016AbhHFVTs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:48 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABC2C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id c16so12652112wrp.13
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g0E1z9oUpcFeUAqMFDOHHwdKa9avIPsEMBJBlOA+9Zo=;
        b=Qm3EwNnrUODIIggKuMYjeNQz0g7OHOPwir6+ZYhih3itVo4HF6d7LSoGBR2THid5AM
         2lBiJMOaFRWGMbafr+3f4l5WA3zRWfhNOXuUteTUmAz5WeePXmMOQB5ID5sK9un59bN+
         cgwzZOhA5NzMnOCd4ngCAQtZbXYFtZgKSUuj3IpWBaCm8urCxAdDyu7IrM81Va4N3lIE
         K8rfQ2mKX2xgMafPO6CbTe/webzxL0zLaYF5qHC+NTEyV8XzPQlDYhNk7YZ4UcgaF+pm
         wHMCk5vnzrBKSHylisLeY4pG2n5t8MqWnNfSDiUi/VfZMx3+z4EJ15bb1qpHH16OocCL
         ueEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g0E1z9oUpcFeUAqMFDOHHwdKa9avIPsEMBJBlOA+9Zo=;
        b=OfwJcYlt53s9jiDWrHoTSWOqcuHrqoMi8EGs3EHcpaxk9uJa+z9dpLFME7m5WemYFp
         JFfvgHYVm2uCZRCSnkEFWBSz9Jew7uFKRszWeaBH+jVYXmW0RYcLJfSMyHA2J0Z7TlGF
         yQgwGi2E7O+0ufdL+hzCo0lF5/7XoRay2xt9bmq/gGsuM5Wo0xALtXE2QJSWrFP2S0w3
         urnLM01DqJbyBfnvwvz3+3BbLqZKKrnxx1KOpTgb/ffquZVUXGJxAlpucM7TXNH6ZrPL
         WBRrlLe1+kKuBD6fnhux9YEsCDRVo+WAE6BhnhR7NPYzCPKMB6vEuu+j6Ajxawc5In7E
         qILg==
X-Gm-Message-State: AOAM531z3mrfJQk99oEemmKtWU15E2oEqNPM1MWziBOZNBFYr8asWJcq
        QxE1KbcUmu+iz0lak8V33C0lxkei+aMQmQ==
X-Google-Smtp-Source: ABdhPJxjc6r9yxeeKbo2scigAhao3/xobnQW/jxtDJbnK52SMIPAlxts9bAAiHBrLxGZ+RPhc2qAMQ==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr12569902wro.331.1628284768266;
        Fri, 06 Aug 2021 14:19:28 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id j14sm10700743wrr.16.2021.08.06.14.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:27 -0700 (PDT)
Subject: [PATCH v2 9/9] i2c: i801: Improve handling platform data for tco
 device
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <0e8188d1-e35c-162b-6657-b22e8034483c@gmail.com>
Date:   Fri, 6 Aug 2021 23:18:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 drivers/i2c/busses/i2c-i801.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 88745e3bc..242bdd2ae 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1470,15 +1470,14 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
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
 	static DEFINE_MUTEX(p2sb_mutex);
 	struct resource *res;
 	unsigned int devfn;
@@ -1522,22 +1521,20 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
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
2.32.0


