Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833BC599BE7
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Aug 2022 14:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347895AbiHSMXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Aug 2022 08:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348040AbiHSMXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Aug 2022 08:23:36 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6574E85F;
        Fri, 19 Aug 2022 05:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMwG4ksx1/nrfkQxvuEuFjoSb+oeEUnNt4Q0y0lq9ONaQ5jPq8ErqkYpbo62VZ7cI4VVNtMuFyNT+gB2aFopmqxihUGG8sNLkXtBB/3Bi0KQZxUsLRIArPq5XPAWWphZXaaI2oO46RskZIGoa7nXTs0a4qy4ti1mvlVhwRHngYGXfRhr/2cP4yKPZ6249EIxDgXek8waUydqmuQTXrRF2pRbl7tZwbqngQSYxtFmKfp6ru9v+EO7IT26G96bDMWA+3LMCpEhgblhylTJANAw1jBNeCrcQsYPPNsFUgU6cnswxRRdoLhuBCwxpUIFTlRXKJ69vlD+Wj2Nso1jfFfrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzXbu0RxavaQeiCi7WRCpTH4fptBFZ2M4m3FpWg3Xbk=;
 b=exeVkWQz3YUemFfbf9/RZG89FlWRGHtMZPNOsbpB20pyICIc46Uege/p/j5tOf1mr24xH3F+LNw5A/2uZgPED8M3Ee92Oo9b749E1pUpzLSSBhsXhIKk8P+LPm/2Gx/TDsp5owm7agcwKRUN0Q54gs1H1N9i6+sH4CasAjNsWguf0IAeBXRAS9atKFZTD4ydPZfYGIlYadbSXVUcSXeTSeLov67nHP1glVu8tNEo2p0UuwkRk8z8hh/O1QdwupqbnnvCQpaBNG2J0V0xCLahdZbybnOX8IQMrSyNYtGAuKJ6evBrBL0/ZZ5tSb87i7XEZZwKaVWBc928s7iPu1p6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzXbu0RxavaQeiCi7WRCpTH4fptBFZ2M4m3FpWg3Xbk=;
 b=ngypGiwG3KnjvVzDSOAy5znMkUScxYcqou/cenyux3VYO2AdycTpsdyYtlaTLar4HUpokhRohBTzkPsY7j/hdEp8XCVYXc6QG8l+BFw3JY51APS5k3zDY+Y9CX69zYQRih9uYq9QCLH3bWDZ5d8MFde5gnnwNaGba95i42U3ZEZ9PdiRiRODtmur84fDzBc0MxwL6HMEtqlPqdBPAugH6oaGIZgEF8+rfuvv1EMhq2l7zmdjQgH2n+SWAfhCOLm3cGQH3cmfrQnzJW4Fv4n+zAtNmkMSiD4ZHMIF3/l9U2yluQu8Bwa33fhvssl/Q5A5ddBoVUaTkVnPTKWF+FDbqw==
Received: from MW4PR04CA0112.namprd04.prod.outlook.com (2603:10b6:303:83::27)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 12:23:29 +0000
Received: from CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::73) by MW4PR04CA0112.outlook.office365.com
 (2603:10b6:303:83::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Fri, 19 Aug 2022 12:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT069.mail.protection.outlook.com (10.13.174.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 12:23:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 19 Aug
 2022 12:23:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 19 Aug
 2022 05:23:28 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 19 Aug 2022 05:23:24 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <=jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH RESEND 0/2] Add GPCDMA support to Tegra234 I2C
Date:   Fri, 19 Aug 2022 17:53:11 +0530
Message-ID: <20220819122313.40445-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d65bae6a-ceb1-47fc-de42-08da81dd9fe9
X-MS-TrafficTypeDiagnostic: MW5PR12MB5652:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wgx/ZKcFjy79mwV7krgigGxDLcW+87MZRhPA/f2DHNdDVPIYouKkylR0oC7jmvQuXoc0qP3OlFHT57Oy9GTbBxi2oxycoT3HysWPo0O7TntMUmfVwSOJsb0wQny0DRR1yH1hP2Qk32RhE4nwQM8+kO3pqplcmIYpg7yoEkuJdF0TDXJ8A8nz1aeY18027ANHq5HHF2/bFJkoFT6Uk9KdV9vGdbxFByFePWgBQJ9NQtNe7bAgvPMrfqZDH2/PcOz15pBtNukR7+V03lUfR8w7l+obBhEJsofiQD9gDF1cQJ1uFMTTumVETSsNfrU97k0Tqfc91dSYCUwd8bMTEGKj6fVqQznI1wA233+a/EAZofhfLXoIaAMXxBg4N1+N167AzGbgaplK3YYzhkbx9p3Q+1QCcXacJ5UkKfbmjjNaX6rAP51LqVLZ+ZQhY/af+uivrto3jdemshs3XPHdB3navXEqnITbpmsdAFRfjK/G7EvgAeTbZmuskO93VxKsLfXHpIXQd5QWmUef57jSN811lhVIFz13RuNrw4dMmOj0NsmAbmaDv9kcPS6VBy8CAhQvWMjFnmULJz3lHZV6WthFoYAm6S6VwMrgfvgDeyzXIBSpmCdIwlDmsH5IpS9urTP8iyrZBF0Eww4bEfIfoyfTSY+vD5n1jmO6R73Y+cx27eD/B0Hclj3n5CpFCXK5SsAK1k6hODPIlw01Dl7NdGBs2VfYjhvzwO/AeMxuJ1KQ4E4GISuQFnjJYxU3nzXdTRYCwjcalO/uMP1IUdL8bp2Ecit7Fq62Zaz9/YS1pzT0CHwAQB4w59PbvQQEd55ke1jNNMCtZDM8upigF0+4eeeOt3xIBzfz3qJQnzbwqaH26UE26ulJ/S7ek2+wdmgoeglh
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(40470700004)(36840700001)(46966006)(4326008)(70206006)(70586007)(36860700001)(426003)(47076005)(7416002)(36756003)(2906002)(8676002)(5660300002)(110136005)(8936002)(316002)(4744005)(478600001)(41300700001)(6666004)(107886003)(1076003)(2616005)(186003)(26005)(7696005)(336012)(82310400005)(86362001)(921005)(356005)(81166007)(40480700001)(83380400001)(40460700003)(82740400003)(2101003)(36900700001)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:23:29.5756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65bae6a-ceb1-47fc-de42-08da81dd9fe9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Updates in Tegra I2C driver and device tree to support GPCDMA in
Tegra234

Akhil R (2):
  i2c: tegra: Add GPCDMA support
  arm64: tegra: Add GPCDMA support for Tegra234 I2C

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 +++++++++++++++++++
 drivers/i2c/busses/i2c-tegra.c           | 39 +++++++++++-------------
 2 files changed, 50 insertions(+), 21 deletions(-)

-- 
2.17.1

