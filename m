Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E43C38889E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 09:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243397AbhESHvr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 03:51:47 -0400
Received: from mail-bn8nam11on2122.outbound.protection.outlook.com ([40.107.236.122]:11026
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243226AbhESHvq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 May 2021 03:51:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGB+96JmxLztFaGSAiXwB13TH56xxWyHQiSbT4rbFxDkQ9A/dg+5yuCCHZZjGu63V7C/KbIDsQDo7fNvN/GMyyEf6ha86KB1Sf9q2xLIwA1MnaLvn0FnnqE2b1BOemfMxro18b0LD969xCs7WKuR8UA7kNat6HjYI/Dj1ArJeWZhDtO4hkEAAdh4G0V0bujWvTaD17ksSzGa6FkQNDng4Z+ULC8oXcfYO/I8NJR/TgCv1XU8kgOtm8UJ2/giBIs6t7u6aAgtWbA+YiTNxCGNOGxSmBmn7q5yKKRjV6L92ILUH1tl+LwR9TZi5M9RwzVT3G7h7EBrVekNmA3d0KZCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrb8L1WtoH37V8+qwYspJMUj716OqVakAWu2FslUZ1s=;
 b=GplRxl7ZXCxY+Df6eo2ZstL1nApMzdx8jpqFrcjvo1DQZli0VfRKae4J97ub8KlvfqGKN066EcT4t4ptqZpV0SP92fn+7oGgUNITSGEaaOrTNUHKLGV4cZI8GTcGvFz7LIX0zj2K8BBVDSYs3HRSu91dzhe4+HHsivOQJYGi4FyKKeS9Ei66nxABC2UuvMv+/427kGN5NoQmz7k+YvKpxGskRKvT3N9D6bxIyScK5ZZJBuzrVNZLV2odEyGsWNxrolTN+B2QAFvMfVyzlY/KptbiSteiAiDr29fYqs9VJGX3Be7tJk3ZV9wBm9c2yG8LxZfu5BLSh4J8/suGM46A8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrb8L1WtoH37V8+qwYspJMUj716OqVakAWu2FslUZ1s=;
 b=OM/gImmBrgCj2y4B6LJh2++vudF4TYiV9UGvIE2AW9fvTsJcM5AJu0dUtO5n+u/+wsGluqvBjnzhPYrLhouv7rNk+2oKJVB2Pb7saMk2Av3u5C74YfpDRJam+jMjU+wz2CKCv9JtW/MKi+jMh4u1EpOIv2X3qjDhawDJhzHPBKE=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3451.prod.exchangelabs.com (2603:10b6:302:10::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 07:50:24 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:24 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/7] ipmi: ssif_bmc: Add SSIF BMC driver
Date:   Wed, 19 May 2021 14:49:29 +0700
Message-Id: <20210519074934.20712-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 454dce6f-02f6-48e3-4ed4-08d91a9ac276
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3451D1F5B6AA2BB8AE86D018F22B9@MW2PR0102MB3451.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0M6BIoNbx8p8GkmRJAcJtaAmN5NoXA13aqHB3VDUEMTlkVuK7enGxW+QDGaSYNkEkxGlm7aa5PEpNwC1aM88C35EJigpSyqC3ycr5jZmANgH3GayDc3oR0dTUuTeH+Lxit4Gk9CGvLQxoMoEAL0GjFpfxuBjmap9HV55Q8JYBwg/WlC4zObtmtn3E8sEaPzXF3ybzULahIwk8jpvg6zDaZ3QF468TEilWuSAudzNh93tVJS6uedIs0lwpoShe9+lV9E6WeCjqKU/PmYWDNMz60pideiqoZCBW7dtNt5kIk35cqH70Dq9hdX/XApAdLnN2zwMAHq1lQ97+cPwQ+eiNsZ8CmsZFwCSjgx9v9Pt6GqfsBvqbJEOY5qv0NVZ73etldaz0d0louhR5STlzzXhe85si6WRg5EiSwM9IXH6pLBZ6OCH8uGmGBt0BwWTIPjTmRttP4BFQITxrH04T9J1Gm+0mK2QzJ06DSTkqkcvSEwQCptoT0mTrbQMJhZairGT8e2Hmj7FzoTND6jMIovvc0H4sk1eaFDfUD4QCw40cy7HCy79VBxSI4vAAdzFHMgtiCtfigYuEN2qhsA+etnW2LlBCxXnVRwaafWuuwWJ+E7ekjhZc68Ag7K66r0RlgrUQrRs11i2sVzIs10Js50sbAVwREfbu9qkTjaZgF8vXcFX8l4ReY726NYlcZc3dPiEXAH6qywgRYn0yynfCGrLI/YgVE6HfJlveFoh5WOxWpgBGG/tvx1FnlW9tWKQ3pNi6CFwliXVVV89NMyr+wtSzIcelypWjlg0Nr+ShEVb0pM5mRTPimrb1Jj00FUyvHO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(366004)(396003)(346002)(83380400001)(7416002)(8676002)(2906002)(921005)(6512007)(478600001)(38100700002)(8936002)(186003)(16526019)(38350700002)(52116002)(5660300002)(30864003)(956004)(2616005)(4326008)(110136005)(54906003)(316002)(66556008)(66476007)(66946007)(6486002)(6506007)(1076003)(26005)(86362001)(2004002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UldsVFV6RGNnbUoxZTE0bWkzOG1DRldOV2xsNzdQNzVKUTZreFJEWjRPMENr?=
 =?utf-8?B?ZTU1SVFtbFlkNE8vQk5abU9OSkNSbVpObFR0c1hxMWxZMVVrWVNudDNLeTZw?=
 =?utf-8?B?RWcyUDN1bzBtMjI5UWo4blFYVGduUk5yaEZRY2IwQ1lwY21DZlFSZFA2Q0Fh?=
 =?utf-8?B?OFEwYm1LdDY1Tk5MSFdwdVpIN2gzOEdORkYvMXl5aFV4NHljT0lBL0h6Vm00?=
 =?utf-8?B?cGVvVFRsb09nOUxBZHVRNUNJRkNjcC9WZDkzUnZiYk5Kc3hVU2NiSWNGclpw?=
 =?utf-8?B?NlJBR0p6RmdpQkp2QThCNys3cTJBcVNDL3hEM3U1bGYvbW9JSnB6SkxNSEhO?=
 =?utf-8?B?OHRzYTYyV2tUai85dnhpSkYvQUtIallxd0pVYnYrTGkya05oc015dEZJcXpZ?=
 =?utf-8?B?UUpHd092NElQQTFGUUwrc3Rpc0kvaE1jV2YybWd6TU9TWW9LVzM5Wm5ySEtx?=
 =?utf-8?B?Kzl1a1RHcDV2VjRta2IxNnNEU0Q1WkNWUXVkdWRpS0dxb3Y2R3h4NGlGdmpV?=
 =?utf-8?B?eEdMYnpsQzQ0TFpRcnM4eDdleEFSc2dZbi8vNEFkVnVTak5XaGFKd1prbjN4?=
 =?utf-8?B?UVV3LzhKRDQzamtVaTR4Q0JzWDlTYzJGcnhaTE5JZXVaWGVZV25YVHlwc1hQ?=
 =?utf-8?B?RHRBcU1CTDd4ZmNsVGkrb2tzTFd5RXJMcUNOTVNHQzJiNnBJMXJ1VVdORnhq?=
 =?utf-8?B?MS9VYTYxTEdFN0hpMWRQelY2NlBjT3dQdExnZlRWYkV0bHM4MHpmMUczUXdI?=
 =?utf-8?B?ZzJQVkgycG1zV2VJaEsvK0hML0VWT3lIcVFRdFVwWldEbWpxWkFUSk5sdzJQ?=
 =?utf-8?B?ek41cVB0elh4TWsra1kwVnl1b0FsOU44RTZNL2tjQXkvTEI1WFZyWWJuaFdV?=
 =?utf-8?B?Q1Z6TFVHRUZKZ2FsSWtSVyt0TVg3Qy8xREZIc0Fkc0pBWjVYK2FMbU5WNS9r?=
 =?utf-8?B?b0h6U29hODQ2R0praHN3NlJwS2Vpc0VwcWV5YktiQnpWbFB2ZEpzdHJHWk5F?=
 =?utf-8?B?VTdOTlhwekE2WlQ2MVZvQXRuUXg5UHdnMXA2U090UktyTXVNNEhqc3ZHT0cy?=
 =?utf-8?B?K2RNNzJFTmY1akVjaXJRemFCTDVzdHIwWlU3T093UW5NeklkeFBmQXFVbk13?=
 =?utf-8?B?Y1hMNnJaSEFFQ2ErekJiT2M3QVFiOTEvVllvVVZ1aFZRV29qZFZXK0JxcEVZ?=
 =?utf-8?B?Yzl3NHR1SDVtbDl4aUNBc1BwVGg1QWVxd3BmalJ2TUJEdWFXTWJKbXRZcnFr?=
 =?utf-8?B?Wlg5NUNsbTVaUGVOZEJLYnhkcERYb09LMVJEN2pISmxhT01hRVBzZWkxb2FI?=
 =?utf-8?B?VHpWVXRieDFVOEVHczQxQTh3TCtvaFdLaXhMWS9ob3Y0eGZRMzNUR1gzU1JR?=
 =?utf-8?B?bzd4UDVVU3JWWkhpMTdRNkdNK1BLTkZsMGRTTHhPSERnZ3FsMXZyS2d0UCsv?=
 =?utf-8?B?NzY2NzdPWUJUdVRrZDJyQmRrSjZ0MUZuVDI2Y3ZlRmRTY3M0SnkzcG5sMHZD?=
 =?utf-8?B?V09TY0hLQndRRGd2MndtUGkxZzZMdXowVW1NUDhCZzY3b2E5RjJnL3hHWm5o?=
 =?utf-8?B?SUZMajZPbVo4OVdtSlJKcm5TU2FqTGZJekNPSGNBT3BtVlRGaFBKMEd2S29h?=
 =?utf-8?B?V2o1ZTFQWVdEV2xkems0cXZKZlJIbTFPdk4xZ1lQK2tkT1ZWUzdla1pFWWhp?=
 =?utf-8?B?YnRzM1lhcDNlbGpna2pQMlk1NGdEN2szS1daSUJvNEhjMUFBdS9jaVZoZXVp?=
 =?utf-8?Q?Af19ywI/xfg1x7hCXET9LzhOxsiBzoJhsHAKbBG?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454dce6f-02f6-48e3-4ed4-08d91a9ac276
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:24.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc/5iGx2aBw8ec9oCf81ZXQhNqvnkoNNNjCsJ9Ihd52vqrqdn82xqXe2NR4vokfJF/d0tsu0FXj6dis5JJvPnqlaAf6QLugE344HRmBAOM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3451
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + Removed redundant license info [Joel]
  + Switched to use traditional if-else [Joel]
  + Removed unused ssif_bmc_ioctl() [Joel]
  + Made handle_request()/complete_response() to return void [Joel]
  + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
  + Removed mutex [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback [Corey]
  + Removed the unnecessary memset [Corey]
  + Switch to use dev_err() [Corey]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

 drivers/char/ipmi/Kconfig    |  11 +
 drivers/char/ipmi/Makefile   |   1 +
 drivers/char/ipmi/ssif_bmc.c | 605 +++++++++++++++++++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h |  93 ++++++
 4 files changed, 710 insertions(+)
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 07847d9a459a..ad5c5161bcd6 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -133,6 +133,17 @@ config ASPEED_BT_IPMI_BMC
 	  found on Aspeed SOCs (AST2400 and AST2500). The driver
 	  implements the BMC side of the BT interface.
 
+config SSIF_IPMI_BMC
+	tristate "SSIF IPMI BMC driver"
+	select I2C
+	select I2C_SLAVE
+	help
+	  This enables the IPMI SMBus system interface (SSIF) at the
+	  management (BMC) side.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF).
+
 config IPMB_DEVICE_INTERFACE
 	tristate 'IPMB Interface handler'
 	depends on I2C
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..d04a214d74c4 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -27,3 +27,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
+obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
new file mode 100644
index 000000000000..d0ea7059b1db
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -0,0 +1,605 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+#include "ssif_bmc.h"
+
+/* Handle SSIF message that will be sent to user */
+static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	while (!ssif_bmc->request_available) {
+		if (file->f_flags & O_NONBLOCK) {
+			ret = -EAGAIN;
+			goto out_unlock;
+		}
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       ssif_bmc->request_available);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request),
+		      min_t(ssize_t, sizeof(struct ssif_msg), count));
+	memcpy(&msg, &ssif_bmc->request, count);
+	ssif_bmc->request_available = false;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	ret = copy_to_user(buf, &msg, count);
+	goto out;
+
+out_unlock:
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+out:
+	return (ret < 0) ? ret : count;
+}
+
+/* Handle SSIF message that is written by user */
+static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
+			      loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	if (count > sizeof(struct ssif_msg))
+		return -EINVAL;
+
+	ret = copy_from_user(&msg, buf, count);
+	if (ret)
+		return ret;
+
+	if (!msg.len || count < ssif_msg_len(&msg))
+		return -EINVAL;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	while (ssif_bmc->response_in_progress) {
+		if (file->f_flags & O_NONBLOCK) {
+			ret = -EAGAIN;
+			goto out_unlock;
+		}
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       !ssif_bmc->response_in_progress);
+		if (ret)
+			goto out;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	memcpy(&ssif_bmc->response, &msg, count);
+	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
+	ssif_bmc->response_in_progress = true;
+	if (ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
+
+out_unlock:
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+out:
+	return (ret < 0) ? ret : count;
+}
+
+static int ssif_bmc_open(struct inode *inode, struct file *file)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	int ret = 0;
+
+	spin_lock_irq(&ssif_bmc->lock);
+	if (!ssif_bmc->running)
+		ssif_bmc->running = 1;
+	else
+		ret = -EBUSY;
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return ret;
+}
+
+static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &ssif_bmc->wait_queue, wait);
+
+	spin_lock_irq(&ssif_bmc->lock);
+	/*
+	 * The request message is now available so userspace application can
+	 * get the request
+	 */
+	if (ssif_bmc->request_available)
+		mask |= POLLIN;
+
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return mask;
+}
+
+static int ssif_bmc_release(struct inode *inode, struct file *file)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+
+	spin_lock_irq(&ssif_bmc->lock);
+	ssif_bmc->running = 0;
+	spin_unlock_irq(&ssif_bmc->lock);
+
+	return 0;
+}
+
+/*
+ * System calls to device interface for user apps
+ */
+static const struct file_operations ssif_bmc_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ssif_bmc_open,
+	.read		= ssif_bmc_read,
+	.write		= ssif_bmc_write,
+	.release	= ssif_bmc_release,
+	.poll		= ssif_bmc_poll,
+};
+
+/* Called with ssif_bmc->lock held. */
+static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
+{
+	if (ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
+
+	/* Request message is available to process */
+	ssif_bmc->request_available = true;
+	/*
+	 * This is the new READ request.
+	 */
+	wake_up_all(&ssif_bmc->wait_queue);
+}
+
+/* Called with ssif_bmc->lock held. */
+static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
+{
+	/* Invalidate response in buffer to denote it having been sent. */
+	ssif_bmc->response.len = 0;
+	ssif_bmc->response_in_progress = false;
+	ssif_bmc->nbytes_processed = 0;
+	ssif_bmc->remain_len = 0;
+	wake_up_all(&ssif_bmc->wait_queue);
+}
+
+static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 response_len = 0;
+	int idx = 0;
+	u8 data_len;
+
+	data_len = ssif_bmc->response.len;
+	switch (ssif_bmc->smbus_cmd) {
+	case SSIF_IPMI_MULTIPART_READ_START:
+		/*
+		 * Read Start length is 32 bytes.
+		 * Read Start transfer first 30 bytes of IPMI response
+		 * and 2 special code 0x00, 0x01.
+		 */
+		*val = MAX_PAYLOAD_PER_TRANSACTION;
+		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
+		ssif_bmc->block_num = 0;
+
+		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
+		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
+
+		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
+
+		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
+		       response_len);
+		break;
+
+	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
+		/*
+		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
+		 * IPMI data plus block number byte.
+		 */
+		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
+			/*
+			 * This is READ End message
+			 *  Return length is the remaining response data length
+			 *  plus block number
+			 *  Block number 0xFF is to indicate this is last message
+			 *
+			 */
+			*val = ssif_bmc->remain_len + 1;
+			ssif_bmc->block_num = 0xFF;
+			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
+			response_len = ssif_bmc->remain_len;
+			/* Clean the buffer */
+			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
+		} else {
+			/*
+			 * This is READ Middle message
+			 *  Response length is the maximum SMBUS transfer length
+			 *  Block number byte is incremented
+			 * Return length is maximum SMBUS transfer length
+			 */
+			*val = MAX_PAYLOAD_PER_TRANSACTION;
+			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
+			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
+			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
+			ssif_bmc->block_num++;
+		}
+
+		memcpy(&ssif_bmc->response_buf[idx],
+		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
+		       response_len);
+		break;
+
+	default:
+		/* Do not expect to go to this case */
+		dev_err(&ssif_bmc->client->dev,
+			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
+		break;
+	}
+
+	ssif_bmc->nbytes_processed += response_len;
+}
+
+/* Process the IPMI response that will be read by master */
+static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf;
+	u8 pec_len, addr, len;
+	u8 pec = 0;
+
+	pec_len = ssif_bmc->pec_support ? 1 : 0;
+	/* PEC - Start Read Address */
+	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+	pec = i2c_smbus_pec(pec, &addr, 1);
+	/* PEC - SSIF Command */
+	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
+	/* PEC - Restart Write Address */
+	addr = addr | 0x01;
+	pec = i2c_smbus_pec(pec, &addr, 1);
+
+	if (ssif_bmc->is_singlepart_read) {
+		/* Single-part Read processing */
+		buf = (u8 *)&ssif_bmc->response;
+
+		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
+			ssif_bmc->msg_idx++;
+			*val = buf[ssif_bmc->msg_idx];
+		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
+			ssif_bmc->msg_idx++;
+			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
+		} else {
+			*val = 0;
+		}
+		/* Invalidate response buffer to denote it is sent */
+		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
+			complete_response(ssif_bmc);
+	} else {
+		/* Multi-part Read processing */
+		switch (ssif_bmc->smbus_cmd) {
+		case SSIF_IPMI_MULTIPART_READ_START:
+		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
+			buf = (u8 *)&ssif_bmc->response_buf;
+			*val = buf[ssif_bmc->msg_idx];
+			ssif_bmc->msg_idx++;
+			break;
+		default:
+			/* Do not expect to go to this case */
+			dev_err(&ssif_bmc->client->dev,
+				"Error: Unexpected SMBus command received 0x%x\n",
+				ssif_bmc->smbus_cmd);
+			break;
+		}
+		len = (ssif_bmc->block_num == 0xFF) ?
+		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
+		if (ssif_bmc->msg_idx == (len + 1)) {
+			pec = i2c_smbus_pec(pec, &len, 1);
+			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
+		}
+		/* Invalidate response buffer to denote last response is sent */
+		if (ssif_bmc->block_num == 0xFF &&
+		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
+			complete_response(ssif_bmc);
+		}
+	}
+}
+
+static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf;
+	u8 smbus_cmd;
+
+	buf = (u8 *)&ssif_bmc->request;
+	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
+		return;
+
+	smbus_cmd = ssif_bmc->smbus_cmd;
+	switch (smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		/* Single-part write */
+		buf[ssif_bmc->msg_idx - 1] = *val;
+		ssif_bmc->msg_idx++;
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+		/* Reset length to zero */
+		if (ssif_bmc->msg_idx == 1)
+			ssif_bmc->request.len = 0;
+
+		fallthrough;
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		/* Multi-part write, 2nd byte received is length */
+		if (ssif_bmc->msg_idx == 1) {
+			ssif_bmc->request.len += *val;
+			ssif_bmc->recv_len = *val;
+		} else {
+			buf[ssif_bmc->msg_idx - 1 +
+			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
+		}
+
+		ssif_bmc->msg_idx++;
+
+		break;
+	default:
+		/* Do not expect to go to this case */
+		dev_err(&ssif_bmc->client->dev,
+			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
+		break;
+	}
+}
+
+static bool validate_pec(struct ssif_bmc_ctx *ssif_bmc)
+{
+	u8 rpec = 0, cpec = 0;
+	bool ret = true;
+	u8 addr, index;
+	u8 *buf;
+
+	buf = (u8 *)&ssif_bmc->request;
+	switch (ssif_bmc->smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
+			/* PEC is not included */
+			ssif_bmc->pec_support = false;
+			return true;
+		}
+
+		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1))
+			goto error;
+
+		/* PEC is included */
+		ssif_bmc->pec_support = true;
+		rpec = buf[ssif_bmc->msg_idx - 2];
+		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+		cpec = i2c_smbus_pec(cpec, &addr, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
+		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
+		if (rpec != cpec) {
+			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
+			ret = false;
+		}
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		index = ssif_bmc->request.len - ssif_bmc->recv_len;
+		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
+			/* PEC is not included */
+			ssif_bmc->pec_support = false;
+			return true;
+		}
+
+		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1))
+			goto error;
+
+		/* PEC is included */
+		ssif_bmc->pec_support = true;
+		rpec = buf[ssif_bmc->msg_idx - 2 + index];
+		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+		cpec = i2c_smbus_pec(cpec, &addr, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
+		/* As SMBus specification does not allow the length
+		 * (byte count) in the Write-Block protocol to be zero.
+		 * Therefore, it is illegal to have the last Middle
+		 * transaction in the sequence carry 32-bytes and have
+		 * a length of ‘0’ in the End transaction.
+		 * But some users may try to use this way and we should
+		 * prevent ssif_bmc driver broken in this case.
+		 */
+		if (ssif_bmc->recv_len != 0)
+			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
+
+		if (rpec != cpec) {
+			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
+			ret = false;
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+error:
+	/* Do not expect to go to this case */
+	dev_err(&ssif_bmc->client->dev,
+		"Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
+
+	return false;
+}
+
+static void complete_write_received(struct ssif_bmc_ctx *ssif_bmc)
+{
+	u8 cmd = ssif_bmc->smbus_cmd;
+
+	/* A BMC that receives an invalid PEC shall drop the data for the write
+	 * transaction and any further transactions (read or write) until
+	 * the next valid read or write Start transaction is received
+	 */
+	if (!validate_pec(ssif_bmc)) {
+		dev_err(&ssif_bmc->client->dev, "Received invalid PEC\n");
+		return;
+	}
+
+	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
+		handle_request(ssif_bmc);
+}
+
+static void initialize_transfer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	/* SMBUS command can vary (single or multi-part) */
+	ssif_bmc->smbus_cmd = *val;
+	ssif_bmc->msg_idx++;
+
+	if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
+	    ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_START) {
+		/*
+		 * The response can be delayed in BMC causing host SSIF driver
+		 * to timeout and send a new request once BMC slave is ready.
+		 * In that case check for pending response and clear it
+		 */
+		if (ssif_bmc->response_in_progress) {
+			dev_err(&ssif_bmc->client->dev,
+				"Warn: SSIF new request with pending response");
+			complete_response(ssif_bmc);
+		}
+	} else if (unlikely(ssif_bmc->smbus_cmd != SSIF_IPMI_SINGLEPART_READ &&
+			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_MIDDLE &&
+			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_END &&
+			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_START &&
+			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_MIDDLE)) {
+		/* Unknown command, clear it */
+		dev_err(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
+		complete_response(ssif_bmc);
+	}
+}
+
+/*
+ * Callback function to handle I2C slave events
+ */
+static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
+{
+	unsigned long flags;
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+
+	/* I2C Event Handler:
+	 *   I2C_SLAVE_READ_REQUESTED	0x0
+	 *   I2C_SLAVE_WRITE_REQUESTED	0x1
+	 *   I2C_SLAVE_READ_PROCESSED	0x2
+	 *   I2C_SLAVE_WRITE_RECEIVED	0x3
+	 *   I2C_SLAVE_STOP		0x4
+	 */
+	switch (event) {
+	case I2C_SLAVE_READ_REQUESTED:
+		ssif_bmc->msg_idx = 0;
+		if (ssif_bmc->is_singlepart_read)
+			*val = ssif_bmc->response.len;
+		else
+			set_multipart_response_buffer(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_REQUESTED:
+		ssif_bmc->msg_idx = 0;
+		break;
+
+	case I2C_SLAVE_READ_PROCESSED:
+		handle_read_processed(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		if (ssif_bmc->msg_idx)
+			handle_write_received(ssif_bmc, val);
+		else
+			initialize_transfer(ssif_bmc, val);
+
+		break;
+
+	case I2C_SLAVE_STOP:
+		if (ssif_bmc->last_event == I2C_SLAVE_WRITE_RECEIVED)
+			complete_write_received(ssif_bmc);
+		/* Reset message index */
+		ssif_bmc->msg_idx = 0;
+		break;
+
+	default:
+		break;
+	}
+	ssif_bmc->last_event = event;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
+}
+
+struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+	int ret;
+
+	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc) + sizeof_priv, GFP_KERNEL);
+	if (!ssif_bmc)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&ssif_bmc->lock);
+
+	init_waitqueue_head(&ssif_bmc->wait_queue);
+	ssif_bmc->request_available = false;
+	ssif_bmc->response_in_progress = false;
+
+	/* Register misc device interface */
+	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
+	ssif_bmc->miscdev.name = DEVICE_NAME;
+	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
+	ssif_bmc->miscdev.parent = &client->dev;
+	ret = misc_register(&ssif_bmc->miscdev);
+	if (ret)
+		goto out;
+
+	ssif_bmc->client = client;
+	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
+
+	/* Register I2C slave */
+	i2c_set_clientdata(client, ssif_bmc);
+	ret = i2c_slave_register(client, ssif_bmc_cb);
+	if (ret) {
+		misc_deregister(&ssif_bmc->miscdev);
+		goto out;
+	}
+
+	return ssif_bmc;
+
+out:
+	devm_kfree(&client->dev, ssif_bmc);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(ssif_bmc_alloc);
+
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
new file mode 100644
index 000000000000..eab540061f14
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+#ifndef __SSIF_BMC_H__
+#define __SSIF_BMC_H__
+
+#define DEVICE_NAME				"ipmi-ssif-host"
+
+#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
+
+#define MSG_PAYLOAD_LEN_MAX			252
+
+/* A standard SMBus Transaction is limited to 32 data bytes */
+#define MAX_PAYLOAD_PER_TRANSACTION		32
+
+#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
+#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
+
+#define SSIF_IPMI_SINGLEPART_WRITE		0x2
+#define SSIF_IPMI_SINGLEPART_READ		0x3
+#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
+#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
+#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
+#define SSIF_IPMI_MULTIPART_READ_START		0x3
+#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
+
+struct ssif_msg {
+	u8 len;
+	u8 netfn_lun;
+	u8 cmd;
+	u8 payload[MSG_PAYLOAD_LEN_MAX];
+} __packed;
+
+static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
+{
+	return ssif_msg->len + 1;
+}
+
+#define SSIF_BMC_BUSY   0x01
+#define SSIF_BMC_READY  0x02
+
+struct ssif_bmc_ctx {
+	struct i2c_client	*client;
+	struct miscdevice	miscdev;
+	u8			running;
+	u8			smbus_cmd;
+	struct ssif_msg		request;
+	bool			request_available;
+	struct ssif_msg		response;
+	bool			response_in_progress;
+	/* Response buffer for Multi-part Read Transaction */
+	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
+	/* Flag to identify a Multi-part Read Transaction */
+	bool			is_singlepart_read;
+	u8			nbytes_processed;
+	u8			remain_len;
+	u8			recv_len;
+	/* Block Number of a Multi-part Read Transaction */
+	u8			block_num;
+	size_t			msg_idx;
+	enum i2c_slave_event	last_event;
+	bool			pec_support;
+	/* spinlock */
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	void (*set_ssif_bmc_status)(struct ssif_bmc_ctx *ssif_bmc, unsigned int flags);
+	void			*priv;
+};
+
+static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
+{
+	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
+}
+
+struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv);
+
+#endif /* __SSIF_BMC_H__ */
-- 
2.28.0

