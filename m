Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E65259F549
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbiHXIbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235870AbiHXIbQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 04:31:16 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37C7C50;
        Wed, 24 Aug 2022 01:31:14 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 990DEE0007;
        Wed, 24 Aug 2022 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661329873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aoMqV032FmyQNEuRgjfIXBChBmAduyDoUQNagPgdnwI=;
        b=fnykMu+4BW/rYTnct/n9n//fLtI2OO8UQlVPjhpebFXNDX7FJhd0jQ94kQLiyxu5frrpkK
        HO9AORhWkv792khx+RXqvj9YrZdtLLdJxMbFf6OQj44i20tLDq9lfA2mJIlyaPhOkFNxy7
        aJ3lW2iIgP8hzEwC3OlphZTxqrfmELZsrIEtTY3cPARd7oEANBl4S/qNs1OHEdBMGvqPHu
        ZSYTigX+Yaa9NDH4bZAm17eU8EG9qJu7EAoz8jgam7gowXR9NvLUzOx27brhAJpqGqkenO
        xNcKsaU0fcVlJQ+fuT0YG3w4ilhu2KJaXQqNf7CtT3Dbd7LRn5JkV/huScFJvw==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 2/3] docs: i2c: i2c-topology: fix incorrect heading
Date:   Wed, 24 Aug 2022 10:31:03 +0200
Message-Id: <20220824083104.2267000-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
References: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

"Etc" here was never meant to be a heading, it became one while converting
to ReST.

It would be easy to just convert it to plain text, but rather remove it and
add an introductory text before the list that conveys the same meaning but
with a better reading flow.

Fixes: ccf988b66d69 ("docs: i2c: convert to ReST and add to driver-api bookset")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Peter Rosin <peda@axentia.se>

---

Changed in v3: none
Changed in v2: none
---
 Documentation/i2c/i2c-topology.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index c9ed3b4d6085..326a1198551e 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -5,6 +5,8 @@ I2C muxes and complex topologies
 There are a couple of reasons for building more complex I2C topologies
 than a straight-forward I2C bus with one adapter and one or more devices.
 
+Some example use cases are:
+
 1. A mux may be needed on the bus to prevent address collisions.
 
 2. The bus may be accessible from some external bus master, and arbitration
@@ -14,9 +16,6 @@ than a straight-forward I2C bus with one adapter and one or more devices.
    from the I2C bus, at least most of the time, and sits behind a gate
    that has to be operated before the device can be accessed.
 
-Etc
-===
-
 These constructs are represented as I2C adapter trees by Linux, where
 each adapter has a parent adapter (except the root adapter) and zero or
 more child adapters. The root adapter is the actual adapter that issues
-- 
2.34.1

