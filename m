Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147436F05FA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 14:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243513AbjD0Mjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 08:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243821AbjD0Mjp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 08:39:45 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A0BAC;
        Thu, 27 Apr 2023 05:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns9+HYHQ2gT3zstseAZL8smBxDxqeQ9j++YMhwJFOMNHzZwkY303xtpFqF4oMoyUH78AjCviEQi36tfhGDc9WR7ikeoWS9TtAyNEBWVVmX1l7+ncBfjq4daKvEzD9RbsZUUGxdC3/xKm3qr7anZSQy8gzWv4/SjfvvaMs8T0kUgBhLFCqUmqIuktynHWK2Yc2wkbTIInVnKDhkzMYgnxyn29Ln86+XkrK7+7ZxdktzrXKuWFymR+NIvrKEbIOQd/1tkbKtbzaam/UW6iXIBS8Y3GX4BWL7ypLO9LnRiBUwtDIxzrrdxmjjpEAAVqy3iOgsuAqHyTan1d7LI3afaLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg8B4lHP5z0+rZHu8OXrZC0HfArZ5QnNN+ytAkVaKGc=;
 b=APZhZzYUD7474EyqRmhqisKo/zIcYuGifZNDoGIDP20QYmtjvKc2jWLbTSxjdS6JcNr2cdxEgaAVAHXRifyFKEV3vCV4CQ/1B5Sev8YgQf3m/yf+zbW1P62FHNl0ThC7BpeVDj1xgFxuCd5pmdxVdtY32C5h1EoJDRXsKIutj2+GXONoeP1AWdY3ETWZWK9VShLzbXOAkstvLkWpNxiL301cWfkC1FMF63QETE1+jtorRhN0XiXnfkmkVUWdTcSGal5hlTtbshPkXufoWuYf0M8QcBDJQWM7nLxNTHnf0mWQLLOF5KlDC6e7FHkNW9zEJ+Lh30jNMVpMtAPXMWwIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg8B4lHP5z0+rZHu8OXrZC0HfArZ5QnNN+ytAkVaKGc=;
 b=V/797r2A3HHo1r8mFHmoOCLQT3KzwVuL2tpLx2ljXKgi2DJ0QiIHLC3eDeEJHEYBYlubJvKF5CIGk/5PycIEdTKKB849fBlcqVBS1GdNhJfwqtJeWKOHtLiKFP4p9VBL582+1mhr2i5WmE4ilXBz8QXpyMIJlOOanKya2CrWmUm5DZG100rFvmO0Ug2trZ0Qh3uk8TOEv+QDfIxL0JKsC+ZhflRPaB+S6dhDK9bcvJoiixWTu80IpXH91HShyCx9HWPehVLzlS0jJ/jd262Tz10cx/dbDjERVs0Wl8IDr6SaiSZ29895q6zHg1rRK2/9pbVkQF/o9pWisfHsSQstiw==
Received: from CYXPR02CA0084.namprd02.prod.outlook.com (2603:10b6:930:ce::10)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:39:38 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::5e) by CYXPR02CA0084.outlook.office365.com
 (2603:10b6:930:ce::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 12:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.5 via Frontend Transport; Thu, 27 Apr 2023 12:39:37 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 27 Apr 2023
 05:39:30 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 27 Apr
 2023 05:39:30 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 27 Apr 2023 05:39:27 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 RESEND 0/2] Tegra I2C DMA and SMBus blockread updates
Date:   Thu, 27 Apr 2023 18:09:13 +0530
Message-ID: <20230427123915.38199-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce95007-b7ff-4f59-ad11-08db471c76c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqNViOTQQeezagjj7GuAdlQwiZgSeWVaAzY+3HMqC9Z1O1u58up+fXzftmfPYW+xbH9JBHWdgLypII2HpuYys2g9pXa56IguKuAOOd88ReEvoISkVq0urOaez69B6sfOHdP+AkoHG0Xag35IiMtoUNd36AOMk5QwgJnHK/ZDP8UuKmMWOVeydYSpbOKEMTPSf/BGBG/chxNjZndgUZ0qyVXiR/JCsG4K1G/SYLQSFHYoVQIuojDDSvSeOENF2IJKgbzDyFNw7zuE1oMBIJrgxWKWSLNZBb4nl4xVK2msn3PTTtw0jv9V69/oHL/oDszYV4MxzlVD5LpJJRYzMnBBOKFsw6E/YYmBJ9NcXkcu6Opaq10oNbTvwpfwsvfKzZrUmS17pf+kXRnD0fSRTmxNHEmeHGUjxeyECYey2/uHv+YIVDAhPohEq8MnkCdSIoq0w6QFiwr9vj5H52ONhgtT9hIwyYTdszMqIDaMAPsUnT2MpNDvPXFM5gsSotu9q1riubaEzl0IkBAN80rgAiHMex+rb/3ieKANUOm96nPi6DUazAO/Y2F87P3lfUgREfZB07pCd3ousgm1vmCcds6Bl8Q4upC2tLzsGbVb+yeY3BI9QQ8hAp18F/i7OOdqCGh074/vVDNudspntB6lDtA12pJdaI/L8km6OIYYRku9UY/N6u0mnzObDJ8QsQRNOxOJ+TyIGCOJ5xmThKC2j0SUfXyD8g3sf8GYFZ8IFnpH/JjcN+ZAQmjC9vlUo4CbCBxv3261XBTFL6WWGija5Hwmgg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(26005)(1076003)(107886003)(7696005)(6666004)(15650500001)(86362001)(8676002)(2906002)(478600001)(4744005)(70206006)(4326008)(110136005)(82740400003)(316002)(40480700001)(70586007)(921005)(356005)(5660300002)(41300700001)(7636003)(8936002)(336012)(186003)(2616005)(83380400001)(47076005)(426003)(40460700003)(36860700001)(36756003)(82310400005)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:39:37.8711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce95007-b7ff-4f59-ad11-08db471c76c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

v5->v6:
 Updated __u16 to unsigned int
v4->v5:
 Corrected the comment style
v3->v4:
 Combine the two patches to one series to avoid merge conflicts.


Akhil R (2):
  i2c: tegra: Fix PEC support for SMBUS block read
  i2c: tegra: Share same DMA channel for RX and TX

 drivers/i2c/busses/i2c-tegra.c | 109 ++++++++++++++-------------------
 1 file changed, 47 insertions(+), 62 deletions(-)

-- 
2.17.1

