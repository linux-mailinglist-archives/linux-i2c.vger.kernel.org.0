Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8640C790977
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 22:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjIBULK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 16:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjIBULJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 16:11:09 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD7C197
        for <linux-i2c@vger.kernel.org>; Sat,  2 Sep 2023 13:11:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso2612931fa.1
        for <linux-i2c@vger.kernel.org>; Sat, 02 Sep 2023 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693685461; x=1694290261; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftby5Ax0/kjaYty9en4KuOgCp6cKGzI0DdjbSXyue8s=;
        b=rjGLOAnq5pTGCI/JRgRAh6utPkK+BFLLzqMNHldxP1GMxZJ1bZQ1CtYzGh302MVa4C
         fdglA2fyE4dpdVaDXZBGgdIXldAw6qt0diWQRtQBAxBEY61sF/vNUJj6VgWmsae0ypRj
         Hg5cn2CdPMeUtSo8GdiwPPsOV+/sV7T/XUadJy6gPXpXnLPNka1ecMro0XGh5t2sx01X
         bZUE2SjzohAW43H+HRntNeec67X8yuNNSDKU4STyaQfIg8rj32YCVWGAciFjr0oz+Tre
         WcSjW1zJEFkjT3eED7Id8yrDiQjvg5I+mDA0kepnURNd+sI4aQ+vBoyofrAzWvcqjmNJ
         iP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693685461; x=1694290261;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ftby5Ax0/kjaYty9en4KuOgCp6cKGzI0DdjbSXyue8s=;
        b=DIzm+QA2xdbkZDCrJhy47UgE7Ae7UFZisvZhrCue4hQzzUF8jVUcJ6m55+8v5Lorb+
         ZK+DwuWtc6lQ2q/4J4jmTCb5tYjRyryU8lG0ZR+55+bREbrZWSPvp5f4O8UaCsfljMX5
         HjrFVOe3/alvpC3FFuoEaio/1vDEQ3rGL5Oqu2jBhabFGcnpVpgsVIAH8rD5NwaUKC66
         CQ4B/77bYyg6e6smhQWNdoaaY8+T3CeLmM/ZuQtRmCUEGn2WuZ5wo/e41wIPa+MWNtJF
         jgpR1BU9EUcs65ZfaSb+0w32PWcejcnnM9ghhsFzHNw0NBGNLLWodB5LnXELC0bFX18f
         QV5A==
X-Gm-Message-State: AOJu0YwNDoOVN4bKt7JYfMHpj0EmEVNHM79pcLBckgZdO8O3iSl6WAfc
        Cc7gtuaT0sblQa57ZcmKhrA=
X-Google-Smtp-Source: AGHT+IGc6uVt2s9OncRlX70gJGzAubyL0Z1XVy+jxBUA4KAol/0/aZh0TTSZ0HaWZvIxQTpfyOLoVg==
X-Received: by 2002:a2e:9082:0:b0:2b9:b693:c906 with SMTP id l2-20020a2e9082000000b002b9b693c906mr3750183ljg.27.1693685461067;
        Sat, 02 Sep 2023 13:11:01 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7326:d300:b9c4:4b23:eec7:79e? (dynamic-2a01-0c22-7326-d300-b9c4-4b23-eec7-079e.c22.pool.telefonica.de. [2a01:c22:7326:d300:b9c4:4b23:eec7:79e])
        by smtp.googlemail.com with ESMTPSA id j6-20020a170906278600b00992b50fbbe9sm3827846ejc.90.2023.09.02.13.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 13:11:00 -0700 (PDT)
Message-ID: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
Date:   Sat, 2 Sep 2023 22:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: fix cleanup code in remove() and error path of
 probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jean pointed out that the referenced patch resulted in the remove()
path not having the reverse order of calls in probe(). I think there's
more to be done to ensure proper cleanup.
Especially cleanup in the probe() error path has to be extended.
Not every step there may be strictly needed, but it's in line with
remove() now.

Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")
Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add Fixes tag for 9424693035a5
- remove restoring SMBHSTCNT from probe error path
- move restoring SMBHSTCNT to the end in remove/shutdown
---
 drivers/i2c/busses/i2c-i801.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 73ae06432..d4f59aecc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1754,6 +1754,8 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		"SMBus I801 adapter at %04lx", priv->smba);
 	err = i2c_add_adapter(&priv->adapter);
 	if (err) {
+		platform_device_unregister(priv->tco_pdev);
+		pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 		i801_acpi_remove(priv);
 		return err;
 	}
@@ -1779,14 +1781,13 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
-	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
+	i801_disable_host_notify(priv);
 	i2c_del_adapter(&priv->adapter);
-	i801_acpi_remove(priv);
-	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
-
 	platform_device_unregister(priv->tco_pdev);
+	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
+	i801_acpi_remove(priv);
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 
 	/* if acpi_reserved is set then usage_count is incremented already */
 	if (!priv->acpi_reserved)
@@ -1803,9 +1804,9 @@ static void i801_shutdown(struct pci_dev *dev)
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	/* Restore config registers to avoid hard hang on some systems */
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 }
 
 static int i801_suspend(struct device *dev)
-- 
2.42.0

