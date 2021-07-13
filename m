Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383EA3C69FB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 07:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhGMF5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 01:57:40 -0400
Received: from mail-bn8nam12on2135.outbound.protection.outlook.com ([40.107.237.135]:6497
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231971AbhGMF5j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 01:57:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVe0vKpcctIo13jJmdKu8uSNGxFAJo4IgPCnqf6Obgz7vyeLzvK4DvkNqKUSUMWbr8sSl12JkwzcA0gAHQGJi3iJxaXadl3dEqPVrYEN1TBzhYJzk7ieOsMU1J/fJMefEf1Wl0UaeLtv/IK1pKqEXF3l1nBBHdl09B8BS89QM5/OXMBXAq+8+sRN73ZXah93p1gpBZvmxcDNUJHIwy+22nAcsny5igsP3X1Nv0dD00oK0QdhmrW5U+VhN+op1BTpWl42z/DwDgXtxGBRC43mtNca5FGhBTS4lv9a9KMVcGnrWdw7pPwtvmf9uOgf3tYoDStD5jst6Zd2Jij8WzBrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRvCkcGmZy3X92RZSBBoLKQ35hZ5gVX6F7qMfHu+Rok=;
 b=JsQVcBtKiW+ea1lVbxf8cOMR0Q0NA5rRYdRYJ1EjguoqKgymlYDZWolMQUbnNMiQPxfMnU1ZYpOA4IcVhlPGY3zFNO/JjMCaugDgKiXiRBhvUkRMs+t6QYYbZpev+xZWL9EGCuqbwneTkLni7P798QAyEHVxXiSUTcZUSNKA/kYA8rYcTKM5rWU2njXLQsOuIOY1n7Nt/PyffF5Wdato9S8n6aRj9OxdleOSgWkh6c3LjW9aXsQyzpE+K67TH69+z7SrJ1yz0Z5obImDYXp7JzHZCfFKo7qyA4ACByHvX5c2ebE+aQxxDBwhEnsHaK2eoseir9HQo8FMYJUXwWXphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRvCkcGmZy3X92RZSBBoLKQ35hZ5gVX6F7qMfHu+Rok=;
 b=n6L0Hz0kumq0OzNpogAyeAoXDgWzTJ5fqyLLBgZCAaXjkysYK/6YqLzx1bBu7pwAIpYYddq6Y4mpXoQywHMyj+I/GK15Fos0pp3zp9zm467ckKEvtlh+n7e+yn/TrWP/hNAk1dBqNLJ0b6Q4j1/7zxVdUh3/3qGJs9Gk3gp6mew=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6535.prod.exchangelabs.com (2603:10b6:303:d9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 13 Jul 2021 05:54:47 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:54:47 +0000
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
Subject: [PATCH v4 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Date:   Tue, 13 Jul 2021 12:54:23 +0700
Message-Id: <20210713055425.30636-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713055425.30636-1-quan@os.amperecomputing.com>
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 05:54:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f6150d-c42a-4d25-d8a6-08d945c2b880
X-MS-TrafficTypeDiagnostic: CO1PR01MB6535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6535179E1639F702565E1720F2149@CO1PR01MB6535.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDO4Gr8uTPEAARhIG+6EdCP/zdidEH8VXrPclSXiwflta/4Ubh49lgEpZ9C5ENhoqvI7ekXK9MVdqYRyFqhIYSRmHyN3fijTp2h/7n5M0t7ZuMS7oMXKz6kbNwDI1vCAnrWqfx+GpyKT7oHuR5WNZqay4uVZ1RmE3sxncwqCc5Ixt84cj+PSD7X6s3loODW3l6NioE13cMJlU7od0me1dBxi2xcoWM1CrJ2KiMCmZ+fQ6Z5ABheuSN50DMWoDBCtzfNGC7zhDnY0NqaV+jRgo8F1AV+3f3SeeeWK5AtyTgHpvbzSZrrAuArYKKenS6QINLeXOJB1QvqjC9oCbURWUxcyyMw1IW5zbGqKJR40kudq339zPwFNtiPZt+0fPwxb68yaDYeioB5YDnVp1E/vH/T/Sh094xpCECckea6FSqikxAa80EV5kg0Cum3QmUh0V0tMKcBMDr7B0Gz5CwQVrsLvVG6kyy2eBb65TUNUTe++j72isCQwhepenTPaK0M8xfdMa6FLRXFMmKHURkMEKCsAt7h4Og89Y3hhEIYcOog4ZvZj6BOdIa+UiLs5e1gj5M7kJGI48ScciW2xd+ojW9thIMSlFlCgOYyzZ8Cx6SLDg8tQPf8h1Im19Wy7qlRMbKtXrgT22dNnYRcwysyP4bVaDPSrXtUIQDQBgryKsX0kDMjCrkm16pMLI904RbRgjltApbNwX1iZvXrpFSH9N3Z7jmx6Pc5yUXVJxpi3op94JcczjPlkt62QeaB70h3qqQb2+lh6VQZZEDRc5eEc83sQO/zmZyPhsOIFuvZ5Q5ujOTHbXrzosGbZWTqcl5kTiM8pvRdgiVWNNoofoIoFag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(956004)(8676002)(54906003)(86362001)(5660300002)(2616005)(2906002)(1076003)(7416002)(52116002)(66946007)(107886003)(478600001)(66556008)(6666004)(30864003)(66476007)(6506007)(921005)(110136005)(26005)(186003)(38100700002)(316002)(4326008)(38350700002)(83380400001)(6512007)(8936002)(6486002)(2004002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlI5Q2Z6VS9BSGJYMGJhcUVJUG1EaXdVbWtMVGpoSDF5Z2ZVQXhXL1dhTUxB?=
 =?utf-8?B?alFTTVRGWkVFMDNtZy8vVSsvQVRraE5zZ1JXcXZXTlQ0RTFJWFFUTkY4WVgy?=
 =?utf-8?B?Z0wxTzhTdmQrWXVxRUpVam1LdmFta1dDRXF0WjhOZk5iQUhMZXZVOXlhdzJL?=
 =?utf-8?B?WWltbk81TWs1ZlRmeWJIa0Z2Rms3Nk9iUG12SUtpWkgwek1FR1FzanZTUlBn?=
 =?utf-8?B?VkFyNXRSVUl0YTdLM3IrUHpEa0pEczgvVXVhNDRrdEZGd1VUbmNIL0dkcW41?=
 =?utf-8?B?bDVRaFJqaGYvSE43YUh3SW1jWGdXUnJ6eEpYMVNDUmpxNEdKd0tnL2Z3d0pa?=
 =?utf-8?B?V04wamM0L21wWlJMVXdKWnhkaE14WGNBZWovRWNFaCt6dlkxZmhmV2VPRnAw?=
 =?utf-8?B?VGp2T2dUK1lvNVhzbXk3eUUvMjdnNTQwRUFSV0VJSUFMdnFqUXh1RDI1cXU2?=
 =?utf-8?B?NVRjeSs1YmFOQVY5OFdOUG9rL05yazJRbjJzYlpVdWZuMGh4OWIwRGg4bXhG?=
 =?utf-8?B?ZCt0cTVtQmhjU0M4M1d0akRyZTdtUjJMbVdKZDJuSXBXTFQ2TFNqYkFLOFdX?=
 =?utf-8?B?dldEMHIzMThXbi9DRllRZGNYSmhQUUFFOHg0NGdEOERZVVV5US94NU1FNUFV?=
 =?utf-8?B?V3dTQi94R0Q3clVvbnBFNWlnQ2Z2cVpqOXQ4MUluV1VZZXUwcjJ5cDgxc3d4?=
 =?utf-8?B?NVErbm1DTTdhbllnalJYbkVkMHREUWhPVmFwMmVra1dmVGh0RnVORVZBanN6?=
 =?utf-8?B?ZFlNQUw0M1lmTGVqVFpRc05TV2NXQ1d2T0tvMmhUZWNOQk5oTzlIaVk4bUxt?=
 =?utf-8?B?MTNzNEpZVkF3NlhsZXdYWWMvVFNEUDVyejRKS0tienFJTEY2Nk8yZnJXcnhO?=
 =?utf-8?B?Z05IejZUZzU3dC9KSytSenNQYVgvbmtyNVFMT1I5UkdOZjI1YXU2TEdWdDZ3?=
 =?utf-8?B?Ry9sMmFKWWFmRHdBTW9yZUhkYUN5MjVHcjg4bW5xMUY0Yk5OdVp4S2NWMDlD?=
 =?utf-8?B?TXpCTmtMMGk0aXN5UDV0blE2Zlgrc2xCSDkrSkFrVWQ5KzNkOTZXTlQ1OU0v?=
 =?utf-8?B?M0FLdkhhVGN3dGcyWjRZcHRkbGZ3d1U1dWFVRmpKMW9QTkVQOGtldzNHVytB?=
 =?utf-8?B?Wm5KTG1KVDc4a0ZNZHk4RnFTZjJQRC9iNkJ0YThBYmJXYzNJTUVSN0N1WWs5?=
 =?utf-8?B?SWxvWU4zMFk0SEl4U2xycGJPUUNlWWdWNXUwN296cm9SNW5PTkx4QjlCckYv?=
 =?utf-8?B?dE9XTVdPdUQ3cml4WGszZlhvbXB3Y1ZtUmd1bUR5UnpSVGYyL1AzYzQ2VHRi?=
 =?utf-8?B?SFdJVHBxUFYweFd1a0NmNENLcXR2WFdnM0NPRUVWSDlJUU9xNE9SNHpoTk1m?=
 =?utf-8?B?N284ZEFwZGpRT2N0Z3gweUZraWZNTm9UQTdMRmdoWnQ4ZzlLREZuS25pc0lk?=
 =?utf-8?B?K1JWYkVha3hjQVFFL3NHQjJmak1pekJhWXhRSHlRRVRHVFpzaXhESVZhTDJq?=
 =?utf-8?B?a1ZXcEd0d25zM0lHV3RnOEZ0UGNsOU14RjZIc2JlV05DMHU2TXlsbHBvRThF?=
 =?utf-8?B?TSs0NEFZR0NTN3o2czgyblhOZklBdVZySVRhRVVDaWlXOTByZWREd1NLaVVw?=
 =?utf-8?B?VUVHTm9SYXI3ZksrYnFxSGFPc3RTdVU1RDVkbmRGeGZNSDZyUVpYTnFPTzVR?=
 =?utf-8?B?clA3bEJVNitKSXdhcVg2Rk00S2dRY252dG9jb3B3WnhpOW9ITmVJZVlLRlgw?=
 =?utf-8?Q?Pvpih8/6+0jQumBRjJtfEQdCOhO87JMG5M2BAsh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f6150d-c42a-4d25-d8a6-08d945c2b880
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:54:47.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cgLGhPbvWyTK1vUudvExk+wmJ5Mky5V/IW9t9BjwzC6ysi36/5CZp8mv87hY5AW2MnbbomGJYuz7f/j/2sOobNT9Qyc+pCRCIlA3UXVisY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6535
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
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

