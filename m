Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711377D12C1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Oct 2023 17:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377753AbjJTPao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Oct 2023 11:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377726AbjJTPa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Oct 2023 11:30:29 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BDC1A8;
        Fri, 20 Oct 2023 08:30:27 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id DF5DAC000D;
        Fri, 20 Oct 2023 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697815826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LpkSQeveUeewBTxaJFyVrBiY7AoHvN0hE8hZ52cDayY=;
        b=OuMTtuTsfHK6E+16NET+zVwtnX4o+Xw9/X7wdTuWuRBpjJ5jdIChiURZAUu5RmWLvsB2T3
        9T9vA38ADHg9rQhKOv0J2IKStBUWX73xMAJIKH6ebMUfsLlEeyo/V/cPqMJbHHCDLRdFT3
        whXqROauSPkco0ha6pH7rqag50cww3Nehn5ycYMB1k3jMYZVaOQyRNdfFeCxJ1mCHV3IaD
        tQ8gvIxiTf2fiX7znhONmol9gf1Ig7oDlavgMgKgttyQAZcvsUJuuJNufpWay2pmDszPKH
        QgwDu2WUlMViWKQK0xdy2jbR1VlcbfaEFJHJqfp230QjADYt4b8TkrhP7Nm7Ew==
From:   Herve Codina <herve.codina@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>,
        Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        stable@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 3/3] i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
Date:   Fri, 20 Oct 2023 17:30:13 +0200
Message-ID: <20231020153017.759926-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020153017.759926-1-herve.codina@bootlin.com>
References: <20231020153017.759926-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-mux-gpmux uses the pair of_find_i2c_adapter_by_node() /
i2c_put_adapter(). These pair alone is not correct to properly lock the
I2C parent adapter.

Indeed, i2c_put_adapter() decrements the module refcount while
of_find_i2c_adapter_by_node() does not increment it. This leads to an
underflow of the parent module refcount.

Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
correctly the module refcount.

Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Cc: stable@vger.kernel.org
Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/muxes/i2c-mux-gpmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index baccf4bfaf02..8305661e1253 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -52,7 +52,7 @@ static struct i2c_adapter *mux_parent_adapter(struct device *dev)
 		dev_err(dev, "Cannot parse i2c-parent\n");
 		return ERR_PTR(-ENODEV);
 	}
-	parent = of_find_i2c_adapter_by_node(parent_np);
+	parent = of_get_i2c_adapter_by_node(parent_np);
 	of_node_put(parent_np);
 	if (!parent)
 		return ERR_PTR(-EPROBE_DEFER);
-- 
2.41.0

