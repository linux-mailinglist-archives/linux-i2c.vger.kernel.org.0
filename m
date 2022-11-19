Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E12631129
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 22:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiKSV5D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 16:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbiKSV5C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 16:57:02 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2131413DCE
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=fCbTWY3pYrE0/ZwKGY/RnW+Rbnq
        yZl46OMy/eNyT42s=; b=CcWZ9rLBGyOAsWxs1WS27QAmSH1oBSAj+4aYxP5/lIH
        2yTEXRka7Jldhz49SufhHNFhqgk6y0MlubWFtjbKQvdcv6CinTaC1xDI18jfhEm3
        NalM8EtHcSn25yoom05Gw/gKMUQ1qeKw26YrpFIsZEKnD7G2k+TfFNoMSixq9zKc
        =
Received: (qmail 2326907 invoked from network); 19 Nov 2022 22:56:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Nov 2022 22:56:56 +0100
X-UD-Smtp-Session: l3s3148p1@Iu9m5tnt1rtehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] i2cdetect: display more functionality bits with '-F'
Date:   Sat, 19 Nov 2022 22:56:46 +0100
Message-Id: <20221119215646.6818-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Original motivation was to add I2C_FUNC_SLAVE, so users can easily
find out if their hardware supports being a target. While here, add
HostNotify and 10-bit addressing as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Now, we could also add PROTOCOL_MANGLING and NO_START to have them all.
But I am not sure if they are really helpful for users?

 tools/i2cdetect.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index 066ec82..54b78e2 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -160,6 +160,12 @@ static const struct func all_func[] = {
 	  .name = "I2C Block Write" },
 	{ .value = I2C_FUNC_SMBUS_READ_I2C_BLOCK,
 	  .name = "I2C Block Read" },
+	{ .value = I2C_FUNC_SMBUS_HOST_NOTIFY,
+	  .name = "SMBus HostNotify" },
+	{ .value = I2C_FUNC_10BIT_ADDR,
+	  .name = "10-bit addressing" },
+	{ .value = I2C_FUNC_SLAVE,
+	  .name = "Target mode" },
 	{ .value = 0, .name = "" }
 };
 
-- 
2.35.1

