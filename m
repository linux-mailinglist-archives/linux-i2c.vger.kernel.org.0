Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4966A7A4902
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Sep 2023 13:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241774AbjIRL7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Sep 2023 07:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241854AbjIRL6m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Sep 2023 07:58:42 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADC91715
        for <linux-i2c@vger.kernel.org>; Mon, 18 Sep 2023 04:57:11 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40479f8325fso35285445e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 18 Sep 2023 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695038229; x=1695643029; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJlenrkb6OM2/XFA6V+0SoD/ghxVj4aU3a35ghgluGU=;
        b=TDLqXSOKJhm3pJC5yhwhw5JLnEWLWhTrJ8uiS/UlEXwO2tF0KZkD5CQ8K/Cy2eITXx
         p1PJcgZLQbi4zIRWhu/WT4fmeZ+bT9IebAvUM9PCjBKD9tFWfUbgHoOvZtlU9JtuUsnQ
         wZ5ekb6oSUtT0QyAkzjqIBlbBiM+uyFXcJ5gCajyj3Jh8nFB3zLgtnnu6IhOH8efUM+v
         q1kWw6Mtq9hTzvsMYzA+H8hnVMgjtf5ttGbS9GBjXsubKr3P2tfjccvRRuihOdrCHroo
         Y5deAyljLwAZpLNWnptb0SEh7p1sYmikGyGuNeSwi87P0JO80sXRprKDPo40AFd2SC8e
         6bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695038229; x=1695643029;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJlenrkb6OM2/XFA6V+0SoD/ghxVj4aU3a35ghgluGU=;
        b=InacNiBDwcVCKlFQDhWYWSI8a4IkV/YY58c8Dipq98b4DJx4IPkWeDGXGsebEAGYu3
         cCjZ4SxpDXnzBC896X7LsBCHGtjhPttXRcUAGA63nzEyI0FfraitBE9U8cru6j5hZecu
         ri9CPWwZE0Ok3xt2y+Z7lFozEXxcNNnX8TMMBZ74JyyNomytT/xD5Vi7G6LKVJKugyFu
         gqOea/mCKuPqFOxpvJcl6pD+iVsktQF4wMVLCWbpDNi8G8pSZFYyu2NB4iaWiv0VIfek
         R3DyaHetYRsX8wCUBeWS3tq0DGHnIC4pT1Scd5AXL+ty2IyLujX0MrPjQQzdZW4FutBq
         DfvA==
X-Gm-Message-State: AOJu0YzH51aWrpHQNSN//rQfoZ33gIxD+CxTYkE0m1mm9LfuWrs+F+FY
        xAM5cX5xZibwXl5Z7bzSYeALTaAIJBI=
X-Google-Smtp-Source: AGHT+IFdQLiELVZwL6oRED0L2/WavOZiLON0pa5F4jOkehDzobq4n0504FUPjyEJKjCAa31mFQJbyw==
X-Received: by 2002:a7b:cb8b:0:b0:3fb:b248:67c with SMTP id m11-20020a7bcb8b000000b003fbb248067cmr7537507wmi.22.1695038229083;
        Mon, 18 Sep 2023 04:57:09 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73cf:cc00:24d0:a406:bff7:95f1? (dynamic-2a01-0c22-73cf-cc00-24d0-a406-bff7-95f1.c22.pool.telefonica.de. [2a01:c22:73cf:cc00:24d0:a406:bff7:95f1])
        by smtp.googlemail.com with ESMTPSA id b14-20020a05600c11ce00b003fee8502999sm15043707wmi.18.2023.09.18.04.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 04:57:08 -0700 (PDT)
Message-ID: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
Date:   Mon, 18 Sep 2023 13:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: add helper i801_restore_regs
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
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

In few places relevant registers are reset to their initial value on
driver load. Factor this out to new helper i801_restore_regs to avoid
code duplication.
Even though no actual problems are known, this patch may contribute
to avoiding potential issues by:
- restoring register values also in the error path of i2c_add_adapter
- making restoring registers the last step (especially in i801_remove)

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
This patch is a reworked version of a part of previously discussed patch
"i2c: i801: fix cleanup code in remove() and error path of probe()".
---
 drivers/i2c/busses/i2c-i801.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9bd712eaf..811541797 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1629,6 +1629,12 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 }
 
+static void i801_restore_regs(struct i801_priv *priv)
+{
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
+	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
+}
+
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int err, i;
@@ -1755,6 +1761,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (err) {
 		platform_device_unregister(priv->tco_pdev);
 		i801_acpi_remove(priv);
+		i801_restore_regs(priv);
 		return err;
 	}
 
@@ -1779,12 +1786,10 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
 	i2c_del_adapter(&priv->adapter);
 	i801_acpi_remove(priv);
-	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 
 	platform_device_unregister(priv->tco_pdev);
 
@@ -1792,6 +1797,8 @@ static void i801_remove(struct pci_dev *dev)
 	if (!priv->acpi_reserved)
 		pm_runtime_get_noresume(&dev->dev);
 
+	i801_restore_regs(priv);
+
 	/*
 	 * do not call pci_disable_device(dev) since it can cause hard hangs on
 	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
@@ -1802,18 +1809,17 @@ static void i801_shutdown(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	/* Restore config registers to avoid hard hang on some systems */
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
-	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
+	/* Restore config registers to avoid hard hang on some systems */
+	i801_restore_regs(priv);
 }
 
 static int i801_suspend(struct device *dev)
 {
 	struct i801_priv *priv = dev_get_drvdata(dev);
 
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
-	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
+	i801_restore_regs(priv);
+
 	return 0;
 }
 
-- 
2.42.0

