Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC6A34CE31
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhC2KvP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232728AbhC2Kuy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:54 -0400
IronPort-SDR: rFdDRE4krYhCPA7xzGpjJE6n1kIe5Aui7fyaOiZ+B976laGYHF4QE4wQi7ttuHCgfceUKOq8pl
 OtOprcQAc1qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653656"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653656"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:44 -0700
IronPort-SDR: kBnfbWcddNVg3aFlhlrqvHddNrpMfnXtqD5knk0CXiIxvoc7oYxlU6+wIBJKND9iidYwoxvO4d
 5h5pFbIMu7SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955855"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:42 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
Date:   Mon, 29 Mar 2021 13:50:40 +0300
Message-Id: <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c/mach-mini2440.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
index 4100905dfbd0c..551ec660ab599 100644
--- a/arch/arm/mach-s3c/mach-mini2440.c
+++ b/arch/arm/mach-s3c/mach-mini2440.c
@@ -542,10 +542,14 @@ static const struct property_entry mini2440_at24_properties[] = {
 	{ }
 };
 
+static const struct software_node mini2440_at24_node = {
+	.properties = mini2440_at24_properties,
+};
+
 static struct i2c_board_info mini2440_i2c_devs[] __initdata = {
 	{
 		I2C_BOARD_INFO("24c08", 0x50),
-		.properties = mini2440_at24_properties,
+		.swnode = &mini2440_at24_node,
 	},
 };
 
-- 
2.30.2

