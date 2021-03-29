Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D597A34CE33
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhC2KvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232736AbhC2Kuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:55 -0400
IronPort-SDR: KHD8/tE82Hvy0eTBQ/oh8oGBX04V5Ud0FHZOPZlaWm2hj+e9XjoQr5qgBB1toflB14F0vcx8xH
 knOV94FPlHkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653672"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:49 -0700
IronPort-SDR: d8jSU6ix2SHelWctKpV6Ol2VhZ8u4lNQEDSRU02T3XRid2rjDdGCelVH3joOygJyO4E2z6wzea
 wnr71fYZaZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955885"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:48 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH 08/12] i2c: nvidia-gpu: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:43 +0300
Message-Id: <20210329105047.51033-9-heikki.krogerus@linux.intel.com>
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
Cc: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 6b20601ffb139..b5055a3cbd935 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -262,6 +262,10 @@ static const struct property_entry ccgx_props[] = {
 	{ }
 };
 
+static const struct software_node ccgx_node = {
+	.properties = ccgx_props,
+};
+
 static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 {
 	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
@@ -274,7 +278,7 @@ static int gpu_populate_client(struct gpu_i2c_dev *i2cd, int irq)
 		sizeof(i2cd->gpu_ccgx_ucsi->type));
 	i2cd->gpu_ccgx_ucsi->addr = 0x8;
 	i2cd->gpu_ccgx_ucsi->irq = irq;
-	i2cd->gpu_ccgx_ucsi->properties = ccgx_props;
+	i2cd->gpu_ccgx_ucsi->swnode = &ccgx_node;
 	i2cd->ccgx_client = i2c_new_client_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
 	return PTR_ERR_OR_ZERO(i2cd->ccgx_client);
 }
-- 
2.30.2

