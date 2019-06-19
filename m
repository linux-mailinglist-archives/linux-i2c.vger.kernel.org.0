Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344414BF39
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 19:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfFSRDO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 13:03:14 -0400
Received: from sauhun.de ([88.99.104.3]:59910 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfFSRDO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 13:03:14 -0400
Received: from localhost (p5486CF02.dip0.t-ipconnect.de [84.134.207.2])
        by pokefinder.org (Postfix) with ESMTPSA id 6415A2C353A;
        Wed, 19 Jun 2019 19:03:13 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: mux: add sysfs header
Date:   Wed, 19 Jun 2019 19:03:06 +0200
Message-Id: <20190619170306.28432-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are using sysfs functions directly, so we should include the header.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 603252fa1284..03536f4da45b 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 
 /* multiplexer per channel data */
 struct i2c_mux_priv {
-- 
2.20.1

