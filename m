Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2405D58CA52
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 16:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbiHHORn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 10:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243322AbiHHORm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 10:17:42 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01282A2;
        Mon,  8 Aug 2022 07:17:41 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 941E440012;
        Mon,  8 Aug 2022 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1659968260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kkRPJXzP0mY0E2xI3MgL2tePFS/x97TuGCmrpd8sMf8=;
        b=HKqjwnT0YuT2hKZfdiLSvcNKsORkzCgBYN0bpfpUfVL+ASMO7n1HmCEoQN9S38/BvV/Sav
        /FZx5rHIIq2/kNaYFxqjLl7rQQ/DACOsmeVXw+8IH7UaFALAe9SaCj2ZZz2Qlt4miXe9nO
        fFQrZzk4msnkbSd6HKecTA1viE/RaE29r2XRHqufeVg9IR2GzSFtB1F75gsTcxweDH0PGx
        h+ErO44vvlnF3AjHoIOVGiaL1ssOS0MUV21vbKSXHuzvelLd8F5kpNiQgYquN7xzdWwq2F
        yCVJ0ps4slCI8+YM68nQmWGZeeSNRxdeq1mK8I1RXmI17eaBBwTAqOHbSuLfxw==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] docs: i2c: i2c-protocol: update introductory paragraph
Date:   Mon,  8 Aug 2022 16:17:00 +0200
Message-Id: <20220808141708.1021103-2-luca.ceresoli@bootlin.com>
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

This sentence dates back to the pre-git era and it does not look very
prefessional... As there is no clear definition of "finished", and given
this page is already a pretty good overview, not to mention it is not the
kernel responsibility to document the protocol in detail, let's update the
text accordingly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/i2c/i2c-protocol.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index b2092f8f815d..9ecf03f5de33 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -2,7 +2,8 @@
 The I2C Protocol
 ================
 
-This document describes the I2C protocol. Or will, when it is finished :-)
+This document is an overview of the basic I2C transactions and the kernel
+APIs to perform them.
 
 Key to symbols
 ==============
-- 
2.34.1

