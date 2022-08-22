Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F85A59BC61
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiHVJLA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbiHVJK7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:10:59 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C6526567;
        Mon, 22 Aug 2022 02:10:56 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 80E1610000A;
        Mon, 22 Aug 2022 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661159455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bRIwYiiwkB4TexwKZV7ejBzoCe+dXPHzoDp5VurumPc=;
        b=O4AjcnDSwiUNdK2PyQ+6udiahWCsrJnxS04DxOGWe0pJ/7nSE5n5tslgwpPfCA1kB1hbjk
        h9l4qzWkC6aedZl2YCE/+At6236PWxhMkG38FICbELxtaVS5RrSHw6LVUKyyHPkzTLmXLF
        4orM/pa99h0eV9LKcCDbo8b6lH+Ftw5eBsIM6Xcsd+NMdb2SPRLQbqtDvSJHA/xseuPr2i
        zBNXlV7ATOZtM02CRHJP3YVnims0/nfnzxMvBJMMfFgNxJyc9ZI5KAGJtmQf4Rzn+8n+Ew
        IJO8fmocG3InR2bqDrcmfUq50fPB/0NuvTRwzOOJQ6qaW7D8DiL/dsrUZzLMdw==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] docs: i2c: rework I2C documentation, part II
Date:   Mon, 22 Aug 2022 11:10:47 +0200
Message-Id: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
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

Back in January 2020 I sent a first batch of patches to improve I2C
documentation, titled "docs: i2c: rework I2C documentation, part I" [0] and
I wrote "I will continue to cover the rest of the sections later".

After about 2.5y, here I am with part II!

This series contains assorted improvements to the "Introduction"
section. The plan is to cover the remaining sections "later", but hopefully
sooner than in 2.5 more years.

Here's v2 with:
 * patches 7 and 8 unmodified, they still need Peter's review
 * other patches remove as they have been applied
 * a new, trivial, patch added after v1 discussion

[v1] https://lore.kernel.org/linux-i2c/20220808141708.1021103-1-luca.ceresoli@bootlin.com/T/#t
[0] https://lore.kernel.org/linux-i2c/20200123135103.20540-1-luca@lucaceresoli.net/

Luca

Luca Ceresoli (3):
  docs: i2c: i2c-topology: fix incorrect heading
  docs: i2c: i2c-topology: reorder sections more logically
  docs: i2c: i2c-topology: fix typo

 Documentation/i2c/i2c-topology.rst | 209 +++++++++++++++--------------
 1 file changed, 110 insertions(+), 99 deletions(-)

-- 
2.34.1

