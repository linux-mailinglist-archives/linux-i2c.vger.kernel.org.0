Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C1034CE32
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbhC2KvP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:49554 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232729AbhC2Kuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:55 -0400
IronPort-SDR: homucKsGkFccfJenyqdo0UjIcD0QJxbH8PNCkiVevgfZAhks9v30cd2fTRMvkPp4h5dhm0QrU7
 X2+ufBBXGuog==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653662"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653662"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:46 -0700
IronPort-SDR: Ws5QOYAJ7MRHYa/KSHWooLQx04b4czjP5MK3M2eNB2Gle/ovYqGimb1ETbTDprDNx/ymvgkZqN
 TbZ/njwgsjpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955861"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:44 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 06/12] platform/x86: intel_cht_int33fe_microb: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:41 +0300
Message-Id: <20210329105047.51033-7-heikki.krogerus@linux.intel.com>
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
 drivers/platform/x86/intel_cht_int33fe_microb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe_microb.c b/drivers/platform/x86/intel_cht_int33fe_microb.c
index 20b11e0d9a758..673f41cd14b52 100644
--- a/drivers/platform/x86/intel_cht_int33fe_microb.c
+++ b/drivers/platform/x86/intel_cht_int33fe_microb.c
@@ -35,6 +35,10 @@ static const struct property_entry bq27xxx_props[] = {
 	{ }
 };
 
+static const struct software_node bq27xxx_node = {
+	.properties = bq27xxx_props,
+};
+
 int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
 {
 	struct device *dev = data->dev;
@@ -43,7 +47,7 @@ int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
 	memset(&board_info, 0, sizeof(board_info));
 	strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type));
 	board_info.dev_name = "bq27542";
-	board_info.properties = bq27xxx_props;
+	board_info.swnode = &bq27xxx_node;
 	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
 
 	return PTR_ERR_OR_ZERO(data->battery_fg);
-- 
2.30.2

