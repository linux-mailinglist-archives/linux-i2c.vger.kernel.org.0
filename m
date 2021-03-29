Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18F034CE30
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhC2KvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:49554 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232718AbhC2Kuy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:54 -0400
IronPort-SDR: Cp9QTvfd9dgeyttB8KbHZMXALOCqwrOHJIc0XCYB4Xzqp5HMRro/5ov3d1dzb/vpKj+88lcJEL
 6Fq6K7KBe+ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653654"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:42 -0700
IronPort-SDR: TZbSW3VbsbB3RsTgWPUgwer6h2wM55cP8asShMLjlLkg69BfjRyF5y5Z8yYHITUdu6Xf8EKjsg
 CrO+jqXAERJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955848"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:40 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@cam.ac.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 04/12] ARM: pxa: stargate2: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:39 +0300
Message-Id: <20210329105047.51033-5-heikki.krogerus@linux.intel.com>
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
Cc: Jonathan Cameron <jic23@cam.ac.uk>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/mach-pxa/stargate2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/stargate2.c b/arch/arm/mach-pxa/stargate2.c
index e2353f7dcf01a..7ad6274657686 100644
--- a/arch/arm/mach-pxa/stargate2.c
+++ b/arch/arm/mach-pxa/stargate2.c
@@ -794,6 +794,10 @@ static const struct property_entry pca9500_eeprom_properties[] = {
 	{ }
 };
 
+static const struct software_node pca9500_eeprom_node = {
+	.properties = pca9500_eeprom_properties,
+};
+
 /**
  * stargate2_reset_bluetooth() reset the bluecore to ensure consistent state
  **/
@@ -929,7 +933,7 @@ static struct i2c_board_info __initdata stargate2_i2c_board_info[] = {
 	}, {
 		.type = "24c02",
 		.addr = 0x57,
-		.properties = pca9500_eeprom_properties,
+		.swnode = &pca9500_eeprom_node,
 	}, {
 		.type = "max1238",
 		.addr = 0x35,
-- 
2.30.2

