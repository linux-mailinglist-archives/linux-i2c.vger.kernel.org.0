Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF981352FE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 07:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgAIGDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 01:03:52 -0500
Received: from mail-eopbgr770043.outbound.protection.outlook.com ([40.107.77.43]:35713
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725899AbgAIGDv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 01:03:51 -0500
Received: from BYAPR02CA0057.namprd02.prod.outlook.com (2603:10b6:a03:54::34)
 by CH2PR02MB6742.namprd02.prod.outlook.com (2603:10b6:610:7a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Thu, 9 Jan
 2020 06:03:49 +0000
Received: from CY1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by BYAPR02CA0057.outlook.office365.com
 (2603:10b6:a03:54::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15 via Frontend
 Transport; Thu, 9 Jan 2020 06:03:49 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT046.mail.protection.outlook.com (10.152.74.232) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 06:03:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv6-0007LL-UK
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 22:03:48 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv1-00063Z-PV; Wed, 08 Jan 2020 22:03:43 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQv0-00063H-Pq; Wed, 08 Jan 2020 22:03:43 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/4] i2c: xiic: Fix kerneldoc warnings
Date:   Thu,  9 Jan 2020 11:33:36 +0530
Message-Id: <1578549819-14110-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.205-7.0-31-1
X-imss-scan-details: No--3.205-7.0-31-1;No--3.205-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230234295398434;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(70206006)(426003)(70586007)(8936002)(316002)(2906002)(2616005)(36756003)(86362001)(498600001)(336012)(76482006)(73392003)(5660300002)(6916009)(6666004)(107886003)(4326008)(9686003)(81166006)(9786002)(356004)(8676002)(26005)(81156014)(55446002)(82202003);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6742;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f687c8-332d-4d55-acaf-08d794c9b234
X-MS-TrafficTypeDiagnostic: CH2PR02MB6742:
X-Microsoft-Antispam-PRVS: <CH2PR02MB67423CA20BAE6FA216F3F86787390@CH2PR02MB6742.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaSWZS373S3HY3TpCF5DnI0eZ9nuoCZiX1h09mWfri/kTKST14BwB+xOMjgUweU09BV2jFiwDCICSzWX+QAlz9Vtse5Xteubd9Aao3SpD6lQ/1FfJLStEjQh3OtMyjS37HjDPFRxzbks6yuiwSG5aRWlz0h9Xwzj9YOOa8EzAYsOU05ojTQTBs/floyWGJEo7PdBzv9F/G4PmJ4KwIOAznwOjdVFxUvpS/A7pvddsNZFrVYUQSqRpI2S3F07PHpu3o0G+scjetfe5ftjyIXg+Ec5xSJFV6TmCr4P41Z29Z1eDcJapTpvSBXSKbxrhq70p2z/pBsKzhL8zukH2N07Q0qTkfugz9bye7lUnXmHBj9fDUkSm24lACXLlczoeyUax8A5r3O7aMZ2h/OZjjWZDSJESo7mK+OrwfrbL1jmUCK0/ndOYXIPgiI7+S5qOU+2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 06:03:49.4057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f687c8-332d-4d55-acaf-08d794c9b234
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6742
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Fix the below warning by adding the description of clock and dev.

drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
'dev' not described in 'xiic_i2c'
drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
'clk' not described in 'xiic_i2c'

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 37b3b93..f42930c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -46,6 +46,7 @@ enum xiic_endian {
 
 /**
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
+ * @dev:	Pointer to device structure
  * @base:	Memory base of the HW registers
  * @wait:	Wait queue for callers
  * @adap:	Kernel adapter representation
@@ -57,6 +58,7 @@ enum xiic_endian {
  * @rx_msg:	Current RX message
  * @rx_pos:	Position within current RX message
  * @endianness: big/little-endian byte order
+ * @clk:	Pointer to struct clk
  */
 struct xiic_i2c {
 	struct device		*dev;
-- 
2.1.1

