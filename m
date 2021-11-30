Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99BB462FD9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 10:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbhK3Jlr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbhK3Jlr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 04:41:47 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3661FC061574
        for <linux-i2c@vger.kernel.org>; Tue, 30 Nov 2021 01:38:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 327C7CE181D
        for <linux-i2c@vger.kernel.org>; Tue, 30 Nov 2021 09:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989DEC53FC7;
        Tue, 30 Nov 2021 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638265104;
        bh=r0cAyP2rsavYVcD1jWm5stdLNg5T4rJuUcSS69KJPfQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Xo10gcG0m4f0eUy7oYK1K4FuAOihAPTCSvOQzL2vICKP5WOZwwqauPghwDE5zMHfp
         WdVOja671ngrq/sblbI8fcZykH+8pE+NTj/JJV2mvlS84k0vh827eKNXo87JeF7fsZ
         8eQnhVSt0fjnKAlGvzU7EQRAFP0yjgGc58o6cChxaCErr4q3mhlpSavF/3gVPT5j7w
         ioj63Apox+UqLp68THmwnDrzddukzpzloeBYjN4AVRekyOz1qaIpcMesYph+Yh6+/+
         dU2yeY/9otNFJv44xUk3VJd/2tSsu4qAr+HAGMWIT+sGVw99Ue6F97oshSc0cHAksY
         kgwq+uF53ahkA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: stm32f7: remove noisy and imprecise log messages
Date:   Tue, 30 Nov 2021 10:38:16 +0100
Message-Id: <20211130093816.12789-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The log messages talk about 'bus recovery' while it is not a bus
recovery with 9 pulses but merely a controller reset. Controller resets
are not worth log messages. The 'bus busy' message should be emitted by
upper layers, a busy bus may be expectected in some cases.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Alain, do you agree? Only compile tested.

 drivers/i2c/busses/i2c-stm32f7.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b9b19a2a2ffa..e0e7d0001cbc 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -832,8 +832,6 @@ static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
 
-	dev_info(i2c_dev->dev, "Trying to recover bus\n");
-
 	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_PE);
 
@@ -854,13 +852,9 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
 	if (!ret)
 		return 0;
 
-	dev_info(i2c_dev->dev, "bus busy\n");
-
 	ret = stm32f7_i2c_release_bus(&i2c_dev->adap);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Failed to recover the bus (%d)\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return -EBUSY;
 }
-- 
2.30.2

