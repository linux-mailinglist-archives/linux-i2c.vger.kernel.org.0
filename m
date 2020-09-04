Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC525D95B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 15:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgIDNNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 09:13:44 -0400
Received: from crapouillou.net ([89.234.176.41]:53560 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730400AbgIDNNW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 09:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599225120; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8KYnW8DrpG29wj31nUxneF23HgfS2+oqloS8LgQTb+g=;
        b=BV9Yn1CGiq4UYLRr1WuK84G8qchM5lUV7x39NLguRpEwaLR2RFhEjRu/lHtOLr2eQaVEEC
        uKJHfTHYdeJC+ppQf4hTZSq5eFrHiC2rWmmguLtbv3QP7k+8EEnhNlkPy7XfHIPv5Bh3iK
        A4KgdT/bRWpd97Y16jFl5EnlBQDaa+M=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
Date:   Fri,  4 Sep 2020 15:11:52 +0200
Message-Id: <20200904131152.17390-3-paul@crapouillou.net>
In-Reply-To: <20200904131152.17390-1-paul@crapouillou.net>
References: <20200904131152.17390-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CONFIG_OF is selected by CONFIG_MACH_INGENIC, therefore we don't need to
handle the case where Device Tree is not supported.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index ed2ec86f6f1a..cb4a25ebb890 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -857,7 +857,7 @@ static struct platform_driver jz4780_i2c_driver = {
 	.remove		= jz4780_i2c_remove,
 	.driver		= {
 		.name	= "jz4780-i2c",
-		.of_match_table = of_match_ptr(jz4780_i2c_of_matches),
+		.of_match_table = jz4780_i2c_of_matches,
 	},
 };
 
-- 
2.28.0

