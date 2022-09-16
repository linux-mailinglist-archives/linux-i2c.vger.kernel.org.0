Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC9E5BADF7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiIPNTf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 09:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbiIPNTd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 09:19:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EA2FCC
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so35532674lfo.8
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ybiSkSsXxKh5zmJ7zBCznaoXv4yD91pfOMCQNft68K4=;
        b=DBL69cHVAeNVBRivuPH58SOhZWWSMo6WrNzIzURY5uDEb3dTUm2X7uZbNEzOP8IvwB
         SBiAACSVAe4b6u5SNqWfVP/uIfOQmyQXWwSHV95DBAMXO248aJze2yEyngH8mvaMTqAl
         Bm/61H5UjBQAIECu+ikxJoiFrLtvXakaWOWAIPr+stuAvC4xH0vOocPhADbONOLUtF5h
         BUAGQKstlNdZCYLj9e+5TpOKvVahCGzVctoQp+ftAvjf23a/C10FuJ8ItVNV1xVoUU55
         l24T6GiI1nItgVdDm3UeifAFv10yZbBZlz0D2zddmP0c9HEVqhBUY5SkVe/5LpgVLdu8
         jdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ybiSkSsXxKh5zmJ7zBCznaoXv4yD91pfOMCQNft68K4=;
        b=yJ7WscWyafujrbcogaf1WV5Qbfbby5cgQxxlZmSIhJsLQYwKbe2o72tJG/5vHv2fk6
         UryiqDmQtkZUqRtFXF+bS4ny48daqtVf59WJ98dSvnQoytrPwQmky46SH/1IEXSZtRp8
         tiJ3N1qzJpejrtJb0QtfN9LjmfSL0sFkYC+uQjolfLyPn3pWdaTHrtSbHGOFtD2mvAta
         K5lr345kJ49vq9rVPD5NiJzf+KIZ8KOLaSuv95f60UOmxitSwTYBjyZ5wZwyhvT+L+PV
         I/o+6MnCUb/688tAkhVYJSFKMKLn07Z6l5MAr/wHn9BxpDpS54Yy+HiZacdFp/+u201V
         ZOPg==
X-Gm-Message-State: ACrzQf3tap8z5tyYThscuaHJReWEGlnM0F+hXeGmtbaC3JZyrFrKdYks
        f1c7pa/jL0Pry5/x9khp0+rPTA==
X-Google-Smtp-Source: AMsMyM5rFiEMYK2R141xzGmpOW9yrmpZvNxQ21qW05oh+DYNIg3rG+U5PNaMgnA54ySb8XUaXyLWiQ==
X-Received: by 2002:ac2:4c50:0:b0:49a:3768:da81 with SMTP id o16-20020ac24c50000000b0049a3768da81mr1530182lfk.247.1663334368937;
        Fri, 16 Sep 2022 06:19:28 -0700 (PDT)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id f3-20020a05651c02c300b0025fdf1af42asm3650847ljo.78.2022.09.16.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:19:28 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com, jsd@semihalf.com
Subject: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access to SMN access
Date:   Fri, 16 Sep 2022 15:18:53 +0200
Message-Id: <20220916131854.687371-2-jsd@semihalf.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220916131854.687371-1-jsd@semihalf.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to a change in silicon compared to Cezanne, in future revisions MSR
access can't be used to get the base address of the PSP MMIO region that
contains the PSP mailbox interface.

Modify driver to use SMN access also for Cezanne platforms (it is
working there) in order to simplify codebase when adding support for new
SoC versions.

Export amd_cache_northbridges() which was unexported by

e1907d3: "x86/amd_nb: Unexport amd_cache_northbridges()"

since function which registers i2c-designware-platdrv is a
subsys_initcall that is executed before fs_initcall (when enumeration of
NB descriptors occurs). Thus in order to use SMN accesses it's necessary
to explicitly call amd_cache_northrbidges() from within this driver.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 arch/x86/include/asm/amd_nb.h               |   1 +
 arch/x86/kernel/amd_nb.c                    |   3 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 112 +++++++++++---------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 5 files changed, 66 insertions(+), 52 deletions(-)

diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.h
index ed0eaf65c437..00d1a400b7a1 100644
--- a/arch/x86/include/asm/amd_nb.h
+++ b/arch/x86/include/asm/amd_nb.h
@@ -16,6 +16,7 @@ extern const struct amd_nb_bus_dev_range amd_nb_bus_dev_ranges[];
 
 extern bool early_is_amd_nb(u32 value);
 extern struct resource *amd_get_mmconfig_range(struct resource *res);
+extern int amd_cache_northbridges(void);
 extern void amd_flush_garts(void);
 extern int amd_numa_init(void);
 extern int amd_get_subcaches(int);
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 4266b64631a4..2077b6cfa8ad 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -201,7 +201,7 @@ int amd_smn_write(u16 node, u32 address, u32 value)
 EXPORT_SYMBOL_GPL(amd_smn_write);
 
 
-static int amd_cache_northbridges(void)
+int amd_cache_northbridges(void)
 {
 	const struct pci_device_id *misc_ids = amd_nb_misc_ids;
 	const struct pci_device_id *link_ids = amd_nb_link_ids;
@@ -303,6 +303,7 @@ static int amd_cache_northbridges(void)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(amd_cache_northbridges);
 
 /*
  * Ignores subdevice/subvendor but as far as I can figure out
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 8f36167bce62..1d467fc83f59 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -8,12 +8,11 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <asm/amd_nb.h>
 #include <asm/msr.h>
 
 #include "i2c-designware-core.h"
 
-#define MSR_AMD_PSP_ADDR	0xc00110a2
-#define PSP_MBOX_OFFSET		0x10570
 #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
 
 #define PSP_I2C_RESERVATION_TIME_MS 100
@@ -31,6 +30,10 @@
 #define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
 #define PSP_MBOX_FIELDS_READY		BIT(31)
 
+#define PSP_MBOX_CMD_OFFSET		0x3810570
+#define PSP_MBOX_BUFFER_L_OFFSET	0x3810574
+#define PSP_MBOX_BUFFER_H_OFFSET	0x3810578
+
 struct psp_req_buffer_hdr {
 	u32 total_size;
 	u32 status;
@@ -47,14 +50,8 @@ struct psp_i2c_req {
 	enum psp_i2c_req_type type;
 };
 
-struct psp_mbox {
-	u32 cmd_fields;
-	u64 i2c_req_addr;
-} __packed;
-
 static DEFINE_MUTEX(psp_i2c_access_mutex);
 static unsigned long psp_i2c_sem_acquired;
-static void __iomem *mbox_iomem;
 static u32 psp_i2c_access_count;
 static bool psp_i2c_mbox_fail;
 static struct device *psp_i2c_dev;
@@ -64,47 +61,43 @@ static struct device *psp_i2c_dev;
  * family of SoCs.
  */
 
-static int psp_get_mbox_addr(unsigned long *mbox_addr)
+static int psp_mbox_probe(void)
 {
-	unsigned long long psp_mmio;
-
-	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
-		return -EIO;
-
-	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
-
-	return 0;
+	/*
+	 * Explicitly initialize system management network interface here, since
+	 * usual init happens only after PCI subsystem is ready. This is too late
+	 * for I2C controller driver which may be executed earlier.
+	 */
+	return amd_cache_northbridges();
 }
 
-static int psp_mbox_probe(void)
+static int psp_smn_write(u32 smn_addr, u32 value)
 {
-	unsigned long mbox_addr;
-	int ret;
-
-	ret = psp_get_mbox_addr(&mbox_addr);
-	if (ret)
-		return ret;
-
-	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
-	if (!mbox_iomem)
-		return -ENOMEM;
+	return amd_smn_write(0, smn_addr, value);
+}
 
-	return 0;
+static int psp_smn_read(u32 smn_addr, u32 *value)
+{
+	return amd_smn_read(0, smn_addr, value);
 }
 
 /* Recovery field should be equal 0 to start sending commands */
-static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
+static int psp_check_mbox_recovery(void)
 {
 	u32 tmp;
+	int status;
 
-	tmp = readl(&mbox->cmd_fields);
+	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &tmp);
+	if (status)
+		return status;
 
 	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
 }
 
-static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
+static int psp_wait_cmd(void)
 {
 	u32 tmp, expected;
+	int ret, status;
 
 	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
 	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
@@ -113,30 +106,55 @@ static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
 	 * Check for readiness of PSP mailbox in a tight loop in order to
 	 * process further as soon as command was consumed.
 	 */
-	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
-				  0, PSP_CMD_TIMEOUT_US);
+	ret = read_poll_timeout(psp_smn_read, status,
+				(status < 0) || (tmp == expected), 0,
+				PSP_CMD_TIMEOUT_US, 0, PSP_MBOX_CMD_OFFSET,
+				&tmp);
+	if (status)
+		ret = status;
+
+	return ret;
 }
 
 /* Status equal to 0 means that PSP succeed processing command */
-static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
+static int psp_check_mbox_sts(void)
 {
 	u32 cmd_reg;
+	int status;
 
-	cmd_reg = readl(&mbox->cmd_fields);
+	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &cmd_reg);
+	if (status)
+		return status;
 
 	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
 }
 
+static int psp_wr_mbox_buffer(phys_addr_t buf)
+{
+	u32 buf_addr_h = upper_32_bits(buf);
+	u32 buf_addr_l = lower_32_bits(buf);
+	int status;
+
+	status = psp_smn_write(PSP_MBOX_BUFFER_H_OFFSET, buf_addr_h);
+	if (status)
+		return status;
+
+	status = psp_smn_write(PSP_MBOX_BUFFER_L_OFFSET, buf_addr_l);
+	if (status)
+		return status;
+
+	return 0;
+}
+
 static int psp_send_cmd(struct psp_i2c_req *req)
 {
-	struct psp_mbox __iomem *mbox = mbox_iomem;
 	phys_addr_t req_addr;
 	u32 cmd_reg;
 
-	if (psp_check_mbox_recovery(mbox))
+	if (psp_check_mbox_recovery())
 		return -EIO;
 
-	if (psp_wait_cmd(mbox))
+	if (psp_wait_cmd())
 		return -EBUSY;
 
 	/*
@@ -145,16 +163,18 @@ static int psp_send_cmd(struct psp_i2c_req *req)
 	 * PSP. Use physical address of buffer, since PSP will map this region.
 	 */
 	req_addr = __psp_pa((void *)req);
-	writeq(req_addr, &mbox->i2c_req_addr);
+	if (psp_wr_mbox_buffer(req_addr))
+		return -EIO;
 
 	/* Write command register to trigger processing */
 	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
-	writel(cmd_reg, &mbox->cmd_fields);
+	if (psp_smn_write(PSP_MBOX_CMD_OFFSET, cmd_reg))
+		return -EIO;
 
-	if (psp_wait_cmd(mbox))
+	if (psp_wait_cmd())
 		return -ETIMEDOUT;
 
-	if (psp_check_mbox_sts(mbox))
+	if (psp_check_mbox_sts())
 		return -EIO;
 
 	return 0;
@@ -417,9 +437,3 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 
 	return 0;
 }
-
-/* Unmap area used as a mailbox with PSP */
-void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
-{
-	iounmap(mbox_iomem);
-}
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 70b80e710990..80dad6c8f321 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -382,7 +382,6 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
-void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
 #endif
 
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ba043b547393..99f54fe583e1 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -214,7 +214,6 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 #ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
 	{
 		.probe = i2c_dw_amdpsp_probe_lock_support,
-		.remove = i2c_dw_amdpsp_remove_lock_support,
 	},
 #endif
 	{}
-- 
2.37.3.968.ga6b4b080e4-goog

