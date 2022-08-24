Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FCD59F548
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 10:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiHXIbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 04:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233808AbiHXIbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 04:31:11 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC723341A;
        Wed, 24 Aug 2022 01:31:10 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 44D79E000A;
        Wed, 24 Aug 2022 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661329869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bFI+HPtTFBe71GLZ2S75WhbRPRP7fijihnkThniBIbY=;
        b=bg2Zjyl3KJPyDDmzRTOAmhGrD5cVKJGTVi7LeqLgAeb+wTID7ytnY3Z1kXVGEymM6+YK/p
        R36dPK3iKCLF4sYKyHIPdJGbD4TB3Px4wp1vTX8ieTOzr3dGACjg2TxIUzPEiMTWHClMCm
        iFctXQDRGg+n3ZUaPkhvrZIQBEgPpJqO17m7ayUN+qnhxvAq5SXOZq1g4Tw43rt4Lw97bZ
        5+hQJDDmbxFPpzwRWkbhRsMcg7ivZDijUajx28j3cig+4rt8yBVjsfc/tnBdNyCjT1+pJk
        g09Rw4BZDb7jmwYqU5nrK67oGdDvCQG0fzIAP/iQomhviLQKuHfFo0jPukI6hg==
From:   luca.ceresoli@bootlin.com
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 0/3] docs: i2c: rework I2C documentation, part II
Date:   Wed, 24 Aug 2022 10:31:01 +0200
Message-Id: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

Changes in v3:
 * re-added "caveat ID" list based on Peter's comments
 * reordered patches to fix typo first

Changes in v2:
 * patches 7 and 8 unmodified, they still need Peter's review
 * other patches remove as they have been applied
 * a new, trivial, patch added after v1 discussion

[v2] https://lore.kernel.org/linux-i2c/20220822091050.47099-1-luca.ceresoli@bootlin.com/T/#t
[v1] https://lore.kernel.org/linux-i2c/20220808141708.1021103-1-luca.ceresoli@bootlin.com/T/#t
[0] https://lore.kernel.org/linux-i2c/20200123135103.20540-1-luca@lucaceresoli.net/

Luca

Luca Ceresoli (3):
  docs: i2c: i2c-topology: fix typo
  docs: i2c: i2c-topology: fix incorrect heading
  docs: i2c: i2c-topology: reorder sections more logically

 Documentation/i2c/i2c-topology.rst | 214 ++++++++++++++++-------------
 1 file changed, 115 insertions(+), 99 deletions(-)

-- 
2.34.1

