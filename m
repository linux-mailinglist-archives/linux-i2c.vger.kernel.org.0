Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C986939179E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 14:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbhEZMpO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 08:45:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:24602 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234728AbhEZMoy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 08:44:54 -0400
IronPort-SDR: A7felA4oGH2w95/VlMKy/mj0W5t+vxDpMMY1tSnAB9dWdaPlFT0qAQ61I3BJ+FcTJxzPQDxoBj
 VGp/A1LLLkxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189574314"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="189574314"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:11 -0700
IronPort-SDR: 038J/aXIgYUgMzjXdUOq0rBwYrrC+EWtxkXo+NLB9nVFn7t2Kucy1TAZV7jcDzI6//+95reKQM
 eZ2d4o627/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="630717247"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 May 2021 05:43:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 702A36D8; Wed, 26 May 2021 15:43:30 +0300 (EEST)
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
Subject: [PATCH v1 5/6] staging: atomisp: Move MIPI_PORT_LANES to the only user
Date:   Wed, 26 May 2021 15:43:21 +0300
Message-Id: <20210526124322.48915-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move MIPI_PORT_LANES to the only user of it, i.e. pci/runtime/isys/src/rx.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/isp2400_input_system_local.h    | 11 -----------
 .../staging/media/atomisp/pci/runtime/isys/src/rx.c   | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 21f11bdfc85f..2614b89b8e34 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -362,17 +362,6 @@ static const hrt_address __maybe_unused MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
 	0x00000200UL
 };
 
-static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
-	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
-	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
-	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
-};
-
 static const hrt_address __maybe_unused SUB_SYSTEM_OFFSET[N_SUB_SYSTEM_ID] = {
 	0x00001000UL,
 	0x00002000UL,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 4a18da6bf0c1..29486dcc9a04 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -20,6 +20,17 @@
 #include "ia_css_irq.h"
 #include "sh_css_internal.h"
 
+static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
+	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_2LANE_CFG},
+	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_2LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG},
+	{MIPI_1LANE_CFG, MIPI_1LANE_CFG, MIPI_1LANE_CFG}
+};
+
 #if !defined(ISP2401)
 void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 {
-- 
2.30.2

