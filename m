Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31106395BC4
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhEaNYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:32 -0400
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:23652
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231924AbhEaNWd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:22:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP0fMApdJgknp6Vz5c3D+TLoTRr3F6yTf/g93h3Bx46L/Dk4bYfHoBDR0xl65nFWHPbDmgTOGHDwDV+nIVKbwC+GsW+ZHaVJ/1sHoSW3xb4xvRCh6NU1YvtPVgStIgdBVRd9NA9Rvy1nA2h+rSGZUifcDSoXLPxRyuQ0gDEcc0eQt3r+3He6W0bvjYqErbHgFrkF9qT46IV7BBlmFu5QIZ+noBGLVWLuo959dwbURHH9vqArtFkyXmSlGoP4cRaL8yfEVlnkwgPZfVXq5WSekyHdQF6pxR9DtUxsHQBOt5T1+JPje2v895brPfF4srcm4nw9JtzSsFt0KrMJct7vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1z4OMhPhSkvJeRQDGVsEf7dW8OAKDLCXAk6JENSbCg=;
 b=ABjVTMhbVDDZd0wi22RSSW3a/N5iGAnFuZTegHfEXagv+0YlE1rnsKrSu2fSgdef+KEBfaiuJpwDfIO+4+j9HC4DM475GX0NVJ/LbQ7ZMjAeN3zM9q548GQwJqjxCjeMDNJye0z7Ah1wbjf037qFOTclkxicxFzQgTD6HXOJeYr4OHBfe2FMjU0eP9gOOjPd3WbSRkOWVa2fWUgrzwO/rc09sRQ31lLoVlvywWtvywBcSnhs07Wv1yi79qDkeuuAp4eRh3XFKPMFbFuVzEc4GC4w+MMMd27dyPNPrWMX1t8AhxFruhn52KKS7glUSq935WHEXkXgigyvZlOHSowbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1z4OMhPhSkvJeRQDGVsEf7dW8OAKDLCXAk6JENSbCg=;
 b=GjUV6m7n0HsUcbFBNIWwCGOhso2xAFHEyEUtK6NOWX8syynQQWdwLwMSaNbRJxQlPZAVc+gGoxNwhOyTQTSvII8ntkAYDBagXa1uv2rAds7xiFtmBlGJzrGsEWWI8n/eTqi+PQCB+VtZTTLsrMIUMdgUcrUL0bmIOn6fUx3CXdk=
Received: from SN6PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:805:106::18) by MW4PR02MB7204.namprd02.prod.outlook.com
 (2603:10b6:303:7a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 13:20:44 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::2c) by SN6PR2101CA0008.outlook.office365.com
 (2603:10b6:805:106::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3 via Frontend
 Transport; Mon, 31 May 2021 13:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:20:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:21 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:21 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhq7-0004GE-Vz; Mon, 31 May 2021 06:20:20 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 00/10]  i2c: xiic: Add features, bug fixes.
Date:   Mon, 31 May 2021 07:19:38 -0600
Message-ID: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c46e092d-f525-47bd-0837-08d92436e536
X-MS-TrafficTypeDiagnostic: MW4PR02MB7204:
X-Microsoft-Antispam-PRVS: <MW4PR02MB720420E9F73A3AAE09114054CA3F9@MW4PR02MB7204.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWnT4KIwghWmgzAfTGhac67EStcjNFt3LGs8JzMd65AMQDs+9Ki5EI1uoQz9ShawILQdKOi76MMKGrKaj/47J235SlQfl8imonhxaMk8OeSfq0Zf8B9Ga38OCYishkK2/CTg2ONm81bc0Cb31K9hmGfnYgtOjofhUTTRfuMV0Xo5OrM2YcevsRJWoAjzlGj2e0oJ26KGfspsioxfzq3o08HiNljeXhfs49RqtkObnZKai3qAKqxdZH9SJlRRVFjH3DXQ0oYZTK429GUm8ImITMUXMyfTCNtwcD53K88k94xl/aBi2CldI9vFUkgUdK+yHQBzdifusOjQWA73449KF/Uwlj8nbWqLd42Biy+RB1yx7awHkpsBGiDZwojT+Pz+VWb0XgrHOnKql2Hx8WCf6odlZ8/I7zxih/4/HXVAH10xas2/vRaXj256MWd64m8P7+jpXmGOIc6ylJO7L5LYXQnLbd0ITuz5/Hg7oVnmIZNMaKyTHQNojC90uimvoEvXu8ApH1mOxJtJcTke/xkpPZQZTMnhQWO/pkQuYqzkvwitbjvGvRPkNnylD5fsWIOMW9DkO9ZTU6LUBdPHQdOOkMccUfAgogHPtX1KBZFj4QyAyuNViBSv5wl5J/uU+TpjubnQTU2qa/v1aT9CECxhHZDolxns2SdrlV4Q9vjK2WfHBCCY1hEczoHT0bHn53QuoHfUb2uIGWt2WEUYasZNcWxuC2TFn6V4uleBDNuYDrGDTul7IgGudiJnX2NNm7DN3TdosMuR+dHOdUn6hUOHdGiNtiDVBv7MbWuBhcKXNYiS8/OBEDjBMKj+RFKGXatg
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(336012)(82740400003)(966005)(26005)(2616005)(8676002)(54906003)(9786002)(1076003)(107886003)(36860700001)(5660300002)(8936002)(316002)(426003)(83380400001)(70206006)(186003)(70586007)(110136005)(47076005)(7696005)(4326008)(36756003)(478600001)(2906002)(82310400003)(44832011)(6636002)(7636003)(356005)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:20:44.1193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46e092d-f525-47bd-0837-08d92436e536
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7204
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Add 'standard mode' feature for reads > 255 bytes.
-Add 'smbus block read' functionality.
-Add 'xlnx,axi-iic-2.1' new IP version support.
-Switch to 'AXI I2C standard mode' for i2c reads in affected IP versions.
-Remove 'local_irq_save/restore' calls as discussed here: https://www.spinics.net/lists/linux-i2c/msg46483.html.
-Some trivial fixes.

Michal Simek (1):
  i2c: xiic: Fix coding style issues

Raviteja Narayanam (7):
  i2c: xiic: Fix Tx Interrupt path for grouped messages
  i2c: xiic: Add standard mode support for > 255 byte read transfers
  i2c: xiic: Add smbus_block_read functionality
  i2c: xiic: Switch to Xiic standard mode for i2c-read
  i2c: xiic: Remove interrupt enable/disable in Rx path
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version

Shubhrajyoti Datta (2):
  i2c: xiic: Return value of xiic_reinit
  i2c: xiic: Fix the type check for xiic_wakeup

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   4 +-
 drivers/i2c/busses/i2c-xiic.c                 | 593 ++++++++++++++----
 2 files changed, 487 insertions(+), 110 deletions(-)

-- 
2.17.1

