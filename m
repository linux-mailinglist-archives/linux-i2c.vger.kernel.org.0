Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5575F994D8
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 15:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfHVNWA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 09:22:00 -0400
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:22022
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727401AbfHVNWA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Aug 2019 09:22:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhUEwXQju7z1avCHyqTbPeA2UsHoffiW8n9zyUr9YY61knIUtK/ewbAKpSKoU0kvb6iYPdn0ft6w2b870e8Lbr8sTmqoFoLZKJLiwA4t8hpuhBrwAaP9Cd+AGKqbqXM1XfLuwJQ8Hm1SGcSvKIwczjK7/gbE/OplU49kDFcmHILBxXRp803QRS6frn/BgGndKmJaIV0HKyocBneBBW3yIT1V28cr9qHcNJxEW3LMEeqhcMjeS6GH3iCb8mcgY6MZ/hry3DhK9JgSp7RD/SX5zLvfmdD6br7rLFKm421LatJqFo0sY0tRMvo8LpNXZXN5cyxKnwtWQ8qZqshC5xpO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGqVuFOVxdXce1zQr38JuZZyFvSzUDLiSkgbrnwp41Q=;
 b=VyZVeaVtGDAZYvrqneLaoQf1YSD/pRwxTBgCeT9uuG5SPxI9gfdqTgQbGJbBz9oOqtkziVX1DGDPj/VOglJpkeNHq/l8Lgbk48t5SnBrRLYI9iHHEkbNq0IL2jI7Ig9tYH7j8jel9EnkByPWG1YsLxZO+TkYNt5kZgxo3XGWTIcRlNsjUlJ8n294QkLc/FmRwz+p8dg9VjbqYD+tawtTNFHXUORKRBrpIkNavOxqniPsreHxh+6177v1RBZH28VmILJklF38LNjZdf01buKpQkkCJqpi6xs+zaQGhfv3ZKBO3p6B9d2tKWVAtMIgr1e7vixHwjiUYL2LvaILWOdu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 188.184.36.46) smtp.rcpttodomain=lunn.ch smtp.mailfrom=cern.ch;
 dmarc=bestguesspass action=none header.from=cern.ch; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector2-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGqVuFOVxdXce1zQr38JuZZyFvSzUDLiSkgbrnwp41Q=;
 b=j58ZasxCWVPSuYKVCqH4LcCRkBUt2WaMCxgYsJGq5LxXfVgeF9QWplIMxrUUQ44KhpzSrW578XVJbJKEjBZ06bftuBhUKPJfzjRR5tgrOhmYgI/TGNjhCmD0Lse0U56YSiHuCRLjOXfuAllO6Tv3HcQdKjNcM9KC3lCZXdAOQRM=
Received: from AM0PR06CA0045.eurprd06.prod.outlook.com (2603:10a6:208:aa::22)
 by AM0PR06MB5299.eurprd06.prod.outlook.com (2603:10a6:208:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Thu, 22 Aug
 2019 13:21:56 +0000
Received: from HE1EUR02FT048.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e05::209) by AM0PR06CA0045.outlook.office365.com
 (2603:10a6:208:aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 22 Aug 2019 13:21:56 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.46)
 smtp.mailfrom=cern.ch; lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=bestguesspass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.46 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.46; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.46) by
 HE1EUR02FT048.mail.protection.outlook.com (10.152.10.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2199.13 via Frontend Transport; Thu, 22 Aug 2019 13:21:55 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 22 Aug
 2019 15:21:43 +0200
Received: from cwe-513-vol689.cern.ch (188.185.69.206) by smtp.cern.ch
 (188.184.36.52) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 22 Aug
 2019 15:21:41 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Andrew Lunn <andrew@lunn.ch>, Peter Korsgaard <peter@korsgaard.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Federico Vaga <federico.vaga@cern.ch>
Subject: [PATCH] i2c: ocores: use request_any_context_irq() to register IRQ handler
Date:   Thu, 22 Aug 2019 15:21:32 +0200
Message-ID: <20190822132132.16557-1-federico.vaga@cern.ch>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [188.185.69.206]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.46;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(199004)(189003)(66066001)(316002)(16526019)(36756003)(51416003)(356004)(50226002)(8676002)(246002)(70206006)(70586007)(47776003)(53416004)(1076003)(486006)(7696005)(14444005)(16586007)(110136005)(6666004)(44832011)(7636002)(305945005)(54906003)(7736002)(8936002)(2616005)(956004)(2906002)(107886003)(3846002)(6116002)(50466002)(5660300002)(478600001)(426003)(4326008)(48376002)(86362001)(126002)(336012)(186003)(26005)(106002)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5299;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx13.cern.ch;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163fd633-7b02-4f73-ef29-08d72703b3fb
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(4709080)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR06MB5299;
X-MS-TrafficTypeDiagnostic: AM0PR06MB5299:
X-Microsoft-Antispam-PRVS: <AM0PR06MB529927AA670C72117B4B10F9EFA50@AM0PR06MB5299.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nbgd8NardOEhV/F790KxcMoi/vfGN40iwgLb3uD6FwVJxDtQ9obUJA2r4zdPkqDMI1izyaGZzKcchmZcPJFjqvsfnXIeU3cJ7AvDLG0+xOD8fX68Iyaa+Tiitl2RWOrCGkHSGlFTVAOv+6hvcd+950YS4gHzZ6U24W/kVmtOsK06mR7P49GHDmonJuA27Vg1m4lEMXoZ7cObfgRWg6CDLScHRTfo1q/VFwn9WdF1kedk5Zj51NM/Vs38Hw/8RXmLoMjgAJo1wbAXh9TV0mlrBkr1yKzG9niObzQD4z2f7cgikJKJ4WFZwXQcmk1alcFxHPdQ+hGwQJS8DcbrK+Nna8zavlIPvK2GU/n4NsDpqR97hMxpg3sLok7zjYGKMZZFAesqkIvhFPP5EzkRXjj5RUOn8gqU2p78sy7Yk8nt5rY=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:21:55.1319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163fd633-7b02-4f73-ef29-08d72703b3fb
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.46];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5299
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-ocores device is an HDL component that get instantiated in FPGA.
The software stack used to drive an FPGA can be very different, and the
i2c-ocore ip-core must work in different context. With respect to this
patch the IRQ controller behind this device, and its driver, can have
different implementations (nested threads). For this reason, it is safer
to use `request_any_context_irq()` to avoid errors at probe time.

Signed-off-by: Federico Vaga <federico.vaga@cern.ch>
---
 drivers/i2c/busses/i2c-ocores.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4117f1abc7c6..ca8b3ecfa93d 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -703,8 +703,9 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	}
 
 	if (ocores_algorithm.master_xfer != ocores_xfer_polling) {
-		ret = devm_request_irq(&pdev->dev, irq, ocores_isr, 0,
-				       pdev->name, i2c);
+		ret = devm_request_any_context_irq(&pdev->dev, irq,
+						   ocores_isr, 0,
+						   pdev->name, i2c);
 		if (ret) {
 			dev_err(&pdev->dev, "Cannot claim IRQ\n");
 			goto err_clk;
-- 
2.15.0

