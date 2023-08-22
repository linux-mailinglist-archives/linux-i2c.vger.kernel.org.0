Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316AF7849AB
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 20:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjHVSwN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 14:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjHVSwN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 14:52:13 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6219DCD6
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 11:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTHZioQTsbya4RKhtLaTG73s6xEnsStHVB2QCC5o/7FHiYQUpwhs7gyscJ8F/6fhKDS4aJHnFihOzh4BaNw0U8s+nPd7XqSvNNAjub5g40pVU1iD8H0DSKDxo7PADUNPb0Qx9qjLk13Vsu/jOnmxLp7ILl91aFkGxC6LojgJLpOKAkL2xLGOcjnnr+cnRZs+l3iSVabUtMPZsnPabQ8AiGVscWmLxfEUsCXbrTwaIaX3PsJW7vm+GAD06vh5M+cB76BAjDgMr5K703mLojZ8vzVrztGSDjAiAMcsnsWGh2Q0SldIqWfYa2uCgJe01scIWpi708BMetiW3N57/VueRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov4LktA3K4FyEjIHYmAGp2kiDAT6l88bKA++h1CznEQ=;
 b=MCgkWkWMFjOWcLRsXfDnII6w+ONLI7/6xN5Y88yaLXW13mDjfB2nbdnK9XRS0tZawQOBKYaRcyfOoDWcdJI6pUGWfTUNnc1SeoYjfG/fDII4KS2fCOjBeCBtIvtI8WFMJygaaf3koOptxgXxoT9EkY71Y/hbxtrmZoEn+hY+7E4uTlspkuG016izo82rB04zhP4ImUXxPffU7lza/l+402wQBTZnDlL3iawQnwjCCDdGXyLxnjvVTvh7XMQBifTRWvwGLV1lOb3T3ZCsLBVnFIRZXJGhL2BKRBD97XuqLWUnCBIawlDcmEfhX7WFEfyxVpDeWRH2WswVGL5b+7qchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov4LktA3K4FyEjIHYmAGp2kiDAT6l88bKA++h1CznEQ=;
 b=bIzUiAbR384e+mh7yWFsFjodPGcKHiTsIg7zRrBSsLaqFOnL7lHP42D/pqQ/J2ylpNNwtpsZxzebpYD9tBwrdVjjhwJKCfJYAMQcgPDanPGETmmUp8P0ZdStSlv2sAOCEFagwomDRWmPmrdmDJa5odmAmMXBCaRD2qCjQTRiEESahchEc5plch6v1YX2bzaNjukj91AaFGHCJLIkXcTauSzXCy3hX5V4N2N2781acoLyMGZxFd6CLUXyteou99bJmGJ2hInzxGQu1t8wfxrssmVA0oitjKQrFFt8N77M6VfbWPRhlRMQp4hzz8s6xKpgTs/KTz1TuE0YG6ZjFGhBcQ==
Received: from DM6PR17CA0035.namprd17.prod.outlook.com (2603:10b6:5:1b3::48)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 18:52:09 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::b4) by DM6PR17CA0035.outlook.office365.com
 (2603:10b6:5:1b3::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Tue, 22 Aug 2023 18:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 18:52:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 11:51:56 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 11:51:55 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 0/2] i2c: mlxcpld: Extend driver functionality and allow to run on ARM64
Date:   Tue, 22 Aug 2023 18:51:35 +0000
Message-ID: <20230822185137.36215-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 972b1ad6-4aab-4ec2-3295-08dba340e2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0i4zHRx+0JotyFqYGuiMiBxOlEYELCkhJrFqU8jjxM+0wmIeD8Cz7vD4Fy8qSUCAJwQm5K5U+xAjID1nlH7irnTsFm6Im/Bo2XaqlBHxjcCKii+66ii5X3+NOzsvo/mfMmqnT5Zmfpo8Yy2llkD7oJGk1+KM5JLNijS5kltI52a/Ll6jAHHO+mjqqSmvpYcDYAP+6KVRmi2Bt30pwwG8RIZoe9zzEzql4I+p4P1KUvKC4+MbrdDVFV7UocP8pUpU0akb+RvqTqv/4MQsGXprbuJJnPHouzqHMdpphnsqWJFSONTfDecj0bkk/8AbAUi3NDfbqCCX3aeHMefFIE26Ke2VgRx7tW+782KzE7WzlExY7OkhPCfjpgd51dYf3Bm5/YWp46TuATqSgoPx//BE0cF+wgrK3xddmVD2bQQR1pYIy9+73v5Ta17UrelCELBvjl5IDaVUsHOSeEJSMLuASPxGRZQkC9BELMpVC9LobLEQIjFq9YEdKke2L+KR5Ab5eWCGanEp0AwSkWrY4FBYL2ZHSZgL2uhCkx5YluftneLvcXAeXP6YDdZ/OtNPF59lXummRDqFJ8KbbqqgwHJ8yH4am8exTaooguKEbgHae1v9Oy2smGnmfLycI1qKo1/VuVDY157CNPNhupxsiElEtoRxWZHHppaUeGYRfUVJI6FdkysOaQhjayW0mF3VXaL6nv53MMQkaNZPV8TKF0XMYLkJqnZ852Der5ZvU4OumbiOdw734SyLuqktx79oloLelkguGLEosL/w/q6zRE4HGA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(4744005)(40480700001)(83380400001)(5660300002)(426003)(336012)(16526019)(26005)(36860700001)(86362001)(47076005)(8676002)(2616005)(107886003)(8936002)(4326008)(70586007)(316002)(6916009)(54906003)(70206006)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 18:52:08.3532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972b1ad6-4aab-4ec2-3295-08dba340e2fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch set contains:
Patch #1 – add dependency on ARM64.
Patch #2 – adds support for 128 bytes transaction data buffer.

Vadim Pasternak (2):
  i2c: mlxcpld: Allow driver to run on ARM64 architecture
  i2c: mlxcpld: Add support for extended transaction length

 drivers/i2c/busses/Kconfig       |  2 +-
 drivers/i2c/busses/i2c-mlxcpld.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.20.1

