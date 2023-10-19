Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7677CF4C4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 12:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345228AbjJSKK1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 06:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345212AbjJSKK0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 06:10:26 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF415123;
        Thu, 19 Oct 2023 03:10:24 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id EACCAC000C;
        Thu, 19 Oct 2023 10:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697710223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V00s/mVGgaCRB68RBbwNCsl4DRqLwcfW3IIuO/Z+Vmg=;
        b=RadoXgs4AZdQ45Rq8OCGmJcQ40bBQg7gztQWIZIhduC3qK/ToTZ5eYQHiS09J8F1qNeP8F
        tv4Sxge0hkziPnEY6JYWltoJOytUHgzt3MJKXELQJ6SfqfdIWwLEUfUZIlaFczhKOZz/5I
        Wum13MlhF6qQYoNFgxNtILhGi04ePLDGiaIAbqappzd6pZzfeayBLgNSZrfxfCZPN+d46u
        O5dMJxlGfCOPGdcJ10KrtOu8ALmxreJsvRbHJ+kPQ55C4RBsiVS/3EMENw/dL0xu8rABod
        usCkvcpv3phCB9lQfoXP4gQXu8tOcuci9emdJ7kaVArJqQ5GK7a8Jl8nK9XYQg==
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
        Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/3] i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
Date:   Thu, 19 Oct 2023 12:10:14 +0200
Message-ID: <20231019101017.425284-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019101017.425284-1-herve.codina@bootlin.com>
References: <20231019101017.425284-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
i2c_put_adapter(). These pair alone is not correct to properly lock the
I2C parent adapter.

Indeed, i2c_put_adapter() decrements the module refcount while
of_find_i2c_adapter_by_node() does not increment it. This leads to an
underflow of the parent module refcount.

Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
correctly the module refcount.

Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/muxes/i2c-mux-pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
index 18236b9fa14a..6ebca7bfd8a2 100644
--- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
@@ -62,7 +62,7 @@ static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
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

