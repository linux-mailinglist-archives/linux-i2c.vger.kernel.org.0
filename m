Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7213C7D04
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 05:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbhGNDmK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 23:42:10 -0400
Received: from mail-bn8nam12on2124.outbound.protection.outlook.com ([40.107.237.124]:57697
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237777AbhGNDmE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 23:42:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fm6iozN+8dJttORZOtFCd9ZSBwrVFUBPR3WKvvzGcaF0CVwkvdDd9tHCZu5jsgosJarnf+V189ffAzM2NX0ZJH1WTkvC0cv5xS4N6N8W4DA/94mZdmWfUOkh8s7BuMpJZDvddaJ6k8m83k0C95HOfF1xnNiogGNfIZxEO4yR4z0Ibu5qBuVxE6D172F7koGc912uo0vnyGJU964GkfWJ5W4SCzsrTFZG4VO7Zri7sBh2qlFdSeL757Ca0Qa4hWbd9lInvmN3rH5TsxmPtytPy8rMKF2FvrZhHGghKXgB9yhi+xuJdipCETe4jvKLTt+ztN0NaOD7as4F7IMSp/kXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43sUey2steEyS7GkmjkqCXWUMwi0B7maERi2FrYOQHg=;
 b=T5QLE38SvX1lkrNbuZlOcJ1Uke6akWStFVAJxe6ugWeYguCRw3qrpjMosy/aCCMnLSfKcP3Gl/PnDgMvgzraxf5wUFleTxI/5H3PdfZVK/AQoNnw2n2v1kujUYuxW0+ehDcSCMuKC8qwowN4uNn06Bz3F9at1bjKxinfTCKGxsjhe1LHpteyvWk36AMw7jaNdlf02RejsKGIqbinr3D8v6Hv1dj+OJ7s19qNinEtrQPpr6Q/AiLLBeLd/9oTDqIFbTUWwDv/aLRxMiFYttSsHPraGjXVLSFpDoffpv3vkmPAbrD483dq1uVLkZr3GoSQpR+ts99c3ZNfqc/uUYIuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43sUey2steEyS7GkmjkqCXWUMwi0B7maERi2FrYOQHg=;
 b=QU8rbeWmcYP6ZB9YOJhlXysOwadwf0gWSANEIiAM9OtsIfUhjIUZoF9iBwB7THNb1wUlObNWZ1pf8eW4jCfhbDy/rxfPgBKHyRF8DIPIcYpI0VS6Xk80z0nSlHmEMcvjzZKDxZB+a4gdmkwrPCJRQdmoRaJ/odfnIgvGQhZZRRY=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3370.prod.exchangelabs.com (2603:10b6:302:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Wed, 14 Jul 2021 03:39:01 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 03:39:01 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v5 2/3] ipmi: ssif_bmc: Add SSIF BMC driver
Date:   Wed, 14 Jul 2021 10:38:32 +0700
Message-Id: <20210714033833.11640-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210714033833.11640-1-quan@os.amperecomputing.com>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 03:38:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 076d9254-0e13-4fe6-5dd9-08d94678eb56
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB337087811D0AE3C9DB15041CF2139@MW2PR0102MB3370.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPyEj+dDftSGg5YPE7wpseaOamvUiKAXVM4caEckd2Z+b3enjxsjp/obo7ti3YeV7mZDkmAML0vu1JZ7eTOsj6BjOAugpolfu5EnClMybn3rfVfNjOsjX62NXF5W/zbUxJ3qcY9bfXPLQ2TyGbBXe3rtYFpP2RnM/ujpPPMItVWj87xRcn55uHM0Juo8eRGoIJdhtRXZYoL2Z2r/AevfM1qFtBZWvENmrDBv6pmZ9iF64nSWgt5APPLDTWu5akHgKn6SfJBYiK9GKc4nYdu+bIMR46RDk5rzmO83LHOQK4Jj2EOYoAprjU/GrR+/JHLiYauaXJE6z9bFe4fBwp7STKGwF6j0BEtL0IJJlVTrpmWFTWOE3d24mW4ULSVBN1EsKe0zgUXhwIbnBJ0eP89mHMVnwYKRExIfAezU4BEa1LbpeU6PI3+hKZKL+qoazw/R5wffJwzoTb6qSne9NRrt4HsGiyYsGuFlbB8Ub5p+hSnM4xxMApP2Gegzduqkan6q8ehoqzV0MmtR6H6dNdkfJKFhL6wV0x+SG5S+A6FI+XpV/rcKcflkvDxxnm4hV5XV7vrQ1DNBw0o3R70MC2DA6cyw18Im5w0TSiqdVwMw4JhRKHrDXRvNwQ4aOkEwsK59TbHBZQnMMOPA+p69NnurFT+hg0wkg+ZDRFXpuYIbJlopKPWcGnTsToMCDPqLZyj/SujkepzHSrrYH6g8A8N1FrnxP//rZ14LGl6WliTSexgXi1paNEn3pVyLbwLu6UUGV/1KrkWtuL/+eEDeHbXtIywG9oB/HZmMQAxBrKC0PG+oT6C3oVl1PX+b8TsUMbDeKxZO9EFs7ydlUxPVAl+wvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(4326008)(38100700002)(1076003)(38350700002)(2616005)(107886003)(956004)(8936002)(8676002)(6506007)(30864003)(86362001)(110136005)(52116002)(5660300002)(54906003)(2906002)(6666004)(478600001)(26005)(186003)(66946007)(83380400001)(7416002)(66556008)(66476007)(6512007)(921005)(6486002)(316002)(2004002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ovTkNMNGRDRFZvUjY5VVMxeVF1UWJGUXV2bDhpY0NZNytPeVZXcnZFT1Zu?=
 =?utf-8?B?VUx4MzJZcnViWUYzS3RwZy9qYjVoT1ZrUXA4Y1VFTHpRMDVsa0MzNHlBVjVz?=
 =?utf-8?B?b203dVlnNjhYWTR3YXU5SmVXR1NGaVY1U05XZDdOSno5SnNGbE81ZlFydk5L?=
 =?utf-8?B?a3Ivb1UwdFNQUm5FaUFDendGMWxVaitGUXdMcmxZZ3krNndLSUtMQnV3eUdm?=
 =?utf-8?B?QjB0M0ZQZml6SDRsZTI5Q21XWkw0T0dLS1NYbUFYWHJFV25HLzdVZE5DUkp0?=
 =?utf-8?B?MStET3BkYVl5RjNlRmRTSlZ1MS9Vcnk4NlJ1T04yTlRZYjhKSkthODcxb1RJ?=
 =?utf-8?B?SW1jVGpuM2FlRmI5T0E3dCtMbG5KWFRhY1hubENoMXU0U081RkY5SXZwb2k1?=
 =?utf-8?B?RGZuR0MrVkZwb012RHcycG82UWZFYlM0TWlTQlJDMSszV1I0c1JUYkFWTUlk?=
 =?utf-8?B?T3NyU0dGOGZmU3hyM3VuRkdXOTFXR0NwSWhWNHhwODhPOUEvK0dUbnNuTlR3?=
 =?utf-8?B?STk2YktkRThXT0c1ZlZUcUJjQUlVeFduMUQwa1VkWG9uWHBoUzZaWG1xVGNy?=
 =?utf-8?B?Q1RZbE5SUmZqSFNYYTdZMXdLT1psY0VnRk1CemdjTzVBQnFlcXNIUlNVTU1n?=
 =?utf-8?B?ZWwxTUtBNXZyUGJuU0U5YWcxNXJ6TkpHQzJmdmN6ek1FNVFtZjRjSzM3NTZj?=
 =?utf-8?B?ank1UjdMdjk2TTRha1NPS2pmRmtJSnQwRGt2ZDR5cWxBVXFDM2NsR244QThM?=
 =?utf-8?B?VHpFYXJoUkVyOGpWcTlaVU53OFZ2S29Jd2s1T3MvMHhBUHJWV250cGlWenB4?=
 =?utf-8?B?TzBXVDAyVmI4cEVUYWJwSXJyalVuNHFndmh6ZUlWelIvSnl1VUh6T2JodGJ3?=
 =?utf-8?B?NnBFWUxsKzJOSnZtdlE1dkcyNHpXKzNJaTlKVHAvRll0amEvZllTRUo5Sm15?=
 =?utf-8?B?VmQrZjFxR2l5R2kvSStnSTJwNHFvYXQwcGRSTWpHM2dac1ZJNnErTEMzMFlX?=
 =?utf-8?B?RVlpRXcvbk9GMm0ySHJ4aFlkTFUyTFc1N2hKMmFOYUlDTlV5YjJlY0lGSFQv?=
 =?utf-8?B?VXZGSmhKM3lPcHgxaDJ0RXI3MWVFNlpCemdJZCtWd2lqLyt5VzgrWlZ4TVZ5?=
 =?utf-8?B?UFpqZ2NQRnVyS2NCZDRheWNMNlZwdzFuYnJYN3d5NDNqM21melVPVFJqNG0z?=
 =?utf-8?B?Z0RRenBSWENsNXZNa29TWEJMTkMxVENOL2NGeFdiNWRjZ2ZCMG5pSWJkOVpI?=
 =?utf-8?B?M1hLRFMydmE3OVppVWxLbmJOTWhrTzhuL3pGbCtUdHlydzlPQ2k1VlZ0VGda?=
 =?utf-8?B?MWpmeDJSdzlKOTZsNnlqMzFLcVR4YmhKSnFlb3RCWUNjZktHcHg4R0tZek05?=
 =?utf-8?B?VlJ5cStBYy9CelZGTDl3dzVPUmt0NHVrR0ZXUFpEWkVvOTg5dWVJUUVNQzQv?=
 =?utf-8?B?WGgyWDdSRlBQYUxmZ3RrVkM5SGRPUlA3ZW52b0Jaa2xwZ3lYM1JDWlRpSkZL?=
 =?utf-8?B?eGs4ZXRPYzE3VkVEaWtiM3F2eUJyUk5TL3FMd2IraWN4amNQUlZWazlwa2FF?=
 =?utf-8?B?TmMvUmxBbmFnUXIvZUp5TEhsa0RML2l4REo0aFYzYk82TzB1NnZ2NzVMdE5p?=
 =?utf-8?B?ZlBJMzNTcEFibTVVRDRmTmgrTWZpRHUrZTV1a2VlYnNKWmNPSUtQSi9kM0JG?=
 =?utf-8?B?WTVpaWtSdVJSU2V5dE1maFJYZi9rK1hrNWQxQ3NUTXdGOGNnNUpLS2dxV3BM?=
 =?utf-8?Q?D9Ff1C5Y3hR4+BWq6V6gKVjHpXDppZ4mjZdeWcg?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076d9254-0e13-4fe6-5dd9-08d94678eb56
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 03:39:01.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Li/s/gGCJxTYjiC7HzTl8EmUZpzDLn/la2VBPcMQYZlgNNmRhfi533B4BqFZ/xs0RRt1FgelW/56vQaHimCaVMvak6Vs4K8ZiWnx9EllQBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3370
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v5:
  + None

v4:
  + Send response with Completion code 0xFF when aborting         [Quan]
  + Added bounding check on SMBus writes and the whole request     [Dan]
  + Moved buffer to end of struct ssif_bmc_ctx to avoid context
    corruption if somehow buffer is written past the end           [Dan]
  + Return -EINVAL if userspace buffer too small, dont
    silence truncate                                       [Corey, Joel]
  + Not necessary to check NONBLOCK in lock                      [Corey]
  + Enforce one user at a time                                    [Joel]
  + Reject write with invalid response length from userspace     [Corey]
  + Add state machines for better ssif bmc state handling         [Quan]
  + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
    SSIF BMC driver                                               [Quan]
  + Change compatible string "aspeed,ast2500-ssif-bmc" to
    "ampere,ssif-bmc"                                             [Quan]
  + Abort current request with invalid SMBus write or
    invalid command                                               [Quan]
  + Abort all request if there is pending response                [Quan]
  + Changed validate_pec() to validate_request()                  [Quan]
  + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
  + Print internal state string for ease investigating issue      [Quan]
  + Move to READY state on SLAVE_STOP event                       [Quan]
  + Change initilize_transfer() to process_smbus_cmd()            [Quan]
  + Introduce functions for each slave event                      [Quan]

v3:
  + Removed redundant license info [Joel]
  + Switched to use traditional if-else [Joel]
  + Removed unused ssif_bmc_ioctl() [Joel]
  + Made handle_request()/complete_response() to return void [Joel]
  + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
[Corey]
  + Removed mutex [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback [Corey]
  + Removed the unnecessary memset [Corey]
  + Switch to use dev_err() [Corey]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

 drivers/char/ipmi/Kconfig    |  11 +
 drivers/char/ipmi/Makefile   |   1 +
 drivers/char/ipmi/ssif_bmc.c | 781 +++++++++++++++++++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h | 106 +++++
 4 files changed, 899 insertions(+)
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 249b31197eea..e09a470ab2da 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -160,6 +160,17 @@ config ASPEED_BT_IPMI_BMC
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
index 84f47d18007f..a93c09dad22a 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -29,3 +29,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
+obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
new file mode 100644
index 000000000000..b15c05622e72
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -0,0 +1,781 @@
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
+static const char *state_to_string(enum ssif_state state)
+{
+	switch (state) {
+	case SSIF_READY:
+		return "SSIF_READY";
+	case SSIF_START:
+		return "SSIF_START";
+	case SSIF_SMBUS_CMD:
+		return "SSIF_SMBUS_CMD";
+	case SSIF_REQ_RECVING:
+		return "SSIF_REQ_RECVING";
+	case SSIF_RES_SENDING:
+		return "SSIF_RES_SENDING";
+	case SSIF_BAD_SMBUS:
+		return "SSIF_BAD_SMBUS";
+	default:
+		return "SSIF_STATE_UNKNOWN";
+	}
+}
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
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       ssif_bmc->request_available);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	if (count < min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg))) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		ret = -EINVAL;
+	} else {
+		count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg));
+		memcpy(&msg, &ssif_bmc->request, count);
+		ssif_bmc->request_available = false;
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+		ret = copy_to_user(buf, &msg, count);
+	}
+
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
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       !ssif_bmc->response_in_progress);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&ssif_bmc->lock, flags);
+	}
+
+	memcpy(&ssif_bmc->response, &msg, count);
+	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
+	ssif_bmc->response_in_progress = true;
+
+	if (ssif_bmc->client->adapter->algo->slave_enable)
+		ret = ssif_bmc->client->adapter->algo->slave_enable(ssif_bmc->client, true);
+
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
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
+	/* The request is available, userspace application can get the request */
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
+/* Called with ssif_bmc->lock held. */
+static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
+{
+	if (ssif_bmc->client->adapter->algo->slave_enable)
+		ssif_bmc->client->adapter->algo->slave_enable(ssif_bmc->client, false);
+
+	/* Request message is available to process */
+	ssif_bmc->request_available = true;
+	/*
+	 * This is the new READ request.
+	 */
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
+			"%s: Unexpected SMBus command 0x%x, aborting ...\n",
+			__func__, ssif_bmc->smbus_cmd);
+		ssif_bmc->aborting = true;
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
+				"%s: Unexpected SMBus command 0x%x, aborting ...\n",
+				__func__, ssif_bmc->smbus_cmd);
+			ssif_bmc->aborting = true;
+			break;
+		}
+
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
+	u8 *buf = (u8 *)&ssif_bmc->request;
+
+	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
+		return;
+
+	switch (ssif_bmc->smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		buf[ssif_bmc->msg_idx - 1] = *val;
+		ssif_bmc->msg_idx++;
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+		if (ssif_bmc->msg_idx == 1)
+			ssif_bmc->request.len = 0;
+
+		fallthrough;
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+		/* The len should always be 32 */
+		if (ssif_bmc->msg_idx == 1 && *val != MAX_PAYLOAD_PER_TRANSACTION) {
+			dev_warn(&ssif_bmc->client->dev,
+				 "Warn: Invalid Multipart Write len, aborting ...");
+			ssif_bmc->aborting = true;
+		}
+
+		fallthrough;
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		/* Multi-part write, 2nd byte received is length */
+		if (ssif_bmc->msg_idx == 1) {
+			if (*val > MAX_PAYLOAD_PER_TRANSACTION) {
+				dev_warn(&ssif_bmc->client->dev,
+					 "Warn: Invalid Multipart Write End len, aborting ...");
+				ssif_bmc->aborting = true;
+			}
+
+			ssif_bmc->request.len += *val;
+			ssif_bmc->recv_len = *val;
+
+			/* request len should never exceeded 255 bytes */
+			if (ssif_bmc->request.len > 255) {
+				dev_warn(&ssif_bmc->client->dev,
+					 "Warn: Invalid request len, aborting ...");
+				ssif_bmc->aborting = true;
+			}
+
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
+			"%s: Unexpected SMBus command 0x%x, aborting ...\n",
+			__func__, ssif_bmc->smbus_cmd);
+		ssif_bmc->aborting = true;
+		break;
+	}
+}
+
+static bool validate_request(struct ssif_bmc_ctx *ssif_bmc)
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
+			ret = true;
+			goto exit;
+		}
+
+		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
+			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
+				ssif_msg_len(&ssif_bmc->request));
+			ret = false;
+			goto exit;
+		}
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
+			ret = true;
+			goto exit;
+		}
+
+		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
+			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
+				ssif_msg_len(&ssif_bmc->request));
+			ret = false;
+			goto exit;
+		}
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
+		 * transaction in the sequence carry 32-byte and have
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
+		/* Do not expect to go to this case */
+		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x, aborting ...\n",
+			__func__, ssif_bmc->smbus_cmd);
+		ret = false;
+		break;
+	}
+
+exit:
+	return ret;
+}
+
+static bool unsupported_smbus_cmd(u8 cmd)
+{
+	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
+	    cmd == SSIF_IPMI_SINGLEPART_WRITE ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
+	    cmd == SSIF_IPMI_MULTIPART_WRITE_END ||
+	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
+	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
+		return false;
+
+	return true;
+}
+
+static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	/* SMBUS command can vary (single or multi-part) */
+	ssif_bmc->smbus_cmd = *val;
+	ssif_bmc->msg_idx++;
+
+	if (unsupported_smbus_cmd(*val)) {
+		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus command, aborting ...");
+		ssif_bmc->aborting = true;
+	} else if (ssif_bmc->aborting &&
+		   (*val == SSIF_IPMI_SINGLEPART_WRITE ||
+		    *val == SSIF_IPMI_MULTIPART_WRITE_START)) {
+		/* New request */
+		dev_warn(&ssif_bmc->client->dev, "Warn: New request found, stop aborting ...");
+		ssif_bmc->aborting = false;
+	}
+}
+
+static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_REQ_RECVING ||
+	    ssif_bmc->state == SSIF_RES_SENDING) {
+		ssif_bmc->state = SSIF_BAD_SMBUS;
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected READ REQUESTED in state=%s, aborting ...\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->aborting = true;
+
+	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
+		ssif_bmc->state = SSIF_RES_SENDING;
+	}
+
+	if (ssif_bmc->aborting || ssif_bmc->state != SSIF_RES_SENDING) {
+		/* Abort by returning the last request with 0xFF as completion code */
+		ssif_bmc->is_singlepart_read = true;
+		ssif_bmc->response.len = 0x03;
+		ssif_bmc->response.netfn_lun = ssif_bmc->request.netfn_lun | 4;
+		ssif_bmc->response.cmd = ssif_bmc->request.cmd;
+		memset(&ssif_bmc->response.payload[0], 0xFF, MAX_PAYLOAD_PER_TRANSACTION);
+	}
+
+	ssif_bmc->msg_idx = 0;
+	if (ssif_bmc->is_singlepart_read)
+		*val = ssif_bmc->response.len;
+	else
+		set_multipart_response_buffer(ssif_bmc, val);
+}
+
+static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_REQ_RECVING ||
+	    ssif_bmc->state == SSIF_SMBUS_CMD) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_BAD_SMBUS;
+	}
+
+	handle_read_processed(ssif_bmc, val);
+}
+
+static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	ssif_bmc->msg_idx = 0;
+
+	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
+		ssif_bmc->state = SSIF_START;
+
+	} else if (ssif_bmc->state == SSIF_START ||
+		   ssif_bmc->state == SSIF_REQ_RECVING ||
+		   ssif_bmc->state == SSIF_RES_SENDING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_BAD_SMBUS;
+	}
+}
+
+static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_RES_SENDING) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+		ssif_bmc->state = SSIF_BAD_SMBUS;
+	} else if (ssif_bmc->state == SSIF_START) {
+		ssif_bmc->state = SSIF_SMBUS_CMD;
+	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
+		ssif_bmc->state = SSIF_REQ_RECVING;
+	}
+
+	/* This is response sending state */
+	if (ssif_bmc->state == SSIF_REQ_RECVING) {
+		if (ssif_bmc->response_in_progress) {
+			/*
+			 * As per spec, it is generic management software or SSIF drivers to take
+			 * care of issuing new request before the prior requests completed.
+			 * So just abort everything here and wait for next new request
+			 */
+			dev_warn(&ssif_bmc->client->dev,
+				 "Warn: SSIF new request with pending response, aborting ...");
+			ssif_bmc->aborting = true;
+			complete_response(ssif_bmc);
+		}
+
+		handle_write_received(ssif_bmc, val);
+	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
+		process_smbus_cmd(ssif_bmc, val);
+	}
+}
+
+static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	if (ssif_bmc->state == SSIF_READY ||
+	    ssif_bmc->state == SSIF_START ||
+	    ssif_bmc->state == SSIF_SMBUS_CMD) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+
+	} else if (ssif_bmc->state == SSIF_BAD_SMBUS) {
+		dev_warn(&ssif_bmc->client->dev,
+			 "Warn: %s received SLAVE STOP from bad state=%s\n",
+			 __func__, state_to_string(ssif_bmc->state));
+
+	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
+		/* A BMC that receives an invalid request drop the data for the write
+		 * transaction and any further transactions (read or write) until
+		 * the next valid read or write Start transaction is received
+		 */
+		if (!validate_request(ssif_bmc))
+			ssif_bmc->aborting = true;
+
+		if (!ssif_bmc->aborting &&
+		    (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
+		     ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END))
+			handle_request(ssif_bmc);
+	}
+
+	ssif_bmc->state = SSIF_READY;
+	/* Reset message index */
+	ssif_bmc->msg_idx = 0;
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
+	switch (event) {
+	case I2C_SLAVE_READ_REQUESTED:
+		on_read_requested_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_REQUESTED:
+		on_write_requested_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_READ_PROCESSED:
+		on_read_processed_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		on_write_received_event(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_STOP:
+		on_stop_event(ssif_bmc, val);
+		break;
+
+	default:
+		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event, aborting ...\n");
+		ssif_bmc->aborting = true;
+		break;
+	}
+
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
+}
+
+static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+	int ret;
+
+	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
+	if (!ssif_bmc)
+		return -ENOMEM;
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
+	return 0;
+out:
+	devm_kfree(&client->dev, ssif_bmc);
+	return ret;
+}
+
+static int ssif_bmc_remove(struct i2c_client *client)
+{
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+	misc_deregister(&ssif_bmc->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id ssif_bmc_match[] = {
+	{ .compatible = "ampere,ssif-bmc" },
+	{ },
+};
+
+static const struct i2c_device_id ssif_bmc_id[] = {
+	{ DEVICE_NAME, 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
+
+static struct i2c_driver ssif_bmc_driver = {
+	.driver         = {
+		.name           = DEVICE_NAME,
+		.of_match_table = ssif_bmc_match,
+	},
+	.probe          = ssif_bmc_probe,
+	.remove         = ssif_bmc_remove,
+	.id_table       = ssif_bmc_id,
+};
+
+module_i2c_driver(ssif_bmc_driver);
+
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
new file mode 100644
index 000000000000..b63e40a4b900
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.h
@@ -0,0 +1,106 @@
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
+#define MSG_PAYLOAD_LEN_MAX			252
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
+/*
+ * SSIF internal states:
+ *   SSIF_READY         0x00 : Ready state
+ *   SSIF_START         0x01 : Start smbus transaction
+ *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
+ *   SSIF_REQ_RECVING   0x03 : Receiving request
+ *   SSIF_RES_SENDING   0x04 : Sending response
+ *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
+ */
+enum ssif_state {
+	SSIF_READY,
+	SSIF_START,
+	SSIF_SMBUS_CMD,
+	SSIF_REQ_RECVING,
+	SSIF_RES_SENDING,
+	SSIF_BAD_SMBUS,
+	SSIF_STATE_MAX
+};
+
+struct ssif_bmc_ctx {
+	struct i2c_client	*client;
+	struct miscdevice	miscdev;
+	size_t			msg_idx;
+	bool			pec_support;
+	/* ssif bmc spinlock */
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	u8			running;
+	enum ssif_state		state;
+	u8			smbus_cmd;
+	/* Flag to abort current process */
+	bool			aborting;
+	/* Flag to identify a Multi-part Read Transaction */
+	bool			is_singlepart_read;
+	u8			nbytes_processed;
+	u8			remain_len;
+	u8			recv_len;
+	/* Block Number of a Multi-part Read Transaction */
+	u8			block_num;
+	bool			request_available;
+	bool			response_in_progress;
+	/* Response buffer for Multi-part Read Transaction */
+	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
+	struct ssif_msg		response;
+	struct ssif_msg		request;
+};
+
+static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
+{
+	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
+}
+#endif /* __SSIF_BMC_H__ */
-- 
2.28.0

