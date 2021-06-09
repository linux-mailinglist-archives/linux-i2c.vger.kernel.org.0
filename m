Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7203A1BCD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jun 2021 19:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFIRcS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Jun 2021 13:32:18 -0400
Received: from mga14.intel.com ([192.55.52.115]:27500 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhFIRcS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Jun 2021 13:32:18 -0400
IronPort-SDR: 1ZjXi/olLDN+krB6eCcakL8J/TKg/EGWe3+eUstKHHxMHGxEV+KdrKbK1p9GrLDYZ5vPFvDI28
 BSsoIJWpc6zw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="204937086"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="204937086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 10:30:23 -0700
IronPort-SDR: JYaEUtInlXRxvx9R42ABSyWPD5FldFMAlV9OB3wYCFEChl8YEcR+1ketRibhSBtVS6vUS1whrj
 1Fct8FFaLa5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="552051340"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Jun 2021 10:30:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9A2DAE7; Wed,  9 Jun 2021 20:30:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, wsa@kernel.org
Subject: [PATCH v2 1/1] i2c: cht-wc: Replace of_node by NULL
Date:   Wed,  9 Jun 2021 20:30:35 +0300
Message-Id: <20210609173035.83777-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver is run on the platforms where OF node is always NULL.
The confusion comes from IRQ domain APIs that take either OF or
firmware node as input parameter. Since fwnode is not used here
either, replace of_node by NULL.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rewrote in order to pass NULL instead of of_node (Hans)
 drivers/i2c/busses/i2c-cht-wc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 08f491ea21ac..1cf68f85b2e1 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -354,8 +354,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Alloc and register client IRQ */
-	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
-						 &irq_domain_simple_ops, NULL);
+	adap->irq_domain = irq_domain_add_linear(NULL, 1, &irq_domain_simple_ops, NULL);
 	if (!adap->irq_domain)
 		return -ENOMEM;
 
-- 
2.30.2

