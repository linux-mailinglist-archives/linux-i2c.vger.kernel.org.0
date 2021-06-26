Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F333B4E0C
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFZKbf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:35 -0400
Received: from mail-mw2nam08on2086.outbound.protection.outlook.com ([40.107.101.86]:8032
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230073AbhFZKbV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy7+6gwnC4NN1nnoIelTyR2pcrENwiv5hED+ysV1Y2NL1Pt8lT9KC0jC2Z/YEw8PCofNbCxkT+YQoipdkUy6Zs1h59CvGP8J9HRBteS3H6zlrX1aCyx7HFm86BMaD5LOfHafNmaLY3NuRMNwcQ1FgFb72pEbmZ3rluxrlcuquUxX4PBOu/BaHouvX137Jj06nI5WZJDfKbKdSKTGYo2aYoZ3eslYwproEIaoC1VYOuvN/MsJXyEXr1RFeRqAWDGLVI+NVCgU+0yWNb2eK6G+MgC1uTWke/nuTQ99IlvClJb4HimAc0cMXNpJ8idkB7yWStJCUw92ebnRIhmdutBb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka99UuqMvEVrXc8zLH1F3MaFqFoQwBZsaxJNyVg30gs=;
 b=IXz+TJXkMnIw/cnD3oOQRzW7PrjO4gjlgOUbCHg22qKt7Qw+aNtuIgemCrqW/xypDUwbsbUbtD7sHWeSo+Y5eunrNLDayYCO5gd7iEnOO7OmFF/g0jDSknNLxL930lNg01+xamv9Y3hHtkOPJBclhkZf0eqOs5TC0zuity13lUrnWTo8DucMuCcV6rWkUlSXK3nwngGjB9ftOa7umZN9mSrrPHma1afgv0HhXNzKLBDInQIpK22YPLxMR2xc7JA2deHYGMaBHAzTA8d1waDtfLLCrsEvOJi4Ww2vndlr9j8DU4O75EzvXF1jsclB+JcjLqYMnG6gc0HUbfuV/zEaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka99UuqMvEVrXc8zLH1F3MaFqFoQwBZsaxJNyVg30gs=;
 b=YdPDtyI1VVDayzIWbbMjDp6pnjTuMS2kQaUvBELk31oTuwNEtawgK1PwjNEgAUaetBKIZ2kckLtv8+2hJ6FRlg2Lk177LxqaSv7FmwXHD/RPYQRWGdRI2N5u1PT+usfZzQg7eq/pKIq/lTLbqj/Q5lCAPjtRk7evjK6BwspR52s=
Received: from SA9PR11CA0011.namprd11.prod.outlook.com (2603:10b6:806:6e::16)
 by SN6PR02MB5230.namprd02.prod.outlook.com (2603:10b6:805:72::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Sat, 26 Jun
 2021 10:28:56 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::1b) by SA9PR11CA0011.outlook.office365.com
 (2603:10b6:806:6e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:46 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5YL-000AWJ-CO; Sat, 26 Jun 2021 03:28:45 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 08/10] i2c: xiic: Fix the type check for xiic_wakeup
Date:   Sat, 26 Jun 2021 15:58:04 +0530
Message-ID: <20210626102806.15402-9-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abee86ec-1002-4232-a31b-08d9388d33c0
X-MS-TrafficTypeDiagnostic: SN6PR02MB5230:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5230407F663455557F3A11B0CA059@SN6PR02MB5230.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufj0jL+PuPvtO0v63smS9DPqPy46FreY7+NGAZyZT6OY9myw386VPZxWeljybwoWBeqb3TeCpQKhXgs3Jp8Wu91bPS1APZjUCNS25pfdHFeiQns9KkZWKZyefIZt1Ujcyb0NsKXPg3N8kVaEQJLsBQc2NPwKAwbM+QrKiJI2ZuJHBraKtLKf3z73/CH7Se2xZTv/L4dAxclpXC25nUtPoHaTfNfreXB/FudGBqZ4iMdgFi1w39YFk/zxlSV1kbdpBqIE/gShEIRIXg1jDMWqvI3oMVmJJxrpyCjbDXWuEZx38UJvDR+MqIg7wzzEOj1i8+N9MXdcr/z65eSMBHlq0spV6uGRyfLl3lTzgcYzSaoUXG02VNdtvCHasx1oQUK4BHV4dVCg/DzYDWTuJ2L01/CnXtjRZ0oG2jSX0YKIWn207pYoU8odt59zwe/JLCuhBb8XkD9wfEWrIbXbQ47xoEMFEE3CklMqscSBHusJTuaeQtnOjhG0Zv2bA4XHjCYXQVFYWJ+r23G/f1z6MBAR+l9DJpQDqs9rzmrXOnYj70FI0ZwONI2+PfWASOvJP2UuOOiCdUVudt2VLnJAwXC4SkY80X2Z5W4IWSq963RMpZycC3eRRCDSKhqllSXGVg4cOa0Jqjgoo9gAQUuc5mFX/P9AUc6hqU0P+eHQ+1AVmHfne3PU4uFUHF98K1VkRMfHWdhXSk2iNCS0Qg0qAvshGScNlb98XTrvlbYQ8H3hiwM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(110136005)(4744005)(7696005)(316002)(36860700001)(107886003)(1076003)(356005)(2616005)(426003)(336012)(9786002)(70206006)(6636002)(5660300002)(70586007)(7636003)(82310400003)(478600001)(6666004)(36906005)(4326008)(44832011)(186003)(82740400003)(54906003)(83380400001)(26005)(36756003)(47076005)(8936002)(8676002)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:55.8633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abee86ec-1002-4232-a31b-08d9388d33c0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5230
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
index 0d76261f1841..3e81ec08b001 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -490,7 +490,7 @@ static void xiic_send_tx(struct xiic_i2c *i2c)
 	}
 }
 
-static void xiic_wakeup(struct xiic_i2c *i2c, int code)
+static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
 {
 	i2c->tx_msg = NULL;
 	i2c->rx_msg = NULL;
-- 
2.25.1

