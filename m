Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10BCEF502
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2019 06:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfKEF2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Nov 2019 00:28:00 -0500
Received: from mail-eopbgr740045.outbound.protection.outlook.com ([40.107.74.45]:16111
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725800AbfKEF2A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Nov 2019 00:28:00 -0500
Received: from MWHPR0201CA0100.namprd02.prod.outlook.com
 (2603:10b6:301:75::41) by BY5PR02MB6355.namprd02.prod.outlook.com
 (2603:10b6:a03:1b3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Tue, 5 Nov
 2019 05:27:56 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by MWHPR0201CA0100.outlook.office365.com
 (2603:10b6:301:75::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24 via Frontend
 Transport; Tue, 5 Nov 2019 05:27:56 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Tue, 5 Nov 2019 05:27:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iRrNj-0000KI-1a
        for linux-i2c@vger.kernel.org; Mon, 04 Nov 2019 21:27:55 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iRrNd-00032I-TF; Mon, 04 Nov 2019 21:27:49 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xA55Rnau009137;
        Mon, 4 Nov 2019 21:27:49 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iRrNc-000322-HL; Mon, 04 Nov 2019 21:27:48 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv2] i2c: xiic: Fix kerneldoc warnings
Date:   Tue,  5 Nov 2019 10:57:45 +0530
Message-Id: <1572931665-24560-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--3.569-7.0-31-1
X-imss-scan-details: No--3.569-7.0-31-1;No--3.569-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132174052756904712;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(2616005)(426003)(70586007)(6916009)(55446002)(6666004)(26005)(336012)(305945005)(9686003)(73392003)(14444005)(486006)(476003)(126002)(48376002)(82202003)(4326008)(50466002)(70206006)(2361001)(5660300002)(107886003)(61266001)(47776003)(316002)(8676002)(51416003)(356004)(86362001)(2351001)(81156014)(498600001)(36756003)(8936002)(2906002)(50226002)(9786002)(81166006)(16586007)(76482006);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR02MB6355;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5596cc4-083f-452a-707d-08d761b0e98f
X-MS-TrafficTypeDiagnostic: BY5PR02MB6355:
X-Microsoft-Antispam-PRVS: <BY5PR02MB635569F7ED335DCAB62D1D17877E0@BY5PR02MB6355.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0212BDE3BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u29RDI9LJKSkJ34rHErnya/wvSl9y5Ec9WolIO2HdhL2Bh1ABoT7f2fZT+YsaLzIqjyQOHddNqeUcDLDPeENKxmybZLCLxjT3JumQ69ITFhRDeBBPGrRTIv+jEa5ClMAV+FSaC+kJtVOZbYnZHBYL89DlSegV1u8bxRjN7sfmL/PAKSwCPa7FGswCHz+EdrVsj8rTYV/Lf08rmA5FxHKviQsPFeufi6F4uxZ4IrzhtFsww/m7DiJj9SQV40Fr6l2+YA7Hk88dDAaUB3YFBgGmmzxykxC06gcqYF7VegIqW7R0vJLTuv2Jh27gZNI/qK/zTVy7GO7MWIp/hVcOLHNWeVTzmyoYQoZz0ptyMZrwcifBj9fOHW/ETpzd5jdbr6ByNIjQ3r0AynNfXxhgIzwtYWlWSKL0KUy9RcDDXrLUH2WVwF/TYFrSnCBi9Gk77lD
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 05:27:55.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5596cc4-083f-452a-707d-08d761b0e98f
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6355
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
v2: update the description of the input clock.

 drivers/i2c/busses/i2c-xiic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0c51c0f..38703a5 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -55,6 +55,7 @@ enum xiic_endian {
 
 /**
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
+ * @dev:	Pointer to device structure
  * @base:	Memory base of the HW registers
  * @wait:	Wait queue for callers
  * @adap:	Kernel adapter representation
@@ -66,6 +67,7 @@ enum xiic_endian {
  * @rx_msg:	Current RX message
  * @rx_pos:	Position within current RX message
  * @endianness: big/little-endian byte order
+ * @clk:	Pointer to AXI4-lite input clock
  */
 struct xiic_i2c {
 	struct device		*dev;
-- 
2.1.1

