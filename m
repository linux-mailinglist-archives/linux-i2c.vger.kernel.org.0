Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E72EF1352C9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 06:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgAIFiH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 00:38:07 -0500
Received: from mail-bn8nam12on2089.outbound.protection.outlook.com ([40.107.237.89]:16578
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725893AbgAIFiG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 00:38:06 -0500
Received: from BN7PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:20::38)
 by MWHPR0201MB3532.namprd02.prod.outlook.com (2603:10b6:301:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Thu, 9 Jan
 2020 05:38:04 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by BN7PR02CA0025.outlook.office365.com
 (2603:10b6:408:20::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Thu, 9 Jan 2020 05:38:03 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 05:38:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQWB-0006Z4-6w
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 21:38:03 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQW6-0006Jn-3Q; Wed, 08 Jan 2020 21:37:58 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0095bvCE012666;
        Wed, 8 Jan 2020 21:37:57 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQW4-0006Je-MO; Wed, 08 Jan 2020 21:37:57 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/3] i2c: cadence: Fix wording in i2c-cadence driver
Date:   Thu,  9 Jan 2020 11:07:53 +0530
Message-Id: <1578548273-23206-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--2.128-7.0-31-1
X-imss-scan-details: No--2.128-7.0-31-1;No--2.128-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230218837271797;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(39860400002)(199004)(189003)(76482006)(8676002)(107886003)(36756003)(70586007)(70206006)(5660300002)(82202003)(4326008)(4744005)(81166006)(6916009)(498600001)(8936002)(6666004)(356004)(81156014)(316002)(9686003)(426003)(55446002)(26005)(9786002)(73392003)(2616005)(336012)(86362001)(2906002)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR0201MB3532;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1a167a3-cae5-452e-d079-08d794c618cd
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3532:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35322406604857E24404201F87390@MWHPR0201MB3532.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMQaC6IwnblThDUjFJ+FklorTR8/nVhZrDsPdsGjYS6UYU4jYitUJbhnh5EnEn1ag+yrbO73qx2lbW+yH7Ub/kL2mlZUT4+MZde7gjKo9nutjSl/l28/D93Nou7ETuarfxqZ7XOVpvhCcsCieWgqbJ1+LLrF3z/DsTSAyOKNDlmICxHGN3OmGCVQIWVkNcBt3lZ62UG2O9S1EdXRQf5iQOxWtd2Jzk78LAkhjOHrxTnAd7OOTsZETEQY2YUR0cuWK4ElO0+eeLpeOv/vzd4ObLbytdbHw2ubp7e7PhLP3+B2WlqHgpbE20/pbkCJzYt11YZDJ0ecMvP6Qvr0y6UilazWaeaQS1v59NxyNebaxzJz9zrBVEyu0FoyNI+85U4qKWFZbOdmadSDD0tYcYiA73fs/bPPBhx+b7/uLxWpgzxoK6bBI/Li82W5P4l6GAj2RoQnRvNw9daw4xTU6R+NaaiKBcNoI9/Hf3Uc2DmqBCc=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 05:38:03.5680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a167a3-cae5-452e-d079-08d794c618cd
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3532
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Michal Simek <michal.simek@xilinx.com>

Fix wording based on checkpatch.pl

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index a88c6c7..8bcb661 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -703,7 +703,7 @@ static void cdns_i2c_master_reset(struct i2c_adapter *adap)
 	cdns_i2c_writereg(regval, CDNS_I2C_CR_OFFSET);
 	/* Update the transfercount register to zero */
 	cdns_i2c_writereg(0, CDNS_I2C_XFER_SIZE_OFFSET);
-	/* Clear the interupt status register */
+	/* Clear the interrupt status register */
 	regval = cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
 	cdns_i2c_writereg(regval, CDNS_I2C_ISR_OFFSET);
 	/* Clear the status register */
-- 
2.1.1

