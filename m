Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8C8EC3DE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2019 14:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfKANkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Nov 2019 09:40:24 -0400
Received: from mail-eopbgr820071.outbound.protection.outlook.com ([40.107.82.71]:35328
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726792AbfKANkY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Nov 2019 09:40:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdBbzu6RmDLpxxQbr7SSHWU4JWiLwhrimerWRlkVzRyQpwl6jcDlZUUNpqX/eFoNqwJNUM5a9ZS9sw9Um8SqP/OrSxbV0/tz4vuYQkybIti5d3VhaVhIeRHq90D7+aa6XhS02qzucgfJguEezJSTgqBs/M9/P7ksrrpGOru0IklLbpVqm3fviMFduVFnr+Xsd18oSvgPh97deiVryAhy5YU1om+GIYxoH/+9UtSMNRz+nXI/s8Ko5BrFo+/TVjpjYb17K1dVW9YAEBxj9M7Rl2WY/umPbjN+vGveaCaKP1pLw4/rbJgjACXakvXQ5ZA82CQ+viMzsRwXXVtQBmN7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti2M7yEdsSGK94UMhsJ4i+QocSPD0nbDVsnkcJX5ZKY=;
 b=RFqMDt2CaK1ys7YaH33wBzsHhVCCY+733OpbP3KPlh4/nh+n4npq9BXSIQq84Ji0/BycY03+oV+J5tBpvboIt6LkAHxLVDokLhGfvu9yJTw4slf6xFz/tQyEt17uhepB6/g8klo8svB3RsKgEBirZ7I4VKhJ7+o8z/G8y0URzDvPUCtvBMyWVyTdeN/1KDtvfxVzDSaspYfit0LC/C9CEbfz1UhJNWLTVR1L6z893GvXBk1gRviiQpnncKsOzKFdJINuKCAzYSt1Xw1jMz/F26SP2tN0pzu93y8pOSiYmO3an5ASm3yGZomywVdFm4B3xFcrSk1tg9lwKZ4ePFC1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti2M7yEdsSGK94UMhsJ4i+QocSPD0nbDVsnkcJX5ZKY=;
 b=al0MLFTtOICK8fbAnww70hUibThUBVh49Fdtr0Yqz7HXYrOG81H5rrS2ohVXqKGhHsu1SNDPnEvspZMbgNVofzRiAU9wntvH8xwZfLhgZYAUdsRz9iqbl9iuctK+lyrMfYlHpF6dWH7NNLFv0eqaK6J2y3RGi7Nlsg+L4D1Jgm4=
Received: from BL0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:207:3c::22)
 by MWHPR02MB2765.namprd02.prod.outlook.com (2603:10b6:300:108::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.18; Fri, 1 Nov
 2019 13:39:39 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by BL0PR02CA0009.outlook.office365.com
 (2603:10b6:207:3c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Fri, 1 Nov 2019 13:39:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Fri, 1 Nov 2019 13:39:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1iQX9O-0006V1-BG
        for linux-i2c@vger.kernel.org; Fri, 01 Nov 2019 06:39:38 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1iQX9J-0006Ww-7W
        for linux-i2c@vger.kernel.org; Fri, 01 Nov 2019 06:39:33 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xA1DdQ9E022612;
        Fri, 1 Nov 2019 06:39:26 -0700
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1iQX9B-0006WR-Oi; Fri, 01 Nov 2019 06:39:26 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] i2c: xiic: Fix kerneldoc warnings
Date:   Fri,  1 Nov 2019 19:09:23 +0530
Message-Id: <1572615563-31751-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(189003)(199004)(5660300002)(8746002)(2351001)(70586007)(2361001)(36386004)(70206006)(2906002)(106002)(36756003)(51416003)(26005)(7696005)(186003)(2616005)(6916009)(50226002)(426003)(6666004)(336012)(316002)(8936002)(356004)(305945005)(9786002)(486006)(47776003)(478600001)(8676002)(48376002)(4326008)(107886003)(81166006)(81156014)(50466002)(126002)(476003)(5024004)(14444005)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2765;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f1b91e7-fb3f-4c18-80d0-08d75ed0f14c
X-MS-TrafficTypeDiagnostic: MWHPR02MB2765:
X-Microsoft-Antispam-PRVS: <MWHPR02MB27657771D391FF39B735AD1CAA620@MWHPR02MB2765.namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 020877E0CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxRB1Chq0xQVP/IpW+Rj9TtKNgFVeSFtLmy8WNT8PHWkMg5ewwftLoy+xPZtLb2tduZhZT01PcnFjhOPT04Bo42R1RgaybyO6fqaSJickBkxJAs76onPtmAbbCITXnNVqsPo09Wi9ph5hxWXGnus3BBxBs3Xgmux+sWYI4ZGvmir2k5e56gA8mjMx0Z7Clb/PIggQwJqYDIu6WFWv96RFSWjLOB/2CiQrXEx491ptsJOvWlrxwAqRt5wmDcOaTAZ9S7NOop2xZ1/UAT8mQFoPaCnRweK4fOQotSgKNXKGdJkqVXBG6YgXyS+/Z9mdIEO6TCoP0FUJk8ELIcBF/iYZPud5+gH3/DGUZFDEKWVn9OPuhir/EbBuAfD3IMtZe2oqZ24RoMaboMg35w4oQZzc/GWdI4d+8m5hu4AJMFonwTbGHx2CwDh9WQNMFHmDdO+
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 13:39:38.9004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1b91e7-fb3f-4c18-80d0-08d75ed0f14c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2765
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the below warning by adding the description of clock and dev.

drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
'dev' not described in 'xiic_i2c'
drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
'clk' not described in 'xiic_i2c'

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0c51c0f..e212a9c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -55,6 +55,7 @@ enum xiic_endian {

 /**
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
+ * @dev:       Pointer to device structure
  * @base:      Memory base of the HW registers
  * @wait:      Wait queue for callers
  * @adap:      Kernel adapter representation
@@ -66,6 +67,7 @@ enum xiic_endian {
  * @rx_msg:    Current RX message
  * @rx_pos:    Position within current RX message
  * @endianness: big/little-endian byte order
+ * @clk:       Pointer to struct clk
  */
 struct xiic_i2c {
        struct device           *dev;
--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
