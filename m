Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4F733EA20
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhCQGyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:21 -0400
Received: from mail-eopbgr80040.outbound.protection.outlook.com ([40.107.8.40]:10718
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230154AbhCQGxy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:53:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCqbxUYPfsB+5AUium0/qtmfKSiGVoGp9MlIGeV7z0dhFok39Jtz6ovt5olTzWF6Sp1ZQLxmrvJMZaDgiyMHVD2DI4HPT/2wMH3I/G1zYnQfp9M2r5Nyy0KH49vejJ7sQDglRv1A5XxX5e0MC8f5V6nqTogURhfULp223l6SAphZDwGL+Cyj+6Yt6fN2S7a3PJsUuyex+WF94bxdbWG9w+FNLbROZA5JGy4UrAsp+HprROdgXuZcxY5hzxA1jrYTZtsZbY2y8Gv2sEdYMO8hJts+8eNBm+dBy33MaV6JqqXJlbxw3FEAiOuPzVC611/DeZf7H7obEyMiGQvSApO2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZBuag9BJWN9LNBfAcR9cSQnSNrF0a/e1GdfQqRPUIk=;
 b=buaH6Ilpy8upuqbnhUcX8/GMofCW9rJT4Yrz1lSL6jgkJFROQEmerRDgAcx0Q9iA7NlZfTiS3NsFaHgzI7E4QYwAZ+7frYHfzXbgcJr5KI2FAXVvgKR0aiqCThqofzMS/yqzmR8yjXSJR/lr8qCLymdssjVsstILUrDgKXYKYo8SnGju7YNeDG9HEh9ed+PTN5WerQuCaqg6nvuh4bbNkyIY0xnAXVo2ge25iLNlB84Ay6ljeeMssTMOMDT7AGxAGJla5u9ShINyWUdha2+zNOTws89T8GlU0wstrUA6jCoiAlqx52qBT9zRT5/39QfyWCTUnbnRUn9sg1EzNbDctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZBuag9BJWN9LNBfAcR9cSQnSNrF0a/e1GdfQqRPUIk=;
 b=d/iLdiOP/p76ndZm8QYZwmwupRThGe3dic2uYwKzesGbCDVhNwGmFfJKAmkNO7xYZJiuHUQsDf4KISIsxZWcmEc/GQJhLumgBRnzrxnTj9KV0XNtb32o7vJ2HwQfX+DDg8hhs8lVoAA+fVjeM8PbSrirNUwDEF5jsX4FZVfFuxg=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:53:48 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:53:48 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] i2c: imx-lpi2c: New features and bug fixes
Date:   Wed, 17 Mar 2021 14:53:48 +0800
Message-Id: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:53:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99473c99-6654-4f51-c7e2-08d8e9116a72
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091BCAC86A8D8B700CEE5E0F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAZeXXx4HfWtoRvvs8ClPG2WLfgy2lNHi+I9xJ8zeGsdMLVtWr1H9E2dnCSYNRuAuJDVBoLDYSFXSRRKN0J4gw2xsSviPrgwgYfjv11thW5eQyp4bz/gnEE5F2KPGH9OjhAk6xZYOAz7f0NJhHf4JBY5o6RAXkkPzYIAYKDou7CghgWd9+pcMer6LC/EvzsMwVvoOKNQp42qJGnA/LC+tYzKlZkJFya/1jra8O5cJXoirFl/iLuM8tT3qfXMj5aVNDsuM9ycmn00PKeTQVlL/RO9mr1BMPR0inpWl0EomcPdV9cuJjSmXxyvA/upWBKCGaaZLGK6mX4hftdNT89sxkMmqmD/qpF5SVRonqlKNBT8xHXDHsVg/n82dNSjN3HfezeCvPM31uRvbtg0M/Ql4cuG197f1R64DXmopx+HWujU/PKhXbd9fQW7ecVxPPnB6NnzhH0v/pSCJCrk98V/iPw4tV8vjC1RG8kiZgHn1pBjsPeoXV05veQYOGJ+V+bkrtCl1HRgj3y3tcc06L/1yc1hq4adkRDFN+nMwAgQzfwWDwXIOkcqinddqM6spcBHjGLbAN6dRxgLaCAO+wf5EiwnfTFtEVNTKE+c43HhP1siaxXU+iyMFL2Vvh2bKnFt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(4744005)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p8lrs+jp+KcFYNf5wNTudU6BOa5tsw+sB7tMvX23q3e8ErjjKoev4n9hy5Zp?=
 =?us-ascii?Q?IfBvkVHB1ul7/n/MH4NXtJDVHfa+rAyo+j+hVcpY/iBehCrFuum/cjupSJCg?=
 =?us-ascii?Q?Ou2mwKMWuNpDLlXIDqIaczuX+Ag9k2KnzMTMq9SWVnsS4EdvsdIBE2/noptD?=
 =?us-ascii?Q?bzbqpw+u0a89p/7nWNpigLRXLCpEXXrxtgcp6vO/5hzElGxQ+5kU92BBKIfC?=
 =?us-ascii?Q?l3dqpCBuOSwsTw5T+pvdYc7CA4dAqFFj25Xb0rYousXcDm8lDKU8KYm59jdW?=
 =?us-ascii?Q?j2TZy0KkoaTLYyj8Hjh6CXomt3J9MPSkboMVkgoSBcbkmglyHvSKp18m1hbS?=
 =?us-ascii?Q?ofE6i28dd5tZncvN1JvPaNNUE+tHW11pVwmRdvkG+DuOmLuSlxKkh+eg4+Km?=
 =?us-ascii?Q?mDDRkJVgps56pzVyJOLVu8lCO5dKXYGcupd1/Sjy3EreaScX6aLpZNmILCym?=
 =?us-ascii?Q?0F4KVFH20EiFR+M5XydQOYQ970vnRywe6PT/eZKEIUrPDx/NvScQoPUy6tZK?=
 =?us-ascii?Q?xs+S3XIObXa5KRr/r1wH9a0hxPtfdVmspQw4KpMX7bL/u+62b+GuoBZnW/8V?=
 =?us-ascii?Q?yG1RCshYKP6PdKoFyXRPIVgB8O2pRYNyVC5s4n6igetgjoFGwRbKBGJjsSmN?=
 =?us-ascii?Q?7pd/mw3L3t0UhCSDfgtvTTa24JE9MTFzoJDLdWozJbwi796/kg4PZOB+bxgj?=
 =?us-ascii?Q?XJ5cIsETQLUcuF52WbXVd3feJMAUC2vr4CFPjXOicvEuTAFvQyA2pm+nhxVo?=
 =?us-ascii?Q?7i8r5f5GdAmwMa2+Y8RFcPrwAomqtGUl5T9DFa0DvBJ4kra8JaWHEbsUmf7k?=
 =?us-ascii?Q?ZzNug0jQqlqAn+5DMSCV9Vqaultwf7miGh+RbSFJvuxS/NVblOCrTmT4rAaG?=
 =?us-ascii?Q?/GwlZlasmfrgekPdMJi4Wk/ftgszA/wd1TP9V0P1NFIv3y7PPzzheMydOoUB?=
 =?us-ascii?Q?tx4Hqzdff7VU3HCb/M73s78oEU7cXi15mjG6d0xXfTX4HBrq9utYDKII9G50?=
 =?us-ascii?Q?eKZrRYO+jWNbyx6g2GiGDGanXcvGgGWZdOnzskrTTJFvBCHMIo9MR/cMvtQj?=
 =?us-ascii?Q?jqei4/Kg3bU7k8oPLlgOV0ChoJ8ZgqFrRzbv3nxwUa4I5HEHyvdkk9pzCuHP?=
 =?us-ascii?Q?p/CekXeQl3b+dDrBjbOThy5U2eBrZ2cUXOv5XFogE4oA2YP2I0vSYZ3ttRgX?=
 =?us-ascii?Q?NGhr290qUHOSsJWNOsWKkOTBAlRUIAt4u8JChhq0E95vMAzcYCYRAICNAlkC?=
 =?us-ascii?Q?vp1vsfuHG3LHXbX+8gjJuhLyADAOklEA1W+ijNroTJUDyTGSp6Dd8yOnDuD2?=
 =?us-ascii?Q?TGlil4gVADIaq3EzRSZG/XOg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99473c99-6654-4f51-c7e2-08d8e9116a72
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:53:48.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKF2Ng5YIeumSslHGMdRstOEHkBEjPjORMT8uhVaRGOowTI/IRkAJSGoeWbXaLWoSgtVUt+Pq9I3A2O3UABAwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Here are some patches to add some new features and bug fixes/improvements.
Each patch of these 11 patches is made on the basis of the previous patches.

New features:
 - add bus recovery support
 - add edma mode support
 - add runtime pm support

Improvements:
 - increase PM timeout to avoid operate clk frequently
 - manage irq resource request/release in runtime pm
 - directly retrun ISR when detect a NACK
 - improve i2c driver probe priority
 - add debug message

Bug fixes:
 - fix i2c timing issue
 - fix type char overflow issue when calculating the clock cycle
 - add the missing ipg clk

Best Regards,
Clark Wang

 drivers/i2c/busses/i2c-imx-lpi2c.c | 536 +++++++++++++++++++++++++----
 1 file changed, 478 insertions(+), 58 deletions(-)

-- 
2.25.1

