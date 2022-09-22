Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E175E5DE2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiIVIsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiIVIrb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:47:31 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108B96AE99;
        Thu, 22 Sep 2022 01:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJWJSPBN1Ypx4lbTy1mPvjfs5BXCPXFLDgIZUMkaSi0IUzqDUMIk1Lj0qf+hlHqr5r1X0oAsxujkVdL/+QkJdD9avBgEwh4d0GT5eG7RAl4cNZNXd/wn9fnRNhAk9Gzft7Vo8yD3qP/fgQl8/9n2zKTH19dG/c9+iEYge3cBCyCZMCJw6URmYYRWoj3/DnobXW4fh/BBwktGgqo5m+aGNd6u0CKBDXXJjz7M0NE4m2jMWpHXnT4T2vvgGf5OvOxoUHBT7tJoJM4l2seXELZIDy9ycmSoStLB9PXYrNqCm25RK7lceRvyHyshQ/0OYHXgEHrYuyEh/JMhe7+2KRyENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyrjM/Yq/n8vsXiBYPaAl2C8mb0/MmXLz5PbcnDq/SI=;
 b=mw/kCCiFXXfdMEL4L6lgdWvryd2X9zFxxMQGZQmoP4hb6mOsDMgMW1bN6VIF9Z4ljS0BULdiY1NYVa8t7OPtKN9PWhxyfP/DDsH4ACleta1cWXxY6VrYPI0eaio3L63XiB0DD+/fYu51jJYVVNb9jvHHiS4dFuFmpZa89mxIlQc40Kph8qzdtwQFdV6f3yfdj0j8Ntf4jtpkR36sh226CcqLgLmN29T1NgxVMs9631wag03VW7HdzKhBbeNMQgO7PDe4luxGOPbNpNfXg7YF9X6EeWaDHw1Ippb9Vo8H4clmEPHmvPe/loY/N+Gz/sAM4BBXccBgdkDUAXUJjjGidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyrjM/Yq/n8vsXiBYPaAl2C8mb0/MmXLz5PbcnDq/SI=;
 b=O/iP19kaje3bzmXTNQFlZIBSUN9lhh3xFp82TdN4jdHv1TRn3ECh2mhCVFCyz5X3ZeY7PlRignc9jidfJOUTw+H5XClUftJU//n04oR9N2VqCJRICOWOkUCx2eEi4pOCWKh/m5AHKjMgtuY3m101sYmcNDOpT2lsV4sxC+tQgKk=
Received: from BN9PR03CA0856.namprd03.prod.outlook.com (2603:10b6:408:13d::21)
 by SJ0PR02MB8577.namprd02.prod.outlook.com (2603:10b6:a03:3f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:47:10 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::93) by BN9PR03CA0856.outlook.office365.com
 (2603:10b6:408:13d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 08:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:47:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:46:49 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:46:49 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54846 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHr7-00062c-8i; Thu, 22 Sep 2022 01:46:49 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id DBBED6102B; Thu, 22 Sep 2022 14:15:18 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 8/9] i2c: xiic: Update compatible with new IP version
Date:   Thu, 22 Sep 2022 14:14:53 +0530
Message-ID: <1663836294-5698-9-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT053:EE_|SJ0PR02MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 1714b3fd-76a6-4561-aa2a-08da9c7709aa
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWzC7yYVUk6oqVM+ws1xRdrd1L6EfAXoMWz5T1G9bsm0o3teKyoMC+C6WEA9pRltJeDVmA4auYdH+oMlGk/9uUk5G6DLUNO5iSbmvG2TOiTYTKvvejxHNYgC8j+ckOJHLdcQHlWMNOtIO9I17NHrUHbpRXndJx9fc3DRIuiTFcZk7wJX2Wygp0KB0u9Bbol84lFMN4KIg5PYkUNgUn1wE7ckPu4S+SzyrXR6ZVNX7l6m10w6HhpOI1cSRC8u8jMIh1ygWkVDpMtbH+GNJtBC73lsoh8JQKRs36SKZ5ROxLQLX05AcrXWyqJJB+6yGjphfqxV5wOfnQfRwnhq7/3rEwAZacDrxl3EixJ5A9xct6N8B0f+KP9YFG1GHVgvU9RgCYde1TMNwo4dSv974Np+3IHe+YzKGbbbIuNQ7p/6eqMYY1D5ytOsHUQuVeMgxA4nqtHWAvopjChJYJ49bBsRoGtjp2IFJuzgUxG7F+Br7AN9kBfJIOf474/1fguTxsPvmYPLvogtNwa7YO6GDER/JrI7ij2qOeLqUp8VopGovIeP1TZhuYUybtAfEQbMubMfxB2vw4NxchTj+4s5FSls1ij37C7NybLKwI0+zrTrJ73q/dHD+X5oWjaKkZhLwAC4mUwIzzVFgVoQVAbBmXKdrQ4bDrEMBpzT8z6jETX7LdOucoRAABoU3L4NlFkrtzednWRkecUPTvaB9Q2O+6ZCnEgmlW7TpKSmXc4pd3E4OAtvFm3DlUwDqyTj/hXgnsoE2czHWuZUV/OrnzToKhodq0FDp0i0FDLdL2US+FvHAgYPW/LXiii1oe5jzntcqLhQ
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(426003)(83380400001)(40480700001)(336012)(40460700003)(47076005)(2906002)(82310400005)(186003)(6266002)(2616005)(82740400003)(7636003)(5660300002)(41300700001)(36756003)(8936002)(107886003)(6666004)(15650500001)(26005)(4744005)(44832011)(356005)(8676002)(4326008)(70206006)(70586007)(316002)(36860700001)(54906003)(110136005)(42186006)(478600001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:47:10.2161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1714b3fd-76a6-4561-aa2a-08da9c7709aa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8577
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Added the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 31296e252279..0f03feb2ff78 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1074,6 +1074,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.25.1

