Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB333C69F8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 07:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbhGMF5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 01:57:36 -0400
Received: from mail-dm6nam10on2118.outbound.protection.outlook.com ([40.107.93.118]:60449
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231971AbhGMF5g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 01:57:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noXVBGl5tkZMgc7Xd5HWOGdxiUwHO8A2ITDaj2jHOGXggbjzhyiChyrp0fz4haAhGrsb4+Mw2lxcRaPYQomancXjMIjZ5FZjHbumOCcjVp5BpVJhncso9nOX20q04lKai0YVa3YqSAN/GV0rCh0YD4M8WC64OauXgGYOpRtdhxEOVJLetq/t1MATUpj6gAaJw/O+C3XfCbZGGiLXJkPVMsZ91cvr42/AWjiIxymVxY8tJB+VRIdthNYA84xzADW4qXrWcpn6ClWEVU022Rg2f2jY3WFQwgmUiqWi5U0QZeCOr7yXIXjQCNYH6Qg4MN73AnlHZxuDxv60ccvSww5FtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IErloZA/PsJ8Yf4Nai0BwectqjObW7+Y46dkM61/fuY=;
 b=OjNEeA/GzJTKCQKOaO+bFHLL6pTL3YKr+lp5OmGGW16xtTwUDWz9bxvYTDXVoIPvBldemhQmM1En1+ejvLemQ9b382rmlOSk0G33rBlflpbJzU+PjtdX6oDbKr+47gWJq8vjcUtGPRfZbnqjVVA58vbvoQ08S3xi4W0JC39LAYDH4afA2upxTiQ/PCPmHDzNd+6NtT2YmXki81PxO948mtbFYBDdY5epLanGEDXCccbm4d1mfIiVcN+aK3fJM3hZHZ3ddrhra4zxMkDXI1dkD4d3ArI9J2nByhsZfX0w0gAWdyHdU9vvvEDg00dc91voX3p8IKEJlTqDKaT8XzbK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IErloZA/PsJ8Yf4Nai0BwectqjObW7+Y46dkM61/fuY=;
 b=N2oqlQUmHwnoQ87EXfcgGnXKwgJvcW45mRpnt4WEQFN4QegAWxL9OpsrSX59Yl7SyBCzliXW6kEBnsS+jD1Q4055wIkfsh4wcy6Xjnbd6bBnsBybO1YgbrceplouS2tjGcOR0uHIRHDZNVNv9Dinav/Qh9kCDEwVYXvU04m9oog=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6535.prod.exchangelabs.com (2603:10b6:303:d9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 13 Jul 2021 05:54:43 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:54:43 +0000
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
Subject: [PATCH v4 0/3] Add SSIF BMC driver
Date:   Tue, 13 Jul 2021 12:54:22 +0700
Message-Id: <20210713055425.30636-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 05:54:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f69ebcc1-5f8e-48b2-76f6-08d945c2b60d
X-MS-TrafficTypeDiagnostic: CO1PR01MB6535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB65351F7C73EEC093E481600DF2149@CO1PR01MB6535.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfOwJCLShIMgA1gVQVpJBjNCnomamnPd2RllmPsD42ryF15BAhbBCz0yPkd/880B1GkTv8Y0MAvOsZIz58Mnvj8vr2d77Ty8xa6+TsS0Y7AmT6GXCOp1k635GGJ03qGU8m9ojau9oUI4YsEUN7Z30LrUtxQgAHhkELVeYKYwVDmzYQJhnAmO3lCUgtQDV7Q9cvYacnpO90mvoYQE/9fbFPTHd74DFS5p1RKlXLDsEUYFcYIG8OKYxslIjgTiQmzC1mPTMmtA2bRTBrenADtBvEffvqMVW0oc2Y4+BkxX+I3IRdZb/sSPlydn6aszUapmxI9fLl7YPrH7OQ8kCARbE+dpu/phcLFCnh4PeeYNqOAKb8l0rnvZL93jXnxzVB3DNoxJMmqINqSlwV7+9x/rC6ogQCQB9Z2cpMtLeIG2xLB6GjEjtwW7QEBBxcGu/+kQxQJOARh9R7NmMJifcF4PBidq656x2X4ZwnnldSwsiDzhWVvJ7Gfbk0xgLJ2T7LYrb9ttxQb5AqybDD+XNR3sZ5ZDJKsRr8rA2W2n9ih1FIb1MS/9tF1dUtLxA76rz0LtlSHZ3MCQZ/7nBbOSgrh97AG1qOxvmzC5sc/a4bnfe+wa5jGm38aO1ilf0rW3MaJ4jc8tvhe0caDVRWZIbF2KzaqWiqaqRLk93l+2tlm9jobrA83JQtIlz5Lk8KXf21Nkc/6+L29GcmRxn+mtVs2F4pJ4caSj1Hy+8XPCwuS10AM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(956004)(8676002)(54906003)(86362001)(5660300002)(2616005)(2906002)(1076003)(7416002)(52116002)(66946007)(107886003)(478600001)(66556008)(6666004)(66476007)(6506007)(921005)(110136005)(26005)(186003)(38100700002)(316002)(4326008)(38350700002)(83380400001)(6512007)(8936002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Wz7Yj6u3CH6zOWilbPfskaAzauLpfwC0eqtWm+9U67FIZqnV9/N5IFQdXVM?=
 =?us-ascii?Q?NIeBsX2j7oInUw6ORsKq85/6/DyBx8z5JfYvrFiPg+Cqyhzqgmj2q2u1M6R4?=
 =?us-ascii?Q?jdRZgM1fzfHL6uevIMCIvarTUh4JJ5YRSCFL7e3b7EjmfQs6mAVtRtTjWoy0?=
 =?us-ascii?Q?oRgfNryono61LmurVcH5SsOm0fdo8B1okc5jrEyEz0VMA1D1GBeB0In8AXr4?=
 =?us-ascii?Q?6XLNlvqhhgsEXvDeEAy16PPQde6ewTGPtsPOCCWUkNXsTp9CoEAFpVLgnaOp?=
 =?us-ascii?Q?dh9WOCFYGWa8P9/GWqDyr5vjp2Q7ng5+RgnzINgzQszK4KaXy0q5yL5rb2bY?=
 =?us-ascii?Q?/FowfW6r5mvUtWvUFjzt4NJJW7LZjdzCNxr4+EVUpEDPBtzvcVFZC/16UqJD?=
 =?us-ascii?Q?5Cc+CuoEOcGY7lYdv7gnKxWlsUvEfgjmCfd/LCAeyO8p0WrU1UZiCp565VG+?=
 =?us-ascii?Q?VlAjFSqobeItTkS6NMZHNznoxhA9Bz7F1XO7tk2Hcg56uoecZbsJHMi0E0FX?=
 =?us-ascii?Q?KgEC33v9dYMWZXg4KZfqlEqSGq4kGCAvy+Fs7OYXAE/P6fyiTM18LIr0nSUZ?=
 =?us-ascii?Q?/CbShUAjcV0I16DB6BiTbm4GUoCovaEYpexAm9IE2qB8Ixgm3DDgy4Vk+0Be?=
 =?us-ascii?Q?weouzrKyAM2h47Kvcrg5MHVZdhG6zJk6ixiR5V7vj/anK3QaraL/N2odSi8v?=
 =?us-ascii?Q?cBR422MVPw907F1jCe3Roesknk0VgxPGOWOZR81c8nm5e3VVPMD49nXQfQrp?=
 =?us-ascii?Q?ACPolvV62m0/8i+cnz2YdeBDdHV0XETB0dLaJ0YdmxlIyj4e8uBor0cl+S7j?=
 =?us-ascii?Q?xByYG+4RjNP4LzHN8W6IXV2Lqma/QQO/+eHVb7lJ7XEmi7Fj+049jsNTyiS5?=
 =?us-ascii?Q?iCEP3Z/7scmd+TxHhaDBNj+tRBDbGLRy/Oa8Dx5huW0o4lXJXo7foMD2C5TU?=
 =?us-ascii?Q?K7GYG1wWLASXYm6unG2OcodNDLlilde/7b8yQThyzO0Z856+EGViQzqH9LxQ?=
 =?us-ascii?Q?lH69/W3+0U/JL2K6C6TaPJVUmV333G4V5CyXqD4njPCb5707j8M9XIl3vvMU?=
 =?us-ascii?Q?LT0I8zxlvvl9rsLtXL+dRuwltAFTgDFyVrTBwQjnrTUyGTOMhgbmxo9912fK?=
 =?us-ascii?Q?3Fm0dRm7P/8tJ+JHFmmDaUAm7ume+NsPnqtPy2VAXoC+OWJsWS71Oq5BWrZI?=
 =?us-ascii?Q?tKbQbnIKb9UlHug5bHmaX9kHrl2PROBmfNYTIVXpS+OifMKL95CPlfEDeDc+?=
 =?us-ascii?Q?zvn3N4R8AaKRtfRnuEw+kNEeR0N/NJ2EoTaq+BnXOBJQKwPV8HoMAFO25B33?=
 =?us-ascii?Q?unv/geLdQomQdwS1JjV3AWjo?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69ebcc1-5f8e-48b2-76f6-08d945c2b60d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:54:43.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj7N2U8YxlOa68+EstTyyYAa2Jt44wyUpSc0u080y7tISvV922YtqfnsXlQdUFk4EfNdpO/qU7/05kF5QYvgpr30/PYV+Md6hmLoc9/HHks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6535
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series add support the SSIF BMC driver which is to perform in-band
IPMI communication with their host in management (BMC) side.

SSIF BMC driver in this series is tested with Aspeed AST2500.

v4:
  + Fix recursive spinlock                                      [Graeme]
  + Send response with Completion code 0xFF when aborting         [Quan]
  + Fix warning with dt_binding_check                              [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
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
  + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
  + Added slave_enable() to struct i2c_algorithm to control
    slave mode and to address the recursive spinlock      [Graeme, Ryan]
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
  + Switched binding doc to use DT schema format [Rob]
  + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
  + Removed redundant license info [Joel]
  + Switched to use traditional if-else [Joel]
  + Removed unused ssif_bmc_ioctl() [Joel]
  + Made handle_request()/complete_response() to return void [Joel]
  + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
  [Corey]
  + Remove mutex [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback [Corey]
  + Removed the unnecessary memset [Corey]
  + Switch to use dev_err() [Corey]
  + Combine mask/unmask two interrupts together [Corey]
  + Fixed unhandled Tx done with NAK [Quan]
  + Late ack'ed Tx done w/wo Ack irq [Quan]
  + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
  to fix the deadlock [Graeme, Philipp, Quan]
  + Clean buffer for last multipart read [Quan]
  + Handle unknown incoming command [Quan]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

Quan Nguyen (3):
  ipmi: ssif_bmc: Add SSIF BMC driver
  bindings: ipmi: Add binding for SSIF BMC driver
  i2c: aspeed: Add slave_enable() to toggle slave mode

 .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
 drivers/char/ipmi/Kconfig                     |  11 +
 drivers/char/ipmi/Makefile                    |   1 +
 drivers/char/ipmi/ssif_bmc.c                  | 781 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  | 106 +++
 drivers/i2c/busses/i2c-aspeed.c               |  20 +
 include/linux/i2c.h                           |   2 +
 7 files changed, 959 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

-- 
2.28.0

