Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DE772AFEE
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 03:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjFKBhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 21:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFKBhR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 21:37:17 -0400
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net [87.98.165.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95DC2D44
        for <linux-i2c@vger.kernel.org>; Sat, 10 Jun 2023 18:37:15 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.166])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 39AEC23384
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 01:37:14 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mx8lq (unknown [10.111.172.114])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DF9631FDF5;
        Sun, 11 Jun 2023 01:37:13 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
        by ghost-submission-6684bf9d7b-mx8lq with ESMTPSA
        id FlwkNUklhWSwAgAA59J6Zg
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 01:37:13 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003fc1a52dc-a023-4c56-b5f9-7471cd84b6a3,
                    457C5B0377F35283987BC361B5457E8A7F11D0C4) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 3/3] i2c: busses: nomadik: Use dev_err_probe() whenever possible
Date:   Sun, 11 Jun 2023 03:37:01 +0200
Message-Id: <20230611013701.1464025-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611013701.1464025-1-andi.shyti@kernel.org>
References: <20230611013701.1464025-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2686960131119516231
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduuddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make use of dev_err_probe() in order to simplify the code and
avoid printing when returning EPROBE_DEFER.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-nomadik.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 2141ba05dfece..1e5fd23ef45c3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1000,16 +1000,14 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	dev->irq = adev->irq[0];
 	ret = devm_request_irq(&adev->dev, dev->irq, i2c_irq_handler, 0,
 				DRIVER_NAME, dev);
-	if (ret) {
-		dev_err(&adev->dev, "cannot claim the irq %d\n", dev->irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&adev->dev, ret,
+				     "cannot claim the irq %d\n", dev->irq);
 
 	dev->clk = devm_clk_get_enabled(&adev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&adev->dev, "could enable i2c clock\n");
-		return PTR_ERR(dev->clk);
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&adev->dev, PTR_ERR(dev->clk),
+				     "could enable i2c clock\n");
 
 	init_hw(dev);
 
-- 
2.40.1

