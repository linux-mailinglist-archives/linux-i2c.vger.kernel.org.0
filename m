Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6D73C7CFD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 05:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbhGNDlq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 23:41:46 -0400
Received: from mail-dm6nam11on2103.outbound.protection.outlook.com ([40.107.223.103]:19262
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237486AbhGNDlq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 23:41:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ4BePB1C+Dwc+Uj7mHgBNEIlEo/18ApRsk2v47vK/YtxWcFHYjbLLTaSHVAAb9Rx7CGb5ctn1hNwduOGD4SSi+zkTFPpShftY0WjvrFD9WUGWUKDyQpV5hh+vjD6m5sApKoof/V5owSTxqtZOQwTuPIeRMLdeHt2QRAwWXL7VkQpt1mtOAKrEe82hjGD4QkVBHeztx/xyvbTCmEVeQm1DgRfQbJG2Gcg0sAQD+EBvZ5FcCENCfRWg46woKUdPhekaFgQddQ3igOcnV9qtx/hah65y8bhlZqt/El77KoAGqOz5jvRHtF5c+4EbLq82aqKE5nW4WVf+/BSUM5K0hywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImhiR2PiuZEgeQZ69qvRpQa1OwamJrnU1zi6QoXjJOw=;
 b=oDO180dMu9BQy2gtmSE54RS2Sj4uj1E2MrGRoFRxLUvPXwb7cMIiI8Xsk8w1Y5GsZaQfQSknDI9gc/ZwylznkjWl8fcqU/Jm6Zoh7Tv6JoA2119YvFbCuWnY9Jj7ed3NI/Qdbuh4F5HHXFzq3kM+HdfiDgAJYY9IyROFGdN4hezh+7haYYFN3xgOqI8tFYCvFaCWnm1pis56He4O9YjWRPUrZM6o7UJjBvXnRabwBxoLD1xVCIoyvhdGV9MgO5vfiMd1eUvUpwCbB6hrI+tW549GshSCL+WbGSGmnXvsADeBuDw3t2wBHC5g/RXg9nI8LQNYI+bgheMaY/22XT+Mww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImhiR2PiuZEgeQZ69qvRpQa1OwamJrnU1zi6QoXjJOw=;
 b=dvw1YjyowR1PFDogIqhwX6kKptsB71BgwxL7bim8mh6e1EmHgA9G/UnqAv9F2rv+TuDL9qhKqQNtTTUmy75dGxZdMZxh1lIOUL9PzzFTYoksliieFJtXOvoJdKQB7F+gKFPHwePsfC4rznVYXfWxeAgGz1nzdKeN5LroKjrU/9c=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3370.prod.exchangelabs.com (2603:10b6:302:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Wed, 14 Jul 2021 03:38:53 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 03:38:53 +0000
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
Subject: [PATCH v5 0/3] Add SSIF BMC driver
Date:   Wed, 14 Jul 2021 10:38:30 +0700
Message-Id: <20210714033833.11640-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 03:38:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e09e8f0-51df-4fdf-521e-08d94678e68f
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3370C2E30C3CEEEE48881693F2139@MW2PR0102MB3370.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PvN8z42CH9MeCuAY4yTjDckVAUfO4bsNhAjnSLG3yA02/hJSOQD7HLLkRDdNKgnn6VvugsOAbQw4xN4rbj9V51h+xUWW88USQglGPqIH5ZnGeSIgMbrdRXrXjbW9b6UB3zUZMUN+Q669oHOmqQmUptf1UjJatlqyEc5EOd+ebesopwTAjDnYoMl9Avxo2U0IPqqyjxNIdxW200ZTbnvKKS3i9TCPydXxPgEdYRUXJUDJrOWZITMsUL9tIgaCJ6EBu+HxkBblMsdeprO6mqY7dme7B04wZ5d3/gvop5MXoxlMDCSrz2as1OsigBoTdanapAvHgSSxsZ7tvgDdfcVa4a8gMeU/+E5qz23PVfbm/9ItKsR4Oa0JGWigms1O/siF48qdEPjC8v3mlJigxXqZzRNtdejFTcfurhraVCwvCE0FlS+65tQYLhZbCYDDKzP0Q89VVg+/UzJnBoOr+yiAIvBmuoQBpHdhDHxIkaPGPC4aLhUucfiPOnvdCracsihjPnPvA/IhNLYH13i7xZUhOOQezqTGgg0GukLJIVmGuUVHF1B9lzjM3JbOFAqEt+44yi1PWrraQcfsE9Mml20Mi5Chr5cUgalctjQeL//3CIzSTl12VIoSCG3GHh5+SlL/BsLx3zLC2y9cAd9XRs8x6w+oMTpnS7nlPe4LquwH7uxN1QEdmG2XoueyUTUltEEaa8pdi3LolbHfi57oOfubUAqVroVJmkaCCHoQu8L/Ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(4326008)(38100700002)(1076003)(38350700002)(2616005)(107886003)(956004)(8936002)(8676002)(6506007)(86362001)(110136005)(52116002)(5660300002)(54906003)(2906002)(6666004)(478600001)(26005)(186003)(66946007)(83380400001)(7416002)(66556008)(66476007)(6512007)(921005)(6486002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pvt+ODcwXC1oetct1FR2D2YHZvu7BjMSwySK9qTGYz9h99j/lccXNSxUovgq?=
 =?us-ascii?Q?INbK/G3amvZwzdAzongWI8bOAopyAGz4RPVVvjInSs+MxJNWDzrFu4dkM70M?=
 =?us-ascii?Q?ux6KCSPxv94FIfCrzxWZdQeIthUW1u5DunyBQUoGFC51dEpGcF6DeFWmn4po?=
 =?us-ascii?Q?VQnmiHri7RhhYrRJruZEr8JQrAep+RJes+4zEFM9p7PuNGdA+58KO9bu0/Kp?=
 =?us-ascii?Q?23P6IRs5nahlTPCiML0BonmnlvdKjGXKAhSzf5tiaSCSy93SIU1jZ0F76tTy?=
 =?us-ascii?Q?oHePQFgM9LIk72YG2ITVLjl5sGmb/C7KlORgDtbUqhgvmnn1gwLDOjvZ/uem?=
 =?us-ascii?Q?ebbZkZb48vaLYUAF4h9ZYSdHng+bQur2RCUJVvCCPZoSuoM9ZDqB4gtKk2Cx?=
 =?us-ascii?Q?AiyhqK/k1ztRUB+MVRDQNyezVdXbDYQEXmThGSlEopBc08/ynWp3R7u7UhQ3?=
 =?us-ascii?Q?bxPqQXnY2Dbu6GmuW4kfx825/E1UzDLNGxzVQgkxznuPt+pnlWDn/YjQZHF7?=
 =?us-ascii?Q?vTesRTTwgJaTMeue+zDGU/36wWVJYPJ8TRnrAw0FDylv5akwvRlhJ1rfXWz3?=
 =?us-ascii?Q?1pCeHe+/NQtDk+DopEUwi9ryJptGL1vYqpNvp8rUxrHKHxaNeQrZqMGvcI4/?=
 =?us-ascii?Q?xe2mIxfNGIiRFnJ/stz6BAvM0IBVoZV/nKik7DAS0Z5z2R8e7ihH3qTy4J4k?=
 =?us-ascii?Q?53lc0Qp1+ZUwMnFqVsDbszrPua9dNLCiBkC72NwM6cAfaaxz+Mx5uEHUQ4FR?=
 =?us-ascii?Q?JHe+JnF/cub2Lb9O3wwySJbkRrXs4IPcaA737mo+/5BY9hgDdmJSC5galbuR?=
 =?us-ascii?Q?uogSa03JsRdFAm99f6OhuzF76JUO4iBCIWo5PID631AFDBXXePcluS2wcdrl?=
 =?us-ascii?Q?bHdCEkxBmIOzXWlDCvW42zuhoNpJlaXL0gvCG6Zf5WWyNxlE55LqkpE9TK+w?=
 =?us-ascii?Q?eN1OGsoPGBFEmdKUw2nFN5KPrm4dl3Shi7u5V4eP0TaT577EX6eZl4uI551f?=
 =?us-ascii?Q?c20F9GFIPW70kR+VXevGfSvOq/tpRSREcUVGf2956CXzg0M4a+bvLvIwxyb5?=
 =?us-ascii?Q?i5uK4rwpjurHG4yDEpMeBCmRo5YtNQHyfryx7FqgBEu/cvj8iNwnp+egqIWx?=
 =?us-ascii?Q?xa8nGlGMc1TpyYGOPEmEQFj1QbEdIVfSmTKpCdQ4vE59UKa8mR/H2XJ5SkPu?=
 =?us-ascii?Q?sxAbb+/JZntGvhoVWfxqF4AJmAGS/VKHP7bxFu5kOKpQ7p4gW6g/BdL0vNCJ?=
 =?us-ascii?Q?PUW3hKThJJWmcjHMVBGwqDRHdQk6vK8e0tW3gOEDsIAcMbc+WBGxJgmEYLgU?=
 =?us-ascii?Q?M5bBWsnmcfUbWBdfPsTpw6Dm?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e09e8f0-51df-4fdf-521e-08d94678e68f
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 03:38:53.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmFD/oZNSaBeOlzhG8T89USjambVF5iCG7PHdmYcMbl29xZ2qNIfjbHxzVfziDX/0inN6IdAP1exEvJ9o82OI3PTL97c0d98fSl3P8gC0g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3370
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series add support the SSIF BMC driver which is to perform in-band
IPMI communication with their host in management (BMC) side.

SSIF BMC driver in this series is tested with Aspeed AST2500.

v5:
  + Correct the patches order to fix the bisect issue found by
  kernel build robot

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
  i2c: aspeed: Add slave_enable() to toggle slave mode
  ipmi: ssif_bmc: Add SSIF BMC driver
  bindings: ipmi: Add binding for SSIF BMC driver

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

