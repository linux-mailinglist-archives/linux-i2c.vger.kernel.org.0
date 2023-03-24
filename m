Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB416C7D8F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 13:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCXMAB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 08:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCXMAA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 08:00:00 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFD123C68;
        Fri, 24 Mar 2023 04:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9N+g+48pJM9zHjirlhB9C10OdvKahIjqtpXgNYBYSvlcL1ZQ+uM6Nd6N7mraNmFRMRdWeOo3mOMjGfsKXPSI+C00BKhYDwtgeYLneFiKcIFPmGq0fQEtCRn3zyUSc/oduwuwSpSID56nkZIUY5zmSEG6tMeBTkO3JCWZkUUBqgiIUpfW9kLm2mASye9YOBk+HdrcvZo0gPsxn5mcQbpO1uio3GeufWVX3XC4c4rXQhQ9Jea3vj8FQsm5QJ3jXBhPItnYysyrZghRpauMG2uDDNKXC+UHRB/h775TtZXSggFoAK0zT4DtXxYbykV/AczVUiKfupsm7PpDS+LuT4vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOEphR0ddAF+H/cBDADZDU2k3G2PO8xXS0A3/4VNCJ8=;
 b=njB6j6Y8MEVHeChCwt6LQ1JL40t2YUJjnTl18cSIq8NfSCJrviQ3U5OxnI+RzdZDVImUceLd77IOhOXb8s3v1fe8QzuQW4om4wY8tKr/i3J8tImdvAfLBduCcgIKfsbPSRdGhX0Qaop8MZX6wfqgvkC7roUHimQBdHzF7xr/DdC2xr7Rd2cm+ayWd/3o3MRt0z1hsd6ll6aFaxeB9U/klbtVBcsVsfJd0Swd+sIfB0j16ehLoXX5+M0WQ6ysmWve/9fUWs/JayO2ndgkjkxkdaD4cDsIEV/srNmJROYf5VRpqwXM8foKjFWQVrvFJnCwrP0A/3uZxKSOs/92o7UGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOEphR0ddAF+H/cBDADZDU2k3G2PO8xXS0A3/4VNCJ8=;
 b=jL6gvFcgzSxUJTjieSlyU5mU+IBNYgApOT/nVK/VtgkcJ/a5uKrmozp4swzL6YBrjEoeceBhiuQb8e/zkac5jluaQDS4I5Pjv/zm8OAKUDBhFKKnO1btU32cgeNQWCQ52B8Cyrhu2N0ggc5/8mslY5b4v0omd7otvTMhF5A1F2FZLbEIhhUrbCrRjjo1tg78ef/Hkbw/JNPsyZ59b0KOy0TcS7CEW1JayQCL2alQ0uUuKKHI1QFEOmQwSc2LXRJTqCRopP81vdM27gatGrzPD+H5yMGrJOdOIT7+2wpenB7osKhQvgvdvqYw/fLXB6sAk6Af6GPH1Nd7IVHCTJnKoQ==
Received: from MW4PR03CA0254.namprd03.prod.outlook.com (2603:10b6:303:b4::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Fri, 24 Mar
 2023 11:59:57 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::8d) by MW4PR03CA0254.outlook.office365.com
 (2603:10b6:303:b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Fri, 24 Mar 2023 11:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Fri, 24 Mar 2023 11:59:56 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 24 Mar 2023
 04:59:56 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 24 Mar 2023 04:59:55 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 24 Mar 2023 04:59:52 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v4 0/2] Tegra I2C DMA and SMBus blockread updates
Date:   Fri, 24 Mar 2023 17:29:22 +0530
Message-ID: <20230324115924.64218-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|BL0PR12MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 487060c5-d3dc-4ec5-ffa2-08db2c5f4983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQj+WnOL+LxvW9RhfykF360b+XekWAj7MkcPLK4VZ5FctgvX4bBdmT6P6ns2FgpUxEZZlvpXJhQLlKpCPyjG3xsXDPTVQh9/d2y1JEwZSaphabhFSdln6lJmIgm5gJWrHghJvPuGLOafe/h15jEhENvk3o9WPDn4Q5idK6doYDRpYt+4P+3rkjUeKMJcqD/01AFJxv/NRRu5XEVSnaSLVhOPyi2s6bsHcyNwxOLi9uOQL41CTNsxa/dP80Oz9k+2PA2rf4JxMugYS+5eDUClqqhk25AdJLCl/Mwjg61c8UqZ+EfSLDnzwlUwRqoBxDhoB6XwMCR8LCMd8Zrb6p1MHdj2TFP4aOvUzKiPNvihuLow6chU0rQdWbm2bUa1kGuEr0xrLFOCOeZfixTdt+BvxqMh7ui0vv68JvDOe9hxjX/dKyZiThBd6CCG5TL7qNYq7/fVMbTJymjcmO76SN4izSCxUn7+ladYbK98m56kOOFHBYIvjRHT/E4nMvk3rLSTpQ05SjqyYta+Lj43oBXwDNtU8gG5wkQQMhmO+CTzgGXj1lIa5G4y/ZKqz/OQpm4L/vv5NwFc5ZcipBRW5F2dnvQ9EtAqyk5w/ANtbRW4PvMNN+UkE+HcSmEOl666XGXyMBhS5VupzBfyINjY52QrsT52dw9jMkKAwhvDqR/6zX5cUYRxV6g09qpOAooI8rqJH2RBeUlU4OK0UOnIc5rcIhRpY6euDFbX6vkWNurWN3LWgMy/Hf23I4So12w1hQG1U1Z8qLAQT7qxaGIHWUa5K/gIp0QycMgTgx4zB2nV7pU/n+OP8D8/G0qXDXgBXC7KXcPnbel+arxtscmDkTdvWw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(36840700001)(46966006)(26005)(186003)(1076003)(6666004)(107886003)(36860700001)(40480700001)(36756003)(83380400001)(356005)(921005)(86362001)(82310400005)(82740400003)(7636003)(2616005)(426003)(336012)(47076005)(5660300002)(316002)(8936002)(7696005)(4744005)(8676002)(70206006)(4326008)(41300700001)(110136005)(478600001)(70586007)(2906002)(966005)(15650500001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 11:59:56.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487060c5-d3dc-4ec5-ffa2-08db2c5f4983
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset contains two independent updates to tegra-i2c driver.
* Update I2C DMA channel usage to use single DMA channel instead of
two different hardware channels.
* Fix PEC byte issue during SMBus block read caused by mismanaged
msg->len property in i2c_msg struct.

v3->v4:
 Combine the two patches to one series to avoid merge conflicts.

Adding the latest independent version links below.
https://lkml.kernel.org/lkml/ZBxZlNOhLyUZi1B+@orome/T/#mb41b90701e70d9663d54455c7e014a528c589284
https://lkml.kernel.org/lkml/20230322131037.53805-1-akhilrajeev@nvidia.com/T/#u

Akhil R (2):
  i2c: tegra: Fix PEC support for SMBUS block read
  i2c: tegra: Share same DMA channel for RX and TX

 drivers/i2c/busses/i2c-tegra.c | 107 ++++++++++++++-------------------
 1 file changed, 46 insertions(+), 61 deletions(-)

-- 
2.17.1

