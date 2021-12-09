Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434F346EA98
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbhLIPJd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:09:33 -0500
Received: from mail-co1nam11on2080.outbound.protection.outlook.com ([40.107.220.80]:31840
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231782AbhLIPJc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 10:09:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hevRM0noGIn92FCbtLMCvuUAQyEEm9y9W7KTfrv1wdLXJQ7TPCvd7gst9YEh5GDp8fgtUHs6NcX6TS2uzbQFZdNazAhhR4qOG6M1G3Q6Ulid/u+th/Fd8Nm60if401h16aARqJ+K9vxnbtFP/dhPjuBl7kNwSYhsdvCy2JE0YfRrH9LTkREP1+vtyIsElHruwFl/UbJafpVGC5kGjNgPWKmLUeZE2gW2AuagpihcoHTzXxavTZqBhwv2nKFj7OHIk/R5KrNnKRZNX7lJE5jYiydfkqLIl/SZOZxHypeyoD7Q22RZnPDfqxkAQG4ytqOP2G+LKccacpcLl+KKrPFXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRwQj9eV6DR2mKj8FrI/GIqY8T3YDNmex/FfEmS3rXE=;
 b=N17gpFpkqI9dr0eVyHTfhsOd4ZGPBfLtg2uunbuYCfRYcZ2pWXLn1Bx2ZxbEpx/IGf+BkM61Q3dnO5lBXbp85e+mAwrDwEmojgd0ieCjnQPfimGZkEgvEh7WS6BUNmOPlN0pI9Dd6teqHigh5Fgy/TxgZD1Pgajg0MH6Ga5aEntb/xj7YvNYuys3vCatvD3b2fFhDFPXpDy7orxZ2caXjlcNmNLZrjYAW4pIze6T34k9L+9TPJG4JUpJIw0YsCqjeylNIjXFoXSqgdDdhwe2QXbEmENK+Qqmy0ik3+0DVJ14FD7TuW//kkaEhML9R0/VLxOk8WrQs/SPKyeogtHdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.12) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRwQj9eV6DR2mKj8FrI/GIqY8T3YDNmex/FfEmS3rXE=;
 b=QcVBlBqSaeLcvg18e/8q3Z9zxPEoUrOJciD8tREGqY85CDfr1PceF3Xe0vOdqIk0cR1qJ/f42+70ShmLULFDSdMmF0fBaqV8N7NGmtiO9vHe1z0LbwxameSWrHWXid5yzWVQdgaTxA0HR10+WFh+Nh9bQN03mAof94pSUcixE7nIL92nUH461MYzNrEA1yNSO2BGhQUKTzbpYl+HkHJ13d/z03zZHYSoS38EtJaYa48dtzlaCSgV4XwyR1ks+gAIQE/4X+UGlcnO4DgLftHlvAWiM2rCqx1bKhL/S0r90K4cBogB4yFzsECvNfnrQftloibOidDmIx9gmwqf8iqIWg==
Received: from DM5PR07CA0114.namprd07.prod.outlook.com (2603:10b6:4:ae::43) by
 CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20; Thu, 9 Dec 2021 15:05:57 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::ab) by DM5PR07CA0114.outlook.office365.com
 (2603:10b6:4:ae::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 15:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.12)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.12; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.12) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 15:05:56 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 15:05:55 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 07:05:54 -0800
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 9 Dec 2021 15:05:50 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: i2c: tegra: Add SMBus feature properties
Date:   Thu, 9 Dec 2021 20:35:20 +0530
Message-ID: <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f46f5a-e85b-4d60-bf58-08d9bb256768
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54913F734FFCC02E3B7EC2E2C0709@CO6PR12MB5491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 855MDg5xhEeYVjnJRAEBTvadjRcWTMgX1ETbQmq5rTDaRHzHRQR9eZzmAejK3IzacPUyIeDLmCR11Q4RfN2pzsBUnkpoSsAiDJMNGP+SgYCz73aEO4LUGTNvL0UWKAlZwkbQTOi3pxvhnPUnX7sX7jEJOgeLfaDRbLRl/f5SMrPcbCAMLtNaZ/VzbaSFAOuOnuhqzvYu2tUEW0cXxsdjI8fdEzlPLAzNzt8re0uazxRYxxNczLDqXMd9ub9mkdUfPs5jpa51QB0GMmDUPMY3xRetexLp1PIMeY6mqHrwl6xlxn9jMqFto7R8Qfkiu2Wx7F+wip8aKmwKDCmT9JkGgRNcYTiO7uDWMLx02OhyKFoZTJmYxb2CB+82RQ5j0loe5hxFRAhCTgzTZQbHB85NLLHMcnFojHNWnE13g+np6zaxS8+5rq0hiBHxZIYA/F0hU/MH+kwVypbx5VBVCHqbrgAId1/N5pRjyzMZZw5BvweoCFlFOZOkIARwtGr8GhoWh+UjSscmJHCpgY7LgRROEwSlwD75uMnAr3VXV8aho+ymC70q3uhSGrUjDHcAZc55AabcEr+sXb7F7S6DyQAUr1sxtTNX4S4FBmwLmeOfePVwR0Lfa+7D9lG93oknJIw4a0i06JE7v7Q+pME2yNT7xw1YkbEnq0nTp+8X0M/FajjSDBxqnbZBE7zqy1wwTZTICuTnYqzPGKoDqJs4pAubHomj4gB8QF/i32jEKO1Er1OtrHy/v18gzCTKhUVP0+1KBM4hjVGP4dwLj63SLSYpeDs+c0yHHB1pEP6laesqmgMFdhzXvtBQL781QkqSSF+xluWOreWe4m8wmMVV63OUVGsQ3EBfBgsyyNbxTd1+PSI=
X-Forefront-Antispam-Report: CIP:203.18.50.12;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(2906002)(336012)(6666004)(8676002)(2616005)(508600001)(8936002)(36860700001)(7416002)(5660300002)(83380400001)(107886003)(34020700004)(316002)(921005)(186003)(47076005)(7696005)(426003)(356005)(110136005)(70586007)(70206006)(82310400004)(4744005)(40460700001)(86362001)(4326008)(26005)(7636003)(36756003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:05:56.8363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f46f5a-e85b-4d60-bf58-08d9bb256768
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.12];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tegra I2C can use a gpio as an smbus-alert. Document the usage of
the same.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index 3f2f990..71ee79b 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -70,6 +70,10 @@ Required properties:
   - rx
   - tx
 
+optional properties:
+- smbalert-gpio: Must contain an entry for the gpio to be used as smbus alert.
+  It will be used only if optional smbus-alert property is present.
+
 Example:
 
 	i2c@7000c000 {
-- 
2.7.4

