Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D8032AB9
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfFCIZq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:46 -0400
Received: from sauhun.de ([88.99.104.3]:35886 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFCIZp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:45 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id C09053E42EA;
        Mon,  3 Jun 2019 10:25:43 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 3/5] i2c: core: always have a named variable in arguments
Date:   Mon,  3 Jun 2019 10:25:33 +0200
Message-Id: <20190603082535.1566-4-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Much better to read and understand.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d389d4fb0623..e7d5ada40d48 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1671,7 +1671,7 @@ EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
 
 /* ------------------------------------------------------------------------- */
 
-int i2c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+int i2c_for_each_dev(void *data, int (*fn)(struct device *dev, void *data))
 {
 	int res;
 
@@ -2284,7 +2284,7 @@ struct i2c_client *
 i2c_new_probed_device(struct i2c_adapter *adap,
 		      struct i2c_board_info *info,
 		      unsigned short const *addr_list,
-		      int (*probe)(struct i2c_adapter *, unsigned short addr))
+		      int (*probe)(struct i2c_adapter *adap, unsigned short addr))
 {
 	int i;
 
-- 
2.19.1

