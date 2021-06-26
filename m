Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41413B4E08
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhFZKbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:22 -0400
Received: from mail-bn8nam11on2082.outbound.protection.outlook.com ([40.107.236.82]:10401
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230082AbhFZKbN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKwPNcNmZwWpWgtYjHLEeU66Y6Qkohvghru33uyC0b5YKSVkeUxh+w1rWRK+/FbiuDnOM4EA7lfVONR3EZ8fv6CmUbtnbrBdimjDnWKcAl0iwcot0wHfnQcuJDrgo1Agcw8k3XyBXm86h6GmpTEYnAlllUf+OnfXZaq8m0ROwWxY3+7tNJ6XyKyzq285nzQOOBcKucsEWi/S2ZEpK02dFuwQ3PLBf/89At3IFLDeeHpc//CGiMqRfBD6HjMy/62zXaLUX0LuGOlMnOLTGNuFm09/6wXF64viAYvEM+3geE5LH9Ieez9RIMTaTSzP4LCG6pPr9dUDo2y/biD3v8PWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z9PqdnsvcQRvSwHqvaJQ0UEhrHpS+ZoJRyxzRYSW4k=;
 b=P3IcE8EhiohGTHaqK4OiAxeEedcqQnZu8DApFEPXU8QSIbNqfnqg412ggRdB2D490BdcmDC+++t3YI0/Z4FGFbcisoNHKlp9rWpT8iIZqqWG0i1pUXWhdMAOgPBRnAXYafiSHZvLRwWaHCzkJmZLFmn2DspoNQ9DeXfXtP5jxdEcFb6MYM+TW+CNGzI7p/QSvgPLs7AlNo+xwplEuLCm+su8FWZioBsqUpXQdrH9qRhT3x2jH1Jc5wodjfAP7KHvqVmXAp5MDlzT3GuDy30kBzgE2TOyd2DYJa3r0yO7TsV1aT8DzfoGk4/3+jzaKRcImjqTZCoQUgfJiMQuz5PvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z9PqdnsvcQRvSwHqvaJQ0UEhrHpS+ZoJRyxzRYSW4k=;
 b=JW9Xc0Ue3PmMRfBMCkdttZChavXX4FgG8uUUc4ZIa8SbTuH//Lt4WSUiQYDuKNU5LXxrC+tNDzwhyIT0gFuc3+CxPp6XBB7rBHOFFPpyC0w8JyGZ1f9r6Emr4PF4Z/OUub9prcheJ2SQ5BY9uPbOx4Zl5LpLp4ePu4RwDnhUVac=
Received: from SA9PR11CA0027.namprd11.prod.outlook.com (2603:10b6:806:6e::32)
 by BN8PR02MB5748.namprd02.prod.outlook.com (2603:10b6:408:b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Sat, 26 Jun
 2021 10:28:45 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::b5) by SA9PR11CA0027.outlook.office365.com
 (2603:10b6:806:6e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:37 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:37 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5YC-000AWJ-9s; Sat, 26 Jun 2021 03:28:36 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 06/10] i2c: xiic: Update compatible with new IP version
Date:   Sat, 26 Jun 2021 15:58:02 +0530
Message-ID: <20210626102806.15402-7-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0672b42-0d4c-451a-76ab-08d9388d2dae
X-MS-TrafficTypeDiagnostic: BN8PR02MB5748:
X-Microsoft-Antispam-PRVS: <BN8PR02MB5748E36C118E816C45B196A8CA059@BN8PR02MB5748.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErkzR78v4SgFsnihbalcVpAyPbUq7lbnB7rkd7OCbdkMiMV9hOD8PRWs2VkJfyHxkjuMKRjZ5sfS50sSm+nadVp/LqNMXDd37P6YjO2+LOMqPblokAlzl9+uspgp4AbeiGGn2OD/xmdJAIzuTHxCnJbssQDTTrbnhdRX6doFeTwjvMvoz8MBD/0vhwK1wE0SmtKXmhVCb73bZ3Cy1+GpVnZ+/q40jBV5dwukKnOofPcqBJdSGGeP1m1Jl5Y61eK1nAwxIAxsz3xoDjOX+isdxDEFcwsY8GGm80+xgc/CN/rATzNyDx+w7tAqGFnK01ozjMDb3Okmw1ZFZER67bKccoj/SucW4oe56igsXsgi6xnVF2AzSI70719WhWbkUmHbD3lB2dqzg/evoK7p5lhB6wVqtWuD8xuPp4kijVyeJi3DktC0WYNOmJWRgyf6XDrguQfVHxulP/6EiRXlIf+8IbKHqxXO+jQWozG16im7M8/nZJUpMoEw7YRm44uzqCwgZXCabOVJ5snmiK5gthoOOruCJZs3av2XKhNI1S+3YiI2ZnjY2E7RJLBFjrd8GLOuUVsaEmGauxP0kaAyuh9UYnu6lVTsc2agOYItDRW9wSOIqFmELWLcyx+CwMOmoktPNodBMUfhlKeTMEyjIwhyORhxYb9VYB3Y5KRZCKpeFOatZhhgPinVjWkBR+cs3O14
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(15650500001)(36860700001)(2906002)(36756003)(6666004)(70206006)(70586007)(6636002)(54906003)(426003)(336012)(26005)(2616005)(110136005)(8936002)(36906005)(4744005)(8676002)(186003)(1076003)(44832011)(356005)(478600001)(4326008)(9786002)(7636003)(316002)(5660300002)(82740400003)(82310400003)(7696005)(83380400001)(107886003)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:45.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0672b42-0d4c-451a-76ab-08d9388d2dae
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5748
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Added the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 72c46cdfa712..007a78215a90 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1058,6 +1058,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.25.1

