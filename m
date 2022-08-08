Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B5E58CA53
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243431AbiHHORp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243357AbiHHORn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:43 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF26CDA;
        Mon,  8 Aug 2022 07:17:42 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 7642C40020;
        Mon,  8 Aug 2022 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+RpzD04feUpzsPHQPlUrUQU23dieVOTj7WEn2/g+uqY=;
        b=jBpJOIP3kqmtpqCNy7/AtcMdVx3svr2ajsPfb6zQEr15GteYOSbidiRVygAHhm3aeaBa83
        BTj0VmpLev7cd2q0EkHi8sXa3dlrpJWKQnuYu/luBBAgZeHknCnBJEMaP5t6zRrMTux09Y
        BgDWtaWB3/hJH/1IoIHoN2OWJ95kvt+ROmCFTwnA+YCnip2Ghlv+mAWEOHWQawiaAKCU1r
        MWUGjNYFqr1/3AF6BjA7C3+9SUVjZ8r6rSj4IVPkGilEX85NmSl9n3lBptq8ZVGE4un8d6
        D2nVyF9i+yShfN6qQ0llSFHwEOmcc6Zw6tT77Prp4VyRg+WT48q/KePDlHVnhA==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] docs: i2c: i2c-protocol,smbus-protocol: remove nonsense words
Date:   Mon,  8 Aug 2022 16:17:01 +0200
Message-Id: <20220808141708.1021103-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

"as usual" does not mean much here, especially as these are introductory
sections and 10-bit addressing hasn't been introduced yet.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/i2c-protocol.rst   | 2 +-
 Documentation/i2c/smbus-protocol.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index 9ecf03f5de33..7ffada1f3335 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -13,7 +13,7 @@ S               Start condition
 P               Stop condition
 Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
 A, NA (1 bit)   Acknowledge (ACK) and Not Acknowledge (NACK) bit
-Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded as usual to
+Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded to
                 get a 10 bit I2C address.
 Comm  (8 bits)  Command byte, a data byte which often selects a register on
                 the device.
diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 00d8e17d0aca..55e209c7e520 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -41,7 +41,7 @@ Sr              Repeated start condition, used to switch from write to
 P               Stop condition
 Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
 A, NA (1 bit)   Acknowledge (ACK) and Not Acknowledge (NACK) bit
-Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded as usual to
+Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded to
                 get a 10 bit I2C address.
 Comm  (8 bits)  Command byte, a data byte which often selects a register on
                 the device.
-- 
2.34.1

