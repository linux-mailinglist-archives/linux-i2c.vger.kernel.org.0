Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B486E57B69B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbiGTMm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 08:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbiGTMm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 08:42:28 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::620])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C166A9EC;
        Wed, 20 Jul 2022 05:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQsXOiNqx2JdBr1Nfif0sv4RQEPU0Moo35zqZm6q3GHFY9hEL+XMlXaERefmq5R+WcIdRFDpNzc9K2Kdz5v63eJnxPzW9uOlH9QOJWE7GBhp8ljT6ZmpiGUtEfv2IWvkntIJ5IgfyZFd26xK/n4KDnrViSOp0wPVVTlzMsD/uO6GK0ExBW/ErEOhoYe/CWOYHukosz06gHCYXty/9358uw3AZ3st4sEDLonYdWFxMgpP59L/LR5oqnkYKbMKLSOtzVI025sxvCuyK9NDrGn/UIsTtpZ8gQK5oJqTIE0gEED1agZVmUpzCFJNq8jnBGlStEUkpUgmiTf5ZvE6ABKwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzXbu0RxavaQeiCi7WRCpTH4fptBFZ2M4m3FpWg3Xbk=;
 b=gS+eRhjnYQzrG4gObmZmPy7derlEYelKTw5BkcErBBUOeQLSj1uInf5qhyhDxb314HSAV18WiHyvRr8ge+P5btcAZ3asSqt5CLFxsXLEaJCU176Flpn/v28XD/c3jks3zbsVj2TF9C+JQKCo+iCveORM+YOPFzJfm9MYBSsS0UcwpsB2JJq/ksn5oyGLCSwUZKkzAWcUaUDTBQW22mPdIVcJzl3LRGyjDipq7ES559QtSBxPWUNWLC05lOI7CyKiBmNFVWlue+c3/eWHaDNHXB8oQwmbLQ0B2JADDwIQ0//jZFkba6fYNDrgqG4H8u5R5CSsC3ia77GNHzqPQJWJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzXbu0RxavaQeiCi7WRCpTH4fptBFZ2M4m3FpWg3Xbk=;
 b=Og8GWbX6U5BXVL1CyYKI03FUR/d+BNEKIfrhABU82NaVVHkpqDjyouEFWIJo/kvlJC3eZzrO1gQyI4PquNlXQrP5cGSg5qHgjT59jdqulrLzurUPZ4Jfm9dLSfAjqRLOPjAAkk0rt1BD0U2YJ76mI5pZhZ+eUi9wq5D9xrXRZ4am5QG13XbR8WhI9W4lc1SNeFdlwXOfjRVzYE48EtUWhx5iuhiaZzh/AtqB3nB5zalCXw8wtsutnfF1xPF59x6YLLUdlFRQJsb7A0kUtomtweCBOoi7C+TW32lgjklqw2zCs9BScTdrgomNL2ezgkLfItYYp7yuVISyAYh1+8VRtA==
Received: from DS7PR05CA0025.namprd05.prod.outlook.com (2603:10b6:5:3b9::30)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 12:42:25 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::d2) by DS7PR05CA0025.outlook.office365.com
 (2603:10b6:5:3b9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Wed, 20 Jul 2022 12:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 12:42:24 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 20 Jul
 2022 12:42:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 20 Jul
 2022 05:42:23 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 20 Jul 2022 05:42:20 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 0/2] Add GPCDMA support to Tegra234 I2C
Date:   Wed, 20 Jul 2022 18:11:46 +0530
Message-ID: <20220720124148.7969-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eba44ce-2bfb-4a6f-9eba-08da6a4d4c2f
X-MS-TrafficTypeDiagnostic: DM4PR12MB6277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+h2j9Y7/KhT/4WA3kMCcLlyBO0l3fTpB/6zD+qRg0EE1L8qrYpGeq5Xdu6pwpL+E9eYuKan+EB+4sbgWslic/2N4gf2BiSq4MT3xIU0xoBXbRupsy2cRZkhNpvsXY2ibZw0tLVg5vQmlIgPebcsATT6hzOzENgKSIFO/0yYwax9oSr6QGx/TdfYc5tptnAZoGonqGIHVwwYA7G3aWfUokDjd8DclE49uNVltLFGm6DRYt84dA0wP9qpBLuT7pMyjKpSbI61oAr694Hbj6leNdVwkRWEjjvZ4fCiRoHsnJcXfcmXWZN7yKVIXE7eWBw93Nqs5FsVXrOqp7Ow0QSpV/RHL2gk30DKY9qtVZmOSu/Uig3Ru32CVbvinBl0537AUbgfpnZu3ZWh8s2GNJOMowXlv4RuRv3ZrdGo6uU8nvEAadUFvmBYQKNzjIHOAoVyO/ijTEbzRyM48Qu6mUbhzj2AX/NRBY6bpSSZ+Xm9ZOhcX30z4luETTaMolAI9do0js+sFq4OCdQpjm6TBCcScbfIJrPr3DVuRvxKmfMEk4LwQ6XCMF6XIiLJZ6yQze4mtuy0mSmiMrd/SHXo7oZr3Uw229COQqVMoNZp2BdkCJWxrOGxL6gP0QD59kxaipvhhxNAjoJbvMTH2eZYC//Hqx9Xuo5bPBF9aWteAekBvFpIC3QU2uUyoy7j2ssGfwu6ZEFRx0HhtZ2gH5KzfDU8aSzqutG1sAjkQkyp8eqd0lZLRswJShalaJc3wMMSVUWsObX4ghtA61zEOvt598jtACyvz1gT9fIcVGUHvFnAbkzlTCAIeZZxb5xDKnBzpNIVhifXwz7ogcbQIpFxkb97/1BGeLiQasfvvAv/jVVdhIAnL45Co3tfFB7BmgzoVb+J2K7uyMF8aIu3Zqic0NF2Fg==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(46966006)(36840700001)(81166007)(4744005)(36860700001)(83380400001)(186003)(336012)(356005)(2616005)(26005)(86362001)(47076005)(921005)(1076003)(426003)(107886003)(82740400003)(41300700001)(478600001)(5660300002)(7416002)(110136005)(36756003)(316002)(70586007)(70206006)(8676002)(40480700001)(40460700003)(2906002)(8936002)(4326008)(7696005)(82310400005)(6666004)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 12:42:24.8311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba44ce-2bfb-4a6f-9eba-08da6a4d4c2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

