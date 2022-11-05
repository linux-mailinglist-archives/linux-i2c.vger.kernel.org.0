Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1E561DE5C
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiKEVNg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiKEVNM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:12 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B1B11A3F;
        Sat,  5 Nov 2022 14:13:11 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bj12so21258761ejb.13;
        Sat, 05 Nov 2022 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGr1gPz8zB0Ciz7kPlieGQfpDM11emH9iwgNzYsPKO4=;
        b=iA4Y+SAEjENlYkR+CrOnrV/GxoJtAbGsibNObkGE9ELJjJ1f0x1RdIFCc9dNKGn6Zr
         NRmwf2S3dUuKslalJ2L8Ro/sjvq51zBkG4PguLlRDYGp0zt+NjjyOTr4q2N+kUNixcPD
         Bp/3OReFhNHs2T1Fe5kNE+J19XMl6h3L7rXCGztUvtvLg9mnmJuZ5gANBHl9NgbHgRTn
         jbYa5tyw9+qN7BpRidEllnZ/iCSNVh21IVkDIsnSJu0fBQ0642k2W+Hi26WY9PHAoXoO
         uDpihBN1b/T30jUI2hG2IDK6gj+oVdEGLV6q4Ep2T/EAT28mh69n9QvQSYdv1CRiuLU+
         0h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGr1gPz8zB0Ciz7kPlieGQfpDM11emH9iwgNzYsPKO4=;
        b=tM7+w3xRBLMJvHwxTms11CAtSjWTAVdbYSv4UOgyxG4aL/rs+KoG8my6mZ0oemnO0G
         JaO5dlsYt53AGzIQr94BY9vPy21lC9YipQB6+ncs/hypYj2AQRt7wrKRWFCtq42YpUn+
         zTJNNQFXGJb1UXGW1FUIFPbhEz41y84UUmkGPKrB22goyNoEQN45RlCT1w5Kn22m14Yh
         Tm17EyHIiMNZjvOB8Io70paUuzOLpTjFlyjcSQEvV+ITEJ04nft5jKCHYXThwvJI2ucX
         D+/AKsKcLNTTdw8hMBI2ZlMHH3O754SbQfS4cyyMBKM/ItftUSbvdprPoAipef6k7HMj
         X2vw==
X-Gm-Message-State: ACrzQf23OlD2NjIMqE0i0WSxZYzGrId+TLuyzo0Nk4C+AgCEprgWGSn1
        7b/ZL6FJbVoSYqVeS8h386c=
X-Google-Smtp-Source: AMsMyM6J8t83NCWCEpyie8exJ5sS+zx6COXQb+ipEo3y1OP+GwnlYwBDwwvlZFtqE74GIWEkt8gu+Q==
X-Received: by 2002:a17:907:c03:b0:781:fd5a:c093 with SMTP id ga3-20020a1709070c0300b00781fd5ac093mr40841917ejc.89.1667682790314;
        Sat, 05 Nov 2022 14:13:10 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:09 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Vince Asbridge <VAsbridge@sanblaze.com>,
        Stephen Shirron <SShirron@sanblaze.com>
Subject: [PATCH v4 08/13] HID: ft260: remove SMBus Quick command support
Date:   Sat,  5 Nov 2022 23:11:46 +0200
Message-Id: <20221105211151.7094-9-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105211151.7094-1-michael.zaidman@gmail.com>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
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

