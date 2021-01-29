Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE0F308D6D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 20:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhA2T2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 14:28:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57697 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbhA2T2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 14:28:39 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1M2w8Y-1l6gOn1pgS-003IpU; Fri, 29 Jan 2021 20:25:57 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: i2c-amd-mp2: Remove NIH logging functions
Date:   Fri, 29 Jan 2021 20:25:52 +0100
Message-Id: <20210129192553.55906-2-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129192553.55906-1-mail@richard-neumann.de>
References: <20210129192553.55906-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RMNLIRuQ4L4YfhVs6P/qlVnIHdQFlvmYBpM7hC0CAORQNJy6L5V
 /rB7STI1+QSkBf78L+P3ASftgCvvNIXZNDqey/V/m4M/NVEZwBrV8nfV+Fg/tf3BHr4Y/dy
 KdvkZWOn+8jU2/53+FsYjpuUFoV40lECeOQTyn3X/n7PPyefeHJH/Og32mkDqSoJXlyLaMQ
 RYIoUjV1GOTl7rknAvrhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7zsIC2GBltI=:k9t1SoPp0a2b7am4Qvn85K
 xA3ETG+smvF0sUYihv5xJET8pXi/kZlfUOd05Si71LxwmasGne/x+tvN4d+s+U/XboWDxzQWB
 1etZuFdwSFWmSaJS7Y9FgrYtj2AVizGcux9crEpfzPOGwrf7KMVXFU5y2WbM3haa36K/+5xaD
 iSF9aUO5IQ/UBQqs6zA22DfNRIPWq6/e7X0yuzf/sFYPF3Qp68E6WtQmRcBhDKADRqf0Iwq2V
 YJW1jHD8l4nutrs9ty+mWrylfMGpboIPdGQeEzuwNy9Qo20+SmkyeaO6ze/DxofDxRse/Hvz8
 X1VztkK4LCpZd7x/4NAIfudlOMhNPnYHNc2mqnS4ApElZyo8X9BQo2B5NQ8E+g4iUQK9kOTMz
 G1wAg9pWGiqU/NjzZavQTcxrkDA5npn9qQTcVE/e45jXe3PThO+O5CttLygpH1GqJRIFwAgED
 gCwxXvbz9w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Use pci_{info,warn,err,dbg} functions of the kernel's PCI API.
Remove unnecessary ndev_pdev, ndev_name and ndev_dev macros.
Remove useless __func__ from logging.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 53 +++++++++++++--------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  3 +-
 drivers/i2c/busses/i2c-amd-mp2.h      |  3 --
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index cd3fd5ee5f65..1067932f2457 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -30,7 +30,7 @@ static void amd_mp2_c2p_mutex_unlock(struct amd_i2c_common *i2c_common)
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
 
 	if (unlikely(privdata->c2p_lock_busid != i2c_common->bus_id)) {
-		dev_warn(ndev_dev(privdata),
+		pci_warn(privdata->pci_dev,
 			 "bus %d attempting to unlock C2P locked by bus %d\n",
 			 i2c_common->bus_id, privdata->c2p_lock_busid);
 		return;
@@ -59,8 +59,7 @@ int amd_mp2_bus_enable_set(struct amd_i2c_common *i2c_common, bool enable)
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
 	union i2c_cmd_base i2c_cmd_base;
 
-	dev_dbg(ndev_dev(privdata), "%s id: %d\n", __func__,
-		i2c_common->bus_id);
+	pci_dbg(privdata->pci_dev, "id: %d\n", i2c_common->bus_id);
 
 	i2c_cmd_base.ul = 0;
 	i2c_cmd_base.s.i2c_cmd = enable ? i2c_enable : i2c_disable;
@@ -111,20 +110,20 @@ EXPORT_SYMBOL_GPL(amd_mp2_rw);
 static void amd_mp2_pci_check_rw_event(struct amd_i2c_common *i2c_common)
 {
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 	int len = i2c_common->eventval.r.length;
 	u32 slave_addr = i2c_common->eventval.r.slave_addr;
 	bool err = false;
 
 	if (unlikely(len != i2c_common->msg->len)) {
-		dev_err(ndev_dev(privdata),
+		pci_err(pdev,
 			"length %d in event doesn't match buffer length %d!\n",
 			len, i2c_common->msg->len);
 		err = true;
 	}
 
 	if (unlikely(slave_addr != i2c_common->msg->addr)) {
-		dev_err(ndev_dev(privdata),
-			"unexpected slave address %x (expected: %x)!\n",
+		pci_err(pdev, "unexpected slave address %x (expected: %x)!\n",
 			slave_addr, i2c_common->msg->addr);
 		err = true;
 	}
@@ -136,13 +135,14 @@ static void amd_mp2_pci_check_rw_event(struct amd_i2c_common *i2c_common)
 static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 {
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 	enum status_type sts = i2c_common->eventval.r.status;
 	enum response_type res = i2c_common->eventval.r.response;
 	int len = i2c_common->eventval.r.length;
 
 	if (res != command_success) {
 		if (res != command_failed)
-			dev_err(ndev_dev(privdata), "invalid response to i2c command!\n");
+			pci_err(pdev, "invalid response to i2c command!\n");
 		return;
 	}
 
@@ -155,22 +155,22 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 					      privdata->mmio + AMD_C2P_MSG2,
 					      len);
 		} else if (sts != i2c_readfail_event) {
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after read (%d)!\n", sts);
+			pci_err(pdev, "invalid i2c status after read (%d)!\n",
+				sts);
 		}
 		break;
 	case i2c_write:
 		if (sts == i2c_writecomplete_event)
 			amd_mp2_pci_check_rw_event(i2c_common);
 		else if (sts != i2c_writefail_event)
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after write (%d)!\n", sts);
+			pci_err(pdev, "invalid i2c status after write (%d)!\n",
+				sts);
 		break;
 	case i2c_enable:
 		if (sts == i2c_busenable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busenable_failed)
-			dev_err(ndev_dev(privdata),
+			pci_err(pdev,
 				"invalid i2c status after bus enable (%d)!\n",
 				sts);
 		break;
@@ -178,7 +178,7 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 		if (sts == i2c_busdisable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busdisable_failed)
-			dev_err(ndev_dev(privdata),
+			pci_err(pdev,
 				"invalid i2c status after bus disable (%d)!\n",
 				sts);
 		break;
@@ -190,10 +190,10 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 void amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 {
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 
 	if (unlikely(i2c_common->reqcmd == i2c_none)) {
-		dev_warn(ndev_dev(privdata),
-			 "received msg but no cmd was sent (bus = %d)!\n",
+		pci_warn(pdev, "received msg but no cmd was sent (bus = %d)!\n",
 			 i2c_common->bus_id);
 		return;
 	}
@@ -208,6 +208,7 @@ EXPORT_SYMBOL_GPL(amd_mp2_process_event);
 static irqreturn_t amd_mp2_irq_isr(int irq, void *dev)
 {
 	struct amd_mp2_dev *privdata = dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 	struct amd_i2c_common *i2c_common;
 	u32 val;
 	unsigned int bus_id;
@@ -236,8 +237,7 @@ static irqreturn_t amd_mp2_irq_isr(int irq, void *dev)
 		val = readl(privdata->mmio + AMD_P2C_MSG_INTEN);
 		if (val != 0) {
 			writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
-			dev_warn(ndev_dev(privdata),
-				 "received irq without message\n");
+			pci_warn(pdev, "received irq without message\n");
 			ret = IRQ_HANDLED;
 		}
 	}
@@ -255,13 +255,13 @@ EXPORT_SYMBOL_GPL(amd_mp2_rw_timeout);
 int amd_mp2_register_cb(struct amd_i2c_common *i2c_common)
 {
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 
 	if (i2c_common->bus_id > 1)
 		return -EINVAL;
 
 	if (privdata->busses[i2c_common->bus_id]) {
-		dev_err(ndev_dev(privdata),
-			"Bus %d already taken!\n", i2c_common->bus_id);
+		pci_err(pdev, "Bus %d already taken!\n", i2c_common->bus_id);
 		return -EINVAL;
 	}
 
@@ -301,13 +301,13 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 
 	rc = pcim_enable_device(pci_dev);
 	if (rc) {
-		dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
+		pci_err(pci_dev, "Failed to enable MP2 PCI device\n");
 		goto err_pci_enable;
 	}
 
 	rc = pcim_iomap_regions(pci_dev, 1 << 2, pci_name(pci_dev));
 	if (rc) {
-		dev_err(ndev_dev(privdata), "I/O memory remapping failed\n");
+		pci_err(pci_dev, "I/O memory remapping failed\n");
 		goto err_pci_enable;
 	}
 	privdata->mmio = pcim_iomap_table(pci_dev)[2];
@@ -327,7 +327,7 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 	rc = devm_request_irq(&pci_dev->dev, pci_dev->irq, amd_mp2_irq_isr,
 			      IRQF_SHARED, dev_name(&pci_dev->dev), privdata);
 	if (rc)
-		dev_err(&pci_dev->dev, "Failure requesting irq %i: %d\n",
+		pci_err(pci_dev, "Failure requesting irq %i: %d\n",
 			pci_dev->irq, rc);
 
 	return rc;
@@ -363,7 +363,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 
 	privdata->probed = true;
 
-	dev_info(&pci_dev->dev, "MP2 device registered.\n");
+	pci_info(pci_dev, "MP2 device registered.\n");
 	return 0;
 }
 
@@ -385,6 +385,7 @@ static int amd_mp2_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct amd_mp2_dev *privdata = pci_get_drvdata(pci_dev);
+	struct pci_dev *pdev = privdata->pci_dev;
 	struct amd_i2c_common *i2c_common;
 	unsigned int bus_id;
 	int ret = 0;
@@ -397,8 +398,7 @@ static int amd_mp2_pci_suspend(struct device *dev)
 
 	ret = pci_save_state(pci_dev);
 	if (ret) {
-		dev_err(ndev_dev(privdata),
-			"pci_save_state failed = %d\n", ret);
+		pci_err(pdev, "pci_save_state failed = %d\n", ret);
 		return ret;
 	}
 
@@ -417,8 +417,7 @@ static int amd_mp2_pci_resume(struct device *dev)
 	pci_restore_state(pci_dev);
 	ret = pci_enable_device(pci_dev);
 	if (ret < 0) {
-		dev_err(ndev_dev(privdata),
-			"pci_enable_device failed = %d\n", ret);
+		pci_err(pci_dev, "pci_enable_device failed = %d\n", ret);
 		return ret;
 	}
 
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 506433bc0ff2..de058671f9b8 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -88,8 +88,7 @@ static void i2c_amd_cmd_completion(struct amd_i2c_common *i2c_common)
 	union i2c_event *event = &i2c_common->eventval;
 
 	if (event->r.status == i2c_readcomplete_event)
-		dev_dbg(&i2c_dev->pdev->dev, "%s readdata:%*ph\n",
-			__func__, event->r.length,
+		dev_dbg(&i2c_dev->pdev->dev, "readdata:%*ph\n", event->r.length,
 			i2c_common->msg->buf);
 
 	complete(&i2c_dev->cmd_complete);
diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 058362edebaa..6b91e285745d 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -185,9 +185,6 @@ struct amd_mp2_dev {
 	unsigned int probed;
 };
 
-#define ndev_pdev(ndev) ((ndev)->pci_dev)
-#define ndev_name(ndev) pci_name(ndev_pdev(ndev))
-#define ndev_dev(ndev) (&ndev_pdev(ndev)->dev)
 #define work_amd_i2c_common(__work) \
 	container_of(__work, struct amd_i2c_common, work.work)
 
-- 
2.30.0

