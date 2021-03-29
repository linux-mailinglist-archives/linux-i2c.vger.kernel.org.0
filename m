Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51B834CFC5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhC2MJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:09:50 -0400
Received: from mail-dm6nam11on2134.outbound.protection.outlook.com ([40.107.223.134]:12160
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231578AbhC2MJk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:09:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEwMST9Gsdjyp+CuxcPrAtK+2c5tOU38gplNyrmtQrVrqNCnCZkqTNIBlSTtVAc6jVs1yks0Tdu+AkIaw9YJ2+sfnW7V+Yi2I8FzjppWeSp80DM/apfgGWO/XtJZCq/f1DHVLij9tnGbxSMisvVHJubc4T2Lt8q3u9HzmTVVvOXDuEWHfb0ezUdbYqrAukLrqrMvzyEjofJ4SKlXYZZ2HZgHcH5J2eSNUkdNzX8rVtVXRmOqrUuRS3sBlKr1q7VU2jpwfPYx+EY4t2ZZKWyOpxEk8Jt0enlKTr+raa3qJImKiDO7USBbAm2pj2r7BLxqvU0naebXHfw4Ho3LBfF0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtlvKtuM6MihIyIrL118Lis3UII/LxYHW7mF9vKD0s4=;
 b=Io3Bfx0ZSIXA5QqWDq9k+LyK62cN/MpE6v4HJbPp9azVqKEyM4KisTYVJoIpYdkm57B0RGCU5ftUF7sXVcKqY9ybPz0kpndD+KDTudritu5LozPj9HCadTQVK9p548BFVrsI56wMxe3y971AFjXL0mbzXl4rrqjKl4Gubp14lmoUj07I05LJ3x17nJK1HYTUuYVvBTlp7CqCrVSeTnC5t3ez+9oNAyMPu3Pa1eLEaY0YVc6I2OAsG8MlsUdxKZVkGHFJpcRA79Fsmi4jQXpNSA5b5wJaIRJdjz762XcIPl1rvjdyi9gbqkTctHAbLiuTLDq+DwSiQLAIIfjRB4Lj2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtlvKtuM6MihIyIrL118Lis3UII/LxYHW7mF9vKD0s4=;
 b=HJvUyOCVYASfrgtHOKh5fw7+w1DrzjcatQFYVETT8SUwPUqoTtA40M04hmbG1nI9h9S+gKs1Do8enti3z7fXt5ah0NcfFdPWr4LE8CN/IthvnpQO6CobijXfgz2jbyAfJaD0jFLIcY0ygQK98iqPGA6YIf6R3RnI1YQ/KywsQdM=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Mon, 29 Mar 2021 12:09:35 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:09:34 +0000
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
Subject: [PATCH v1 0/3] Add Aspeed SSIF BMC driver
Date:   Mon, 29 Mar 2021 19:09:11 +0700
Message-Id: <20210329120914.4527-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 12:09:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6503f41a-172e-4cfd-1244-08d8f2ab8407
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320A355F7EC138F638EE835F27E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWQbmN1IeQ/9NDDefGJpwQGP3nfpsZ7ro1kpgB0vXMCcaU3x9Rur8Ucf9xb9AgauQvCDMiKiAvxpePNfzEqkwr8eHfNEKlE2UKNt9lGBjgmiDlHaZYOY/EeREPn6+kQ7DGR73J2RX8O3AokbZ5ESOKKCcNTiVjdm4n2s0bHY1+8ME1HD0yjGJDSPsuewJv5B22B06WsMcfVquY1ToYys8O7Gx31VJugdMJcTEvxElTkTO52lZ2vszbAzjjWgOa/yFFmDNSv5OpRCvEIO0P/eKH98vvLqBGx9NYHe4sOJfFfCLv/f5KmMlE68arFv08ElGxmn1RJZjIn5FUGley/O4pGYsagpusFoNK7Ql2sTl8IVv+CsBikJyvFaja1wZkG1+EXOM6WSbOZmRchop/bdIQlPUuuuLN3pZFw2AHRnImqXbChu7ForjjnGnNaIRRqshzMJF3Qd2mef/Ieu30xTru6N9w15wzGSfxRpIPLw3F3RobJCGT8mXDOX/EKB1TfffP1OxWaQcWlGV3C+ZkzwX+AGXk85P7gu4n3x/nLHEpOwoSrdiRBrzca19Du7LGY9+n9dJtj4UtKUp7E6Hcuq7KyLbn4Jp1dq1KOvlVGNM3NfnuVRm2Cvtr7b22Cxn5/xLJDXSgpmEie+i/6ip9Y56WZZZp2Y3DCSCeAzxm/jhUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39840400004)(7416002)(107886003)(921005)(86362001)(110136005)(6486002)(8676002)(52116002)(4326008)(8936002)(6512007)(66946007)(2906002)(956004)(5660300002)(2616005)(478600001)(26005)(6506007)(4744005)(1076003)(83380400001)(54906003)(186003)(16526019)(6666004)(316002)(66476007)(66556008)(38100700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5njVkJq+schj7xWZe5EWzjoyRwMZI+a0jgmQg2NksCmVQAErq5SpIe0FFqS6?=
 =?us-ascii?Q?27O1gj+yiMwaWmi++fhOyKP/AT5vnNsrm+QlBT/V6hO/+Nsd9ZPhH3QydKf7?=
 =?us-ascii?Q?geL7F/7UEjwfNYdztKXg07H4JFLLH/1XdbiNHUumORKV7BqyKpR14ix/rklY?=
 =?us-ascii?Q?afXvfTLuItfdGiKxEddJcUxLQgGMpfw7k3TOVyNv5PfUh/WJ0xZr2xau+mfi?=
 =?us-ascii?Q?z5NfvtjGyHIGTTxqLYwkLEvX5AIZUPG4BxKt/xcOeJ2j4kE2OvgH2ed72Xj5?=
 =?us-ascii?Q?JthtUCetomVfILAVI45imYiNbwY1Sp7a2YmI4AwmDmVr+P5HAmuInQKk3PU/?=
 =?us-ascii?Q?Ncb5UoOdIfY3da46FCDT6W3tyGyYD2x78yNNU/S8TMBRhc4KBdDC8R8SVBoQ?=
 =?us-ascii?Q?o4vk/yIihxu4C4UoXwhhjkE3MOTw2q6Ga5500Uo3R1IW7/JPJp/rMw8nXw+J?=
 =?us-ascii?Q?JTHb4h/rAMIaGL2suC8MJX2rJiyBEXf9Ws5CsCd7s93uXP9IKlIW+meQ5pU+?=
 =?us-ascii?Q?YtzfjxMskA8OzLGTgK3xE7ewhV/Bd8yWUyVd8QaV6rSeFqkBCerp40T1naIm?=
 =?us-ascii?Q?UHjmFhbMe3DSheGyxRzPRXLoSvUt5M4j6q7ZOM5/I4vz7GmSbKfVfviWzPx3?=
 =?us-ascii?Q?j5HnjkJiKHsT0Sclsk/mhN3/6lCidrn0Ezz+TwyLjJj5ATjSZitQI6iNUc0J?=
 =?us-ascii?Q?D9hQP+GUbUdZWvFdm3aCkEvPZlTSJ3Ygf56trKmbicycCwG9GvLLlZretxmk?=
 =?us-ascii?Q?aauvcuru7qm08p/geLB0EwfeA9A5fX43RifLGnOGCH27Dtz2dc54cq1irWUg?=
 =?us-ascii?Q?hUQPR3lWLiDQrZk+cH4/XuzUWKslvPOzlBP2HmsCEDwMITQ94Px58kWczi6P?=
 =?us-ascii?Q?6xVCX3ZggFQGNtB3FFu0UAkldW7Gs4JEQGogdDHd4XruToigfUwVDk57XF/M?=
 =?us-ascii?Q?7gesQiTRZDYTJud4JdjQH5NxIrVF1z1ZTfbocvX/FbMBpBPEvrgpE9h5v/Gd?=
 =?us-ascii?Q?1jSNXxc+chlm6rqQn+7UnFegpjS97VOh6tltlwR+VUDm1XqMCMT4eu8okcIX?=
 =?us-ascii?Q?rY/gGxIV8utjVPt+k25I8wk+8ytv/CFmJjTmuL2VRDqZibXFqz5A/DA/absa?=
 =?us-ascii?Q?NEkuQxUjTkcwsFS7Vt9WPCeJNfu+cwBjBab021v+IO8IIvbOQQIILKe99nBG?=
 =?us-ascii?Q?7/b52wYhOgu/H31ZC0tzG2aztMwW+EsscHDhPUyJijyvvB0d/NyhAKnBFWfZ?=
 =?us-ascii?Q?TZbkCcwLTHgTKlos/U4r5wgmx35B8mfIE95NDI+BGfIx1ULOk0vZJOJiWaOW?=
 =?us-ascii?Q?7jC+n1R2oTVOojn73fuG6Epg?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6503f41a-172e-4cfd-1244-08d8f2ab8407
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:09:34.7157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HqrnXmjVFWdgzC6L1yzgNNCgdnbt0N/vPxt92jvWbdzkjv+dtXrmOOXlwCCKYw01jhAGnBukpwEXPRkO/qoPuKrG5oi0/dDkUrLS5WOVFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series add support for the Aspeed specific SSIF BMC driver which
is to perform in-band IPMI communication with the host in management
(BMC) side.

Quan Nguyen (3):
  i2c: i2c-core-smbus: Expose PEC calculate function for generic use
  drivers: char: ipmi: Add Aspeed SSIF BMC driver
  bindings: ipmi: Add binding for Aspeed SSIF BMC driver

 .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
 drivers/char/ipmi/Kconfig                     |  22 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  |  92 +++
 drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
 drivers/i2c/i2c-core-smbus.c                  |  12 +-
 include/linux/i2c.h                           |   1 +
 8 files changed, 922 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

-- 
2.28.0

