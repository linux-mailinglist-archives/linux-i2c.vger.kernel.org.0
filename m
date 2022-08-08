Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D846A58CA56
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243434AbiHHORq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243378AbiHHORo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:44 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D616DF9;
        Mon,  8 Aug 2022 07:17:43 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 4B14D40022;
        Mon,  8 Aug 2022 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7LWos+3Nat6ZJ6Jrt0Y6a2rt6FhVH50B0A/I/sZ/L0c=;
        b=RhQx0/m5oUl4IpNjZ7hGUz3SOa2uzgysGRElbtxe8in6kRSOwq9/HXT+UsJAkH8lRc7VlZ
        S3PMz2BrKD7/EuWfAoFQWYwqJqHyo76gABPoXWixnpkw2VBriZL2vkyS+hi+Cqqv+Mpz2Q
        vjIYAmILYArwcQsKjwz/0a27K3WOSU2Qe/U7O88frOZF3IjE6OHeriyvz9uVfB1VTccBys
        p2rkEZY78I+9LgoqCrmsS6fNFNsBX5iOmkuofT/glp3yRTzVtWAfgV60YGHnJxSwkzBmWa
        tqm6oVkrgZqQ83ssNbyoFaabZLG3ddWoT2H1It3d1+W/HGdiohTTeOvgc3acRQ==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] docs: i2c: i2c-protocol: remove unused legend items
Date:   Mon,  8 Aug 2022 16:17:02 +0200
Message-Id: <20220808141708.1021103-4-luca.ceresoli@bootlin.com>
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

"Comm", "Count", "DataLow", "DataHigh" are not used in this section.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/i2c-protocol.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index 7ffada1f3335..df0febfe6410 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -15,11 +15,7 @@ Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
 A, NA (1 bit)   Acknowledge (ACK) and Not Acknowledge (NACK) bit
 Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded to
                 get a 10 bit I2C address.
-Comm  (8 bits)  Command byte, a data byte which often selects a register on
-                the device.
-Data  (8 bits)  A plain data byte. Sometimes, I write DataLow, DataHigh
-                for 16 bit data.
-Count (8 bits)  A data byte containing the length of a block operation.
+Data  (8 bits)  A plain data byte.
 
 [..]            Data sent by I2C device, as opposed to data sent by the
                 host adapter.
-- 
2.34.1

