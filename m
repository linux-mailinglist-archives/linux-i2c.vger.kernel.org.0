Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54A85E5DCE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiIVIqA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiIVIpT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:45:19 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2069.outbound.protection.outlook.com [40.107.96.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F25DB6035;
        Thu, 22 Sep 2022 01:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMZOW0MXkTSacKt/7C29DE5VNsrfQSlQvPTdZmg/LQJRjIZgkBm4x4+EoiVlEo5Gmo4wpngnhdjJ0ZPQbdJjwkkikCBkMLMeIBwm1VNs7MkCCmfSFIourhJ/Pcprq/HS1U4xxXE2WEE+jtJr4HIeZGmD8YFOs4mZoezdtAFut8IEb2Fxm0vBSt7VwEMpyqbpR5Xe9tC4csq45gVDnQ7xeKaZBOPWwyyflnxwEzEyukXED5/JsEqWHIflQVJy/eBhhMpO8dl3S96ke1koZ+3RWL1HW1BQ8O9SX0rTvf97v0//m7ln+hWFiNORltxJ23kBXo6bLPLpinAi9yYbEecf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4YTHG/L7dRcbuJm23/DNad/lFQtDhFMxvz9GaSfaf4=;
 b=GVZevW63CUhqn00znX514oZ6EifGIKoq+iqnIAudyq16Xh7XBRNuHyl7JzIfrMOjm3P+/Lg0mtsC54wz4ux2zOgnw9Wotz7LQXbz8cyvtugk7Y+511mQWo6wqw8EmNTkuWlv+PpOoCRI/kCeTKwgB6KcFgFfRCdXDGQe/WrHc/UylPAOh20wnSbcbJE4CTxG8pHgrvEF+zGDhyky+XBh0RKtm6rZTZk+90hsZ5tTJJSG1xPD3ILAXAtqOPmy2mCgUNVcd5z64mI82g9b9SNFdG02mO9tMnC1YMGuFpBwrjGVsvVo1Fp8Cj85pV86lvsXEFN9VpQj6daWWVNG9BX1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4YTHG/L7dRcbuJm23/DNad/lFQtDhFMxvz9GaSfaf4=;
 b=sZUd20wxMg1llXd7H+1q8GBU1MmszRGyur+XuMjfpi46CZM1JW4CBSeAU6bmfO2s+XBB6woe3lmLmfCqockV+/YsFiunJ6tOtTbyv0K9ZHHl8FX8dO869TYujvg08z8DtMjcdLTqUWpKfjjPAyH6P0KFKk2VOQw57IvK6JZGcnc=
Received: from BN8PR16CA0027.namprd16.prod.outlook.com (2603:10b6:408:4c::40)
 by PH0PR02MB8568.namprd02.prod.outlook.com (2603:10b6:510:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:45:16 +0000
Received: from BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::2f) by BN8PR16CA0027.outlook.office365.com
 (2603:10b6:408:4c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT016.mail.protection.outlook.com (10.13.2.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:45:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:45:15 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:45:15 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54834 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHpO-0000mq-Kz; Thu, 22 Sep 2022 01:45:03 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id 959876102B; Thu, 22 Sep 2022 14:15:01 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 0/9] Added Standard mode and SMBus support.
Date:   Thu, 22 Sep 2022 14:14:45 +0530
Message-ID: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT016:EE_|PH0PR02MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9cb597-f9d1-4081-7b22-08da9c76c58c
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQOV9fOtXevSVG2MOsMauYj4qKjev3MujDgwvD3unZVcivaOpd8z1CeHXMao6VuR/JUx6X5vpZznsARslejHpv6EggBm9OLrSbmtF29Ya69d7C+xEGJkaDaHMBJSJ9ybUnc9gQLki/lMDZvRcJVQxxH8ftcucbXoeT7PeV5tcnk1m3KcIBZThjMn21sWVBOvtKYHHgbibLf4jPlHwcQ/LT+MFMxF735+dNxhOD7owWsNxBpm/VMvTMRQqp6KsAxR1/xUP75qEus67FihKK8T5eXXwh4uYwJFyTHI0wQeHabThyQ4M+hCXfh15p1EIZJkRlPrfVg3ti6eKY/KX9RgEsmWv4W28HeCtDn6sqTOzxWE/Kdmi5jgjx+i3K7bYvmbXywKaXX/DKDBTxOe6Iez3Xnnstzr1UTAG2MfGH92feynOq4lCFxQcZFwWq5rPHNV7HB8ISiIeV0enoyd95TTk/ovH6IoTLZoZZDYcyw4/ZY8yqLlN4h8ReyxTM5G8OUPJfF8yFYJ0JQN4zwdm8MUI3zEAOE7z9RGpmtRg4J3/JGdEO6fCnbpE69vb0KHAt+17SK9f/wwXR0ScxOaIAETkrIgEx5SkCbLChpoH8DeSNNM2zq3J6xsZ0fpaMs3bFgphyQwjy2htuuRIhVaq0fjMQaQqW5TRTYpCy6h24CPjRGAPq/ZWl1gx2OnMGIR1gyIIqBWYdID4Cb90FA6k6l4whJ1AzCzqd+hdk1plBjSlGDuoLRScb6tAwBj+YX1/iEi0/2ijnkkG0fP/Oc0Lh0xWM/zbe5u8jdaeK1leeUt7g34mLuyFZ0SmW2gAeKPqr84az6Zc8dfJK/DgXe7jiJwwHoenPryp9SB/1So95TGczI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(47076005)(82740400003)(4744005)(44832011)(70206006)(2906002)(966005)(426003)(356005)(110136005)(478600001)(107886003)(6666004)(4326008)(8676002)(70586007)(54906003)(82310400005)(186003)(8936002)(2616005)(336012)(40460700003)(26005)(41300700001)(316002)(5660300002)(6266002)(7636003)(36756003)(42186006)(36860700001)(40480700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:45:15.9176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9cb597-f9d1-4081-7b22-08da9c76c58c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8568
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Added standard mode for AXI I2C controller.
-Added Smbus block read support to xiic driver.
-Added 'xlnx,axi-iic-2.1' new IP version support.
-Added dynamic SCL frequency configuration support.
-Removed 'local_irq_save/restore' calls as discussed
 here: https://www.spinics.net/lists/linux-i2c/msg46483.html.

Raviteja Narayanam (9):
  i2c: xiic: Add standard mode support for > 255 byte read transfers
  i2c: xiic: Fix Rx and Tx paths in standard mode repeated start
  i2c: xiic: Switch to Xiic standard mode for i2c-read
  i2c: xiic: Add wait for FIFO empty in send_tx
  i2c: xiic: Add smbus_block_read functionality
  i2c: xiic: Remove interrupt enable/disable in Rx path
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add SCL frequency configuration support

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |   7 +-
 drivers/i2c/busses/i2c-xiic.c                 | 582 ++++++++++++++++--
 2 files changed, 537 insertions(+), 52 deletions(-)

-- 
2.25.1

