Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDA16AACBB
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 22:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjCDVh6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 16:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCDVh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 16:37:57 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59E340F9
        for <linux-i2c@vger.kernel.org>; Sat,  4 Mar 2023 13:37:55 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id j11so4325587edq.4
        for <linux-i2c@vger.kernel.org>; Sat, 04 Mar 2023 13:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmoEBPg1RhiKMQ3ukhEU7raAFGZCe7vPRIf7lgCoJpo=;
        b=FhTQZlEzaVKDjgh0aQXBlX1DCQNr5zBuS2C3tqFJHPOn2ZsP1QTvYoGJGWcSrkuLQp
         Ku5mAjJpey0k1q1v8IoOpEsv4YlVlkLeZ4ZmRgGFDVjhssaWIUBc41mUgZsPVe4dHzWT
         9QphkgvVu2h1fyC49cyVMG5gvAu7L5HbN6bH/tjADCRUS9AEqn3Vrh9nliOAbEC7gnq7
         vzH6Tf/B/Xb1ZTBeYM6b00y3DxomnpPCbOEmYbYEV/oNBcmdh7r2Ji/YlyWH2MFGKupr
         ZKcM87LeJQZSJVrQavMfljIhFrg3JtTETsDrU6B/pFdR4ejb8WvbSZPwHdYeXKfEHPM0
         JREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmoEBPg1RhiKMQ3ukhEU7raAFGZCe7vPRIf7lgCoJpo=;
        b=hHvjP25/rE5CmmBZBYMJci5JKpqMbgwOqWyarp0ANIFH5idb2NxPVjUqignFcwSSTl
         O8LXNY6y2qWgHAWCRPkpRkinNvHq96iMjtZtX9BZLqeT/AksdVMSrmrX5J/jKHSQQysk
         1KadG4QoHX0fBG1u48OqcwsHmyKqCLnfkX1d1olY6ZMuD5Mtns0uaShrtd+xN0UN+hQL
         pgYpFsEDJS7qvxoP50CIY2iuEnKrKPzS/ECCM+Aq0uYU6WPOq28fUBHNWTtT6B17KaUO
         8Xfy0GY8LCzPVXCxPDyy4RMrBIJTjEONjiz7NPMOoTG7J6LIi8SBMLlCectVuwyPilwc
         4kHw==
X-Gm-Message-State: AO0yUKVpzyXHiZ9ZDeUC8DwZCY7QTkzIB3vLwoVrH3azqVMK2FEXRbXV
        GVDrkvwdy/jTkXVcSqGAW34qsCfkuk4=
X-Google-Smtp-Source: AK7set8fc2D5Duy/irTBBO4M+YT8PhoRSt/zSnRv2gXAFkckLVnsK8hTmDkJwPnCUMHwVRSJpDTOfA==
X-Received: by 2002:a17:906:a3c2:b0:887:9a7f:4326 with SMTP id ca2-20020a170906a3c200b008879a7f4326mr5522353ejb.8.1677965873610;
        Sat, 04 Mar 2023 13:37:53 -0800 (PST)
Received: from ?IPV6:2a01:c22:72de:8e00:a559:93c8:8a72:3308? (dynamic-2a01-0c22-72de-8e00-a559-93c8-8a72-3308.c22.pool.telefonica.de. [2a01:c22:72de:8e00:a559:93c8:8a72:3308])
        by smtp.googlemail.com with ESMTPSA id dc23-20020a170906c7d700b008b17e55e8f7sm2436975ejb.186.2023.03.04.13.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 13:37:46 -0800 (PST)
Message-ID: <a2cd5692-7a9e-7fef-6c09-6c694df1b23e@gmail.com>
Date:   Sat, 4 Mar 2023 22:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 1/4] i2c: i801: Use i2c_mark_adapter_suspended/resumed
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
In-Reply-To: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
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

When entering the shutdown/remove/suspend callbacks, at first we should
ensure that transfers are finished and I2C core can't start further
transfers. Use i2c_mark_adapter_suspended() for this purpose.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ac5326747..d6a0c3b53 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1773,6 +1773,8 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
+	i2c_mark_adapter_suspended(&priv->adapter);
+
 	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
@@ -1796,6 +1798,8 @@ static void i801_shutdown(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
+	i2c_mark_adapter_suspended(&priv->adapter);
+
 	/* Restore config registers to avoid hard hang on some systems */
 	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
@@ -1807,6 +1811,7 @@ static int i801_suspend(struct device *dev)
 {
 	struct i801_priv *priv = dev_get_drvdata(dev);
 
+	i2c_mark_adapter_suspended(&priv->adapter);
 	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
 	return 0;
@@ -1818,6 +1823,7 @@ static int i801_resume(struct device *dev)
 
 	i801_setup_hstcfg(priv);
 	i801_enable_host_notify(&priv->adapter);
+	i2c_mark_adapter_resumed(&priv->adapter);
 
 	return 0;
 }
-- 
2.39.2


