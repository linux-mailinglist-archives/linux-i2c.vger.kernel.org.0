Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D0355992B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiFXMGz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbiFXMGx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:06:53 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBC87FD1F;
        Fri, 24 Jun 2022 05:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxAXKjFypJksmVyUXmdkP/g4kyhOVk5jVf+EPAyY/tm8HIPfizFV46b4S8ubSmZ9EEYQt2nZ/xs1omrxzAYoEpL1EWbQLcdzYTQoSKP5d8cUt6AJ+6yHfOOWuDq7Bs1u7QjEEnkV2wjiLGt9xoRyHe0XqMbQHOXTHAaOD/aWtn8C39CK8D8EYwWzDiXhsXsmQpQBxA0R2+V1HKURgt7ijitoEm6hFlq2XK5KbXlO495VW8AEaNwO0yXMAe9HmI0hcOnRjReEoLJs2dL7lea3zgGtnnKEazb1Znton92ULdm0GcDidiZ4dk5eNfatiwt3K3Vp73E8FEwKbTGUeGCBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLoIQatsTzciqaKcDsrIkk3NhUIFHoZHUaZhb4sVahg=;
 b=bVwRO254cJ6OQRuZPoEGaj8TVxlQ3J8sHTx9PfXp/JM8q+qaBoartGPvMNIshPEU9kX2hYvvRyr7m+wVtk8/NDzUf8KffiFJ4V7hCleimasvRpClHfr6OAxogNHzQoxCf9yna56Swf6D2QPlJ99p8ZS/GqpyoGk7tsezQgQgnv6++ZhSn+5GmfSJ6FIFSrj+P8P/HrCAz+VbaR0fKeTo7O2ZbNhcSUSNs5WdGaIokyLoRPyMz5iyZhwWwu1Y3hIE5//IxWhar5iygd67V4sjibJy+W0ImMcC8ADQGbG/2I+iH6G3oceeoA4dvZvkQnaHMnwUddfFmXBmy9vyvrFbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLoIQatsTzciqaKcDsrIkk3NhUIFHoZHUaZhb4sVahg=;
 b=A7q3ipsnIGIMxpKylMB5uOnIx+jjFDvpkZg+m6z3FhqWhcyyzllNhmyrLdK4JBDW673pXrzMQlak7zDpVmuFOKjYFj944hIaPL4ANYmEJ7m8yjg9byf+557fHkJESSRz5p77NKG852IpiqM31bs1NX7D6hOZk3TWLTa9A6+MVZ8=
Received: from BN0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:408:e5::16)
 by SN1PR02MB3853.namprd02.prod.outlook.com (2603:10b6:802:24::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Fri, 24 Jun
 2022 12:06:47 +0000
Received: from BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::f1) by BN0PR02CA0041.outlook.office365.com
 (2603:10b6:408:e5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT023.mail.protection.outlook.com (10.13.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:06:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:06:25 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:06:25 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47733 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i4v-0005Lb-Hv; Fri, 24 Jun 2022 05:06:25 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id A7C16104548; Fri, 24 Jun 2022 17:35:38 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 04/12] i2c: xiic: Add wait for FIFO empty in send_tx
Date:   Fri, 24 Jun 2022 17:35:19 +0530
Message-ID: <1656072327-13628-5-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba88ecf-ba2c-4f8b-2f85-08da55da036b
X-MS-TrafficTypeDiagnostic: SN1PR02MB3853:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrOTDu6XRP3dQ2gePL5yzb/fP0F7tyiVR5kpSMwL/F5nskQPr5sR0IUuc8U80yyCmE64SBdSHOhhVBPOX0qK51lCM3JV6z/Fke3pwO5Z0roKHQibW//9RQ3x7kCxJvXq0QRa+VNw2DyYmk8ktMvMvXToIbBacVWFUY3r2Mo/Rx/YsBgiBvteMB+00ZySc+1hGwx98vmZFe1fInUO8CeZ27HyG9mvZsLEZzZLusbgc12j0m7qiUPWtkYtEpgGalSMo/gYSZZc7gefz6+0HiaBvi30JUtwhz+xD36rN7IzcH0ZuMFbKNNHHq3TNCqfsM+eNJG1myri8AugKrhbvIMVBIDGMPTLuzxKbrJxLDeIxjfmRG1I8LnsLMpq/2+gPaoZ4c29ZCrI71siDCJSZfUirVdfiw1JmcrO9G8zyUIndaEM9Tjh3byS2cW5tuX3TgX0/3XiHR/+b9meYoqF/Fr2rnhUaiWAiEF44HD95bg9adGBmX+Tlo7QPpAsDO6+n56gX4kj2RJl9qISDllDwr2wvPlKJZfXU5xiO8APVaCtovwA3DLOnfzoHj6WvONbWjxFgTZ+YnkerNJXoB9PPTti5WcwmlHf1HnxqhFduUcWrNtp1eQjiOjPnqsq/+aP4f+wUBLu2rpeLYTlS6Qgt6YPRaSI1N1In2t2nUNJ7yNnhZJfXUdT9P0h2jnxoDiAPblkhFmW3iXJNvwpBYaWnFRa1sp8M1KrOzZgOhTUGxuk/MMe/aL8RuH+R09SGOB1Re2+e5ERQX6I8gfxMK91Zwd6EbigddFcyDMWzKBnL8UUDsAT5ntKTXDv0QrFkfY0MDWm0Ge3rXGKuBTyhrXNgsxy2xpr3Ubq8NPpUfREIlqR+YA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(8936002)(36860700001)(41300700001)(2906002)(40480700001)(110136005)(42186006)(70206006)(5660300002)(8676002)(70586007)(316002)(107886003)(478600001)(186003)(4326008)(2616005)(356005)(6266002)(7636003)(26005)(426003)(54906003)(336012)(6666004)(82740400003)(82310400005)(40460700003)(44832011)(36756003)(47076005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:06:47.3527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba88ecf-ba2c-4f8b-2f85-08da55da036b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3853
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

If the tx_half_empty interrupt comes first instead of tx_empty,
STOP bit is generated even before all the bytes are transmitted
out on the bus.
STOP bit should be sent only after all the bytes in the FIFO are
transmitted out of the FIFO. So wait until FIFO is empty before sending
the STOP bit.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2d5214f1ba03..9c3266ac209e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -472,6 +472,12 @@ static void xiic_send_tx(struct xiic_i2c *i2c)
 
 		if (i2c->nmsgs == 1) {
 			u8 cr;
+			int status;
+
+			/* Wait till FIFO is empty so STOP is sent last */
+			status = xiic_wait_tx_empty(i2c);
+			if (status)
+				return;
 
 			/* Write to CR to stop */
 			cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
-- 
2.25.1

