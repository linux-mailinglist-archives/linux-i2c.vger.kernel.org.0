Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29117D7C4E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 07:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjJZFjW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 01:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJZFjV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 01:39:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB851115;
        Wed, 25 Oct 2023 22:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=b3TZe4+33zPofg5TBxkNYMDXDP3VgfP6XYFLcWONn6E=; b=NQIwHCoi229PR2hFsF1HUxuf+p
        mchbBWzenhNv6nLu24kNfumlHsbrnuCkBCXrlSDe7j49nmJV5/Yu6mzXaF3bxYF9hcKEryeg2bPOZ
        ys44y7Uh0o9N0b+XA2fuPht3WRBn9E2fYjt6COnTrgS+5roSfpvrZCE6l4u/A6ZPT69+KQoBmBAfG
        hhgezQ5UBwmmtKV+rbkWqNbXBGNNaXd6WkVkXSGe/Ei1Av1GcboyqTmlVuf5f0RFX1+kFLUX0p7U5
        xhZcGbUn7mZJuETgAy65kXa575jD2/XrW6wQiDCvyrnzQFbK+qGw2i+JP85ranlz2LS41zopmgJ8o
        sdzOGedg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qvt5T-00DiU7-1V;
        Thu, 26 Oct 2023 05:39:19 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: axxia: eliminate kernel-doc warnings
Date:   Wed, 25 Oct 2023 22:39:18 -0700
Message-ID: <20231026053918.17347-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add kernel-doc for 'slave' and 'irq' in struct axxia_i2c_dev.
Drop kernel-doc notation ("/**") for static functions since they
are not usually documented with kernel-doc.

Prevents these kernel-doc warnings:

i2c-axxia.c:150: warning: Function parameter or member 'slave' not described in 'axxia_i2c_dev'
i2c-axxia.c:150: warning: Function parameter or member 'irq' not described in 'axxia_i2c_dev'
i2c-axxia.c:172: warning: Function parameter or member 'ns' not described in 'ns_to_clk'
i2c-axxia.c:172: warning: Function parameter or member 'clk_mhz' not described in 'ns_to_clk'
i2c-axxia.c:172: warning: No description found for return value of 'ns_to_clk'
i2c-axxia.c:271: warning: Function parameter or member 'idev' not described in 'axxia_i2c_empty_rx_fifo'
i2c-axxia.c:271: warning: No description found for return value of 'axxia_i2c_empty_rx_fifo'
i2c-axxia.c:303: warning: Function parameter or member 'idev' not described in 'axxia_i2c_fill_tx_fifo'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202310181049.Vo62moV1-lkp@intel.com/
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-axxia.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff -- a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -131,6 +131,8 @@
  * @i2c_clk: clock reference for i2c input clock
  * @bus_clk_rate: current i2c bus clock rate
  * @last: a flag indicating is this is last message in transfer
+ * @slave: associated &i2c_client
+ * @irq: platform device IRQ number
  */
 struct axxia_i2c_dev {
 	void __iomem *base;
@@ -165,7 +167,7 @@ static void i2c_int_enable(struct axxia_
 	writel(int_en | mask, idev->base + MST_INT_ENABLE);
 }
 
-/**
+/*
  * ns_to_clk - Convert time (ns) to clock cycles for the given clock frequency.
  */
 static u32 ns_to_clk(u64 ns, u32 clk_mhz)
@@ -263,7 +265,7 @@ static int i2c_m_recv_len(const struct i
 	return (msg->flags & I2C_M_RECV_LEN) != 0;
 }
 
-/**
+/*
  * axxia_i2c_empty_rx_fifo - Fetch data from RX FIFO and update SMBus block
  * transfer length if this is the first byte of such a transfer.
  */
@@ -295,7 +297,7 @@ static int axxia_i2c_empty_rx_fifo(struc
 	return 0;
 }
 
-/**
+/*
  * axxia_i2c_fill_tx_fifo - Fill TX FIFO from current message buffer.
  * @return: Number of bytes left to transfer.
  */
