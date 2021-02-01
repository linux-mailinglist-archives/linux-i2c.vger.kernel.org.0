Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D1730AE82
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 18:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbhBARyY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 12:54:24 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:60925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbhBARyX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Feb 2021 12:54:23 -0500
Received: from envy.fritz.box ([87.123.101.73]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8EdM-1m1z6U1GqW-014Ax7; Mon, 01 Feb 2021 18:51:42 +0100
From:   Richard Neumann <mail@richard-neumann.de>
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] i2c: i2c-amd-mp2: Remove NIH logging functions
Date:   Mon,  1 Feb 2021 18:51:37 +0100
Message-Id: <20210201175138.8986-2-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201175138.8986-1-mail@richard-neumann.de>
References: <20210201175138.8986-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pa2HY3WvUYCzEeE7rQX07WdPmFyENj74eBLHGN/BRpJBoq2kR6l
 6lRqRTZlOHdoIPvCHY/DL8qN897ykO0uafNKADZSfxKLevMC03ucNJq7CPU89XFOeOgMbhk
 yLh4fWN3PrAeggQmPzBHHc7axvmuHNH3yhdzzsn7veTqoCgyBOjpjaQjgNrxzmBUP1giObv
 bUR+VoSEJyVosTbh45+nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CTQ7/onK5lk=:+bVEb/iKQBYo21otzqdiuI
 OR0lXfEZWz501oG8D0++bgoy8mU0Ao2BZuIJrbXqWWuCmZuPM36qKqNs9emp8Gel4QPfjL+1V
 QGY8ewSQ6rJt9xZHWp1gRnsfFymwqnIuYdVN7CloWhGHidyONTyvbOkPRf0YdPKqsB78L6Ykq
 F0oSj9i7cM1ktH1zVk90BLIPf8UaHEhppVQPLAnIlOLaKc9OiCc6fDshkq/ss7ErVUtnWoThZ
 VUAUN2BBgXiiey3L5g/TbRo0OL3Ko5dRQe7Sruafd4Oymei7o341utgNHK5PmoyBVGHpvyngJ
 MBJEpEAdDv4FUHsATysy59bHWRfLK5ICR6h1g9bar+09FHoAuSvBfh2Wxhyn0AgjAjaAEHEYc
 NeXLWJNbC7EscSibjKOf61/jimsA08/ETKYJ8xsLF+MCJmnQWVY5PuyjmGiNHao/m1+1CPNpa
 6DYoK4zmGw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use pci_{info,warn,err,dbg} functions of the kernel's PCI API.
Remove unnecessary ndev_pdev(), ndev_name() and ndev_dev() macros.
While at it, remove useless __func__ from logging.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 55 +++++++++++----------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  3 +-
 drivers/i2c/busses/i2c-amd-mp2.h      |  3 --
 3 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index cd3fd5ee5f65..ce130a821ea5 100644
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
@@ -111,20 +110,19 @@ EXPORT_SYMBOL_GPL(amd_mp2_rw);
 static void amd_mp2_pci_check_rw_event(struct amd_i2c_common *i2c_common)
 {
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 	int len = i2c_common->eventval.r.length;
 	u32 slave_addr = i2c_common->eventval.r.slave_addr;
 	bool err = false;
 
 	if (unlikely(len != i2c_common->msg->len)) {
-		dev_err(ndev_dev(privdata),
-			"length %d in event doesn't match buffer length %d!\n",
+		pci_err(pdev, "length %d in event doesn't match buffer length %d!\n",
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
@@ -136,13 +134,14 @@ static void amd_mp2_pci_check_rw_event(struct amd_i2c_common *i2c_common)
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
 
@@ -155,32 +154,26 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 					      privdata->mmio + AMD_C2P_MSG2,
 					      len);
 		} else if (sts != i2c_readfail_event) {
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after read (%d)!\n", sts);
+			pci_err(pdev, "invalid i2c status after read (%d)!\n", sts);
 		}
 		break;
 	case i2c_write:
 		if (sts == i2c_writecomplete_event)
 			amd_mp2_pci_check_rw_event(i2c_common);
 		else if (sts != i2c_writefail_event)
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after write (%d)!\n", sts);
+			pci_err(pdev, "invalid i2c status after write (%d)!\n", sts);
 		break;
 	case i2c_enable:
 		if (sts == i2c_busenable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busenable_failed)
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after bus enable (%d)!\n",
-				sts);
+			pci_err(pdev, "invalid i2c status after bus enable (%d)!\n", sts);
 		break;
 	case i2c_disable:
 		if (sts == i2c_busdisable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busdisable_failed)
-			dev_err(ndev_dev(privdata),
-				"invalid i2c status after bus disable (%d)!\n",
-				sts);
+			pci_err(pdev, "invalid i2c status after bus disable (%d)!\n", sts);
 		break;
 	default:
 		break;
@@ -190,10 +183,10 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
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
@@ -208,6 +201,7 @@ EXPORT_SYMBOL_GPL(amd_mp2_process_event);
 static irqreturn_t amd_mp2_irq_isr(int irq, void *dev)
 {
 	struct amd_mp2_dev *privdata = dev;
+	struct pci_dev *pdev = privdata->pci_dev;
 	struct amd_i2c_common *i2c_common;
 	u32 val;
 	unsigned int bus_id;
@@ -236,8 +230,7 @@ static irqreturn_t amd_mp2_irq_isr(int irq, void *dev)
 		val = readl(privdata->mmio + AMD_P2C_MSG_INTEN);
 		if (val != 0) {
 			writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
-			dev_warn(ndev_dev(privdata),
-				 "received irq without message\n");
+			pci_warn(pdev, "received irq without message\n");
 			ret = IRQ_HANDLED;
 		}
 	}
@@ -255,13 +248,13 @@ EXPORT_SYMBOL_GPL(amd_mp2_rw_timeout);
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
 
@@ -301,13 +294,13 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 
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
@@ -327,7 +320,7 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 	rc = devm_request_irq(&pci_dev->dev, pci_dev->irq, amd_mp2_irq_isr,
 			      IRQF_SHARED, dev_name(&pci_dev->dev), privdata);
 	if (rc)
-		dev_err(&pci_dev->dev, "Failure requesting irq %i: %d\n",
+		pci_err(pci_dev, "Failure requesting irq %i: %d\n",
 			pci_dev->irq, rc);
 
 	return rc;
@@ -363,7 +356,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 
 	privdata->probed = true;
 
-	dev_info(&pci_dev->dev, "MP2 device registered.\n");
+	pci_info(pci_dev, "MP2 device registered.\n");
 	return 0;
 }
 
@@ -397,8 +390,7 @@ static int amd_mp2_pci_suspend(struct device *dev)
 
 	ret = pci_save_state(pci_dev);
 	if (ret) {
-		dev_err(ndev_dev(privdata),
-			"pci_save_state failed = %d\n", ret);
+		pci_err(pci_dev, "pci_save_state failed = %d\n", ret);
 		return ret;
 	}
 
@@ -417,8 +409,7 @@ static int amd_mp2_pci_resume(struct device *dev)
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

