Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1387B72B4CE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjFKXf7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjFKXf7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:35:59 -0400
X-Greylist: delayed 1804 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:35:56 PDT
Received: from 18.mo584.mail-out.ovh.net (18.mo584.mail-out.ovh.net [188.165.54.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B966018B
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:35:56 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.1.146])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 248B723ACD
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:46 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mz2r5 (unknown [10.110.115.220])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DD8DE1FD4F;
        Sun, 11 Jun 2023 22:57:45 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-mz2r5 with ESMTPSA
        id HYi0M2lRhmTh0AIA8H4CEw
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001e86cf684-f498-400f-b0b2-f9ad1f212e0c,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 00/15] i2c: busses: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:47 +0200
Message-Id: <20230611225702.891856-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5866501466203753031
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedvhefgveffteekueefgeehleekueegieeivdeiuedvhfeifeevieffgffhgfektdenucfkphepuddvjedrtddrtddruddpleefrdeiiedrfedurdekledpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

After having sent some cleanups for using devm_clk_get_enabled(),
I decided to expand a bit to some of the i2c drivers.

Andi

Andi Shyti (15):
  i2c: busses: emev2: Use devm_clk_get_enabled()
  i2c: busses: xiic: Use devm_clk_get_enabled()
  i2c: busses: at91-core: Use devm_clk_get_enabled()
  i2c: busses: exynos5: Use devm_clk_get_enabled()
  i2c: busses: hix5hd2: Use devm_clk_get_enabled()
  i2c: busses: jz4780: Use devm_clk_get_enabled()
  i2c: busses: lpc2k: Use devm_clk_get_enabled()
  i2c: busses: mt7621: Use devm_clk_get_enabled()
  i2c: busses: owl: Use devm_clk_get_enabled()
  i2c: busses: pasemi-platform: Use devm_clk_get_enabled()
  i2c: busses: stm32f4: Use devm_clk_get_enabled()
  i2c: busses: stm32f7: Use devm_clk_get_enabled()
  i2c: busses: sun6i-p2wi: Use devm_clk_get_enabled()
  i2c: busses: uniphier-f: Use devm_clk_get_enabled()
  i2c: busses: uniphier: Use devm_clk_get_enabled()

 drivers/i2c/busses/i2c-at91-core.c       |  8 ++---
 drivers/i2c/busses/i2c-emev2.c           | 17 +++------
 drivers/i2c/busses/i2c-exynos5.c         | 44 +++++++-----------------
 drivers/i2c/busses/i2c-hix5hd2.c         | 11 +++---
 drivers/i2c/busses/i2c-jz4780.c          | 25 ++++----------
 drivers/i2c/busses/i2c-lpc2k.c           | 22 +++---------
 drivers/i2c/busses/i2c-mt7621.c          | 20 +++--------
 drivers/i2c/busses/i2c-owl.c             | 18 +++-------
 drivers/i2c/busses/i2c-pasemi-platform.c | 22 +++---------
 drivers/i2c/busses/i2c-stm32f4.c         | 32 ++++++-----------
 drivers/i2c/busses/i2c-stm32f7.c         | 37 +++++++-------------
 drivers/i2c/busses/i2c-sun6i-p2wi.c      | 17 ++-------
 drivers/i2c/busses/i2c-uniphier-f.c      | 21 +++--------
 drivers/i2c/busses/i2c-uniphier.c        | 21 +++--------
 drivers/i2c/busses/i2c-xiic.c            | 20 ++++-------
 15 files changed, 87 insertions(+), 248 deletions(-)

-- 
2.40.1

