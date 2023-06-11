Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756DC72AFF4
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 03:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjFKBqz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 21:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjFKBqy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 21:46:54 -0400
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net [178.32.96.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9BD1B9
        for <linux-i2c@vger.kernel.org>; Sat, 10 Jun 2023 18:46:52 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.146.1])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id E6FC9230FE
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 01:37:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ccksr (unknown [10.110.208.180])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6A0951FD6F;
        Sun, 11 Jun 2023 01:37:08 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
        by ghost-submission-6684bf9d7b-ccksr with ESMTPSA
        id 3iEMFkQlhWTpXQAABRW5BA
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 01:37:08 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00404c35923-03c9-42db-a1df-38cf9e3526a1,
                    457C5B0377F35283987BC361B5457E8A7F11D0C4) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/3] i2c: busses: nomadik cleanups
Date:   Sun, 11 Jun 2023 03:36:58 +0200
Message-Id: <20230611013701.1464025-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2685271278688471623
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduuddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
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

while browing the i2c code I spotted the unused goto. The other
two patches come naturally.

Andi

Andi Shyti (3):
  i2c: busses: i2c-nomadik: Remove unnecessary goto label
  i2c: busses: nomadik: Use devm_clk_get_enabled()
  i2c: busses: nomadik: Use dev_err_probe() whenever possible

 drivers/i2c/busses/i2c-nomadik.c | 45 +++++++++-----------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

-- 
2.40.1

