Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8419D3F0F9C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 02:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHSAvD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Aug 2021 20:51:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:26041 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230180AbhHSAvD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Aug 2021 20:51:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="203657799"
X-IronPort-AV: E=Sophos;i="5.84,333,1620716400"; 
   d="scan'208";a="203657799"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 17:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,333,1620716400"; 
   d="scan'208";a="678768847"
Received: from jiedeng-optiplex-7050.sh.intel.com ([10.239.154.104])
  by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 17:50:24 -0700
From:   Jie Deng <jie.deng@intel.com>
To:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org, jie.deng@intel.com, viresh.kumar@linaro.org,
        sfr@canb.auug.org.au, conghui.chen@intel.com
Subject: [PATCH] i2c: virtio: Fix the compiler warning when CONFIG_ACPI is not set
Date:   Thu, 19 Aug 2021 08:48:41 +0800
Message-Id: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the compiler warning "drivers/i2c/busses/i2c-virtio.c:208:17:
warning: unused variable 'pdev' [-Wunused-variable]" when CONFIG_ACPI
is not set.

Fixes: 8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")
Signed-off-by: Jie Deng <jie.deng@intel.com>
---
 drivers/i2c/busses/i2c-virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index d3e60d9..964c601 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -205,7 +205,6 @@ static const struct i2c_adapter_quirks virtio_i2c_quirks = {
 
 static int virtio_i2c_probe(struct virtio_device *vdev)
 {
-	struct device *pdev = vdev->dev.parent;
 	struct virtio_i2c *vi;
 	int ret;
 
@@ -234,7 +233,7 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	 * Setup ACPI node for controlled devices which will be probed through
 	 * ACPI.
 	 */
-	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
+	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(vdev->dev.parent));
 
 	ret = i2c_add_adapter(&vi->adap);
 	if (ret)
-- 
2.7.4

