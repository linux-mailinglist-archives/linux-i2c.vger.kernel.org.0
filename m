Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F46C395BD7
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhEaNZI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:08 -0400
Received: from mail-mw2nam08on2052.outbound.protection.outlook.com ([40.107.101.52]:9025
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232323AbhEaNXD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCLjOS6/3YUfFPwISAjxcewjZ18mOkO0YvDVASpTGTM+KFL9qWoo6HX1ICOHHDUhyLGmJAgYDON25Ahq3RT1XQod/LBPxyTurWmCTh9P3XaUQzChN9IxFOg4pqA4skla76kKwZQwOvGxsDxhkEBYMA7FDYbeBFiO+sA2j4KJ3aZ0/PO3xIZN4Oysx1G5wFOaBStArMvkUVLiaSa4cRWMjBuc8wCkb6yRbjQ1mwaV4PbvlhDTwq7IuWuqzFZi+j8diOf3hDiO3V5ygzWqWNygR51Ji5oH0IoGVpcf5P4/puZOWlEFRtLB/d7QFMeJhNq9kC0CsEX7qUH24IDMhSDkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olQ1kIRSGkHH5KiXTQs67sKPfMcfsrDpvuJOb37YkVI=;
 b=N9h8Z4DeAqpc05joslNh/D622yboy+nU851fCOgncGyW7LFkBpGpZ93YgqT47f6g3HHeRYsdv0HzJ24uvUolsygIRkgqO/MBmkC5lXYe/z36Qe9jbZSBhntqEVXgbY7+6YHoCT957UNtfxLYf42Gr0caZlBOXD320t4rN/R9Fb5lh/KT73Ah5ID08daD8Ln+H+mrlVswa2ICzZfcU0r15uxjtmt+DueL3O+EkTYjtCqpEWWj3Qhx91a6sKW9+kIybWOniw8RbodZQqKpes2rqLLFhW+kkWoEEnunsynHGF7o/e60/tkKw3Twj8d7svICVCko2LNGCseWUX0xeEP/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olQ1kIRSGkHH5KiXTQs67sKPfMcfsrDpvuJOb37YkVI=;
 b=eRX1TydGLle8PpDGExHFDLUKDallDxJa3qVU+FG8uIvZoZjPWhQcfMr+/mTIRIelBtuoepC3eHxIOdLbf2FZpOptgFbk7ukSfcwwhJyAqxVjHvhjGXs4U5h96Goo4UHaIXDSxVO7tS+NIXx3ciCBwFINelBsizx/3wDLQBvvSb8=
Received: from SN6PR04CA0099.namprd04.prod.outlook.com (2603:10b6:805:f2::40)
 by SA2PR02MB7836.namprd02.prod.outlook.com (2603:10b6:806:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 13:21:20 +0000
Received: from SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2::4) by SN6PR04CA0099.outlook.office365.com
 (2603:10b6:805:f2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 13:21:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0018.mail.protection.outlook.com (10.97.5.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:50 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqb-0004GE-Me; Mon, 31 May 2021 06:20:50 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 06/10] i2c: xiic: Fix the type check for xiic_wakeup
Date:   Mon, 31 May 2021 07:19:44 -0600
Message-ID: <20210531131948.19477-7-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3651d3a2-b365-4d4f-b4bf-08d92436fb0c
X-MS-TrafficTypeDiagnostic: SA2PR02MB7836:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7836533C8DE4F99E18077C42CA3F9@SA2PR02MB7836.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3oNDlnIPX7v64pkvEwZxYLaIUTjMo/4qWJhYev0ge5OhdVPVjszTkkf5GPdZqpGZ1E3MmSwFImxKoV/WescTjX/327laPOldKZHTDEEr1Up72p3m7/CXM5/Z0Hr427FX7PdR1I8BDTgypbh/1ZjljwhiPQGTvx4J4IiYnnGvg2S9XzkUCISPbIsVW5rAhhL6NAn44y7oUZRf036Ky6FtXJSdcIGynTyxBC9VZrCcvTFI/ANybzEPFhWixBAoC/+mIkjN5OCZfcE4QFV5ofsy/wu8dpUK5CsHQyZGo5pd7rcPGOyhVgabR3ydHpPYj+57WyjCH42VZ9T15k0xviffNaEatHazgMhe2uxMnOFVw+Q0P02pra7kJx7ICOXQdVEGgS+Vh7tprkB4Rwm0hs/xevNs2L8To9UxI/SYjUPcJyHHgW/p5SCH8o1bzFf5FP4fob1ulmTuNg5hMMdFWP1Eazu1ngE3WByyonTfOMMLWVB3EZZHC8H1wsJsCH6TycEf6VjtCFM7RP2h/9hVY+tcs2aZ0RJOTlGXBwh97ttzBuP3vGD8h7YzP9S0ooDtaEOQ4s20NB4u1cjMnlEm4GN5yOLvjfKskz54n1u9dQdA5TM6AJoUJeGb01U8N2dOQHGKTXB5+TijxWTJqlda91QdQxn7DK5nVKUAbWhcUZ2GsNYO/iNq2wahOm+ZBKfcReK
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(6636002)(336012)(1076003)(316002)(36906005)(478600001)(110136005)(82740400003)(2906002)(54906003)(426003)(47076005)(4326008)(36860700001)(7696005)(186003)(107886003)(7636003)(36756003)(5660300002)(82310400003)(44832011)(83380400001)(2616005)(26005)(356005)(8936002)(70586007)(8676002)(70206006)(6666004)(9786002)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:20.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3651d3a2-b365-4d4f-b4bf-08d92436fb0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7836
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Fix the coverity warning
mixed_enum_type: enumerated type mixed with another type

We are passing an enum in the xiic_wakeup lets change
the function parameters to reflect that.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b2ac76d94212..1a26e5ebfc6c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -542,7 +542,7 @@ static void xiic_send_tx(struct xiic_i2c *i2c)
 	}
 }
 
-static void xiic_wakeup(struct xiic_i2c *i2c, int code)
+static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
 {
 	i2c->tx_msg = NULL;
 	i2c->rx_msg = NULL;
-- 
2.17.1

