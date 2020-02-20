Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E79166490
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2020 18:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgBTRZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 12:25:54 -0500
Received: from sauhun.de ([88.99.104.3]:35042 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728706AbgBTRZy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Feb 2020 12:25:54 -0500
Received: from localhost (p5486CC48.dip0.t-ipconnect.de [84.134.204.72])
        by pokefinder.org (Postfix) with ESMTPSA id D7BF52C1EBA;
        Thu, 20 Feb 2020 18:25:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/7] i2c: add sanity check for parameter of i2c_verify_client()
Date:   Thu, 20 Feb 2020 18:23:57 +0100
Message-Id: <20200220172403.26062-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We export this function, so we should check the paramter to make it
NULL-compatible.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cefad0881942..8f46d1bb8c62 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -517,7 +517,7 @@ EXPORT_SYMBOL_GPL(i2c_client_type);
  */
 struct i2c_client *i2c_verify_client(struct device *dev)
 {
-	return (dev->type == &i2c_client_type)
+	return (dev && dev->type == &i2c_client_type)
 			? to_i2c_client(dev)
 			: NULL;
 }
-- 
2.20.1

