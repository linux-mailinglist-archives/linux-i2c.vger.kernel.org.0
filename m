Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08234FC15B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 09:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfKNIRP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 03:17:15 -0500
Received: from mail-eopbgr770074.outbound.protection.outlook.com ([40.107.77.74]:43920
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726024AbfKNIRP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 03:17:15 -0500
Received: from MWHPR0201CA0064.namprd02.prod.outlook.com
 (2603:10b6:301:73::41) by BN7PR02MB5091.namprd02.prod.outlook.com
 (2603:10b6:408:24::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 08:17:13 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by MWHPR0201CA0064.outlook.office365.com
 (2603:10b6:301:73::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 08:17:12 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Thu, 14 Nov 2019 08:17:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVAJU-00072B-8A; Thu, 14 Nov 2019 00:17:12 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVAJP-0007uk-3U; Thu, 14 Nov 2019 00:17:07 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAE8H6TP019445;
        Thu, 14 Nov 2019 00:17:06 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVAJN-0007uC-MO; Thu, 14 Nov 2019 00:17:06 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     robh+dt@kernel.org, peda@axentia.se, devicetree@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Date:   Thu, 14 Nov 2019 13:47:02 +0530
Message-Id: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--1.977-7.0-31-1
X-imss-scan-details: No--1.977-7.0-31-1;No--1.977-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132181930327956828;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39850400004)(136003)(346002)(396003)(376002)(199004)(189003)(37524003)(8936002)(16586007)(14444005)(73392003)(316002)(9786002)(336012)(76482006)(498600001)(107886003)(81156014)(47776003)(2351001)(50226002)(2361001)(82202003)(4326008)(5660300002)(450100002)(61266001)(6666004)(356004)(86362001)(81166006)(8676002)(9686003)(70206006)(70586007)(48376002)(126002)(2906002)(486006)(476003)(50466002)(2616005)(51416003)(36756003)(6916009)(426003)(55446002)(26005)(305945005)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB5091;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e58561f-1117-4f58-249d-08d768db0d62
X-MS-TrafficTypeDiagnostic: BN7PR02MB5091:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5091B22B7D36BCBDC6A71BE187710@BN7PR02MB5091.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqFYr3Znm6b6qz6k20ve3vdtidM0hStlqozZoB9xN2dxa6Vlk0TzBahQXgxUQ1D1lhT81+7+nUa7jas5rPMpnzrB+Q/Fja7dh5hvspG6xl4vX8k1FEUIWXIhQHaX/jEBwBHWytXUS/2h9c7aGn7Hw9vH+9P6TJkxgHQvT6Z1A3C9pky8+TDANu/QL7s9k5RuKtrE2/WAh8Yel8N9/MNpw7DX2GVJcDYZgsbW9hL7y4CXMJGUvkIDY+aYurwoKRwra0AsB0ZWk1Wsb7V+v1ikw1bjeNse7ykvZ9SQyTEPDI5YJR4GT8o4tg6VvF9JoGsAxco9S2Odpbc6BQ6P9xgyffCRUksyH0tCxWdKnECgBlIqBcm5GRrfnq05EZQorecxJrMsu8NLBF57oVDCpUUENpB2xUFSKWR9RlqtsFcxqF+IGZ4lyn76Ms7EDEF5MCBy
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:17:12.6755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e58561f-1117-4f58-249d-08d768db0d62
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5091
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

In case of multimaster configuration the last channel cached value is
not reliable. Basically the first processor/master does a write to the
mux and then to the intended slave, it caches the value.
Now the second processor/processor does a write to mux on another
channel and writes to another slave.
The first processor/master when it attempts to write the slave
skips the mux as it relies on the mux channel being the same as the
intended. This causes an issue.

To fix that write always to the mux address.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
 drivers/i2c/muxes/i2c-mux-pca954x.c                       | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a6..fc4c0b0 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -34,6 +34,7 @@ Optional Properties:
     - first cell is the pin number
     - second cell is used to specify flags.
     See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+  - no-channel-cache: Write the mux channel always.
 
 Example:
 
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a..37d32b0 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -85,6 +85,7 @@ struct pca954x {
 	const struct chip_desc *chip;
 
 	u8 last_chan;		/* last register value */
+	u8 last_chan_unchached;	/* write channel register always */
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
 	s8 idle_state;
 
@@ -244,7 +245,7 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		regval = 1 << chan;
 
 	/* Only select the channel if its different from the last channel */
-	if (data->last_chan != regval) {
+	if (last_chan_unchached && data->last_chan != regval) {
 		ret = pca954x_reg_write(muxc->parent, client, regval);
 		data->last_chan = ret < 0 ? 0 : regval;
 	}
@@ -479,6 +480,9 @@ static int pca954x_probe(struct i2c_client *client,
 	if (idle_disconnect_dt)
 		data->idle_state = MUX_IDLE_DISCONNECT;
 
+	data->last_chan_unchached = np &&
+		of_property_read_bool(np, "no-channel-cache");
+
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
 		goto fail_cleanup;
-- 
2.1.1

