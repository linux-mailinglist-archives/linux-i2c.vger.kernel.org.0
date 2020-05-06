Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3AD1C7A1E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgEFTVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:21:10 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:38510 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgEFTVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:21:10 -0400
Received: from localhost.localdomain ([93.23.14.107])
        by mwinf5d60 with ME
        id bXM6220092JbCfx03XM6m5; Wed, 06 May 2020 21:21:07 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 06 May 2020 21:21:07 +0200
X-ME-IP: 93.23.14.107
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     wsa+renesas@sang-engineering.com, peda@axentia.se, robh@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'
Date:   Wed,  6 May 2020 21:21:00 +0200
Message-Id: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A call to 'i2c_demux_deactivate_master()' is missing in the error handling
path, as already done in the remove function.

Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 0e16490eb3a1..5365199a31f4 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -272,6 +272,7 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 err_rollback_available:
 	device_remove_file(&pdev->dev, &dev_attr_available_masters);
 err_rollback:
+	i2c_demux_deactivate_master(priv);
 	for (j = 0; j < i; j++) {
 		of_node_put(priv->chan[j].parent_np);
 		of_changeset_destroy(&priv->chan[j].chgset);
-- 
2.25.1

