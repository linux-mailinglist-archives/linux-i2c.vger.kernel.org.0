Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84954486453
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 13:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbiAFMZE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 07:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238788AbiAFMZD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 07:25:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517A7C061245;
        Thu,  6 Jan 2022 04:25:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19C4AB81E8B;
        Thu,  6 Jan 2022 12:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69CBC36AE5;
        Thu,  6 Jan 2022 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641471900;
        bh=7GTTtf7eu4RoZ9dWQBGOYY0gMIrhN8Iyq+VpX5N94Jo=;
        h=From:To:Cc:Subject:Date:From;
        b=Gft7t8m6QsRRVsarlT4YIejzSI8Na0Dyo3ua3VrXwRPErKEhrwwM6Sq5+D/GxMwXm
         aSCtmOaAU8kMfYju2aKU7NFbxwk+Vy7t9aE7hEUOBeKIF1W51xTxyR/TJYReZ4zk7w
         UvgFnscY4mNBk2mEWnCEgCzfM91HBV+/mqmMijmdASooVSN32K4alumsZ1SAUZ39QB
         lfGB7VW6eAQtjk+wk5RAoD8Zk/KurxxvMasY2euW+/uLNOsnaGvtCEZHYZiB+/xUst
         KYQ70RqFU+KuIhCzMsAIoX3tab5SKnIeaum/7K7VOi+GVhPu16gnKDTBA739jM/+hT
         4998/AaxIMtTA==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        Konstantin Kharlamov <hi-angel@yandex.ru>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] Revert "i2c: core: support bus regulator controlling in adapter"
Date:   Thu,  6 Jan 2022 13:24:52 +0100
Message-Id: <20220106122452.18719-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This largely reverts commit 5a7b95fb993ec399c8a685552aa6a8fc995c40bd. It
breaks suspend with AMD GPUs, and we couldn't incrementally fix it. So,
let's remove the code and go back to the drawing board. We keep the
header extension to not break drivers already populating the regulator.
We expect to re-add the code handling it soon.

Reported-by: "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
Link: https://lore.kernel.org/r/1295184560.182511.1639075777725@mail.yahoo.com
Reported-by: Konstantin Kharlamov <hi-angel@yandex.ru>
Link: https://lore.kernel.org/r/7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru
BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1850
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

So far, I tested it on a Renesas R-Car M3-N board verifying that I2C
still works. I'll apply it to my for-next branch right away to get the
buildbots involved as well. But I am still open for comments until I
apply it to my for-current branch, probably tomorrow.

 drivers/i2c/i2c-core-base.c | 95 -------------------------------------
 1 file changed, 95 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f193f9058584..73253e667de1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -466,14 +466,12 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
-	struct i2c_adapter	*adap;
 	struct i2c_driver	*driver;
 	int status;
 
 	if (!client)
 		return 0;
 
-	adap = client->adapter;
 	client->irq = client->init_irq;
 
 	if (!client->irq) {
@@ -539,14 +537,6 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
-	if (adap->bus_regulator) {
-		status = regulator_enable(adap->bus_regulator);
-		if (status < 0) {
-			dev_err(&adap->dev, "Failed to enable bus regulator\n");
-			goto err_clear_wakeup_irq;
-		}
-	}
-
 	status = of_clk_set_defaults(dev->of_node, false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
@@ -605,10 +595,8 @@ static int i2c_device_probe(struct device *dev)
 static void i2c_device_remove(struct device *dev)
 {
 	struct i2c_client	*client = to_i2c_client(dev);
-	struct i2c_adapter      *adap;
 	struct i2c_driver	*driver;
 
-	adap = client->adapter;
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status;
@@ -623,8 +611,6 @@ static void i2c_device_remove(struct device *dev)
 	devres_release_group(&client->dev, client->devres_group_id);
 
 	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
-	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
-		regulator_disable(adap->bus_regulator);
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -634,86 +620,6 @@ static void i2c_device_remove(struct device *dev)
 		pm_runtime_put(&client->adapter->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int i2c_resume_early(struct device *dev)
-{
-	struct i2c_client *client = i2c_verify_client(dev);
-	int err;
-
-	if (!client)
-		return 0;
-
-	if (pm_runtime_status_suspended(&client->dev) &&
-		client->adapter->bus_regulator) {
-		err = regulator_enable(client->adapter->bus_regulator);
-		if (err)
-			return err;
-	}
-
-	return pm_generic_resume_early(&client->dev);
-}
-
-static int i2c_suspend_late(struct device *dev)
-{
-	struct i2c_client *client = i2c_verify_client(dev);
-	int err;
-
-	if (!client)
-		return 0;
-
-	err = pm_generic_suspend_late(&client->dev);
-	if (err)
-		return err;
-
-	if (!pm_runtime_status_suspended(&client->dev) &&
-		client->adapter->bus_regulator)
-		return regulator_disable(client->adapter->bus_regulator);
-
-	return 0;
-}
-#endif
-
-#ifdef CONFIG_PM
-static int i2c_runtime_resume(struct device *dev)
-{
-	struct i2c_client *client = i2c_verify_client(dev);
-	int err;
-
-	if (!client)
-		return 0;
-
-	if (client->adapter->bus_regulator) {
-		err = regulator_enable(client->adapter->bus_regulator);
-		if (err)
-			return err;
-	}
-
-	return pm_generic_runtime_resume(&client->dev);
-}
-
-static int i2c_runtime_suspend(struct device *dev)
-{
-	struct i2c_client *client = i2c_verify_client(dev);
-	int err;
-
-	if (!client)
-		return 0;
-
-	err = pm_generic_runtime_suspend(&client->dev);
-	if (err)
-		return err;
-
-	if (client->adapter->bus_regulator)
-		return regulator_disable(client->adapter->bus_regulator);
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops i2c_device_pm = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
-	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
-};
-
 static void i2c_device_shutdown(struct device *dev)
 {
 	struct i2c_client *client = i2c_verify_client(dev);
@@ -773,7 +679,6 @@ struct bus_type i2c_bus_type = {
 	.probe		= i2c_device_probe,
 	.remove		= i2c_device_remove,
 	.shutdown	= i2c_device_shutdown,
-	.pm		= &i2c_device_pm,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
-- 
2.30.2

