Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9360F49FC18
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349482AbiA1Osq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349483AbiA1Osq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:48:46 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3116C06173B
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:48:45 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u6so12218190lfm.10
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9AF+WGR/RiuT1FNhLGMPjEaqe+pSIzyRRHFJm5zw/s=;
        b=Er1CMOiPlw5jfIruwz/CAtYHWVjqXRvURsuEA2MFI3hrWfn/U8vkhNNiTHfpDjuGPd
         gew22+kGGS0yIye1ZJieZd64q2oiSi8xXy+YYoHFLG7yq4srxZ2njBDMYMKbt227N++u
         fqvWc0YEaCTP0SCKEBw9aw+YHhqskHHcHL6TYpH1yGlZ5lAMSxZU4jdR1yVp6iT6Bt9F
         l/AmuMWhWiOdizQlrZMX884TOsmE02sx/s6FvZdQzgWu49GkFS80leATCy790/xHoYq1
         IpHdYr7XPFFv9S0MT/xc/nklYaL0PzKs238Xa7DbRCe0T2aZtdxyGl1/2kUN5H7/FyXs
         X63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9AF+WGR/RiuT1FNhLGMPjEaqe+pSIzyRRHFJm5zw/s=;
        b=jWxX9r2XS82iD4cOPfaVojIipYjtMJCyZ0BOL5M7lckgWhO0P4vhGamP/N9lgM3+EI
         IMOtU7BMuwyXm6qA2qg6aM3sic+UOYFoyHg4dILsv3eMx3OKB8HrbZMyWKhFCsx3B3bw
         wZfNxXByyzZ0+k7caCMq5XhjHmGwsuuVXGGRqVwa0BuI6JJ5bSmZIkfMNb0i3UqmydmR
         EVXgR7j5N+9GOKsbKiR+HBAdXL60TPI9H7E6SXaFldzbmZZKDGDoXnYkHx4Tq5J74hKm
         GWNMpXKiaHxf5nn04FeFRR1PBCK0WSaq/1EtNINCZsNYwYZ5dHXTIOzEt1u03v2oLBOl
         cXWQ==
X-Gm-Message-State: AOAM530jZQCSsdJK+gB8vxxAFqaSUXZqbjYOHLcNRdCUzJpRHsNvrbh6
        k2YtgJUGst2ltSW9EMtnFWgcWQ==
X-Google-Smtp-Source: ABdhPJy+UtiqqJfyhA7JddamyFmBHEqpa5Acp4wPXY5j5biyEwwX2IZTyJSPY/D6vrgZLSJQRUb/Mw==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr6543474lfv.305.1643381323750;
        Fri, 28 Jan 2022 06:48:43 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id q7sm1706520lfp.63.2022.01.28.06.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 06:48:43 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, adriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com, jsd@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] i2c: designware: Add AMD PSP I2C bus support
Date:   Fri, 28 Jan 2022 15:48:11 +0100
Message-Id: <20220128144811.783279-3-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220128144811.783279-1-jsd@semihalf.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220128144811.783279-1-jsd@semihalf.com>
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

Modify i2c_dw_probe_lock_support() to select correct semaphore
implementation at runtime, since now we have more than one available.

Configure new matching ACPI ID "AMDI0019" and register
ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
arbitration.

Add myself as a reviewer for I2C DesignWare in order to help with reviewing
and testing possible changes touching new i2c-designware-amdpsp.c module.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 MAINTAINERS                                  |   1 +
 drivers/acpi/acpi_apd.c                      |   7 +-
 drivers/i2c/busses/Kconfig                   |  11 +
 drivers/i2c/busses/Makefile                  |   1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c   | 373 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
 drivers/i2c/busses/i2c-designware-core.h     |  18 +-
 drivers/i2c/busses/i2c-designware-platdrv.c  |  61 +++
 8 files changed, 471 insertions(+), 11 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f41088418aae..e0a7e05c5a41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18666,6 +18666,7 @@ SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Mika Westerberg <mika.westerberg@linux.intel.com>
+R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-designware-*
diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index e7934ba79b02..ad245bbd965e 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -232,12 +232,13 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	/* Generic apd devices */
 #ifdef CONFIG_X86_AMD_PLATFORM_DEVICE
 	{ "AMD0010", APD_ADDR(cz_i2c_desc) },
-	{ "AMDI0010", APD_ADDR(wt_i2c_desc) },
 	{ "AMD0020", APD_ADDR(cz_uart_desc) },
-	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
-	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
 	{ "AMD0030", },
 	{ "AMD0040", APD_ADDR(fch_misc_desc)},
+	{ "AMDI0010", APD_ADDR(wt_i2c_desc) },
+	{ "AMDI0019", APD_ADDR(wt_i2c_desc) },
+	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
+	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
 	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
 #endif
 #ifdef CONFIG_ARM64
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..3ba9e7f9366e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -553,6 +553,17 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
+config I2C_DESIGNWARE_AMDPSP
+	bool "AMD PSP I2C semaphore support"
+	depends on X86_64
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
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..752f47be3fc1 100644
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
index 000000000000..9b600ca54f7c
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/psp-sev.h>
+#include <linux/types.h>
+
+#include <asm/msr.h>
+
+#include "i2c-designware-core.h"
+
+#define MSR_AMD_PSP_ADDR	0xc00110a2
+#define PSP_MBOX_OFFSET		0x10570
+#define PSP_CMD_TIMEOUT_MS	500
+
+#define PSP_I2C_REQ_BUS_CMD		0x64
+#define PSP_I2C_REQ_RETRY_CNT		10
+#define PSP_I2C_REQ_RETRY_DELAY_USEC	(50 * 1000)
+#define PSP_I2C_REQ_STS_OK		0x0
+#define PSP_I2C_REQ_STS_BUS_BUSY	0x1
+#define PSP_I2C_REQ_STS_INV_PARAM	0x3
+
+#define PSP_MBOX_FIELDS_STS		GENMASK(15, 0)
+#define PSP_MBOX_FIELDS_CMD		GENMASK(23, 16)
+#define PSP_MBOX_FIELDS_RESERVED	GENMASK(29, 24)
+#define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
+#define PSP_MBOX_FIELDS_READY		BIT(31)
+
+struct psp_req_buffer_hdr {
+	u32 total_size;
+	u32 status;
+};
+
+enum psp_i2c_req_type {
+	PSP_I2C_REQ_ACQUIRE,
+	PSP_I2C_REQ_RELEASE,
+	PSP_I2C_REQ_MAX
+};
+
+struct psp_i2c_req {
+	struct psp_req_buffer_hdr hdr;
+	enum psp_i2c_req_type type;
+} __aligned(32);
+
+struct psp_mbox {
+	u32 cmd_fields;
+	phys_addr_t i2c_req_addr;
+} __packed;
+
+static DEFINE_MUTEX(psp_i2c_access_mutex);
+static unsigned long psp_i2c_sem_acquired;
+static void __iomem *mbox_iomem;
+static u32 psp_i2c_access_count;
+static bool psp_i2c_mbox_fail;
+static struct device *psp_i2c_dev;
+
+/*
+ * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD Cezanne
+ * family of SoCs.
+ */
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
+	int ret;
+
+	ret = psp_get_mbox_addr(&mbox_addr);
+	if (ret)
+		return ret;
+
+	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
+	if (!mbox_iomem)
+		return -ENOMEM;
+
+	return 0;
+}
+
+
+/* Recovery field should be equal 0 to start sending commands */
+static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
+{
+	u32 tmp;
+
+	tmp = readl(&mbox->cmd_fields);
+
+	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
+}
+
+static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
+{
+	u32 tmp, expected;
+
+	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
+	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
+
+	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
+				  0, 1000 * PSP_CMD_TIMEOUT_MS);
+}
+
+/* Status equal to 0 means that PSP succeed processing command */
+static int psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
+{
+	u32 cmd_reg;
+
+	cmd_reg = readl(&mbox->cmd_fields);
+
+	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
+}
+
+static int psp_send_cmd(struct psp_i2c_req *req)
+{
+	struct psp_mbox __iomem *mbox = (struct psp_mbox __iomem *)mbox_iomem;
+	phys_addr_t req_addr;
+	u32 cmd_reg;
+
+	if (psp_check_mbox_recovery(mbox))
+		return -EIO;
+
+	if (psp_wait_cmd(mbox))
+		return -EBUSY;
+
+	/*
+	 * Fill mailbox with address of command-response buffer, which will be
+	 * used for sending i2c requests as well as reading status returned by
+	 * PSP. Use physical address of buffer, since PSP will map this region.
+	 */
+	req_addr = __psp_pa((void *)req);
+	writeq(req_addr, &mbox->i2c_req_addr);
+
+	/* Write command register to trigger processing */
+	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
+	writel(cmd_reg, &mbox->cmd_fields);
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
+static int psp_send_check_i2c_req(struct psp_i2c_req *req)
+{
+	if (psp_send_cmd(req))
+		return -EIO;
+
+	return check_i2c_req_sts(req);
+}
+
+static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+{
+	struct psp_i2c_req *req;
+	unsigned long start;
+	int status, ret;
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
+	ret = read_poll_timeout(psp_send_check_i2c_req, status,
+				(status != -EBUSY),
+				PSP_I2C_REQ_RETRY_DELAY_USEC,
+				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_USEC,
+				0, req);
+	if (ret)
+		goto cleanup;
+
+	if (status) {
+		ret = status;
+		goto cleanup;
+	}
+
+	dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
+		jiffies_to_msecs(jiffies - start));
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
+	 * already taken by kernel.
+	 */
+	if (psp_i2c_access_count > 0) {
+		psp_i2c_access_count++;
+		goto cleanup;
+	};
+
+	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
+	if (status) {
+		if (status == -ETIMEDOUT)
+			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
+		else
+			dev_err(psp_i2c_dev, "PSP communication error\n");
+
+		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+		psp_i2c_mbox_fail = true;
+		goto cleanup;
+	}
+
+	psp_i2c_sem_acquired = jiffies;
+	psp_i2c_access_count++;
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
+	 * via mailbox.
+	 */
+	psp_i2c_access_count--;
+	if (psp_i2c_access_count > 0)
+		goto cleanup;
+
+	/* Send a release command to PSP */
+	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
+	if (status) {
+		if (status == -ETIMEDOUT)
+			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
+		else
+			dev_err(psp_i2c_dev, "PSP communication error\n");
+
+		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+		psp_i2c_mbox_fail = true;
+		goto cleanup;
+	}
+
+	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
+		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
+
+cleanup:
+	mutex_unlock(&psp_i2c_access_mutex);
+}
+
+/*
+ * Locking methods are based on the default implementation from
+ * drivers/i2c/i2c-core-base.c, but with psp acquire and release operations
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
+	if (ret)
+		return ret;
+
+	psp_acquire_i2c_bus();
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
+int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
+{
+	int ret;
+
+	if (!dev || !dev->dev)
+		return -ENODEV;
+
+	if (!(dev->flags & ARBITRATION_SEMAPHORE))
+		return -ENODEV;
+
+	/* Allow to bind only one instance of a driver */
+	if (psp_i2c_dev)
+		return -EEXIST;
+
+	psp_i2c_dev = dev->dev;
+
+	ret = psp_mbox_probe();
+	if (ret)
+		return ret;
+
+	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
+
+	/*
+	 * Install global locking callbacks for adapter as well as internal i2c
+	 * controller locks.
+	 */
+	dev->adapter.lock_ops = &i2c_dw_psp_lock_ops;
+	dev->acquire_lock = psp_acquire_i2c_bus;
+	dev->release_lock = psp_release_i2c_bus;
+
+	return 0;
+}
+
+/* Unmap area used as a mailbox with PSP */
+void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
+{
+	iounmap(mbox_iomem);
+}
diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
index c6a7a00e1d52..0c674542dd99 100644
--- a/drivers/i2c/busses/i2c-designware-baytrail.c
+++ b/drivers/i2c/busses/i2c-designware-baytrail.c
@@ -12,25 +12,25 @@
 
 #include "i2c-designware-core.h"
 
-int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
+int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
 {
 	acpi_status status;
 	unsigned long long shared_host = 0;
 	acpi_handle handle;
 
 	if (!dev || !dev->dev)
-		return 0;
+		return -ENODEV;
 
 	handle = ACPI_HANDLE(dev->dev);
 	if (!handle)
-		return 0;
+		return -ENODEV;
 
 	status = acpi_evaluate_integer(handle, "_SEM", NULL, &shared_host);
 	if (ACPI_FAILURE(status))
-		return 0;
+		return -ENODEV;
 
 	if (!shared_host)
-		return 0;
+		return -ENODEV;
 
 	if (!iosf_mbi_available())
 		return -EPROBE_DEFER;
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4b26cba40139..1d65212fddbd 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -227,6 +227,8 @@ struct reset_control;
  * @hs_lcnt: high speed LCNT value
  * @acquire_lock: function to acquire a hardware lock on the bus
  * @release_lock: function to release a hardware lock on the bus
+ * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
+ *	-1 if there is no semaphore.
  * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
  * @disable: function to disable the controller
  * @disable_int: function to disable all interrupts
@@ -285,6 +287,7 @@ struct dw_i2c_dev {
 	u16			hs_lcnt;
 	int			(*acquire_lock)(void);
 	void			(*release_lock)(void);
+	int			semaphore_idx;
 	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
 	void			(*disable_int)(struct dw_i2c_dev *dev);
@@ -297,6 +300,7 @@ struct dw_i2c_dev {
 
 #define ACCESS_INTR_MASK	BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
+#define ARBITRATION_SEMAPHORE	BIT(2)
 
 #define MODEL_MSCC_OCELOT	BIT(8)
 #define MODEL_BAIKAL_BT1	BIT(9)
@@ -310,6 +314,11 @@ struct dw_i2c_dev {
 #define AMD_UCSI_INTR_REG	0x474
 #define AMD_UCSI_INTR_EN	0xd
 
+struct i2c_dw_semaphore_callbacks {
+	int	(*probe)(struct dw_i2c_dev *dev);
+	void	(*remove)(struct dw_i2c_dev *dev);
+};
+
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
@@ -370,9 +379,12 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 }
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
-extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
-#else
-static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
+int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
+#endif
+
+#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
+int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
+void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
 #endif
 
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2bd81abc86f6..7cb555d6c2e8 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -50,6 +50,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
+	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
 	{ "HISI02A1", 0 },
@@ -204,6 +205,64 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
 	{ } /* terminate list */
 };
 
+static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
+#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
+	{
+		.probe = i2c_dw_baytrail_probe_lock_support,
+	},
+#endif
+#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
+	{
+		.probe = i2c_dw_amdpsp_probe_lock_support,
+		.remove = i2c_dw_amdpsp_remove_lock_support,
+	},
+#endif
+	{}
+};
+
+static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
+{
+	const struct i2c_dw_semaphore_callbacks *ptr;
+	int i = 0;
+	int ret;
+
+	ptr = i2c_dw_semaphore_cb_table;
+
+	dev->semaphore_idx = -1;
+
+	while (ptr->probe) {
+		ret = ptr->probe(dev);
+		if (ret) {
+			/*
+			 * If there is no semaphore device attached to this
+			 * controller, we shouldn't abort general i2c_controller
+			 * probe.
+			 */
+			if (ret == -ENODEV) {
+				i++;
+				ptr++;
+				continue;
+			} else {
+				return ret;
+			}
+		}
+
+		dev->semaphore_idx = i;
+		break;
+	}
+
+	return 0;
+}
+
+static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
+{
+	if (dev->semaphore_idx < 0)
+		return;
+
+	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
+		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct i2c_adapter *adap;
@@ -334,6 +393,8 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	dw_i2c_plat_pm_cleanup(dev);
 
+	i2c_dw_remove_lock_support(dev);
+
 	reset_control_assert(dev->rst);
 
 	return 0;
-- 
2.35.0.rc0.227.g00780c9af4-goog

