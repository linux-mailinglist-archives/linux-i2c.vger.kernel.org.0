Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E18308C9C
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 19:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhA2Sim (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 13:38:42 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:59177 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbhA2Sil (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 13:38:41 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MK3eI-1lOkHe2hB8-00LUvr; Fri, 29 Jan 2021 19:26:08 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] Removed NIH log functions
Date:   Fri, 29 Jan 2021 19:26:05 +0100
Message-Id: <20210129182606.41518-2-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129182606.41518-1-mail@richard-neumann.de>
References: <20210129182606.41518-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0kPq/Ub56QPc9aM1blPMnrxEqPLzloilxGxhBJhpM3il7VbjUIJ
 EutWdqtbMiL8OKprrazKISE7yjzop1FmeKa8gNfpXmzBgiQ3kPM+AwdN1iUT5FU6xHX4oSY
 orliq4chsyXKDtRTVmsKvx79EdwhQAooKI/TKLq8Y8rQpmwEpx27kMQBT2tlmuKtGRLWa0w
 TstDWnsjJHDeLZQB//SFA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SDWUM23IlYw=:B5Tj/dmpVVNRu/dmMS6ApD
 NSDtm4YSW1E5Wqr1vZ54wpKPDB/wdrQB2IWnjhWExFchnis0gpuw/4KVXUospSaMoSezAqxRX
 60asRlPbTZQ7+L1PZ9UvT2OcyTkNW6qZL4KOupU7rimjgAgllOCyOQG100r0dlK+o0PGzNYtq
 iQ39pVPA0mggfWZJGl/yZ0EfQDjOfam17wtet4jcA/K6jwKvuD1Emk5rYNNogMsKCzbbmTqx/
 qOEvHcSL/38EQq4z//nkZftNSgW0axkIurNv8kqHnU0/S49ic2zK3Je6AIC22KVMVtoTgIjdK
 eSz1hLo/JI39T0wW5v/UULf7l2k7fQazViVzAe0MLdFGjiZc+UAbs7vn4jfnCubQJHxmMeUvO
 CiGSdO2Uv+p0RO9atBzVqmEZQy2Pigx3gJEmOhTTL3EDlsG9CnMnwvkHYgZT+Nc2/d6ivyMwl
 UufjxJVD+Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Removed unnecessary ndev_pdev, ndev_name and ndev_dev macros.
Using pci_{info,warn,err,dbg} functions of the kernel's PCI API.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 37 ++++++++++++++-------------
 drivers/i2c/busses/i2c-amd-mp2-plat.c |  5 ++--
 drivers/i2c/busses/i2c-amd-mp2.h      |  3 ---
 3 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index cd3fd5ee5f65..6a864c481b87 100644
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
@@ -59,7 +59,7 @@ int amd_mp2_bus_enable_set(struct amd_i2c_common *i2c_common, bool enable)
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
 	union i2c_cmd_base i2c_cmd_base;
 
-	dev_dbg(ndev_dev(privdata), "%s id: %d\n", __func__,
+	pci_dbg(privdata->pci_dev, "%s id: %d\n", __func__,
 		i2c_common->bus_id);
 
 	i2c_cmd_base.ul = 0;
@@ -116,14 +116,14 @@ static void amd_mp2_pci_check_rw_event(struct amd_i2c_common *i2c_common)
 	bool err = false;
 
 	if (unlikely(len != i2c_common->msg->len)) {
-		dev_err(ndev_dev(privdata),
+		pci_err(privdata->pci_dev,
 			"length %d in event doesn't match buffer length %d!\n",
 			len, i2c_common->msg->len);
 		err = true;
 	}
 
 	if (unlikely(slave_addr != i2c_common->msg->addr)) {
-		dev_err(ndev_dev(privdata),
+		pci_err(privdata->pci_dev,
 			"unexpected slave address %x (expected: %x)!\n",
 			slave_addr, i2c_common->msg->addr);
 		err = true;
@@ -142,7 +142,8 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 
 	if (res != command_success) {
 		if (res != command_failed)
-			dev_err(ndev_dev(privdata), "invalid response to i2c command!\n");
+			pci_err(privdata->pci_dev,
+				"invalid response to i2c command!\n");
 		return;
 	}
 
@@ -155,7 +156,7 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 					      privdata->mmio + AMD_C2P_MSG2,
 					      len);
 		} else if (sts != i2c_readfail_event) {
-			dev_err(ndev_dev(privdata),
+			pci_err(privdata->pci_dev,
 				"invalid i2c status after read (%d)!\n", sts);
 		}
 		break;
@@ -163,14 +164,14 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 		if (sts == i2c_writecomplete_event)
 			amd_mp2_pci_check_rw_event(i2c_common);
 		else if (sts != i2c_writefail_event)
-			dev_err(ndev_dev(privdata),
+			pci_err(privdata->pci_dev,
 				"invalid i2c status after write (%d)!\n", sts);
 		break;
 	case i2c_enable:
 		if (sts == i2c_busenable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busenable_failed)
-			dev_err(ndev_dev(privdata),
+			pci_err(privdata->pci_dev,
 				"invalid i2c status after bus enable (%d)!\n",
 				sts);
 		break;
@@ -178,7 +179,7 @@ static void __amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 		if (sts == i2c_busdisable_complete)
 			i2c_common->cmd_success = true;
 		else if (sts != i2c_busdisable_failed)
-			dev_err(ndev_dev(privdata),
+			pci_err(privdata->pci_dev,
 				"invalid i2c status after bus disable (%d)!\n",
 				sts);
 		break;
@@ -192,7 +193,7 @@ void amd_mp2_process_event(struct amd_i2c_common *i2c_common)
 	struct amd_mp2_dev *privdata = i2c_common->mp2_dev;
 
 	if (unlikely(i2c_common->reqcmd == i2c_none)) {
-		dev_warn(ndev_dev(privdata),
+		pci_warn(privdata->pci_dev,
 			 "received msg but no cmd was sent (bus = %d)!\n",
 			 i2c_common->bus_id);
 		return;
@@ -236,7 +237,7 @@ static irqreturn_t amd_mp2_irq_isr(int irq, void *dev)
 		val = readl(privdata->mmio + AMD_P2C_MSG_INTEN);
 		if (val != 0) {
 			writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
-			dev_warn(ndev_dev(privdata),
+			pci_warn(privdata->pci_dev,
 				 "received irq without message\n");
 			ret = IRQ_HANDLED;
 		}
@@ -260,7 +261,7 @@ int amd_mp2_register_cb(struct amd_i2c_common *i2c_common)
 		return -EINVAL;
 
 	if (privdata->busses[i2c_common->bus_id]) {
-		dev_err(ndev_dev(privdata),
+		pci_err(privdata->pci_dev,
 			"Bus %d already taken!\n", i2c_common->bus_id);
 		return -EINVAL;
 	}
@@ -301,13 +302,13 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 
 	rc = pcim_enable_device(pci_dev);
 	if (rc) {
-		dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
+		pci_err(privdata->pci_dev, "Failed to enable MP2 PCI device\n");
 		goto err_pci_enable;
 	}
 
 	rc = pcim_iomap_regions(pci_dev, 1 << 2, pci_name(pci_dev));
 	if (rc) {
-		dev_err(ndev_dev(privdata), "I/O memory remapping failed\n");
+		pci_err(privdata->pci_dev, "I/O memory remapping failed\n");
 		goto err_pci_enable;
 	}
 	privdata->mmio = pcim_iomap_table(pci_dev)[2];
@@ -327,7 +328,7 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 	rc = devm_request_irq(&pci_dev->dev, pci_dev->irq, amd_mp2_irq_isr,
 			      IRQF_SHARED, dev_name(&pci_dev->dev), privdata);
 	if (rc)
-		dev_err(&pci_dev->dev, "Failure requesting irq %i: %d\n",
+		pci_err(pci_dev, "Failure requesting irq %i: %d\n",
 			pci_dev->irq, rc);
 
 	return rc;
@@ -363,7 +364,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 
 	privdata->probed = true;
 
-	dev_info(&pci_dev->dev, "MP2 device registered.\n");
+	pci_info(pci_dev, "MP2 device registered.\n");
 	return 0;
 }
 
@@ -397,7 +398,7 @@ static int amd_mp2_pci_suspend(struct device *dev)
 
 	ret = pci_save_state(pci_dev);
 	if (ret) {
-		dev_err(ndev_dev(privdata),
+		pci_err(privdata->pci_dev,
 			"pci_save_state failed = %d\n", ret);
 		return ret;
 	}
@@ -417,7 +418,7 @@ static int amd_mp2_pci_resume(struct device *dev)
 	pci_restore_state(pci_dev);
 	ret = pci_enable_device(pci_dev);
 	if (ret < 0) {
-		dev_err(ndev_dev(privdata),
+		pci_err(privdata->pci_dev,
 			"pci_enable_device failed = %d\n", ret);
 		return ret;
 	}
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 506433bc0ff2..d02ca7ab9a3b 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -88,9 +88,8 @@ static void i2c_amd_cmd_completion(struct amd_i2c_common *i2c_common)
 	union i2c_event *event = &i2c_common->eventval;
 
 	if (event->r.status == i2c_readcomplete_event)
-		dev_dbg(&i2c_dev->pdev->dev, "%s readdata:%*ph\n",
-			__func__, event->r.length,
-			i2c_common->msg->buf);
+		dev_dbg(&i2c_dev->pdev->dev, "%s readdata:%*ph\n", __func__,
+			event->r.length, i2c_common->msg->buf);
 
 	complete(&i2c_dev->cmd_complete);
 }
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

