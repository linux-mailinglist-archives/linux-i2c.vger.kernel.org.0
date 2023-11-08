Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C2A7E50E7
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 08:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbjKHH1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 02:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHH1e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 02:27:34 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27BD198
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 23:27:31 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so11268708a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Nov 2023 23:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699428450; x=1700033250; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u+E7EX14UtqWPZQOrooU8JvAp0r7y1MWkEpycOUOFw=;
        b=JaDllmfkx9V+HU1xGk51vCv9Da+UL4a61BRNpADJGJPScvh1kAXVGhz+5XGLi/Wcrq
         9GizRzHRjl3UoNiUVDTRsKZgMzlolVwERQJg78pzFRdXtqxgYWAj6PAJh1heJdcNEo8X
         jWEENizpBYmVw2zZS4/jQ9O3/b8pIWNF4OThf1KWfacBiXs+vusqxhnpgBstZ8yp7YdU
         TU7WTi6J3S/a0XUtpLc0Df1bcAo8khsBfwZSbU4OSGm5suu1ACISAB1vcWs9+t/m59Ym
         1Nco3vcm6+GoNbJ4AaBR9lvYVEuCfN6oCOM+vDSYNbxgx3YsE3bnM6If0Epsnkmw6Ybk
         BK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699428450; x=1700033250;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u+E7EX14UtqWPZQOrooU8JvAp0r7y1MWkEpycOUOFw=;
        b=AcNTGmSmRT2c0+Rfk36YqgjC2knSgkDeQ6Rgz4cFoSAtURs/r/4NvNfRoe5X8ttpxi
         Q49Pa+kiqB6OforyBlvQZNNPNPMXzWlJQRw4jdFLaz1/5RVoCBYrXdfFsAO3aXpSEJzr
         t29duc2kIZ+vko+5PJ2qIjmU2kMQBRlvaY5CG5M1Cy8nrG2sCh6M5n5OUhX/jvT5JAod
         09B8w48/riAYwqmTC/KTTSP8a3P5HL0LumVYmAQy7eKYu+L3Yrd+qj2TFqt1Zj0AVVna
         LvrmzHCt+g+LzCSWwocCNZE3oQnJyjF4OgWoHM2iktf3F5d9zwOqHTFf6YGWJw/6h4JQ
         deOQ==
X-Gm-Message-State: AOJu0YwoWj/km/LzHKZr5aNFR5aJg+4cIJBhallG9ZxnOalmPaAUDrlc
        JFMh2a/0HgQVA3YNsj80/WDAIo5d4Vw=
X-Google-Smtp-Source: AGHT+IFNDz+9NrqxSjPP6pEPkZpZfcTAtM/PInyqwi0jywcP+RQcSncfKURDa9h+B79EsStoXd8mdg==
X-Received: by 2002:a50:8d0a:0:b0:53d:d799:641 with SMTP id s10-20020a508d0a000000b0053dd7990641mr716290eds.26.1699428449556;
        Tue, 07 Nov 2023 23:27:29 -0800 (PST)
Received: from ?IPV6:2a01:c23:c56e:b200:75f2:d482:5d42:c8a0? (dynamic-2a01-0c23-c56e-b200-75f2-d482-5d42-c8a0.c23.pool.telefonica.de. [2a01:c23:c56e:b200:75f2:d482:5d42:c8a0])
        by smtp.googlemail.com with ESMTPSA id i23-20020a508717000000b0054353639161sm6164854edb.89.2023.11.07.23.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 23:27:29 -0800 (PST)
Message-ID: <79977020-69c3-4f87-b861-b043c7fb9077@gmail.com>
Date:   Wed, 8 Nov 2023 08:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC] i2c: i801: Add i801_register_jc42, similar to
 i2c_register_spd
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As discussed, this is a RFC version of changing jc42 auto-detection
with the goal to get rid of I2C_CLASS_SPD completely mid-term.

Code of i801_jc42_probe() was copied from jc42 driver, just w/o
the device id check. I think it's safe enough w/o this check.

I don't have hw to test this, therefore it's compile-tested only.

Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 070999139..4d5103288 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -261,7 +261,6 @@ struct i801_mux_config {
 	char *gpio_chip;
 	unsigned values[3];
 	int n_values;
-	unsigned classes[3];
 	unsigned gpios[2];		/* Relative to gpio_chip->base */
 	int n_gpios;
 };
@@ -1298,7 +1297,6 @@ static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03 },
 	.n_values = 2,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1307,7 +1305,6 @@ static struct i801_mux_config i801_mux_config_asus_z8_d18 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03, 0x01 },
 	.n_values = 3,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD, I2C_CLASS_SPD },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1379,6 +1376,47 @@ static const struct dmi_system_id mux_dmi_table[] = {
 	{ }
 };
 
+#define JC42_REG_CAP		0x00
+#define JC42_REG_CONFIG		0x01
+#define JC42_REG_MANID		0x06
+#define JC42_REG_DEVICEID	0x07
+
+static int i801_jc42_probe(struct i2c_adapter *adap, unsigned short addr)
+{
+	struct i2c_client cl = {.adapter = adap, .addr = addr};
+	int cap, config, manid, devid;
+
+	cap = i2c_smbus_read_word_swapped(&cl, JC42_REG_CAP);
+	config = i2c_smbus_read_word_swapped(&cl, JC42_REG_CONFIG);
+	manid = i2c_smbus_read_word_swapped(&cl, JC42_REG_MANID);
+	devid = i2c_smbus_read_word_swapped(&cl, JC42_REG_DEVICEID);
+
+	if (cap < 0 || config < 0 || manid < 0 || devid < 0)
+		return 0;
+
+	if (cap & 0xff00 || config & 0xf800 || !manid)
+		return 0;
+
+	return 1;
+}
+
+static int i801_register_jc42(struct device *dev, void *data)
+{
+	struct i2c_adapter *adap;
+	struct i2c_client *client;
+	struct i2c_board_info info = {.type = "jc42"};
+	static const unsigned short addrs[] =
+		{0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, I2C_CLIENT_END};
+
+	adap = i2c_verify_adapter(dev);
+	if(!adap)
+		return 0;
+
+	client = i2c_new_scanned_device(adap, &info, addrs, i801_jc42_probe);
+
+	return PTR_ERR_OR_ZERO(client);
+}
+
 /* Setup multiplexing if needed */
 static void i801_add_mux(struct i801_priv *priv)
 {
@@ -1400,7 +1438,6 @@ static void i801_add_mux(struct i801_priv *priv)
 	gpio_data.parent = priv->adapter.nr;
 	gpio_data.values = mux_config->values;
 	gpio_data.n_values = mux_config->n_values;
-	gpio_data.classes = mux_config->classes;
 	gpio_data.idle = I2C_MUX_GPIO_NO_IDLE;
 
 	/* Register GPIO descriptor lookup table */
@@ -1430,6 +1467,9 @@ static void i801_add_mux(struct i801_priv *priv)
 		gpiod_remove_lookup_table(lookup);
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
 	}
+
+	/* Ignore errors */
+	device_for_each_child(dev, NULL, i801_register_jc42);
 }
 
 static void i801_del_mux(struct i801_priv *priv)
-- 
2.42.1

