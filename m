Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DEF48D8EB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbiAMNbN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:13 -0500
Received: from mail-mw2nam12on2077.outbound.protection.outlook.com ([40.107.244.77]:29272
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232034AbiAMNbM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxwLdc7po5jNLa4vnBB/bUMojzLCiGxaI5D1IsGxgmEhhEJgVmibFoH5QxzTqPpR0JNnTtxnr90Ijc6E/joLumVgeB4ITdkpLFNq/HOXW2dVLmG9HWRXzx4RazGbEjeG0o8b7mJ3PjcF0UcGs3wY2Q9mHfKjXynq0X7UReP5AsBbYsFZhK1M1BgVv7d+7Xc418MJfQutCz6pz8lU4KvEmo9twObmXM8QaFrGPtHfH87cwE1RQYlqOpsQza4JKO3NgD2Inc4jRliXziZIOg8sssU7JtxvX0FConSC3N8Zs0eq3dyYYDloT+qXMgGeHQF1HM9Ilpap31WuGDkQLylY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbLMd+sYGaX/Q/7v/g6hvJFzQ63GYKBhQwahmY4YC7o=;
 b=X5FaSC8ZEVMo5zhxToVY9OCQFgD4xRBRffAmid7NsD3VleEEWovnSmzh52f+1nt3SNBSm6pCLVwF1Je7M/E0t88YoYt0Io9+fjOshau+6kLxorR+ETDUA9gcAGFJ/5oy7gkAdqmfAJZy+3miEM31jXjcZpjVqywx7IjQKNCO945E7ilYEdgpHOj6ak6FOh25pZzmRdJzyaAyIFFIERciHFo7W8nHn9JEqNx2L5Dy+fBhaKgCy3teS5qbxMjTj1jRq6+XKgf5wJ0K+vjmuaFvPVebTcXpOb8uef+fZFFPBlk+MKYhZytoOMw/6zuujG9Fv+5lKA9k8pbUL2FtSvJ/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbLMd+sYGaX/Q/7v/g6hvJFzQ63GYKBhQwahmY4YC7o=;
 b=EDkDaBTimFdEN7f+075u/oGQTFHBUubx19UVIDtd1EPotAJv9PGY407LGGie64+LT51gKuRXAFOUOlHDZEWbuavTI3kIECHCq6SimFqZOW/R8dC5FHhbXPiT7kytEgUb8CzOh3ukEUN8tsro2Tiw+WEsug2njqwpCNdDmn7UoRgpsfPjol/vj/p28PyF8aqKwlY1gD7PEIHB6dLVjjzwyUtHYzyezGsvvVJAjS+5YHFQIhjrb2399wQMs74HrPBAjAwjYD8R9qvmHrMQ2tAvBej691lQTc6n1/X//W00JUQkyrs4Kkpl0Xp6xWFwCFOHy3uGJGJC+vKdQ0fBBWM/YA==
Received: from DM5PR07CA0056.namprd07.prod.outlook.com (2603:10b6:4:ad::21) by
 DM5PR12MB1851.namprd12.prod.outlook.com (2603:10b6:3:109::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Thu, 13 Jan 2022 13:31:10 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::7d) by DM5PR07CA0056.outlook.office365.com
 (2603:10b6:4:ad::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:10 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:09 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:08 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:05 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 2/6] dt-bindings: i2c: tegra: Add Tegra234 details
Date:   Thu, 13 Jan 2022 19:00:19 +0530
Message-ID: <1642080623-15980-3-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7697f11-3533-4b90-bedb-08d9d698f65c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1851:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1851022FFA8BB686D87B6C7BC0539@DM5PR12MB1851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YilOuxW8MdGEZb+SHCZf6unoEbHN7kdlt4/abOK+afg8Taklb5ZqmhifCf6URiDF13QIu5Ua0APXQ9W6BSJ2pzpcuZmKKCmrwcD9+KOe5Yuy6VMCF3FqRqTNFE4i5OJMtns9+crupQTiksnmHTBw0YkYHmNdFmmlz0zaPL06tRRTqh3kgm7WxCB6AlAMJIL4idF1jkz2sF1U/vJWRBnolZryE5eu9sKraCKLHDl5/XGrsINNv7OYYPqgfCwWvSYRuthJ2FLhTeur2/53nWoArCvJsx/jnDaB2YQOC96NGgVc/NyCfTBVaS/YRoR+pLhHiKMDTMm+6clryWm/+BhewhMEgp1GUqt6J/uB8Wf2RhFjKclacHo2Q4PFYC+g0Fx/oq3odjAJRlAU+iZHmW0eAXjP/aq/ekdrvnlB7Sl8Tjbb7n5zG/WNmyDkLJrPghXX/ghEViOsu1BQPf5Pk2wld3a7+Vh4UyFpg1OwAksP9tsFxdbXhc6b97Fuy9jGiA8xx7+nDjZcbEBqQWQKUBcoPAg7UioQW95aydWwlRlYlJLRWrWDcXdpwEHZaPmfLVcyS3Gm2wu4IDmJ5LYMmkm1dA1wLsHChExv7OTEBGS/gn3oeheSips7SpI4UanBYBYyvBIRHBqAQN8aKJICmPhmrwP2AZDiRUWJIU+H89AmI79Jj5UhLFzptLaNTrNCDx3IBFMWwS8yern4vx1x3efw2qb4H5OELBaYo4vK7OKun/lGaWzNJv7rcRE/2U7MPqJ8w6YWGyLA0OBDaYRAlfN24xAhi8a05P5nqeY0gO1zRIR91TfWMpm48H/LK6JcSI7
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(6666004)(921005)(36860700001)(47076005)(70586007)(70206006)(508600001)(2616005)(426003)(2906002)(8936002)(4326008)(356005)(4744005)(82310400004)(316002)(110136005)(107886003)(26005)(336012)(5660300002)(186003)(36756003)(86362001)(81166007)(40460700001)(7696005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:10.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7697f11-3533-4b90-bedb-08d9d698f65c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add documentation for Tegra234 I2C compatible.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 424a4fc..c58e256 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -80,6 +80,11 @@ properties:
           support for 64 KiB transactions whereas earlier chips supported no
           more than 4 KiB per transactions.
         const: nvidia,tegra194-i2c
+      - description: |
+          Tegra234 has 8 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. All of these controllers are
+          similar to those found on Tegra194.
+        const: nvidia,tegra234-i2c
 
   reg:
     maxItems: 1
-- 
2.7.4

