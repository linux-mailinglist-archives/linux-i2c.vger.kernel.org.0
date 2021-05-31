Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA58395BD8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhEaNZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:09 -0400
Received: from mail-dm6nam12on2061.outbound.protection.outlook.com ([40.107.243.61]:7777
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232351AbhEaNXH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaAfmkZSr9Vh6wHAWLxmjAhR4lCTBj62mlPX++EHGiLmObRexsQf0kzJNRitEjCFsMn/wMoG45fiQouI2qL5JKT2lAa1rbV/xqdphemRk9q/wHIDwiPdHc6jhxEFE5wocDecK9O25m68TcBtn9xMz7ju8IDLkemvUaRFo/rzxZ6UpDNy0+EDHZP9Xo4cCfI2ygfNx/NWHugB92oR+IKJ+mVd7DOxALBgTVuQEaQt3/0qChrfwdX/mN3p/WNhyvjq3a7Gv/XVE99KnOWRMRC8S4+QuUKI8BrIIuqyVJDVzlYtc4Ek6dd+tPjxAUeOb2pV0sO+9pBd34LX6PShYCv5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIQMAFeWEOlVva/AMbTzk+yzrBYHtq1g9I5dQBHLscA=;
 b=GzlDxpvwNnRpDipsDP9+N5HM9M1hptfCT6A5TWXKVbeRUzZjCQKN4AGFhe+8rDGBlkTl0gbXSmBX/y1g47R5m/tOEQGWBNur4PQLLOYugz+B0KnsZ1xuZvdNT+mZ3oyry2b1Orxp+EuLCF4iYgi3sw9DWOI26ahUktj77iWrHm/i9IcLemPuzpfPjI9ijbmP/X2uTaQPRnRJK+j5nnobCcnoRQ3V6U9pD/WUGiwiW4ooQragw99weXZOPKMXmdzMktCu1L9YdO2xVjwGEcjgnMJdKqI8fA+nNqrCsgVTeO4L0E8QSnG7DJGkSe3WbcXOfDWSv25thmsWpgTgR0jSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIQMAFeWEOlVva/AMbTzk+yzrBYHtq1g9I5dQBHLscA=;
 b=Av+jImbane9tQkmXDT+8sAchwlKkP3oBi/NeMd9p0HQRxz5SQcMida50joMIfvmYKoUk1rtgcBv1AlVA14bsMYMVL6rD7NuL3YDoqrIm7hAQ/IBrdcpDhgKYKZGahRCMTiI3erYJtQ30nVTk+9bEA46Mg4tabSxsfFFqjjqcfvg=
Received: from SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) by SN6PR02MB4335.namprd02.prod.outlook.com
 (2603:10b6:805:a7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 13:21:23 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::76) by SN6PR2101CA0021.outlook.office365.com
 (2603:10b6:805:106::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3 via Frontend
 Transport; Mon, 31 May 2021 13:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:21:10 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:21:10 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqv-0004GE-Cx; Mon, 31 May 2021 06:21:09 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 09/10] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
Date:   Mon, 31 May 2021 07:19:47 -0600
Message-ID: <20210531131948.19477-10-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f91f9e37-3c72-4cca-2a14-08d92436fce7
X-MS-TrafficTypeDiagnostic: SN6PR02MB4335:
X-Microsoft-Antispam-PRVS: <SN6PR02MB433547044D0E66D308D546B9CA3F9@SN6PR02MB4335.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /O1fMdWu7dDXcisKNNMpuKw3Yy5Ks0eJCvT7CV+2po/Tt6wc3rZPswxnJwA9f1ggyOHgeiJ7Qmg/f6F6AJJxhyqVXCYKn16fahKHue/90433qVrL9430SBE9H4I1GPCxOFTNZWI9jEJfDURvmO+2UgWdvATEBJ/zKDgnGWg8I0GLeZ73+huvx4XmGlF1AdfG7LjqPoeM+c7dWkDZxqw67Gil0lQv2rhgSE/NwG1eoQ2PNRcns6XpdfCpBsA9WXkGUBxURHAkeWO90c7gfVDqXtDzYDkSFB1UrrYPJc2Eay970D1ZFtcenQTNRyn8W/vwdCD2JTbayBtgxdkVgeBuiqFnuwDcWBl3MlgFaOCxc0yTBq5N5l/Z8SBHWEXNmcRhUlHBXpQnt8Nz7iQUzWMmr7cEaVv043Pha/Mv3PCOQZCV7+jCovQ67M2Yp57jHY64m5gRFqApwQExNUJRGMhREo1701aRun+d1zPLravNlrVOkC7ps1Y4a6/I6o2bK7XY/3rB+jpg1Su8w6+RJapJnp2/da0hC6sBI2hLTKjC42HuMeNjuAlLRxgZlMwl16NIfN467ILVhVVIyyDBL/ylDT84mwBxCiSrWe928xOusS0iCI7aNXWu4XNfpDTxvEV4RthsCYCf5gglxObRaBa4NheUDTtsKPNC7x6vwAw88QEuplAxq03qrDbeA/B/hU1q
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(36906005)(6636002)(316002)(9786002)(1076003)(36756003)(54906003)(6666004)(110136005)(82310400003)(8936002)(83380400001)(26005)(4326008)(36860700001)(4744005)(356005)(7696005)(107886003)(186003)(7636003)(44832011)(5660300002)(336012)(70206006)(8676002)(478600001)(82740400003)(70586007)(2616005)(426003)(47076005)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:23.8638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91f9e37-3c72-4cca-2a14-08d92436fce7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4335
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 715dcfa5a922..e516c1ed358c 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: xlnx,xps-iic-2.00.a
+    enum:
+      - xlnx,xps-iic-2.00.a
+      - xlnx,axi-iic-2.1
 
   reg:
     maxItems: 1
-- 
2.17.1

