Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515175B6B5D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 12:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiIMKGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 06:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiIMKGC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 06:06:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F75A1AF36
        for <linux-i2c@vger.kernel.org>; Tue, 13 Sep 2022 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=BYbWZ7LYHvDFpzPpdnmpIMg3Dks
        ark4EJo5LolLoG0c=; b=rLxYd3X4Ir9w5gNqcyQWPVdfN0vtS2PO0eWEBRnt89N
        W5OQ/nJh77c7tngpeCvp//bfNK7fmpSqaNGR8OBVvA7BaCk5q9d5ue+7O5800Ba+
        fGyLwImY+lu0e7LveaCm4075kZZbCyT2WJQAh17WmZ3yvlTQsxXRhB06cP/xHqbk
        =
Received: (qmail 2090867 invoked from network); 13 Sep 2022 12:05:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2022 12:05:59 +0200
X-UD-Smtp-Session: l3s3148p1@r2msKIzoCLNZZcFI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: i2c: fix references to other documents
Date:   Tue, 13 Sep 2022 11:05:52 +0100
Message-Id: <20220913100552.3080-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Similar to commit fe99b819487d ("docs: i2c: i2c-sysfs: fix hyperlinks"),
make other links in documentation consistent with the preferred way.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/dev-interface.rst   | 2 +-
 Documentation/i2c/slave-interface.rst | 6 +++---
 Documentation/i2c/writing-clients.rst | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index 73ad34849f99..c277a8e1202b 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -148,7 +148,7 @@ You can do plain I2C transactions by using read(2) and write(2) calls.
 You do not need to pass the address byte; instead, set it through
 ioctl I2C_SLAVE before you try to access the device.
 
-You can do SMBus level transactions (see documentation file smbus-protocol
+You can do SMBus level transactions (see documentation file smbus-protocol.rst
 for details) through the following functions::
 
   __s32 i2c_smbus_write_quick(int file, __u8 value);
diff --git a/Documentation/i2c/slave-interface.rst b/Documentation/i2c/slave-interface.rst
index 82ea3e1d6fe4..58fb143baee4 100644
--- a/Documentation/i2c/slave-interface.rst
+++ b/Documentation/i2c/slave-interface.rst
@@ -32,9 +32,9 @@ User manual
 ===========
 
 I2C slave backends behave like standard I2C clients. So, you can instantiate
-them as described in the document 'instantiating-devices'. The only difference
-is that i2c slave backends have their own address space. So, you have to add
-0x1000 to the address you would originally request. An example for
+them as described in the document instantiating-devices.rst. The only
+difference is that i2c slave backends have their own address space. So, you
+have to add 0x1000 to the address you would originally request. An example for
 instantiating the slave-eeprom driver from userspace at the 7 bit address 0x64
 on bus 1::
 
diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index e3b126cf4a3b..47f7cbf4ed1a 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -364,7 +364,7 @@ stop condition is issued between transaction. The i2c_msg structure
 contains for each message the client address, the number of bytes of the
 message and the message data itself.
 
-You can read the file ``i2c-protocol`` for more information about the
+You can read the file i2c-protocol.rst for more information about the
 actual I2C protocol.
 
 
@@ -414,7 +414,7 @@ transactions return 0 on success; the 'read' transactions return the read
 value, except for block transactions, which return the number of values
 read. The block buffers need not be longer than 32 bytes.
 
-You can read the file ``smbus-protocol`` for more information about the
+You can read the file smbus-protocol.rst for more information about the
 actual SMBus protocol.
 
 
-- 
2.35.1

