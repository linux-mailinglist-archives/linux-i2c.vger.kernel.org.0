Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35EA59BC5E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbiHVJLO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234223AbiHVJLF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:11:05 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE352F394;
        Mon, 22 Aug 2022 02:11:01 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 680DA100015;
        Mon, 22 Aug 2022 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661159460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zj/2REijE3zPLLtMEabFdtuhZMR0wF7GWbZ6HPCLFdc=;
        b=Sj/rhWYF57wjxSrCwt56XER4Hx8VgWt3V2KKTL2W0vs6kgsukNavV6b6IqZStp9mXZogeE
        HOWm00d91osgpMkCQPNJw35eIKyiV7Ex0sl8ZADGTjAPtjRS1f+1wvybN5XBC17w22qPn9
        XxeymR+v5+FQ/kAMH+NWTqyg0pFtPwIub9dZqBk26Jc4GQC7KCWIKJuuHuZasnXitx9VVb
        H90kjwDtrgvLtAbKtWW0JNL8DJGERN2Lfn7xHDNEhkf4IBLiCrWjlwk2pCRdaRmvuTy3km
        xqK93v2xhmbb/2ZjRF3p0mHGtznv+xE6b16MJd9c5PuqX1+5R1lcRbFgL05MSQ==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 3/3] docs: i2c: i2c-topology: fix typo
Date:   Mon, 22 Aug 2022 11:10:50 +0200
Message-Id: <20220822091050.47099-4-luca.ceresoli@bootlin.com>
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

"intension" should have probably been "intention", however "intent" seems
even better.

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2:
- this patch is new in v2
---
 Documentation/i2c/i2c-topology.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 6f2da7f386fd..65ed76bc979f 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -102,7 +102,7 @@ When using a mux-locked mux, be aware of the following restrictions:
   I.e. the select-transfer-deselect transaction targeting e.g. device
   address 0x42 behind mux-one may be interleaved with a similar
   operation targeting device address 0x42 behind mux-two. The
-  intension with such a topology would in this hypothetical example
+  intent with such a topology would in this hypothetical example
   be that mux-one and mux-two should not be selected simultaneously,
   but mux-locked muxes do not guarantee that in all topologies.
 
-- 
2.34.1

