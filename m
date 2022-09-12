Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6D15B6269
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 22:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiILU67 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 16:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiILU66 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 16:58:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD39A476D4
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 13:58:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74FF061291
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 20:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D598C433C1;
        Mon, 12 Sep 2022 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663016336;
        bh=hUixuizgoYolI4Ndnc0u8HgjN673iqMDT5nrORXOPQk=;
        h=From:To:Cc:Subject:Date:From;
        b=hHnOXjBk9/PFyDp+mlUp9x/HNZrNMqBaVOB8UTQr8OB9udWDRWCpbXYNMOqjh3mOU
         1iQxErSwv30eE1hKCC7Cya3av/wOhr1/jpFP2LG8vjYJMbNgPWZE0NsmmPptACOfO+
         SJJ8By0g+n0OcimKtEuzPE7pad7TaEqZfxGolb4FRakPQNcBmEEsYugoUhZtkj60tT
         QSAUZBdUv84bLrYn4+NFDMHIpqWZrQgHb1hx4ATxwQomomP6B8po8xh7Z/0xkDsNmG
         cs44M7dg47zr+RDmpSRuN/aJhW6D74PuhjOfXO0amdN+ROtd/UdQ0rMHlq7A0hQ9h+
         JSc1xv7qxx33A==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] MAINTAINERS: remove Nehal Shah from AMD MP2 I2C DRIVER
Date:   Mon, 12 Sep 2022 21:58:43 +0100
Message-Id: <20220912205843.3343-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

His email bounced and given commit 88115ea6308d ("HID: amd_sfh: Remove
name from maintainers list"), I assume he is no longer available as a
maintainer.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 589517372408..9da64b983985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1010,7 +1010,6 @@ F:	drivers/spi/spi-amd.c
 
 AMD MP2 I2C DRIVER
 M:	Elie Morisse <syniurge@gmail.com>
-M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
 M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-- 
2.35.1

