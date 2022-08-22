Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA9E59BC64
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbiHVJLG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbiHVJLC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:11:02 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F42092F009;
        Mon, 22 Aug 2022 02:10:59 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id DEAD2100011;
        Mon, 22 Aug 2022 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661159458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cz3J51WuGNpz+PJJqTlvHHYBthbMkuACUKp1GmXcH1U=;
        b=KPSjBRqrXUNaYtx3oHiTpWIFHIU2JMXO7FQykFDDYg3ut1PM8DGXeiyDy/yJ85422B3RPI
        giqLImXfHukwGjMBasOghOMWG5ScSpgwAoMiSsCKp/+DHBs0dk+Iewo1YSSMYbEWiS3J4o
        W/nG4oUGMWbLqfwqxUWPHXqflfbz7Gi1wAfLfnp0OSX/GTz2jDjzBRJlCzqJ/IZ17OwMio
        Uf6X/5FcIdbPSsKCQCUZ+6AA4DyJc120TLn6CQehpo/Uu2LQpJqm8aXJA/wrpGt2jnlJ6C
        RCiPYyp2ZkIhNIprn8yla2/f6mePLqnV/F3Lr3zpjw1HOj28frz8J5qqcJ0TNw==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] docs: i2c: i2c-topology: fix incorrect heading
Date:   Mon, 22 Aug 2022 11:10:48 +0200
Message-Id: <20220822091050.47099-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

---

Changed in v2: none
---
 Documentation/i2c/i2c-topology.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 7cb53819778e..1b11535c8946 100644
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

