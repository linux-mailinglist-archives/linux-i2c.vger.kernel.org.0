Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61A747CF7B
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244003AbhLVJqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbhLVJqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 04:46:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C11C061574
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bq20so4138169lfb.4
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S3vpyZLzIBGSWj8xpE+OLGtslDGuksJHgwpTbE76hpU=;
        b=1z02WyR2/L3P9DY8VZtcJvUhYb6auaNL76Kzf22K/rOQCAt/RhOT8sO11KAzyCfbjx
         /097//9VHK9dJJ+BeoTDOXbCi5JcjwpB46WoIwbx0MnV01KscJlLkcNzd4bGKCyu8oR9
         iAQsOi/cP7DE+OVRT75CgIDTXhw/B5d0QjaUlCa2tboEvIaHuYcJsHPkMf2o9yc3PYmI
         N17ApZaY6mrzYLNH1EkbCABOeNzDL3ze7EcIX6Dzru0t1WRGvxi3EiB7iJeSOshP54iN
         NOGFT5EjgKz3oguiiBI6RMWpRJqWcJU4mfGyJCk0yU0EoROmrfwfP4TebzaZ1UpE7Jac
         zNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S3vpyZLzIBGSWj8xpE+OLGtslDGuksJHgwpTbE76hpU=;
        b=unMzmGYSnrIsaWyUYLqk+aYumkBHaycfjWsz4HMKn7KHhMeu29lbgHUut5SF/QPZ7R
         u6/tWKvF/3sf3J04xdGSEm5/nudPRSL0BZxlRW1xIS+c8zZtXburBiTUTWlc09qhBvSI
         SV//zpmDelQcBw43O2e/SRWg3ynk8lmn+LCjxQJc3aoy8hZ5Pq2JIPztLysH0xtG4s+a
         b0TmyjKJhOvjjAG5qT4yJcw1o3Wku7gpoTumEfSeFRbFtW0sr20Udvwh3TxokRDeLBjm
         TFZp+kMxeijXdvr5yBKQV2kj/nvYFOW0iDY2t5zrAn/9TgK9IDFuWajUsgQjyGO3oMBs
         3IZw==
X-Gm-Message-State: AOAM531FDw2EuGsxb4GYNUDGBBto0X4kp3B3Lyhlm0Gk0RnzEo8xs+Q6
        XKKC++MMIc+5D5SCiXCymz8pf96OPGCnnQ==
X-Google-Smtp-Source: ABdhPJxPeOdCu0aj1Gm2DJqbtNi6KhP1UBRUHGmY2/WMCC//qjKX7Ih8EOjmzAQge3a/rEDmAUXmLg==
X-Received: by 2002:a19:c7ce:: with SMTP id x197mr1950166lff.80.1640166403156;
        Wed, 22 Dec 2021 01:46:43 -0800 (PST)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id e19sm132756ljn.82.2021.12.22.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:46:42 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, jsd@semihalf.com, upstream@semihalf.com
Subject: [RFC 2/2] i2c: designware: Add AMD PSP I2C bus support
Date:   Wed, 22 Dec 2021 10:45:58 +0100
Message-Id: <20211222094558.2098791-3-jsd@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211222094558.2098791-1-jsd@semihalf.com>
References: <20211222094558.2098791-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implement an I2C controller sharing mechanism between the host (kernel)
and PSP co-processor on some platforms equipped with AMD Cezanne SoC.

On these platforms we need to implement "software" i2c arbitration.
Default arbitration owner is PSP and kernel asks for acquire as well
as inform about release of the i2c bus via mailbox mechanism.

            +---------+
 <- ACQUIRE |         |
  +---------|   CPU   |\
  |         |         | \      +----------+  SDA
  |         +---------+  \     |          |-------
MAILBOX                   +--> |  I2C-DW  |  SCL
  |         +---------+        |          |-------
  |         |         |        +----------+
  +---------|   PSP   |
   <- ACK   |         |
            +---------+

            +---------+
 <- RELEASE |         |
  +---------|   CPU   |
  |         |         |        +----------+  SDA
  |         +---------+        |          |-------
MAILBOX                   +--> |  I2C-DW  |  SCL
  |         +---------+  /     |          |-------
  |         |         | /      +----------+
  +---------|   PSP   |/
   <- ACK   |         |
            +---------+

The solution is similar to i2c-designware-baytrail.c implementation, where
we are using a generic i2c-designware-* driver with a small "wrapper".

In contrary to baytrail semaphore implementation, beside internal
acquire_lock() and release_lock() methods we are also applying quirks to
lock_bus() and unlock_bus() global adapter methods. With this in place
all i2c clients drivers may lock i2c bus for a desired number of i2c
transactions (e.g. write-wait-read) without being aware of that such bus
is shared with another entity.

Configure new matching ACPI ID and register ARBITRATION_SEMAPHORE flag in
order to distinguish setup with PSP arbitration.

Only one instance of a driver may be running at a time since there is
only one PSP mailbox available. Add extra check to ensure this.

Introduce new CONFIG and add new menuconfig selection list in order to
allow (optional) selection between baytrail and amdpsp semaphore.

Add new entry in MAINTAINERS file to cover new module.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 MAINTAINERS                                 |   1 +
 drivers/acpi/acpi_apd.c                     |   1 +
 drivers/i2c/busses/Kconfig                  |  20 ++
 drivers/i2c/busses/Makefile                 |   1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 359 ++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |   9 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |   3 +
 7 files changed, 393 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8912b2c1260c..8a75c355942f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18410,6 +18410,7 @@ SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Mika Westerberg <mika.westerberg@linux.intel.com>
+R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-designware-*
diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 6e02448d15d9..1d7a3bed8250 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -227,6 +227,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "AMD0020", APD_ADDR(cz_uart_desc) },
 	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
 	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
+	{ "AMDI9999", APD_ADDR(wt_i2c_desc) },
 	{ "AMD0030", },
 	{ "AMD0040", APD_ADDR(fch_misc_desc)},
 	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index dce392839017..a54d592fc1a0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -553,6 +553,24 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
+choice
+	prompt "I2C DesignWare semaphore support"
+	depends on I2C_DESIGNWARE_PLATFORM
+	optional
+	help
+	  Option to enable implementations of DesignWare I2C driver with
+	  support for semaphores.
+
+config I2C_DESIGNWARE_AMDPSP
+	bool "AMD PSP I2C semaphore support"
+	depends on ACPI
+	depends on I2C_DESIGNWARE_PLATFORM
+	help
+	  This driver enables managed host access to the selected I2C bus shared
+	  between AMD CPU and AMD PSP.
+
+	  You should say Y if running on an AMD system equipped with the PSP.
+
 config I2C_DESIGNWARE_BAYTRAIL
 	bool "Intel Baytrail I2C semaphore support"
 	depends on ACPI
@@ -566,6 +584,8 @@ config I2C_DESIGNWARE_BAYTRAIL
 	  the platform firmware controlling it. You should say Y if running on
 	  a BayTrail system using the AXP288.
 
+endchoice
+
 config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index d85899fef8c7..eaacb31769eb 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -54,6 +54,7 @@ i2c-designware-core-y					+= i2c-designware-master.o
 i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
 obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
+i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
 i2c-designware-pci-y					:= i2c-designware-pcidrv.o
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
new file mode 100644
index 000000000000..2d605ed487ea
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/i2c.h>
+#include <linux/psp-sev.h>
+
+#include "i2c-designware-core.h"
+
+#define MSR_AMD_PSP_ADDR	0xc00110a2
+#define PSP_MBOX_OFFSET		0x10570
+#define PSP_CMD_TIMEOUT_MS	500
+
+#define PSP_I2C_REQ_BUS_CMD		0x64
+#define PSP_I2C_REQ_RETRY_CNT		3
+#define PSP_I2C_REQ_RETRY_DELAY_MSEC	50
+#define PSP_I2C_REQ_STS_OK		0x0
+#define PSP_I2C_REQ_STS_BUS_BUSY	0x1
+#define PSP_I2C_REQ_STS_INV_PARAM	0x3
+
+union psp_req_buffer_hdr {
+	struct {
+		u32 total_size;
+		u32 status;
+	} __packed;
+	u64 hdr_val;
+};
+
+enum psp_i2c_req_type {
+	PSP_I2C_REQ_ACQUIRE,
+	PSP_I2C_REQ_RELEASE,
+	PSP_I2C_REQ_MAX,
+};
+
+struct psp_i2c_req {
+	union psp_req_buffer_hdr hdr;
+	enum psp_i2c_req_type type;
+} __packed __aligned(32);
+
+union psp_mbox_cmd_reg {
+	struct psp_mbox_cmd_fields {
+		u16 mbox_status;
+		u8 mbox_cmd;
+		u8 reserved:6;
+		u8 recovery:1;
+		u8 ready:1;
+	} __packed fields;
+	u32 val;
+};
+
+struct psp_mbox {
+	union psp_mbox_cmd_reg fields;
+	uintptr_t i2c_req_addr;
+} __packed;
+
+static DEFINE_MUTEX(psp_i2c_access_mutex);
+static unsigned long psp_i2c_sem_acquired;
+static void __iomem *mbox_iomem;
+static u32 psp_i2c_access_count;
+static bool psp_i2c_mbox_fail;
+static struct device *psp_i2c_dev;
+
+static int psp_get_mbox_addr(unsigned long *mbox_addr)
+{
+	unsigned long long psp_mmio;
+
+	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
+		return -EIO;
+
+	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
+
+	return 0;
+}
+
+static int psp_mbox_probe(void)
+{
+	unsigned long mbox_addr;
+
+	if (psp_get_mbox_addr(&mbox_addr))
+		return -1;
+
+	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
+	if (!mbox_iomem)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* Recovery field should be equal 0 to start sending commands */
+static int psp_check_mbox_recovery(struct psp_mbox *mbox)
+{
+	union psp_mbox_cmd_reg tmp = {0};
+
+	tmp.val = readl(&mbox->fields.val);
+	return !!tmp.fields.recovery;
+}
+
+static int psp_wait_cmd(struct psp_mbox *mbox)
+{
+	union psp_mbox_cmd_reg and_mask = { .val = ~0 };
+	union psp_mbox_cmd_reg expected = { .val = 0 };
+	u32 tmp;
+
+	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
+	and_mask.fields.mbox_cmd = 0;
+	and_mask.fields.ready = 0;
+	expected.fields.ready = 1;
+
+	return readl_poll_timeout(&mbox->fields.val, tmp, (tmp == expected.val),
+				  0, 1000 * PSP_CMD_TIMEOUT_MS);
+}
+
+/* Status equal to 0 means that PSP succeed processing command */
+static int psp_check_mbox_sts(struct psp_mbox *mbox)
+{
+	union psp_mbox_cmd_reg cmd_reg = {0};
+
+	cmd_reg.val = readl(&mbox->fields.val);
+	return cmd_reg.fields.mbox_status;
+}
+
+static int psp_send_cmd(struct psp_i2c_req *req)
+{
+	struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
+	union psp_mbox_cmd_reg cmd_reg = {0};
+
+	if (psp_check_mbox_recovery(mbox))
+		return -EIO;
+
+	if (psp_wait_cmd(mbox))
+		return -EBUSY;
+
+	/* Fill address of command-response buffer */
+	writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
+
+	/* Write command register to trigger processing */
+	cmd_reg.fields.mbox_cmd = PSP_I2C_REQ_BUS_CMD;
+	writel(cmd_reg.val, &mbox->fields.val);
+
+	if (psp_wait_cmd(mbox))
+		return -ETIMEDOUT;
+
+	if (psp_check_mbox_sts(mbox))
+		return -EIO;
+
+	return 0;
+}
+
+/* Helper to verify status returned by PSP */
+static int check_i2c_req_sts(struct psp_i2c_req *req)
+{
+	int status;
+
+	status = readl(&req->hdr.status);
+
+	switch (status) {
+	case PSP_I2C_REQ_STS_OK:
+		return 0;
+	case PSP_I2C_REQ_STS_BUS_BUSY:
+		return -EBUSY;
+	case PSP_I2C_REQ_STS_INV_PARAM:
+	default:
+		return -EIO;
+	};
+}
+
+static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+{
+	int status, ret, retry_cnt = PSP_I2C_REQ_RETRY_CNT;
+	struct psp_i2c_req *req;
+	unsigned long start;
+
+	/* Allocate command-response buffer */
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->hdr.total_size = sizeof(*req);
+	req->type = i2c_req_type;
+
+	start = jiffies;
+	do {
+		if (psp_send_cmd(req)) {
+			ret = -EIO;
+			goto cleanup;
+		}
+
+		status = check_i2c_req_sts(req);
+		if (!status) {
+			dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
+				i2c_req_type, jiffies_to_msecs(jiffies - start));
+			ret = 0;
+			goto cleanup;
+		} else if (status == -EBUSY) {
+			retry_cnt--;
+		} else {
+			ret = -EIO;
+			goto cleanup;
+		};
+
+		/* IF EBUSY, give PSP time to finish its i2c activities */
+		mdelay(PSP_I2C_REQ_RETRY_DELAY_MSEC);
+	} while (retry_cnt);
+
+
+	ret = -ETIMEDOUT;
+
+cleanup:
+	kfree(req);
+	return ret;
+}
+
+static int psp_acquire_i2c_bus(void)
+{
+	int status;
+
+	mutex_lock(&psp_i2c_access_mutex);
+
+	/* Return early if mailbox malfunctioned */
+	if (psp_i2c_mbox_fail)
+		goto cleanup;
+
+	/*
+	 * Simply increment usage counter and return if PSP semaphore was
+	 * already taken by kernel
+	 */
+	if (psp_i2c_access_count > 0) {
+		psp_i2c_access_count++;
+		goto cleanup;
+	};
+
+	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
+	if (!status) {
+		psp_i2c_sem_acquired = jiffies;
+		psp_i2c_access_count++;
+		goto cleanup;
+	} else if (status == -ETIMEDOUT) {
+		dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
+	} else {
+		dev_err(psp_i2c_dev, "PSP communication error\n");
+	};
+
+	dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+	psp_i2c_mbox_fail = true;
+
+cleanup:
+	mutex_unlock(&psp_i2c_access_mutex);
+	return 0;
+}
+
+static void psp_release_i2c_bus(void)
+{
+	int status;
+
+	mutex_lock(&psp_i2c_access_mutex);
+
+	/* Return early if mailbox was malfunctional */
+	if (psp_i2c_mbox_fail)
+		goto cleanup;
+
+	/*
+	 * If we are last owner of PSP semaphore, need to release aribtration
+	 * via mailbox
+	 */
+	psp_i2c_access_count--;
+	if (psp_i2c_access_count > 0)
+		goto cleanup;
+
+	/* Send a release command to PSP */
+	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
+	if (!status) {
+		dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
+			jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
+		goto cleanup;
+	} else if (status == -ETIMEDOUT) {
+		dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
+	} else {
+		dev_err(psp_i2c_dev, "PSP communication error\n");
+	}
+
+	dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+	psp_i2c_mbox_fail = true;
+
+cleanup:
+	mutex_unlock(&psp_i2c_access_mutex);
+}
+
+/*
+ * Locking methods are based on the default implementation from
+ * drivers/i2c/i2c-core.base.c, but with psp acquire and release operations
+ * added. With this in place we can ensure that i2c clients on the bus shared
+ * with psp are able to lock HW access to the bus for arbitrary number of
+ * operations - that is e.g. write-wait-read.
+ */
+static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
+					unsigned int flags)
+{
+	psp_acquire_i2c_bus();
+	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
+}
+
+static int i2c_adapter_dw_psp_trylock_bus(struct i2c_adapter *adapter,
+					  unsigned int flags)
+{
+	int ret;
+
+	ret = rt_mutex_trylock(&adapter->bus_lock);
+	if (!ret)
+		psp_acquire_i2c_bus();
+
+	return ret;
+}
+
+static void i2c_adapter_dw_psp_unlock_bus(struct i2c_adapter *adapter,
+					  unsigned int flags)
+{
+	psp_release_i2c_bus();
+	rt_mutex_unlock(&adapter->bus_lock);
+}
+
+static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
+	.lock_bus = i2c_adapter_dw_psp_lock_bus,
+	.trylock_bus = i2c_adapter_dw_psp_trylock_bus,
+	.unlock_bus = i2c_adapter_dw_psp_unlock_bus,
+};
+
+int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
+{
+	if (!dev || !dev->dev)
+		return 0;
+
+	if (!(dev->flags & ARBITRATION_SEMAPHORE))
+		return 0;
+
+	/* Allow to bind only one instance of a driver */
+	if (!psp_i2c_dev)
+		psp_i2c_dev = dev->dev;
+	else
+		return -1;
+
+	if (psp_mbox_probe())
+		return -1;
+
+	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
+
+	/*
+	 * Install global locking callbacks for adapter as well as internal i2c
+	 * controller locks
+	 */
+	dev->adapter.lock_ops = &i2c_dw_psp_lock_ops;
+	dev->acquire_lock = psp_acquire_i2c_bus;
+	dev->release_lock = psp_release_i2c_bus;
+
+	return 0;
+}
+
+/* Unmap area used as a mailbox with PSP */
+void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
+{
+	iounmap(mbox_iomem);
+}
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 60a2e750cee9..252931a3f552 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -292,6 +292,7 @@ struct dw_i2c_dev {
 
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
+#define ARBITRATION_SEMAPHORE	BIT(2)
 
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
@@ -364,12 +365,18 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 		i2c_dw_configure_master(dev);
 }
 
-#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
+#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL) || IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
 extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 #else
 static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
 #endif
 
+#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
+extern void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev);
+#else
+static inline void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev) { return; }
+#endif
+
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 21113665ddea..2023da6b020f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
 	{ "AMDI0510", 0 },
+	{ "AMDI9999", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
 	{ "APMC0D0F", 0 },
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
@@ -332,6 +333,8 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	dw_i2c_plat_pm_cleanup(dev);
 
+	i2c_dw_remove_lock_support(dev);
+
 	reset_control_assert(dev->rst);
 
 	return 0;
-- 
2.34.1.307.g9b7440fafd-goog

