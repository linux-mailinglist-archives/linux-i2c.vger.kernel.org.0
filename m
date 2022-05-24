Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28623532E5F
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 18:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbiEXQDd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 12:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239520AbiEXQCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 12:02:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6021B7A8;
        Tue, 24 May 2022 09:01:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2985DB81A3A;
        Tue, 24 May 2022 16:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311F3C34113;
        Tue, 24 May 2022 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653408077;
        bh=1+z+sNbxT56SjlBQgUUIv3b78tcRXKNXzlTy+NZVN0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i0/STzQVVggY0xxcBE7XHkRhLPJIfKqXYIe2OxVC3iCOJVLDTh+1FEjv/MFrzwuyw
         8bKlHlaHrf2SO5bKB25A/f0PcXpujbpxnyhvYLyyJa3pGtQQdBtxl3H4mFLDpXArOI
         qe0Z6At8O8wYtA89htztpJ4kVY1YE62Nw8rV58FEYNVUM56kSNfEM6YRa2yS9sBVS7
         ZBxMv9qu4BXM3wc/LwM3/XLVzb9WYmAyFDMmote8hhLuBaXrz/sYV8RRPRDs452U8N
         CNkx7xqcprJ5n+v3N1A5rnbBj6xebzHKqJZ0u0HleVU+A/CR/iW857W4wA6hIoOMcF
         U+unE3fvYz/iA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Piyush Malgujar <pmalgujar@marvell.com>,
        Szymon Balcerak <sbalcerak@marvell.com>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        rric@kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 5/5] drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers
Date:   Tue, 24 May 2022 12:01:01 -0400
Message-Id: <20220524160102.827227-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524160102.827227-1-sashal@kernel.org>
References: <20220524160102.827227-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Piyush Malgujar <pmalgujar@marvell.com>

[ Upstream commit 03a35bc856ddc09f2cc1f4701adecfbf3b464cb3 ]

Due to i2c->adap.dev.fwnode not being set, ACPI_COMPANION() wasn't properly
found for TWSI controllers.

Signed-off-by: Szymon Balcerak <sbalcerak@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 19f8eec38717..107aeb8b54da 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -208,6 +208,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->adap.bus_recovery_info = &octeon_i2c_recovery_info;
 	i2c->adap.dev.parent = dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
+	i2c->adap.dev.fwnode = dev->fwnode;
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 "Cavium ThunderX i2c adapter at %s", dev_name(dev));
 	i2c_set_adapdata(&i2c->adap, i2c);
-- 
2.35.1

