Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1E1F4A9658
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 10:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357647AbiBDJYr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 04:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357742AbiBDJYG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 04:24:06 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75D4C061762
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 01:24:05 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w11so10117453wra.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 01:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:from:to:cc
         :subject:content-transfer-encoding;
        bh=IuhbCfCGr8DRV1Ax3tB98jUXQOqlk+rlIPDsoC6CRjM=;
        b=lDq1iF6KDYklwZxcIJ+3dWi3XcFjLstrHw8d4OO9o/7lveDGFiYu7IvWZISxG/xJuF
         N5haV4ijv2w5ySRfS6NGeF0RToWeMXo4QP9IFRqlPLEdGmnMs5X94MAPDstFi4rItTXR
         LAZ6EJtONSVnE3bLvLtAsKkoeg64xZ1HBP8lXJda6lMgOqsLxkcQMjGrZvWF5M1/fwG3
         e5UiaR4h6fQTf2zmkGjnLmZzvMrOW3fx8rjO4SXygtRGIQehpVKKQSZ+xqZVCbRAVkZl
         3NBrUbxa53gQCOj+o8LjiyRSz0ut9EkdeLaugT8o9qSwgjU0eYl1+UhIqOBce8qBdEFP
         N2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:to:cc:subject:content-transfer-encoding;
        bh=IuhbCfCGr8DRV1Ax3tB98jUXQOqlk+rlIPDsoC6CRjM=;
        b=LEtdbHpObEDDH7CCizhTp9b4432wm4sRFg5OD0ARFpAJTtxalNsJ7LrP7JEcHf1eFb
         7pdmzl4x492ktMkZQzQzQmE09K2SIwCnvMUHMap0qYZU0KzPmnobA2T9ADbt4dBtYd7e
         ZIB+e5CPK/wR4Ba6oPFVhXPpsGUi6fbJxc/4qg32A7KbBPGnG+y+GddNay0ze8QswAYa
         1CJN8bfYEj3wa8wv59gc43LzT0O0S6X00n07bljF/VbjGLCEdW/eT16K3CLS2d3zX/PU
         2bvxM/Ui0YuB/YEFzglT6K63pdu880g3VswfaU9IzlgzVUy4BYDPNIx6cJKybEm0nbne
         3znw==
X-Gm-Message-State: AOAM5312T4DqD0NTsC1VcoMQ64KROnLR3i4ojWcacDZmjRCSFexjkVCB
        AorRrMdgrL8dzg6i2L0d7QfGL/zEtao=
X-Google-Smtp-Source: ABdhPJwVQYbBvPHcqpdA9Qd/NEivDA0pEIR8qSDbU4d4r2aWnbohnMDhtP5lypNjy7xprDHYn0f66A==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr1635566wrp.426.1643966644299;
        Fri, 04 Feb 2022 01:24:04 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:9989:e0f5:2ae1:bcee? (p200300ea8f4d2b009989e0f52ae1bcee.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:9989:e0f5:2ae1:bcee])
        by smtp.googlemail.com with ESMTPSA id f8sm1621245wry.12.2022.02.04.01.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 01:24:03 -0800 (PST)
Message-ID: <dba1720d-4efc-e304-01c7-e020efb423f2@gmail.com>
Date:   Fri, 4 Feb 2022 10:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: smbus: change type of length argument in block functions
 to size_t
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Callers may rely on the block functions returning the actually processed
number of bytes, even if the requested number of bytes is larger, e.g.
when used in a loop. However the length argument is of type u8 currently.
This may result in unintended casting and side effects.
If e.g. length == 256, then the effective length would be 0.
Therefore callers that can not guarantee length < 256 have to duplicate
the following check that is done by the block functions already:
if (length > I2C_SMBUS_BLOCK_MAX)
	length = I2C_SMBUS_BLOCK_MAX;
To avoid this change the type of length to size_t.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 8 ++++----
 include/linux/i2c.h          | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 304c2c8fe..6fda43317 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -249,7 +249,7 @@ EXPORT_SYMBOL(i2c_smbus_read_block_data);
  * else zero on success.
  */
 s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
-			       u8 length, const u8 *values)
+			       size_t length, const u8 *values)
 {
 	union i2c_smbus_data data;
 
@@ -265,7 +265,7 @@ EXPORT_SYMBOL(i2c_smbus_write_block_data);
 
 /* Returns the number of read bytes */
 s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
-				  u8 length, u8 *values)
+				  size_t length, u8 *values)
 {
 	union i2c_smbus_data data;
 	int status;
@@ -285,7 +285,7 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data);
 
 s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
-				   u8 length, const u8 *values)
+				   size_t length, const u8 *values)
 {
 	union i2c_smbus_data data;
 
@@ -638,7 +638,7 @@ EXPORT_SYMBOL(__i2c_smbus_xfer);
  * transfer.
  */
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
-					      u8 command, u8 length, u8 *values)
+					      u8 command, size_t length, u8 *values)
 {
 	u8 i = 0;
 	int status;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 7d4f52ceb..706357241 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -178,14 +178,14 @@ i2c_smbus_write_word_swapped(const struct i2c_client *client,
 s32 i2c_smbus_read_block_data(const struct i2c_client *client,
 			      u8 command, u8 *values);
 s32 i2c_smbus_write_block_data(const struct i2c_client *client,
-			       u8 command, u8 length, const u8 *values);
+			       u8 command, size_t length, const u8 *values);
 /* Returns the number of read bytes */
 s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client,
-				  u8 command, u8 length, u8 *values);
+				  u8 command, size_t length, u8 *values);
 s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
-				   u8 command, u8 length, const u8 *values);
+				   u8 command, size_t length, const u8 *values);
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
-					      u8 command, u8 length,
+					      u8 command, size_t length,
 					      u8 *values);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
-- 
2.35.1

