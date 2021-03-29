Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C828934CE36
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhC2KvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232732AbhC2Kuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:55 -0400
IronPort-SDR: 3XgH5mpe6ZZu01l++vGnIhjecmj8trt6uwanDtxy7vrKVi6h7kfNSHP0Xu2NFGglMGvp1jgfYm
 KBOY5tE9KcJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653667"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653667"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:47 -0700
IronPort-SDR: JkD5Oy3hVYWfGJXOsuOTsPmBNkURB/dcSjUcUBRt+RrI9q5H8jsZw1FfjNdmH/Ilc+vmSTjUaN
 reprAYCtnYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955873"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:46 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 07/12] i2c: cht-wc: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:42 +0300
Message-Id: <20210329105047.51033-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional device properties are always just a part of a
software fwnode. If the device properties are constant, the
software node can also be constant.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/i2c/busses/i2c-cht-wc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index f80d79e973cd2..08f491ea21ac9 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -280,6 +280,10 @@ static const struct property_entry bq24190_props[] = {
 	{ }
 };
 
+static const struct software_node bq24190_node = {
+	.properties = bq24190_props,
+};
+
 static struct regulator_consumer_supply fusb302_consumer = {
 	.supply = "vbus",
 	/* Must match fusb302 dev_name in intel_cht_int33fe.c */
@@ -308,7 +312,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 		.type = "bq24190",
 		.addr = 0x6b,
 		.dev_name = "bq24190",
-		.properties = bq24190_props,
+		.swnode = &bq24190_node,
 		.platform_data = &bq24190_pdata,
 	};
 	int ret, reg, irq;
-- 
2.30.2

