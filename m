Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1595BADFA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 15:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiIPNTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbiIPNTh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 09:19:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86022617
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f9so34835082lfr.3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EQ9/p3lJwci77ftCdqtq0O5QcfX0Mc1jziB3F9PSJEI=;
        b=Hb69zvadMagHI6Rmr8J94YmyJGlj3RJiSLbUJDAgtRs5nlghIMcztyCqjgg2Ig0/XK
         /d4PPdExghd4DUvS4vtwcoNZQCIaI1co85ms9tX2JRN1W1/tc2sH0OB7uOId4vAACkLr
         /jPogKEvu7YIp6ewOC7oUmmbe6cRrVWWC7aqh+fqm0Lk57ywqoeQHApIo+mLAQ2j67q8
         oWzvCROmfS4kw8KCniRWS7BKuJ7uZItKKda+twqiQv+jqG3x+a/85odDLSFoNOv4o/6d
         5MMjI75rVRcRBweY5bZIdAAljRKHDpj1tUTa5h9GW9ozj+MhW3eIPV0cpVAFSsD+mm5+
         435A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EQ9/p3lJwci77ftCdqtq0O5QcfX0Mc1jziB3F9PSJEI=;
        b=QX+o7tYBn4l1MGqJZvYIGK5IPvfV6TltyvU7cc+BJQLzijbyfcsyd7//ZXpfPFJa+Z
         hzLsGs9XcV4jAfIT3pI/bd4MB2ovGTEyXXiRumyeEvhvtkRuEAmZ0QARhFvitdbGu2IU
         tt+zyW/Fd+WwAt99KmkU42YJFE12jKGOgZXSgjk9M1H6qRYkcD92nq7M9FhFvnR8jbCS
         UN6o+dc4YGAYr/Zo7Crqe/9qulmVDGS998gji8YDSOBISPIgHNcADez0g7rWHCxrbIDM
         mfEh+K5y+e96l2WcJi4+NDBfWI9dUvA0ZL9vA1b/GjfSyBMqgs/U856s9lK7xWZ8fifG
         VvfQ==
X-Gm-Message-State: ACrzQf0lC86xeUqxVA7ouAgxrQAZ6jC5Bq8Z7DJ5HBQou9WRSEjou9zz
        5tVvdmJECRdFtQxG23o8iBpnvQ==
X-Google-Smtp-Source: AMsMyM5N5LQf4ychHaDbBThx4GDmr3IOssq3QwqQ2E8d30ZgLuG8liE/GeH1rjLEuC86l/yFS5t6MA==
X-Received: by 2002:a05:6512:b81:b0:494:78cc:ca9c with SMTP id b1-20020a0565120b8100b0049478ccca9cmr1605663lfv.564.1663334370150;
        Fri, 16 Sep 2022 06:19:30 -0700 (PDT)
Received: from dabros-l.wifi.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id f3-20020a05651c02c300b0025fdf1af42asm3650847ljo.78.2022.09.16.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:19:29 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        mario.limonciello@amd.com, jsd@semihalf.com
Subject: [PATCH -next 2/2] i2c: designware: Add support for new SoCs in AMDPSP driver
Date:   Fri, 16 Sep 2022 15:18:54 +0200
Message-Id: <20220916131854.687371-3-jsd@semihalf.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220916131854.687371-1-jsd@semihalf.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

New AMD SoCs are using different algorithm for x86-PSP communication,
thus need to modify I2C arbitration driver. Since possible future
revisions should have follow new approach, mark functions used only for
Cezanne with "czn_" prefix.

While at it, remove redundant check by modifying psp_wait_cmd() to only
check for MBOX_READY bit, since MBOX_CMD field being zero is verified by
czn_psp_check_mbox_sts() later on in the sequence.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 145 ++++++++++++++-------
 1 file changed, 97 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 1d467fc83f59..4395a2ae960a 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -4,6 +4,7 @@
 #include <linux/bits.h>
 #include <linux/i2c.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/pci.h>
 #include <linux/psp-sev.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -30,9 +31,13 @@
 #define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
 #define PSP_MBOX_FIELDS_READY		BIT(31)
 
-#define PSP_MBOX_CMD_OFFSET		0x3810570
-#define PSP_MBOX_BUFFER_L_OFFSET	0x3810574
-#define PSP_MBOX_BUFFER_H_OFFSET	0x3810578
+#define CZN_PSP_MBOX_CMD_OFFSET		0x3810570
+#define CZN_PSP_MBOX_BUFFER_L_OFFSET	0x3810574
+#define CZN_PSP_MBOX_BUFFER_H_OFFSET	0x3810578
+#define PSP_MBOX_CMD_OFFSET		0x3810A40
+#define PSP_MBOX_DOORBELL_OFFSET	0x3810A24
+
+#define AMD_CPU_ID_CZN			0x1630
 
 struct psp_req_buffer_hdr {
 	u32 total_size;
@@ -55,6 +60,7 @@ static unsigned long psp_i2c_sem_acquired;
 static u32 psp_i2c_access_count;
 static bool psp_i2c_mbox_fail;
 static struct device *psp_i2c_dev;
+static unsigned short cpu_id;
 
 /*
  * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD Cezanne
@@ -63,6 +69,17 @@ static struct device *psp_i2c_dev;
 
 static int psp_mbox_probe(void)
 {
+	struct pci_dev *rdev;
+
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (!rdev) {
+		dev_err(psp_i2c_dev, "Failed to get host bridge device\n");
+		return -ENODEV;
+	}
+
+	cpu_id = rdev->device;
+	pci_dev_put(rdev);
+
 	/*
 	 * Explicitly initialize system management network interface here, since
 	 * usual init happens only after PCI subsystem is ready. This is too late
@@ -81,80 +98,76 @@ static int psp_smn_read(u32 smn_addr, u32 *value)
 	return amd_smn_read(0, smn_addr, value);
 }
 
-/* Recovery field should be equal 0 to start sending commands */
-static int psp_check_mbox_recovery(void)
+static int psp_mbox_ready(u32 smn_addr)
 {
 	u32 tmp;
-	int status;
-
-	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &tmp);
-	if (status)
-		return status;
-
-	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
-}
-
-static int psp_wait_cmd(void)
-{
-	u32 tmp, expected;
 	int ret, status;
 
-	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
-	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
-
 	/*
 	 * Check for readiness of PSP mailbox in a tight loop in order to
 	 * process further as soon as command was consumed.
 	 */
 	ret = read_poll_timeout(psp_smn_read, status,
-				(status < 0) || (tmp == expected), 0,
-				PSP_CMD_TIMEOUT_US, 0, PSP_MBOX_CMD_OFFSET,
-				&tmp);
+				(status < 0) || (tmp & PSP_MBOX_FIELDS_READY),
+				0, PSP_CMD_TIMEOUT_US, 0, smn_addr, &tmp);
 	if (status)
 		ret = status;
 
 	return ret;
 }
 
+/* Recovery field should be equal 0 to start sending commands */
+static int czn_psp_check_mbox_recovery(void)
+{
+	u32 tmp;
+	int status;
+
+	status = psp_smn_read(CZN_PSP_MBOX_CMD_OFFSET, &tmp);
+	if (status)
+		return status;
+
+	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
+}
+
 /* Status equal to 0 means that PSP succeed processing command */
-static int psp_check_mbox_sts(void)
+static u32 czn_psp_check_mbox_sts(void)
 {
 	u32 cmd_reg;
 	int status;
 
-	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &cmd_reg);
+	status = psp_smn_read(CZN_PSP_MBOX_CMD_OFFSET, &cmd_reg);
 	if (status)
 		return status;
 
 	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
 }
 
-static int psp_wr_mbox_buffer(phys_addr_t buf)
+static int czn_psp_wr_mbox_buffer(phys_addr_t buf)
 {
 	u32 buf_addr_h = upper_32_bits(buf);
 	u32 buf_addr_l = lower_32_bits(buf);
 	int status;
 
-	status = psp_smn_write(PSP_MBOX_BUFFER_H_OFFSET, buf_addr_h);
+	status = psp_smn_write(CZN_PSP_MBOX_BUFFER_H_OFFSET, buf_addr_h);
 	if (status)
 		return status;
 
-	status = psp_smn_write(PSP_MBOX_BUFFER_L_OFFSET, buf_addr_l);
+	status = psp_smn_write(CZN_PSP_MBOX_BUFFER_L_OFFSET, buf_addr_l);
 	if (status)
 		return status;
 
 	return 0;
 }
 
-static int psp_send_cmd(struct psp_i2c_req *req)
+static int czn_psp_send_cmd(struct psp_i2c_req *req)
 {
 	phys_addr_t req_addr;
 	u32 cmd_reg;
 
-	if (psp_check_mbox_recovery())
+	if (czn_psp_check_mbox_recovery())
 		return -EIO;
 
-	if (psp_wait_cmd())
+	if (psp_mbox_ready(CZN_PSP_MBOX_CMD_OFFSET))
 		return -EBUSY;
 
 	/*
@@ -163,18 +176,18 @@ static int psp_send_cmd(struct psp_i2c_req *req)
 	 * PSP. Use physical address of buffer, since PSP will map this region.
 	 */
 	req_addr = __psp_pa((void *)req);
-	if (psp_wr_mbox_buffer(req_addr))
+	if (czn_psp_wr_mbox_buffer(req_addr))
 		return -EIO;
 
 	/* Write command register to trigger processing */
 	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
-	if (psp_smn_write(PSP_MBOX_CMD_OFFSET, cmd_reg))
+	if (psp_smn_write(CZN_PSP_MBOX_CMD_OFFSET, cmd_reg))
 		return -EIO;
 
-	if (psp_wait_cmd())
+	if (psp_mbox_ready(CZN_PSP_MBOX_CMD_OFFSET))
 		return -ETIMEDOUT;
 
-	if (psp_check_mbox_sts())
+	if (czn_psp_check_mbox_sts())
 		return -EIO;
 
 	return 0;
@@ -185,8 +198,13 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
 {
 	u32 status;
 
-	/* Status field in command-response buffer is updated by PSP */
-	status = READ_ONCE(req->hdr.status);
+	if (req) {
+		/* Status field in command-response buffer is updated by PSP */
+		status = READ_ONCE(req->hdr.status);
+	} else {
+		status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &status);
+		status &= ~PSP_MBOX_FIELDS_READY;
+	}
 
 	switch (status) {
 	case PSP_I2C_REQ_STS_OK:
@@ -199,8 +217,31 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
 	}
 }
 
-static int psp_send_check_i2c_req(struct psp_i2c_req *req)
+static int psp_send_cmd(enum psp_i2c_req_type i2c_req_type)
+{
+	int ret;
+
+	ret = psp_mbox_ready(PSP_MBOX_CMD_OFFSET);
+	if (ret)
+		return ret;
+
+	psp_smn_write(PSP_MBOX_CMD_OFFSET, i2c_req_type);
+
+	/* Ring the Doorbell for PSP by writing a non-zero value */
+	psp_smn_write(PSP_MBOX_DOORBELL_OFFSET, 0x1);
+
+	ret = psp_mbox_ready(PSP_MBOX_CMD_OFFSET);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int psp_send_check_i2c_req(struct psp_i2c_req *req,
+				  enum psp_i2c_req_type i2c_req_type)
 {
+	int ret;
+
 	/*
 	 * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
 	 * 1. mailbox communication - PSP is not operational or some IO errors
@@ -208,10 +249,15 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
 	 * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too
 	 * long.
 	 * In order to distinguish between these two in error handling code, all
-	 * errors on the first level (returned by psp_send_cmd) are shadowed by
+	 * errors on the first level (returned by *psp_send_cmd) are shadowed by
 	 * -EIO.
 	 */
-	if (psp_send_cmd(req))
+	if (req)
+		ret = czn_psp_send_cmd(req);
+	else
+		ret = psp_send_cmd(i2c_req_type);
+
+	if (ret)
 		return -EIO;
 
 	return check_i2c_req_sts(req);
@@ -219,24 +265,27 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
 
 static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 {
-	struct psp_i2c_req *req;
+	struct psp_i2c_req *req = NULL;
 	unsigned long start;
 	int status, ret;
 
-	/* Allocate command-response buffer */
-	req = kzalloc(sizeof(*req), GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
+	/* Allocate command-response buffer for Cezanne platforms */
+	if (cpu_id == AMD_CPU_ID_CZN) {
+		req = kzalloc(sizeof(*req), GFP_KERNEL);
+		if (!req)
+			return -ENOMEM;
 
-	req->hdr.total_size = sizeof(*req);
-	req->type = i2c_req_type;
+		req->hdr.total_size = sizeof(*req);
+		req->type = i2c_req_type;
+	}
 
 	start = jiffies;
 	ret = read_poll_timeout(psp_send_check_i2c_req, status,
 				(status != -EBUSY),
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
-				0, req);
+				0, req, i2c_req_type);
+
 	if (ret) {
 		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
 			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
-- 
2.37.3.968.ga6b4b080e4-goog

