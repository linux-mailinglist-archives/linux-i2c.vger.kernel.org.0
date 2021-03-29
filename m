Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0252E34CFC7
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhC2MJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:09:51 -0400
Received: from mail-mw2nam12on2127.outbound.protection.outlook.com ([40.107.244.127]:38279
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231758AbhC2MJp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:09:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHOasz3ICNllG/VtkPbRy0dB72XFzEQY3OPp1aLUkRU/tlnn9zN0HCV0GI75Pj1f1DZKn7hbM+RNAf7qZ0lqCpm/Hgq6VGiIbL844qWLRDm1lYf56t7BhogVJsA161dZuIAJfffvbcxr+L9R9B1NiqGW1VfdhGzdxgkJkEQKGFB0eFLyePCIwmnwLYhyB3/8MeUC8kErdLb4332bHa0cTdZm6+hJkGOydFM6nX2/1W1TTyqSwTsCteKDOVWSDCq6IIRrheEYHOmPp/1xPEzRaOuuY9ES3ZfXscJLImTKIb19lOKTXs+DvFaEaMyRnwDA1HCu3Ug6HLak4YfTWPOXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmTD/UAk6wbBkI+OBSheNaNjRlvzJADBqzqKzbZAtIk=;
 b=Gsj9cYImhzzk3J2CIEhGJIhyisAvPHLcPJlHVCd9r9NvctWjKzKcpZFbfSEGbhCRSaA0alVIPtG8DilatEq/Tl5ObKnQi1u98xfnHU0NEo3SyIctkMceRck8Q/BwQOA1KYMG1jdkzabiSFh9NSJKqO3bmXG4h7PeIJeFYyIcinxmIQ+RsRIZFHKZBIh49mYDiFaUM070ePbppQOSczV/7O80AfkkVJiKhhDtzBAg5kdFk1Ksa7QDP2drNrq7tsWeuo8oHEUf++rqKSSNvIZm7/JZ+vGzpW4Vlh4tGLX5zri0TYfHpXjoscA/SoRp8Gniq8vLFO9dKlKGuty+ix7kew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmTD/UAk6wbBkI+OBSheNaNjRlvzJADBqzqKzbZAtIk=;
 b=A+kENpt3fXFQHI9vKry/A5jWKPqmLIAiQ6V5ddHGf85QKApT7m/yHGwiMb3qX2btB8Js6Sg/OvhUSX+8ZhZ+ihg8xv1CUqzP4Zr2LGzBjPUmJNVHGjHNJ4pKEQ3hiiR57EspuMmrzzoOEGJsxdBRlXXdtSyK48QJC00XK37leaU=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Mon, 29 Mar 2021 12:09:43 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:09:43 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v1 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
Date:   Mon, 29 Mar 2021 19:09:13 +0700
Message-Id: <20210329120914.4527-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329120914.4527-1-quan@os.amperecomputing.com>
References: <20210329120914.4527-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 12:09:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89fdf95b-fa86-4f28-ee9a-08d8f2ab88fc
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB23201DF4CDB934487122189CF27E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KZmivTx093MwKapFknJCGIGF/Lqkskhar/m/vf6EmOEHCaZV5R+tPAPZ/lTWNkXN59RYTTKybavdSC4LJMaQNEYeM2mf4EdS3aApJ8Fsg165e9iCwGpktHcWQ4bAohfyYDLaK1BHZteFxdfYTfp56bTSq02WOqMiH3BdaBSnR/Rgdz5b/nRHEYEkZFmIyqSjg4sP6eaB/yMGyXu31grC009jwmfJl1/6o/9Wld7iSZauC/6hXSXbbcvRzAJs2ZfqrCb8SKvj7QMvVGfr9W0NufwXrQmHk6ftjdI5DWCDWh1fJDtyNuxNPBBvKArVcdtr11XuNRotstFD0Fr/luRbHD4XhWnWgZtEWba944ZYegY3mxUywNBbBvQe2OFlwXfLy0h0ZiKgm7NDJkyzr3KXp691QOGy4GQt2GCZfZJix+OQAvfm0r2N53X2z+j6lwOenBgXvYcfxmC30QI1XQJGZCJxuN6jgZRuxEu9/uBvmbIsl0CAlJbNin2UAdkeGezXl20UrIqKBR1q91i2OO2qI9ZP666OTSD5zakVG2H4wcThZekz+pwUqN+uYgRcd5fRKrZWZX6/SpzvsXCCd3Z2zJLWyrB/vNQ8qn10fVe217dk0oYBSGvBYfS8DqNYgHZKu8M9FUCPtzdgNNo1M86wTkC6ukYxL5Kxlxius4tMKoXbaP8c2rd1/qQRl9vWrCoX9XeWXD5PfrAG74z2wob/e/azw4kIvCbuK6/kv6l0uZWnpHng+9mNFM10+/CsQ1B5mRtKhjmS1ZeK3kInQYbAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39840400004)(7416002)(107886003)(921005)(86362001)(110136005)(6486002)(8676002)(52116002)(4326008)(8936002)(6512007)(66946007)(2906002)(956004)(5660300002)(2616005)(478600001)(26005)(30864003)(6506007)(1076003)(83380400001)(54906003)(186003)(16526019)(6666004)(316002)(66476007)(66556008)(38100700001)(2004002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1o3NmxTd3pod3cveWR2K0ZReUdWS3VrRzhoWHQ5WXlyQktBRHBweFBTNDJv?=
 =?utf-8?B?MUkrZ09mYUZLQ3luUSttWXpVYW0xMDFxMkRhSUdWRCt2SnpVdmxlNFdXaXVP?=
 =?utf-8?B?YkZqUCtwTE0zZUxtY2dPRU5scUdMTk1uL1h5REQ1dmlYSmJUelZiYUlSUnFC?=
 =?utf-8?B?MHpYbUZYeUliV29tUTVhZTd6NkpnWHF4U1RreG1PY1c5ZFpGTThxcjFtckhF?=
 =?utf-8?B?bXRadHk5WTlJcVNRYVllWjlvVVgxOGo4aXY2ZkR0V00zU0lMQ2ExUE5wOXh1?=
 =?utf-8?B?N1FPWGtXVVpHbHRYL0xWM09FekJ6R3M2eS9DQjNZcmMwYU52Z0JyL2NYQW1i?=
 =?utf-8?B?ZkJjNTFSL2s5YTQ5Q3VmaGRWbWx6a1ZZOTRwVFhKemV6aTk3RU1SV3NPWHNG?=
 =?utf-8?B?Z0drdjFhdjZHZEFwYXg0dmZNcGJGbG5oeTJIbDBaLytaaFN2VXV2NnBCVlVS?=
 =?utf-8?B?cWptb3NXSVhvSCtWTWlrOFQ2VFpnN1Q1TmQyVXIzaU1Oa1pyTTUydHRpWDdl?=
 =?utf-8?B?UGtQOEswNG00RHpoVmo5eHZ1eFJLbFJUOFJjYncrQjU1SllTWjRUME01UjFV?=
 =?utf-8?B?TUVkUDNmdXdORlNBL1o4R2NUWFpuNWpUT3B3d2JyenFMNWRQSjdzOHJNWDdZ?=
 =?utf-8?B?bVhRQ1N5eGJBYkdDMWVvbmphYVcwT0FTTmRnWTdiOUthWkZoaUdndHgyQytK?=
 =?utf-8?B?NE1YTlVJQ09STUl3b0QxUWlCRmxMQ3pCNXd4QVJyRGJicXEydjg4TFFDTmN4?=
 =?utf-8?B?dTVjNEZsbllpbGUzUkNYaW5uekdLbHVKUmhLQU9IRDQ2RmZkNUR4Wm5jKzVt?=
 =?utf-8?B?c3prRTZZeU1PWm1TSHpBMU5XVHZCQTNVcTBXc0w3T3dGLzVJbkFub2FFVTVL?=
 =?utf-8?B?OVlUK0NNajFKbll5dExWOUZWckJ0Q2p2YXlFazRXdjZFSmdhem9HYUNJdlpG?=
 =?utf-8?B?NHREWFJtOEpPdGV5dU1HcW41NEpxNEFoZTJYajd2ckFqVU85WDluTHh2aVp2?=
 =?utf-8?B?Vm52TlgxWnRUQ0ZTaEkra3hqNXU0WW5ZcWJmUVlVQVRkQjJhOFRlV3NzN3NI?=
 =?utf-8?B?YmRvaUhkOEVOanZxbFhpWnBhazlKMFBhd29PS0JVcXpkekdSdDZCZjhqSUJs?=
 =?utf-8?B?NzJLa2IxVmVTR1BCaEl1dXJUalpRNnBTaCtsU2NxZUxhbGFSVm5Nc3hBWHFs?=
 =?utf-8?B?MEZvQ25XS2NBVkxGYzJHZkpsZ3plMk5WQ2sxaEo1ZitYUjJBL3kzRlFJR0dr?=
 =?utf-8?B?LzBYV0FZbzRZazB0cThYdHJlWEtCU0pyclRSdkxqWFhNN1ZEN0t0R3p6Nlg2?=
 =?utf-8?B?V0wxVGZ5blEva3ZQUlhNa2xKamtLdXpZaFVMZTEwa1YvODZaa1huSkRSenZ2?=
 =?utf-8?B?eng3Q2hlYnRtcHlaTU56WVViUVhSRHVOYzB0cERkQWRNRkVnNTVHU0ZVY0Q0?=
 =?utf-8?B?VFhHRjZUUWZUd0NBM2FBb010b0lRekFxd094UUsvcE1vY3FueGZoc3YxVHk5?=
 =?utf-8?B?dmZYTlIzWjljcTljSUh0aUViRE44UStvY3JpYnpjOW1ydE5JMTdHUEVVNy85?=
 =?utf-8?B?R3d1S1B2QVFJdjR0R24veUYxWEtVZXlyTnFnZm5RVXVzWGd2ME5ZSTZ4ZGF6?=
 =?utf-8?B?SUVBKzJ6cms2MERxamI1V1h1dU5TcTZtZmhaaVpqNFV5MjJwUUQ0SEZyS3pS?=
 =?utf-8?B?Q3gwcE9EbnVNeWhuSktYZWZLeEtqamcwZXoxM0pSYk1NV3ZTUCtqSkZ1RW43?=
 =?utf-8?Q?i7mIWMoBkiJSBzmeu/0i5SOhwSyfUP0xTWGrY1V?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fdf95b-fa86-4f28-ee9a-08d8f2ab88fc
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:09:42.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqzxFC/MkzT29kH0KMo2g6m0l7QkepFMYv6ol6OQNfyxkwog/dVV2QECU0AwoUMU6WBdsISL3lGx+7Bre4Yq/2ZwSwBVdyfMoIGNXLjFxN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

This commits adds support specifically for Aspeed AST2500 which commonly
used as Board Management Controllers.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/char/ipmi/Kconfig           |  22 +
 drivers/char/ipmi/Makefile          |   2 +
 drivers/char/ipmi/ssif_bmc.c        | 645 ++++++++++++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h        |  92 ++++
 drivers/char/ipmi/ssif_bmc_aspeed.c | 132 ++++++
 5 files changed, 893 insertions(+)
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 07847d9a459a..d67fd204409a 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -133,6 +133,28 @@ config ASPEED_BT_IPMI_BMC
 	  found on Aspeed SOCs (AST2400 and AST2500). The driver
 	  implements the BMC side of the BT interface.
 
+config SSIF_IPMI_BMC
+	tristate "SSIF IPMI BMC driver"
+	help
+	  This enables the IPMI SMBus system interface (SSIF) at the
+	  management (BMC) side.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF).
+
+config ASPEED_SSIF_IPMI_BMC
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on I2C
+	select SSIF_IPMI_BMC
+	select I2C_SLAVE
+	tristate "Aspeed SSIF IPMI BMC driver"
+	help
+	  Provides a driver for the SSIF IPMI interface found on
+	  Aspeed AST2500 SoC.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF), specific for Aspeed AST2500 SoC.
+
 config IPMB_DEVICE_INTERFACE
 	tristate 'IPMB Interface handler'
 	depends on I2C
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..05b993f7335b 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -27,3 +27,5 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
+obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
+obj-$(CONFIG_ASPEED_SSIF_IPMI_BMC) += ssif_bmc_aspeed.o
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
new file mode 100644
index 000000000000..ae6e8750c795
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0+
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
+/*
+ * Call in WRITE context
+ */
+static int send_ssif_bmc_response(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!non_blocking) {
+retry:
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       !ssif_bmc->response_in_progress);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (ssif_bmc->response_in_progress) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+
+		goto retry;
+	}
+
+	/*
+	 * Check the response data length from userspace to determine the type
+	 * of the response message whether it is single-part or multi-part.
+	 */
+	ssif_bmc->is_singlepart_read =
+		(ssif_msg_len(&ssif_bmc->response) <= (MAX_PAYLOAD_PER_TRANSACTION + 1)) ?
+		true : false; /* 1: byte of length */
+
+	ssif_bmc->response_in_progress = true;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
+}
+
+/*
+ * Call in READ context
+ */
+static int receive_ssif_bmc_request(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!non_blocking) {
+retry:
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       ssif_bmc->request_available);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (!ssif_bmc->request_available) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+		goto retry;
+	}
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
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
+	mutex_lock(&ssif_bmc->file_mutex);
+
+	ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
+	if (ret < 0)
+		goto out;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	count = min_t(ssize_t, count, ssif_msg_len(&ssif_bmc->request));
+	memcpy(&msg, &ssif_bmc->request, count);
+	ssif_bmc->request_available = false;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	ret = copy_to_user(buf, &msg, count);
+out:
+	mutex_unlock(&ssif_bmc->file_mutex);
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
+	mutex_lock(&ssif_bmc->file_mutex);
+
+	ret = copy_from_user(&msg, buf, count);
+	if (ret)
+		goto out;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (count >= ssif_msg_len(&ssif_bmc->response))
+		memcpy(&ssif_bmc->response, &msg, count);
+	else
+		ret = -EINVAL;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	if (ret)
+		goto out;
+
+	ret = send_ssif_bmc_response(ssif_bmc, file->f_flags & O_NONBLOCK);
+	if (!ret && ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
+out:
+	mutex_unlock(&ssif_bmc->file_mutex);
+
+	return (ret < 0) ? ret : count;
+}
+
+static long ssif_bmc_ioctl(struct file *file, unsigned int cmd, unsigned long param)
+{
+	return 0;
+}
+
+static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	unsigned int mask = 0;
+
+	mutex_lock(&ssif_bmc->file_mutex);
+	poll_wait(file, &ssif_bmc->wait_queue, wait);
+
+	/*
+	 * The request message is now available so userspace application can
+	 * get the request
+	 */
+	if (ssif_bmc->request_available)
+		mask |= POLLIN;
+
+	mutex_unlock(&ssif_bmc->file_mutex);
+	return mask;
+}
+
+/*
+ * System calls to device interface for user apps
+ */
+static const struct file_operations ssif_bmc_fops = {
+	.owner		= THIS_MODULE,
+	.read		= ssif_bmc_read,
+	.write		= ssif_bmc_write,
+	.poll		= ssif_bmc_poll,
+	.unlocked_ioctl	= ssif_bmc_ioctl,
+};
+
+/* Called with ssif_bmc->lock held. */
+static int handle_request(struct ssif_bmc_ctx *ssif_bmc)
+{
+	if (ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
+
+	/* Request message is available to process */
+	ssif_bmc->request_available = true;
+	/*
+	 * This is the new READ request.
+	 * Clear the response buffer of the previous transaction
+	 */
+	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
+	wake_up_all(&ssif_bmc->wait_queue);
+	return 0;
+}
+
+/* Called with ssif_bmc->lock held. */
+static int complete_response(struct ssif_bmc_ctx *ssif_bmc)
+{
+	/* Invalidate response in buffer to denote it having been sent. */
+	ssif_bmc->response.len = 0;
+	ssif_bmc->response_in_progress = false;
+	ssif_bmc->nbytes_processed = 0;
+	ssif_bmc->remain_len = 0;
+	memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
+	wake_up_all(&ssif_bmc->wait_queue);
+	return 0;
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
+			 * Return length is: remain response plus block number
+			 */
+			*val = ssif_bmc->remain_len + 1;
+			ssif_bmc->block_num = 0xFF;
+			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
+			response_len = ssif_bmc->remain_len;
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
+		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
+		break;
+	}
+
+	ssif_bmc->nbytes_processed += response_len;
+}
+
+static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf = (u8 *)&ssif_bmc->response;
+
+	/*
+	 * Do not expect the IPMI response has data length 0.
+	 * With some I2C SMBus controllers (Aspeed I2C), return 0 for
+	 * the SMBus Read Request callback might cause bad state for
+	 * the bus. So return 1 byte length so that master will
+	 * resend the Read Request because the length of response is
+	 * less than a normal IPMI response.
+	 *
+	 * Otherwise, return the length of IPMI response
+	 */
+	*val = (buf[ssif_bmc->msg_idx]) ? buf[ssif_bmc->msg_idx] : 0x1;
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
+		} else if (ssif_bmc->response.len &&
+			   (ssif_bmc->msg_idx == ssif_bmc->response.len)) {
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
+			pr_err("Error: Unexpected SMBus command received 0x%x\n",
+			       ssif_bmc->smbus_cmd);
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
+		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
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
+			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
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
+			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
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
+	pr_err("Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
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
+		pr_err("Received invalid PEC\n");
+		return;
+	}
+
+	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
+		handle_request(ssif_bmc);
+}
+
+/*
+ * Callback function to handle I2C slave events
+ */
+static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
+{
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	spin_lock(&ssif_bmc->lock);
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
+			set_singlepart_response_buffer(ssif_bmc, val);
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
+		/*
+		 * First byte is SMBUS command, not a part of SSIF message.
+		 * SSIF request buffer starts with msg_idx 1 for the first
+		 *  buffer byte.
+		 */
+		if (ssif_bmc->msg_idx == 0) {
+			/* SMBUS command can vary (single or multi-part) */
+			ssif_bmc->smbus_cmd = *val;
+			ssif_bmc->msg_idx++;
+		} else {
+			handle_write_received(ssif_bmc, val);
+		}
+
+		break;
+
+	case I2C_SLAVE_STOP:
+		/*
+		 * PEC byte is appended at the end of each transaction.
+		 * Detect PEC is support or not after receiving write request
+		 * completely.
+		 */
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
+	spin_unlock(&ssif_bmc->lock);
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
+	mutex_init(&ssif_bmc->file_mutex);
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
index 000000000000..a2ee090572db
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.h
@@ -0,0 +1,92 @@
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
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	struct mutex		file_mutex;
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
diff --git a/drivers/char/ipmi/ssif_bmc_aspeed.c b/drivers/char/ipmi/ssif_bmc_aspeed.c
new file mode 100644
index 000000000000..02abfca90986
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc_aspeed.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * The driver for BMC side of Aspeed SSIF interface
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
+
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/iopoll.h>
+
+#include "ssif_bmc.h"
+
+struct aspeed_i2c_bus {
+	struct i2c_adapter              adap;
+	struct device                   *dev;
+	void __iomem                    *base;
+	struct reset_control            *rst;
+	/* Synchronizes I/O mem access to base. */
+	spinlock_t                      lock;
+};
+
+#define ASPEED_I2C_INTR_CTRL_REG	0x0c
+#define ASPEED_I2CD_INTR_SLAVE_MATCH	BIT(7)
+#define ASPEED_I2CD_INTR_RX_DONE	BIT(2)
+void aspeed_i2c_enable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
+{
+	unsigned long current_mask;
+
+	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
+	writel(current_mask | mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
+}
+
+void aspeed_i2c_disable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
+{
+	unsigned long current_mask;
+
+	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
+	writel(current_mask & ~mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
+}
+
+void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc, unsigned int status)
+{
+	struct aspeed_i2c_bus *bus;
+	unsigned long flags;
+
+	bus = (struct aspeed_i2c_bus *)ssif_bmc->priv;
+	if (!bus)
+		return;
+
+	spin_lock_irqsave(&bus->lock, flags);
+
+	if (status & SSIF_BMC_BUSY) {
+		/* Ignore RX_DONE and SLAVE_MATCH when slave busy processing */
+		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
+		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
+	} else if (status & SSIF_BMC_READY) {
+		/* Enable RX_DONE and SLAVE_MATCH when slave ready */
+		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
+		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
+	}
+
+	spin_unlock_irqrestore(&bus->lock, flags);
+}
+
+static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+
+	ssif_bmc = ssif_bmc_alloc(client, sizeof(struct aspeed_i2c_bus));
+	if (IS_ERR(ssif_bmc))
+		return PTR_ERR(ssif_bmc);
+
+	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
+	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
+
+	return 0;
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
+	{ .compatible = "aspeed,ast2500-ssif-bmc" },
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
+	.driver		= {
+		.name		= DEVICE_NAME,
+		.of_match_table = ssif_bmc_match,
+	},
+	.probe		= ssif_bmc_probe,
+	.remove		= ssif_bmc_remove,
+	.id_table	= ssif_bmc_id,
+};
+
+module_i2c_driver(ssif_bmc_driver);
+
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of Aspeed BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

