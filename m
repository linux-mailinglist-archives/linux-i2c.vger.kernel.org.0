Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83293B4E02
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFZKbH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:07 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com ([40.107.223.41]:54240
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229952AbhFZKbG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFoDIkvMtSxhrR/JB5QiqFAEtwVaFV4emwWcWqamtcyuQgjZalSbxETF23YjG6TCoyphz4rKGFzNbV8m9A3ZEq35/WBT53GsTjnnb+UCSiXvNon41ISxbicfAS9eDAjN/aDv9IZlbgGyCisyDSl27aJdCBj+rFzO3kQoA9LDnI/x75VS01ZFt5pgh6BgfDnOteyNKK31wqO782Eseqp36ItHHC1Ly2RXYqEVdRgr0V38SQeYQghaSh3Q+wOLrwAlbznoFAYOUFL6zBuFVIXr4sIATNAch2zKkX6L8pvbY1+36fzcQKzQa0O5YPAXAai2fgvhMNLJZi+cpG/cRUoNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NDCSf4A1c8Arzt6jcl21UUd+3eeKwp+xRpDDsk18Hs=;
 b=YRXmf8/hViCMUnVoIAvN9COtaMHS1eDYE1uhuvAOtQVcRM+X+/f/lWP5cXv4q3qsuKVrG4Nv9uQn+6trnsWxzMNewZcA9vcDPg+jiEiilhTjmOUmF47YecV7dMCqiWV+VhrXC8KAfjf0MlTJT2NSiEpmzbMSeTAIjHjow5hvu0FfS+kuVt2D7ElfnOcIoK6HpREbrvCEzCYBuAxTJ5uTMnYjmwDIhOdwF78l675tV2B8DvWAXruzZEa6PdQMbyX5AtsQ8jpY4sxudriRfH9gXsrpzK95iqee0roo61jSJg0o/oBW5okZMpLgq1WzhRciKtdhDXtXtsaohW/Ygqcmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NDCSf4A1c8Arzt6jcl21UUd+3eeKwp+xRpDDsk18Hs=;
 b=einvYLGLDp4uoskfTH5HwkL099OvkohTAWPcx3tytnJPG2A5gJUkinHp8m6lNPEjx7qKx1f77F1USsCJR0DsI5311iBDskkq4EcleYpCkgfosPkI1pdfJ4oJ0l/VgZzGwwehF12vAS5QGVsJFIxsIbBPLjKZPa1FmaoZTrg8c70=
Received: from SA9PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:6e::20)
 by DM5PR02MB3339.namprd02.prod.outlook.com (2603:10b6:4:66::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 26 Jun
 2021 10:28:42 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::96) by SA9PR11CA0015.outlook.office365.com
 (2603:10b6:806:6e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:27 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:27 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Y2-000AWJ-Nr; Sat, 26 Jun 2021 03:28:27 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 04/10] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Sat, 26 Jun 2021 15:58:00 +0530
Message-ID: <20210626102806.15402-5-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1765c1-4eba-4c52-13a1-08d9388d2b67
X-MS-TrafficTypeDiagnostic: DM5PR02MB3339:
X-Microsoft-Antispam-PRVS: <DM5PR02MB333950DCC01499130CEDFA43CA059@DM5PR02MB3339.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5obvHLme/d8FJ8DNzT9fhqElHo+VbepSdwhQZo+n06+ThXvkNsGgnV9UgYEO6Ju+soc0k01jboF1sQ/EHXbTMSSUUl+z5RzpLCjoi+717HjWbY2ue0JOfhwfNgH8yB+tVk64u9l54zP4Bf4wRB5tSB5HAptjesjHS3pPxOB5/cD5s1btVEarD2lQXsEd0gaWoCZ44iXDhI8oBbz2Dkl5o7x6Q644uoZoZmLgQgGYkk7PjcC/oWKT+Epg3lNw+7Ic9EiQN/bNsUVdCvkg8wHGhnPw54NZ+Pwcgi2rPafgnu3zBOrKE0LAErwbwT+2Me36QJ5/cc439L8VetLiwdonH7feUta/7VAbG9fLK/jqNwbRvYCDDzH4BmfNdBUQY20y0yeCA+5/QPf8VuEMLrSRPPcV8pnom18c8FkdFacJagbt5DNy3mHxTX7kzWRDEVlVi7SYePGHO7vqZrk+RS9OzKbp+jnIHleCWSF5b4SNGEUOZ3h2kHVE8G+AY2VUjoNtI3pq5iBVYmJ2IKmytF/SDR+LUM90vPHCmWxYWpC0D8jb7GMTNsfFAC7J3hp9AdiIdRSS7w1jzymLIQXGjyFKBmcQxu5VB2lGTrKXt1+JW1+W87T2UGEchGxfP65sfQbpQytSoYQOfic03EVHDIU8I0nb1tjqyGN/tNpnQGPLjBd3aSDibq4rdXb4zGR6+xdq
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(8676002)(107886003)(36906005)(70586007)(54906003)(36756003)(316002)(47076005)(110136005)(9786002)(8936002)(478600001)(70206006)(5660300002)(186003)(26005)(6666004)(336012)(36860700001)(7696005)(2616005)(4326008)(82310400003)(83380400001)(6636002)(356005)(1076003)(82740400003)(44832011)(426003)(2906002)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:41.8435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1765c1-4eba-4c52-13a1-08d9388d2b67
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3339
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As the 'DYNAMIC_MODE_READ_BROKEN_BIT' quirk is added in the driver,
we no longer enter dynamic mode for the effected IP versions.
So, remove local_irq_save/local_irq_restore APIs from driver.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c31d0d0a8384..72c46cdfa712 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -691,7 +691,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -722,7 +721,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
 
-		local_irq_save(flags);
 		if (!(msg->flags & I2C_M_NOSTART))
 			/* write the address */
 			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
@@ -736,7 +734,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		val |= msg->len;
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
-		local_irq_restore(flags);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.25.1

