Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96AED78A15F
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 22:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjH0U0m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 16:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjH0U0L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 16:26:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0802128
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 13:26:08 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c1c66876aso320903966b.2
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 13:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693167967; x=1693772767;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTmvATT/UtEXUK1ImZOjKSkY8ri0j8jCjWUi3tVfSes=;
        b=soNTpyGsglnWViIPlxTzT6Rsf53/QnXOtR9G6y1s7Rsm+X+iGTshUUc5i+h93BvPCM
         xia2aYRKuJ3cvTlko6N2RHwEg0x4SNzMnbgCktxgRi9s6C/mrB/356jAqEx+goi3l8Eo
         yUEhRGeY6RjHDgtR/Qf0x73B4kEM6neQDb85nAPByNCqJ0pXlXl+Zm7EdxcIKi4/V89i
         8lGnkUfAx2271mU96Ul86YQv0qZae+C5tF3s9QZ8DYOoG3WIYXRzp3dVpEu9r7lychWy
         HwCDTe4ULPixrE43Zs2GjYLDxjJIER66/kifkZlDSbdWBiwMu5kn3B7T1ZY2h2t9I1y/
         oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693167967; x=1693772767;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTmvATT/UtEXUK1ImZOjKSkY8ri0j8jCjWUi3tVfSes=;
        b=MVkBzD7jWGKnOsYJiIIi3JZEwqVlABxM5TO5EELOrlb3A3PQl8btRgWJwZlaT8tdXM
         VLXJvG76mYyQFIHkNSlKQsKiRf6cH+OHXIot8nY5GpXi6D487UvpVO+jehb4XndCQJwU
         Sg4hvhShtqaLN5hvRtHk04lEeKE9DUqbDpVEJcWFMr52972BHL1sVTW3XCD8ORynUzP3
         Os3lfmhpkMDQ32oarJRH1QY7VjBv5Der0oWvho00qZ1bCJERHVLtlNDa/UurV+DTulM+
         TmX1VFvMQx3X6gkKmBtDUzXfzF2kYziHhiVm6Ad5/AjL2Cw0tyXMWz0v3yIWx68p/bMN
         DuFA==
X-Gm-Message-State: AOJu0YwW0snStJe6+vCv7rlMzT9f6gp0MumuFWe/SEaPYGffxLmC2CDo
        yC4YH46pGYjnRt6kfKdhGGo=
X-Google-Smtp-Source: AGHT+IHwGhHR81vicU2BR1PXIuY1sy+QlFaea4lmPlZ1MthjNwyJEhjWS9HBuwFg/f0zGyaREVFJdg==
X-Received: by 2002:a17:906:19:b0:9a1:ddb9:6550 with SMTP id 25-20020a170906001900b009a1ddb96550mr10727565eja.52.1693167967031;
        Sun, 27 Aug 2023 13:26:07 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9? (dynamic-2a01-0c23-c0a4-3400-90f1-4994-ce26-fdf9.c23.pool.telefonica.de. [2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9])
        by smtp.googlemail.com with ESMTPSA id z21-20020a1709064e1500b0098f99048053sm3845768eju.148.2023.08.27.13.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 13:26:06 -0700 (PDT)
Message-ID: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
Date:   Sun, 27 Aug 2023 22:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: fix cleanup code in remove() and error path of
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
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 73ae06432..7a0ccc584 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1754,6 +1754,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		"SMBus I801 adapter at %04lx", priv->smba);
 	err = i2c_add_adapter(&priv->adapter);
 	if (err) {
+		platform_device_unregister(priv->tco_pdev);
+		outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
+		pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 		i801_acpi_remove(priv);
 		return err;
 	}
@@ -1779,14 +1782,13 @@ static void i801_remove(struct pci_dev *dev)
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
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
+	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
+	i801_acpi_remove(priv);
 
 	/* if acpi_reserved is set then usage_count is incremented already */
 	if (!priv->acpi_reserved)
@@ -1803,8 +1805,8 @@ static void i801_shutdown(struct pci_dev *dev)
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	/* Restore config registers to avoid hard hang on some systems */
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 }
 
-- 
2.42.0

