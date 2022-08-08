Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C0358CA67
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243504AbiHHOSE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243487AbiHHORy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:54 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0361F2651;
        Mon,  8 Aug 2022 07:17:48 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id AD23A40020;
        Mon,  8 Aug 2022 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pyimITfYwt3DejxDZgcbCvqHq6RQhBlBuA0ezeFDKiY=;
        b=NKVB+a7xZq38HyvuMUsGZ4uuCdObXTEDP7EACfzRBHTNybzlIdtguSWANv5Ge4gqM3NuP1
        oaoXhG1Lh1T1aygrtWXyrgPSQuoE9x3EeQnTJLBqBTAmHqgOiugRaydA2HzE8EFdsklfGR
        yCIZ2DvovWl0Nr7AcsfeIEs0mAn51X8M4yNr/jg0AuwNFEyXrmj3gvFYHe4KoujytEcLN0
        vOUuhWRDcWElPzlqxDgk5RZlWlHdc+5KbpgbCe1rDNNb8q8tT3t+QZJpAYhS+Gq+T3qn1w
        6Q5KF5a4v/frDZcTA+CzGUi+97XBlmbLXqlJQQkx3GKYXT97nl3ulrMi/xhT0A==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] docs: i2c: i2c-sysfs: fix hyperlinks
Date:   Mon,  8 Aug 2022 16:17:08 +0200
Message-Id: <20220808141708.1021103-10-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

dts files cannot be linked conveniently, thus replace them with literal
formatting.

The links to other rst pages are broken, fix them using the proper syntax.

Fixes: 31df7195b100 ("Documentation: i2c: Add doc for I2C sysfs")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/i2c-sysfs.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/Documentation/i2c/i2c-sysfs.rst b/Documentation/i2c/i2c-sysfs.rst
index d816a23b80f2..b6d31290fc4b 100644
--- a/Documentation/i2c/i2c-sysfs.rst
+++ b/Documentation/i2c/i2c-sysfs.rst
@@ -99,9 +99,7 @@ Caveat
 This may be a confusing part for people who only know about the physical I2C
 design of a board. It is actually possible to rename the I2C bus physical number
 to a different number in logical I2C bus level in Device Tree Source (DTS) under
-section ``aliases``. See
-`arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
-<../../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts>`_
+section ``aliases``. See ``arch/arm/boot/dts/nuvoton-npcm730-gsj.dts``
 for an example of DTS file.
 
 Best Practice: **(To kernel software developers)** It is better to keep the I2C
@@ -289,8 +287,7 @@ MUX channel 0, and all the way to ``i2c-19`` for the MUX channel 3.
 The kernel software developer is able to pin the fanout MUX channels to a static
 logical I2C bus number in the DTS. This doc will not go through the details on
 how to implement this in DTS, but we can see an example in:
-`arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
-<../../arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts>`_
+``arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts``
 
 In the above example, there is an 8-channel I2C MUX at address 0x70 on physical
 I2C bus 2. The channel 2 of the MUX is defined as ``imux18`` in DTS,
@@ -382,13 +379,9 @@ Sysfs for the I2C sensor device::
 
 For more info on the Hwmon Sysfs, refer to the doc:
 
-`Naming and data format standards for sysfs files
-<../hwmon/sysfs-interface.rst>`_
+../hwmon/sysfs-interface.rst
 
 Instantiate I2C Devices in I2C Sysfs
 ------------------------------------
 
-Refer to the doc:
-
-`How to instantiate I2C devices, Method 4: Instantiate from user-space
-<instantiating-devices.rst#method-4-instantiate-from-user-space>`_
+Refer to section "Method 4: Instantiate from user-space" of instantiating-devices.rst
-- 
2.34.1

