Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24AF63A666
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 11:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiK1Kw1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 05:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiK1Kw0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 05:52:26 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 544C1BF9;
        Mon, 28 Nov 2022 02:52:26 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE694D6E;
        Mon, 28 Nov 2022 02:52:32 -0800 (PST)
Received: from e126387.arm.com (unknown [10.57.87.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 400DE3F73B;
        Mon, 28 Nov 2022 02:52:25 -0800 (PST)
From:   carsten.haitzler@foss.arm.com
To:     michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: cadence: Fix regression with bus recovery
Date:   Mon, 28 Nov 2022 10:51:58 +0000
Message-Id: <20221128105158.1536551-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carsten Haitzler <carsten.haitzler@arm.com>

Commit "i2c: cadence: Add standard bus recovery support" breaks for i2c
devices that have no pinctrl defined. There is no requirement for this
to exist in the DT. This has worked perfectly well without this before in
at least 1 real usage case on hardware (Mali Komeda DPU, Cadence i2c to
talk to a tda99xx phy). Adding the requirement to have pinctrl set up in
the device tree (or otherwise be found) is a regression where the whole
i2c device is lost entirely (in this case dropping entire devices which
then leads to the drm display stack unable to find the phy for display
output, thus having no drm display device and so on down the chain).

This converts the above commit to an enhancement if pinctrl can be found
for the i2c device, providing a timeout on read with recovery, but if not,
do what used to be done rather than a fatal loss of a device.

This restores the mentioned display devices to their working state again.

Fixes: 58b924241d0a ("i2c: cadence: Add standard bus recovery support")
Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
Note: This issue was discovered during the porting of the linux kernel
on Morello [1].

[1] https://git.morello-project.org/morello/kernel/linux
---
 drivers/i2c/busses/i2c-cadence.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index fe0cd205502d..09acd2d399d5 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -852,7 +852,8 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 					 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
 	if (ret) {
 		ret = -EAGAIN;
-		i2c_recover_bus(adap);
+		if (id->adap.bus_recovery_info)
+			i2c_recover_bus(adap);
 		goto out;
 	}
 
@@ -1263,9 +1264,13 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 
 	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(id->rinfo.pinctrl)) {
+		int err = PTR_ERR(id->rinfo.pinctrl);
+
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
-		return PTR_ERR(id->rinfo.pinctrl);
-	}
+		if (err != -ENODEV)
+			return err;
+	} else
+		id->adap.bus_recovery_info = &id->rinfo;
 
 	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(id->membase))
@@ -1283,7 +1288,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
-	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.32.0

