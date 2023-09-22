Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7557ABA35
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 21:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjIVTmu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 15:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjIVTmt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 15:42:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1B5AF
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-317c3ac7339so2607431f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695411761; x=1696016561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNfg+2j8nmBgO5Py3EXSUz4Ywg9livIThgjtUIdH8Gs=;
        b=mCBkeJgSQfN531hLrA/1WhnMOBg1kxQRQZiec9YCFmcT3QOJzJI8aqUzOboWh/QzTr
         gfgTQNqu41oAuorwf5YKB5ge8pR7zfJh1FIEd26bIN5yBsrkuPHomnyh28t1uXbKJPFk
         HEgIW5hGSDMFdDgQLa7Ps99NU5VolZJ4aJMStlEpWSqIxs2xlqkrnRPJo8A8Hp8s0iB1
         nJdLuyyozqZWXWJ9c5Hot/vWEOyCo1hRS86v+WgV3C2kgIBFBuW98FW8go1ZjEx67zZp
         6VJIF1Wd0puasuZvzZPWVZJXY+LXlVQo/u9lPdKEvJW2pkV25UdDJZbrcM48ikbOuoyb
         UknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411761; x=1696016561;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNfg+2j8nmBgO5Py3EXSUz4Ywg9livIThgjtUIdH8Gs=;
        b=nBFpwMV0utIbkRKJf8fXp+GNwd5yb0Tc7HadSwt28gs2ZyIFLIfV9MxH/1Nc3LFkP+
         XB+Gx1adIzeiUtz4SDOj0uR2/644OH1OD+FHERcjHBH3cpfZGCEnJEmX2Xmb9FIogJaH
         heEhA+krFWQ7z5FDdJqyP55JiNuz63FErVyNyJ6Dc0RpIn7OvY4xmukjYpyUcaHdIni5
         5ZghGaQPqnzOpJFOD+5TJHlflBIaiuT7V/uhRyOP3ChX6TJNZi6oqH3ygx1KAMLqQxfF
         nT+P+3xOqj3imyC4eCbomimjVKFPVtY40ojjDH+GQaW5+mn99llPGYMWzTiWAdJGX7n8
         52aw==
X-Gm-Message-State: AOJu0YxuHE6kFwNuBZsXYaB1+xaKPzJjVWoavkXqIsIEW0RmuVjd0Y3y
        BjdVnQTZRZwrswg6pRszlErIzA70LtA=
X-Google-Smtp-Source: AGHT+IHzN25N31fGz/vGvhI9ttiTuciPXek2io3h7Nt/8sJuarlu0Y9fSqX07kQT65oeN+Y49wLeKg==
X-Received: by 2002:adf:decb:0:b0:321:5f0e:26a4 with SMTP id i11-20020adfdecb000000b003215f0e26a4mr562891wrn.38.1695411761332;
        Fri, 22 Sep 2023 12:42:41 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:3475:142c:c3cb:ba32? (dynamic-2a02-3100-9589-7c00-3475-142c-c3cb-ba32.310.pool.telefonica.de. [2a02:3100:9589:7c00:3475:142c:c3cb:ba32])
        by smtp.googlemail.com with ESMTPSA id t16-20020a5d49d0000000b0031c5b380291sm5174077wrs.110.2023.09.22.12.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 12:42:40 -0700 (PDT)
Message-ID: <0d347ae8-b4e0-4937-a6dd-55bd72748d04@gmail.com>
Date:   Fri, 22 Sep 2023 21:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] i2c: i801: Add helper i801_get_block_len
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

Avoid code duplication and factor out retrieving and checking the
block length value to new helper i801_get_block_len().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 36 +++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 30a2f9268..55bfb4d18 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -329,6 +329,18 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static int i801_get_block_len(struct i801_priv *priv)
+{
+	u8 len = inb_p(SMBHSTDAT0(priv));
+
+	if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
+		pci_err(priv->pci_dev, "Illegal SMBus block read size %u\n", len);
+		return -EPROTO;
+	}
+
+	return len;
+}
+
 static int i801_check_and_clear_pec_error(struct i801_priv *priv)
 {
 	u8 status;
@@ -524,11 +536,9 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	if (read_write == I2C_SMBUS_READ ||
 	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
-		len = inb_p(SMBHSTDAT0(priv));
-		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
-			status = -EPROTO;
-			goto out;
-		}
+		len = i801_get_block_len(priv);
+		if (len < 0)
+			return len;
 
 		data->block[0] = len;
 		for (i = 0; i < len; i++)
@@ -544,14 +554,11 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 	if (priv->is_read) {
 		/* For SMBus block reads, length is received with first byte */
 		if (priv->len == SMBUS_LEN_SENTINEL) {
-			priv->len = inb_p(SMBHSTDAT0(priv));
-			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
-				dev_err(&priv->pci_dev->dev,
-					"Illegal SMBus block read size %d\n",
-					priv->len);
+			priv->len = i801_get_block_len(priv);
+			if (priv->len < 0)
 				/* FIXME: Recover */
 				priv->len = I2C_SMBUS_BLOCK_MAX;
-			}
+
 			priv->data[-1] = priv->len;
 		}
 
@@ -699,11 +706,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 			return status;
 
 		if (len == SMBUS_LEN_SENTINEL) {
-			len = inb_p(SMBHSTDAT0(priv));
-			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
-				dev_err(&priv->pci_dev->dev,
-					"Illegal SMBus block read size %d\n",
-					len);
+			len = i801_get_block_len(priv);
+			if (len < 0) {
 				/* Recover */
 				while (inb_p(SMBHSTSTS(priv)) &
 				       SMBHSTSTS_HOST_BUSY)
-- 
2.42.0


