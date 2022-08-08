Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41A258CA58
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243521AbiHHOR4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243451AbiHHORr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:47 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273DDE1F;
        Mon,  8 Aug 2022 07:17:46 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 239F740023;
        Mon,  8 Aug 2022 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/RQOfRAEuYlxpaBgdy2xoxxpuzSBGjIuj6Pa8upvDM=;
        b=Ffxeb1YNIarNews4CIJI8cbgm+UCqX/TGrmYlyB/rCOk1uWvq55WRCeN3a0RuY2dPp6M62
        SHKNDJ2+dfVWf18dIIYC02PZ+G1I7HJZ6nCctaPGvJ3t6C9xsc58g/D+uQuwflqMRi5ZCv
        7b6AIaMG9Wpjw8JvqB+YAX/yxlAtw37fHzvAdNUEYSEeC3s+5ujZTCorvsxtsxUYON8YYT
        3jLXduWrSzCR8R3O+d5P8h0pR/e0FUgjN2cl2Nn0pTnq8GUchOSCD3AkL06DWq83yOaQ3A
        3c8xQiEfaSDSg0qj2nQAE2dEqZaJvW2GSY6lq+w/kWFisf0xj9lUVeFsfrvUtg==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] docs: i2c: i2c-topology: fix incorrect heading
Date:   Mon,  8 Aug 2022 16:17:05 +0200
Message-Id: <20220808141708.1021103-7-luca.ceresoli@bootlin.com>
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

"Etc" here was never meant to be a heading, it became one while converting
to ReST.

It would be easy to just convert it to plain text, but rather remove it and
add an introductory text before the list that conveys the same meaning but
with a better reading flow.

Fixes: ccf988b66d69 ("docs: i2c: convert to ReST and add to driver-api bookset")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

