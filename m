Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486B634CE2E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhC2KvO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232711AbhC2Kux (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:53 -0400
IronPort-SDR: an28CXjcbwRvWmkA8ZPOTatqnC7JNdLnPkV1I6tcl/PEp06GJFJh97MgbX6ximvVSL6mJjsZEE
 uEamjCvE1g6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653649"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653649"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:39 -0700
IronPort-SDR: OyK8IBaP138GcLAxk6LNP0ihsqSYYhTpPX2lNNTblyTO4Chg9unUYH8JUeBFH2HZ1CKCK2w84Q
 PjCo/eUnBjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955840"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:38 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 03/12] ARM: omap1: osk: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:38 +0300
Message-Id: <20210329105047.51033-4-heikki.krogerus@linux.intel.com>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap1/board-osk.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index 0a4c9b0b13b0c..e18b6f13300eb 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -332,11 +332,15 @@ static const struct property_entry mistral_at24_properties[] = {
 	{ }
 };
 
+static const struct software_node mistral_at24_node = {
+	.properties = mistral_at24_properties,
+};
+
 static struct i2c_board_info __initdata mistral_i2c_board_info[] = {
 	{
 		/* NOTE:  powered from LCD supply */
 		I2C_BOARD_INFO("24c04", 0x50),
-		.properties = mistral_at24_properties,
+		.swnode = &mistral_at24_node,
 	},
 	/* TODO when driver support is ready:
 	 *  - optionally ov9640 camera sensor at 0x30
-- 
2.30.2

