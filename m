Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942D33917A1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 14:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhEZMpP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 08:45:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:21157 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234741AbhEZMoy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 08:44:54 -0400
IronPort-SDR: 1u0VBTYOWj+FL1nx/rKXFpILC6NPM/l++IBqKfKq4cgg0/D0/Yd4wplUa7+AWRYQnxpXzqxUUo
 O4ENyt+vUqTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199401427"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="199401427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:11 -0700
IronPort-SDR: Dzk5EFsP7fJJVT6B3lf0dHwP7+a4bLImdwCySiTE43cfCefcEez/XVuQAqRbDuMXGa17s9VgWU
 VXQt1BZPP0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="409246040"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2021 05:43:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 53E645B6; Wed, 26 May 2021 15:43:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 3/6] staging: atomisp: Remove unused declarations
Date:   Wed, 26 May 2021 15:43:19 +0300
Message-Id: <20210526124322.48915-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is a few static declarations that are not used anywhere, remove them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../atomisp/pci/isp2400_input_system_local.h    | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 072a92199e05..27f3c8a45730 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -362,23 +362,6 @@ static const hrt_address MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000200UL
 };
 
-static const mipi_lane_cfg_t MIPI_PORT_MAXLANES[N_MIPI_PORT_ID] = {
-	MIPI_4LANE_CFG,
-	MIPI_1LANE_CFG,
-	MIPI_2LANE_CFG
-};
-
-static const bool MIPI_PORT_ACTIVE[N_RX_MODE][N_MIPI_PORT_ID] = {
-	{true, true, false},
-	{true, true, false},
-	{true, true, false},
-	{true, true, false},
-	{true, true, true},
-	{true, true, true},
-	{true, true, true},
-	{true, true, true}
-};
-
 static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
 	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-- 
2.30.2

