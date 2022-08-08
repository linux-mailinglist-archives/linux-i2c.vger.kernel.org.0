Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9DBA58CA5F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243494AbiHHORy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243381AbiHHORp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:45 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1E3E1D;
        Mon,  8 Aug 2022 07:17:44 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 295DE40009;
        Mon,  8 Aug 2022 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s8gzQTvX0pOI7ot4Zo9ZL6U8ilRBCDjzvp41cYqckpw=;
        b=Mz+jQQpjIJkcHGrl2iLMnHSCBUxWyXVhiK38JuREwBqHPK62+NNxawqtzcNxu4VzZmZOqa
        p+vFb//6xmRjCZjxGXsj5kuw9bGuxfJ+ubkNLjguNMSHtHWPqn5KH3gJ2Rro/9Il4DnKJW
        Rf34IkosI+BvDD1RoRXLkBJq6IaiMzm5rsQrAIaV1wLNRPtfNOFenmi7Eg4ZZCp4GSsn8p
        EWVa3yHtWlTqGRNs06QaKfnmTZY0+/q1uUZ3mWm4vJVju4GnlkP/GZaNvXoN12ZVVO6yhF
        DilbHSwOvijScvB1fdcrUayQHRdCoz0CNFmOeJbXKqG+zwYEk7ooaJmZ5P9CVg==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] docs: i2c: smbus-protocol: improve DataLow/DataHigh definition
Date:   Mon,  8 Aug 2022 16:17:03 +0200
Message-Id: <20220808141708.1021103-5-luca.ceresoli@bootlin.com>
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

Use a more professional wording.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/smbus-protocol.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 55e209c7e520..4942c4cad4ad 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -45,8 +45,8 @@ Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded to
                 get a 10 bit I2C address.
 Comm  (8 bits)  Command byte, a data byte which often selects a register on
                 the device.
-Data  (8 bits)  A plain data byte. Sometimes, I write DataLow, DataHigh
-                for 16 bit data.
+Data  (8 bits)  A plain data byte. DataLow and DataHigh represent the low and
+                high byte of a 16 bit word.
 Count (8 bits)  A data byte containing the length of a block operation.
 
 [..]            Data sent by I2C device, as opposed to data sent by the host
-- 
2.34.1

