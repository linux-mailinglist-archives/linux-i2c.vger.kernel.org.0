Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2816D1EC2E5
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 21:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgFBTim (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 15:38:42 -0400
Received: from v6.sk ([167.172.42.174]:45786 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgFBTil (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 15:38:41 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 52BA7610D5;
        Tue,  2 Jun 2020 19:38:40 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] i2c: pxa: don't error out if there's no pinctrl
Date:   Tue,  2 Jun 2020 21:38:23 +0200
Message-Id: <20200602193823.267048-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The bus recovery patch regresses on OLPC XO-1.75 that has no pinctrl in
its DT.

Fixes: 7c9ec2c52518 ("i2c: pxa: implement generic i2c bus recovery")'
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/i2c/busses/i2c-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index a7885b8b5031c..35ca2c02c9b9b 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1348,6 +1348,8 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 		return 0;
 
 	i2c->pinctrl = devm_pinctrl_get(dev);
+	if (PTR_ERR(i2c->pinctrl) == -ENODEV)
+		i2c->pinctrl = NULL;
 	if (IS_ERR(i2c->pinctrl))
 		return PTR_ERR(i2c->pinctrl);
 
-- 
2.26.2

