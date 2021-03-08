Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284753311A4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 16:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhCHPGg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 10:06:36 -0500
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com ([40.107.223.70]:22208
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231308AbhCHPGJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 10:06:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgLQsZR3xS3x1JWGEKD0V3NggLy/p2WMDQBS7RwV/GEzDaEoyMc4ctXeN04Lo4ZPmL4SHIi4Jvi6bOZEZT2KPFqpPKespauFqGGQaI3hOehmvu4pgchQoHnR9T20w26b+13fkT35g9VVXC8gwKYm5CtWwEYMZGU6iFX0StJBklKA2+XiYPy6+MTMytSc3gSiRD6bog3FPCxxd6v1Qx1keohEzP0Hu49xJXqxxv/9CK/4rRVjima0L6X067YUQa1Bxjj8RtetZul05aiXqjauiAd9dF9e9cjbuQNEmjggWB71iBLJMBPQs+9yz6ZlAxH3HnzR8JkRY+leCEyyXrdLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKp2F394qI++yz2HkWbUDjxFBUcW4Y8PLIDPD9ZbOUY=;
 b=Cj8q1KKHSFOP4mx1KCAH84GSP7AbiZrp3yvHfYJKM+md1nU48iNurjQaM1eLg6LTiZWWdsQi9mcnW9p2p8lvNP9G71m/SZRJtDPmPEt/h8XaycuaDPGPVWZ+A3zscveuo59rLgcX9vOOvDOzs3wPRHENs6aApNXGPivJP49pH55c+0Rq8QVtdSe1Frq8ySQ6tbsTBDchJdkFLPiJ4hCnxHirUMVUi9xRmm/bprAPMEPizcloM5dXdXJez+6KGmL2dTLjb8uGz4+DdUBbf6oSduvTX3rQoXH0nCkBJ/Wd9XNCGlZTaPSp6z4CbdTCSuNW4AmV52Gzk0FBFmOuRgEWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKp2F394qI++yz2HkWbUDjxFBUcW4Y8PLIDPD9ZbOUY=;
 b=J8HBtBeC9K7tP59zl0Vnzux1hrKexz6KbrFURdcpuHcnYIen8SqI1Vf7WVwaljm/FrDIfINoGQ5UzxCw2tvUp7KFroS2Eud6wkgZGJdR+sPXTO2ZDbxwR2A90e/Kfn8xxSqIUaTnxJ6R9iE3lZue0JH5CP3ZA1W+qBBxERmVzco=
Received: from SA0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:806:130::7)
 by BYAPR02MB4728.namprd02.prod.outlook.com (2603:10b6:a03:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 15:06:07 +0000
Received: from SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::ca) by SA0PR13CA0002.outlook.office365.com
 (2603:10b6:806:130::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend
 Transport; Mon, 8 Mar 2021 15:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT008.mail.protection.outlook.com (10.152.72.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.25 via Frontend Transport; Mon, 8 Mar 2021 15:06:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 07:06:06 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Mar 2021 07:06:06 -0800
Envelope-to: devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=49108 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lJHSQ-0000LX-KL; Mon, 08 Mar 2021 07:06:06 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <shubhrajyoti.datta@gmail.com>, <linux-i2c@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] dt-bindings: i2c: xiic: Fix a typo
Date:   Mon, 8 Mar 2021 20:36:03 +0530
Message-ID: <1615215963-1042-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf4faee8-9fed-4aa8-b586-08d8e243b367
X-MS-TrafficTypeDiagnostic: BYAPR02MB4728:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4728549FCAF902141B5FB59EAA939@BYAPR02MB4728.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Og6nKXMzUdhUEFEEke5UXZA1x7UjZ9nF+ulXMas0rCgjmx40tGYSGol4uwx/TEd+m7fEyFtkUQbuAEKIYc0sRVkPN/XljDYWLYIg/X4PMaRT1N6cCm09XCrbmKTZ7GVlOxHs0pAojGESzS9wkhK75EK97ExWYBbr0+ocDE+wS10406ZXVF4wsXMrRP9OioOrnuQR+Oz350IiwKD9EM3pkEq8Scq09I5IMYdxf9GzBQh6muAS7ZV+9i9VuJSzlu8viNtc0vxLmIDGuQkWw5ELC5YutFsHZWde4vqQHBqrHupNZMezlpFVzIi4icNfjb0vTtRXCwP0tsI3ZHZj4pYz2EfSqlt9yFLH5e12v4XVL8EVfOHdmaj8MFdnLk1S4C3IRwPYXeEKx/zuDVP1WcfFB75uIx73qpMJrZja79mQDnvR0MwRTokMlnMn6BoxOnf10T/fTGCDTWXm5vNrw+w91rVOhjHjHhWOnrGnn9Hq6nSkguL1TvMi0x3PZ1TwRdLSMvE59daA1QbOQXoBhDLJJEq1Jwn0JvqNA4q8/qrnq0KuJ0T4XhuJ+GopX7LUmuOH+QNeiR1wOjpgGlu6HcTUVq6sjFxZB+et0F+8cFNtQ0xKQRH8xL9eaCTWRObWWMsuxCRo2G0xVOstxd/Yr3C8sA8lIRI/iJoitNSr6b7VmRPj1SwpiOWmzRmrNN0zsUzqGhBXeUDjWVWI/rERoUcsd6kWXah4/Q5/269V2KcUQ997lTCb5muu4R8FJKI9knd2V7t+4IDoRyRwJTMMW56Y8Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(4744005)(107886003)(9786002)(6666004)(36860700001)(7696005)(7636003)(356005)(6916009)(8936002)(5660300002)(8676002)(82740400003)(186003)(26005)(82310400003)(70206006)(36756003)(44832011)(83380400001)(70586007)(478600001)(2616005)(4326008)(336012)(426003)(47076005)(54906003)(2906002)(316002)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 15:06:07.2691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4faee8-9fed-4aa8-b586-08d8e243b367
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4728
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Trivial fix. Correct a typo.
Fixes: f86ca4147976 ("dt-bindings: i2c: xiic: Migrate i2c-xiic documentation to YAML")

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index ffb2ed0..715dcfa5 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -4,7 +4,7 @@
 $id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: ilinx IIC controller Device Tree Bindings
+title: Xilinx IIC controller Device Tree Bindings
 
 maintainers:
   - info@mocean-labs.com
-- 
2.1.1

