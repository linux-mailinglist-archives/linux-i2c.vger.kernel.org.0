Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C617785CB5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 17:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbjHWPyK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 11:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbjHWPyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 11:54:10 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3D3E5F
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 08:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxgORFY4GhBSFVybCQrzfQmmm/eelNu0tdIdIRRGrRAe8FbgjUPFARzMqOyAJy93Xmhvn5I9yIM/1tlLiBiPufZfAyb5yY/RC0PIsd7TUtLyWRIrcY154bB7vLOCpLDy5lAKJ7gFWpGtELI7n1cTwM1CVFVs2qJ5W6vkbONDBG8kJyvDVsieLSVh05HPkSbqAoyuT1noqCQY+nSlK5y3zOO7ZrpcimPrJ+9gAlLMlfOEk8+aQw1bbozwyZufYZ2kIlmqZR05YRA/3itD22BUVEAKdiCc3k91t4aRj/95HaVu8MWKs5eteovww/YnpfUjXYXLwqP8vOvqqmcgLTz4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbvsuH63x8n0SpWxVYd/WoFU5Kk3LacJB0xMVM1eJkU=;
 b=H+ADoMo1Hz6mw+QurQGgCXQ+ehujkVhvZ+tCUVAnFa8Ti6PnUrA9Rwi8uVJrgFM67N+IMKNQ/H9hafGgQQkb8AtvA3Z3w8qALFpuFcgTSl6TOyezgyjmjPjUKtThlqBKKt6szpOyPldv3J6Lwf6zgV08aTnWbnTI8NknM+uxDxQk7f5fnqBdXC/yUtqAOgfB9FrZQBriWbWzkFQKKJ+qeVauoppFC496DHiQYZxeiPF3A7UStItuUlA6v7cZ5lFNZcv/qWRDna149PepP8b8qWeBTE2KXGPAOVVnT5+ZIeyJkO+hqC5ltbvtStuCns0QTocFZ1a2wAg55Ltsy3wn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbvsuH63x8n0SpWxVYd/WoFU5Kk3LacJB0xMVM1eJkU=;
 b=o1ICGVKUrN2lBFEAI1rQ5gF5Qj3C2Cvoh2gxZqgb9mYhfJtwZVfRat1aM5EQ/CkJOuFyOpliG57I3DSHKmLDXQmKDlikq3Ofu8JGo9zqTg2l7BGXBDJGQnpNNpC4viVi9E2vrepf+rugGPDmXWv7nfDxh4JxCfDb/43xAFY92XlVUPtNyyZRchld8osMQejsC1EK58I/NKTQntW//uyaqVZQwuNlnIV1mozAlKDosdrMoNWYMsaDh+DD5CqkS99Pz/HkOwTxPMFtg+lYPKuecYRbphF0JZUni+sc6EB5Jb0SqWzXUE+P0NOl++g2FQ4XNLaWHZNHEZ75UP9u+HZWbA==
Received: from DS7PR06CA0015.namprd06.prod.outlook.com (2603:10b6:8:2a::26) by
 PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 15:54:05 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::21) by DS7PR06CA0015.outlook.office365.com
 (2603:10b6:8:2a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 15:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 15:54:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 23 Aug 2023
 08:53:51 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 23 Aug 2023 08:53:49 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <peda@axentia.se>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-mux-next v2 0/1] mux: Add regmap based mux driver
Date:   Wed, 23 Aug 2023 15:53:31 +0000
Message-ID: <20230823155332.48648-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: abefdbe3-67ba-46c4-b732-08dba3f12d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2Mh6YWPLLLpv31kdhrjIBwwUsftk3AYjVYnyw+9+uHGo2w0qAlJaksas1NvE3YuHc5obL1J9jB2zBf3Lkh7s32zR5qOsn9315I6ygMZZSoO3/1ZptwAlJmVJP+dNfVjE1frQQuhWMSmPM0/19t7OLdu7C3GiNs9dTAqE6DNARil7je1XcbA+6+6xzcMUv1TbqJzHYyLCI92n+tG3RDI45UIUZ9iO4FrgKfBw9kwKiyiDso7Z9319sUp4xQf+w2v+5tocjvO1cGf1sGwhT91EY9tnOh/dZR3ggHjLKB8UnKeuNsBg9Y4QM64ffieK9pzUWCd/8TilkVvYbtVeylCJKCHfggm3JdhntfNMTTmH1sD5l/WL8ckQP0vrXy8BLu/nDkWuRVDEsf7D8x3l3ambWQVsQfkEJp5NRTdC23AUo6fjvxx5X2pevNTsKpl4MvwBGyYi3xmis3MlO5x+ytrBY4ifbmZV+s1k/vBNjA+f+6ocl4y47W4QVYk8z363/FJljZaiZHRHt8xEYEKU3qmZiOc/jVKKI82G+ctEmP76wKS+O6mFz4kpuG72QsPJe4e7NaYyg7LFcEr5nohq0AZCECi3VwVyAA8MaD+yBTbhd6SSF94pb3hSc71YYUB1gouuLnodVRE6rs+hWyDLhfJEPtYyPsZ084M8MTJJSueQWpRGs4y7gk0w9nxnTggNXMOKJaLGfCax2SRaI4/sLQdY1JdJI3lOe9f8z277jaHlZI5JhrHyQxbO7gNBX8wgr3I
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(82310400011)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(2906002)(4744005)(40480700001)(426003)(5660300002)(336012)(16526019)(86362001)(36860700001)(26005)(47076005)(2616005)(8936002)(107886003)(4326008)(70586007)(316002)(54906003)(6916009)(70206006)(82740400003)(478600001)(8676002)(356005)(40460700003)(41300700001)(36756003)(6666004)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:54:04.9654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abefdbe3-67ba-46c4-b732-08dba3f12d9c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changelog:
v1->v2:
Comments provided by Yann:
 - Fix 3 comments Documentation/i2c/muxes/i2c-mux-regmap.rst.
 - Use 'unsigned int' for the fields 'num_adaps' and 'sel_reg_addr'
   in struct 'i2c_mux_regmap_platform_data'.
 - Fix comment in i2c_mux_regmap_select_chan().
 - Fix comment "Probe/remove functions".
Added by Vadim:
 - Remove unused field 'reg_size' from struct
   'i2c_mux_regmap_platform_data'.

Vadim Pasternak (1):
  i2c: mux: Add register map based mux driver

 Documentation/i2c/muxes/i2c-mux-regmap.rst   | 168 +++++++++++++++++++
 drivers/i2c/muxes/Kconfig                    |  12 ++
 drivers/i2c/muxes/Makefile                   |   1 +
 drivers/i2c/muxes/i2c-mux-regmap.c           | 127 ++++++++++++++
 include/linux/platform_data/i2c-mux-regmap.h |  32 ++++
 5 files changed, 340 insertions(+)
 create mode 100644 Documentation/i2c/muxes/i2c-mux-regmap.rst
 create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
 create mode 100644 include/linux/platform_data/i2c-mux-regmap.h

-- 
2.20.1

