Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA5B612CBB
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiJ3Uen (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiJ3Uek (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:40 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E58B1FE;
        Sun, 30 Oct 2022 13:34:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso9696544wma.1;
        Sun, 30 Oct 2022 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGr1gPz8zB0Ciz7kPlieGQfpDM11emH9iwgNzYsPKO4=;
        b=hdSxL/jp05gPlg7e/8Z5vI/+iGjPCAkTJ1evp/DDgm5VbtZm9rHIdGasoFiJrwe6Uv
         K3q/NMLi1l+Le7fJI1/icK4qsUAXRWyb9vCCRkaBBahI0nn/BP+68IuKoP8se88xaI+n
         mcMTnhwiZ3u2nu3ESu9IKIpyn1zYxVg9V8H1c5wuknX0EP83UU9YcCH+slEykxjroOLr
         S8ajmYL3HoWs7+DghMz6zMy0hbNlUhgV8crMq7L2TDlj26H9QdYTWJoyoAQeJegz+5IA
         n69dDFb4Nnw2Wn9XoUiul/jPsA/XFcSWTPRTy/3+vf1Ct1QzcOolnVnDr/jKp3riMiB4
         CWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGr1gPz8zB0Ciz7kPlieGQfpDM11emH9iwgNzYsPKO4=;
        b=aEUcSRZloTT3tF9B6xDEIKuEfWbxmr5yBGrGRxqMugoYIWBB9AIPRJgHRT0FzBBYqm
         njxTEZ2IulJLVHGvyx2D5n6+cnOvuQZwff/C+hFL3Ck/8F2vPXqoT+5v0e4fliZR1ATF
         9ogTriu+cDGNZnyoqmQx5Sr+rbbd4OaWoDNu7nyQvx9e7WwG7mzNdMx6OBV6oKLzV3NX
         RjKZ/gRjHvdrMlLdg1OTcx1MLicEIaqM3eom1/A1STB2YnoNugmdrRk2xACoXs4T5XWN
         HMLZmeL4EhdezQ66t2o5I1FaCri1Ln+Hmf1C/aQcCGI2Kl33gGjLuIPEeN9WoJsoyQkl
         06TQ==
X-Gm-Message-State: ACrzQf0wLRaKEdIXJc940TgA6SF3egKgAIGMYC9l7wecZmHq4jf6L+Af
        p0XT0/ML9K29w9oU5iTUm5bTJIMbavlaUQ==
X-Google-Smtp-Source: AMsMyM6iK4kumvV6kjVG5x+UBZysodHXQQp6lmoKNDwSZLL0A4bDc3wDTtn6rSzFl1fTGsPDbmfbbw==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id p5-20020a1c7405000000b003cf55ea6520mr5972572wmc.46.1667162078327;
        Sun, 30 Oct 2022 13:34:38 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:37 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>,
        Vince Asbridge <VAsbridge@sanblaze.com>,
        Stephen Shirron <SShirron@sanblaze.com>
Subject: [PATCH v3 08/12] HID: ft260: remove SMBus Quick command support
Date:   Sun, 30 Oct 2022 22:33:59 +0200
Message-Id: <20221030203403.4637-9-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030203403.4637-1-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2cdetect uses the SMBus Quick command by default to scan devices
on the I2C bus. The FT260 implements an I2C bus controller. The SMBus
is derived from I2C, but there are several differences between the
specifications of the two buses in the areas of timing, protocols,
operation modes, and electrical characteristics.

One of the differences is that the I2C devices allow the slave not
to ACK its slave address, but SMBus requires it to always ACK it as
a mechanism to detect a detachable device’s presence on the bus.
Since FT260 is the I2C bus controller, it does not acknowledge the
SMBus Quick write command, which sends a single bit to the device at
the place of the RD/WR bit.

The ft260 driver attempted to mimic the SMBus Quick Write functionality
by writing a single byte as the SMBus Byte Write command does.

Usually, one byte in the SMBus Quick Write will be fine. However, it may
cause problems with devices with a control register at offset 0, like
i2c muxes, for example, when scanned with the i2cdetect utility.

The i2cdetect with the "-r" option uses the SMBus Read Byte command,
which is a reasonable workaround. To prevent the I2C bus from locking
at write-only devices (most notably clock chips at address 0x69), use
the "-r" option in conjunction with scanning range parameters.

This patch removes the SMBus Quick command support.

$ sudo i2cdetect -y 13
Warning: Can't use SMBus Quick Write command, will skip some addresses
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:
10:
20:
30: -- -- -- -- -- -- -- --
40:
50: 50 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
60:
70:

$ sudo i2cdetect -y -r 13
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

Reported-by: Vince Asbridge <VAsbridge@sanblaze.com>
Reported-by: Stephen Shirron <SShirron@sanblaze.com>
Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 8b6ebc5228eb..d186aa5a8e73 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -630,14 +630,6 @@ static int ft260_smbus_xfer(struct i2c_adapter *adapter, u16 addr, u16 flags,
 	}
 
 	switch (size) {
-	case I2C_SMBUS_QUICK:
-		if (read_write == I2C_SMBUS_READ)
-			ret = ft260_i2c_read(dev, addr, &data->byte, 0,
-					     FT260_FLAG_START_STOP);
-		else
-			ret = ft260_smbus_write(dev, addr, cmd, NULL, 0,
-						FT260_FLAG_START_STOP);
-		break;
 	case I2C_SMBUS_BYTE:
 		if (read_write == I2C_SMBUS_READ)
 			ret = ft260_i2c_read(dev, addr, &data->byte, 1,
@@ -720,7 +712,7 @@ static int ft260_smbus_xfer(struct i2c_adapter *adapter, u16 addr, u16 flags,
 
 static u32 ft260_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_QUICK |
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
 	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
 }
-- 
2.34.1

