Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDF96E0E1D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 15:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjDMNJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 09:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjDMNJk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 09:09:40 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02hn2212.outbound.protection.outlook.com [52.100.160.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23D5977C;
        Thu, 13 Apr 2023 06:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1tk2IXwb18XZLFfqH/Xn+++RPFzAMzHEk6iNTM/OE5xS1woENCsBe5CyQPd95cC+aQBD/CBTtcYhVBBvsKJyDFcJBqdCZlHy58YzedCcQwbyXxI8vaF3LcPDOjUJZdlrwFwG2HYczIMjWx5HfHmG5oZaeMATx5lxBth1zIQA7HKolRvTNZTTwhEnRsg3ZOcKff04ztXkCxqwFEUXznuER5yZjdSzv9al9JBDexhF9il+UytDEyQLEyAF+gVbTIhipnNM0pJ/+SCRb+jv4GZQqu2Ijon4Sj58mA6XL+izqm6MGIJMy8aRFAvk7mckW1sC22dwB4E3pAkyF0s8gKk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5/zYOp+lJK1V8iemjmOfbMxwzf+6i4eqvQJaeVChLI=;
 b=jSX0YZD/xdOfVPQpXOXfgyvkSc7L1vD+tl4zjDVl6g72ZQc4X2idUZ0juubLkWTczuLRpG7vSGDODi+wqdeetc7nSNSsXFcpUz0Jzw4JbceMqWFd2KnI3WlegJNOMXCT78/tJJ7nMNhGb/nAQKr26Sz+1KoT+6wphkS/tyq9bvXlqTZnOTEa8nQIqQ01OZ0bAhyZrqL69mPre6UdhYdRh8QPJEYTDc/rigizBgDO2nOVDOyUQtM3HgXdYhjrQ4yvw6irJcfaxs3LnV3yIinnMOctijEDyuC7quUPnXOC/rdH/OCGfG7On1kUU14R50W9lTpVfPmNZuL8//G2RSN/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5/zYOp+lJK1V8iemjmOfbMxwzf+6i4eqvQJaeVChLI=;
 b=R5HPA7FonRRWIGi9uBOs6GjLzMLfjN9Az4A/cb+KLatmK0vs3IJZ9/FfRc7J0W54pqISy2PjQsOmRDh3AJ6VoMNcWogCa2AU0TtGQMLjO/y2/2ia/7v/q+FqFl40EPNY7IiUAThbb5XLWnzhAIFS9c80Y+4u1qvpCUGMAIfO+JdMYO33k1T5wmDzAYy+gZEr0iKWqErIKASDBnz54EihyUoxYBbDErlMJmtFmu9vt29+vpyYtJYVYCqmtV8S3b/d9MZjZkdkEyvu7VIpHXvDxJxZKuzFBLOvHo1bvCExiaL2rzaVs4iw86n4HGRQPhC3nMspfk+4T3jgGpAODtEFzw==
Received: from MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36) by
 DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 13:09:37 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::d0) by MW2PR16CA0023.outlook.office365.com
 (2603:10b6:907::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 13:09:36 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 06:09:34 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 13 Apr 2023 06:09:34 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 06:09:30 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v5 0/2] Tegra I2C DMA and SMBus blockread updates
Date:   Thu, 13 Apr 2023 18:38:47 +0530
Message-ID: <20230413130849.2894-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT007:EE_|DM6PR12MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: 419b7010-50aa-43b3-6453-08db3c205531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYv/qUiVhppk7QBJ+IIJPYGeQNXv+8ItwJCMPStV5WzfzynCghHX0PTcqGnYPyMM2rK7fEnxrRcX9MUeJQjxopSVlaK/raV+c9kzS8Y/vpmR0YZfvoYLOqhbP1ct5MvxSVj3unuV9PVL4TnwhhigbBkdtTiUpDlt0jsHYDb8elpMN7Lkh941HoksJUvlBExIialNqn3IzXLeIXrE1K2TItk0fdJ8AASZNO3F+fC992IQV5soXMJQZtM4VjHCFlAxm84mOjobzAmkdzK8ECeSVtWpbfhYToqoVJrTmPGAtC1RUi00A6LDfdgWMyKWXNS52/DMy4zNm0x+8mhTkgHKl5Baoj4uG0pt+TTz0EqNu9jIzUwMkOyb3R0+S3jRweEM3xczwrLOpnLTjePXcMGXdHGTCFYeogANJI8oDjjqcZs4L6GPrjNMvvNvKKU47Eo+h/dGQOUlagTp1fMso7BR4HFpDiTmgbuZGgc5vorJiCJ2xUo+ZhC6xryFtSAb20nZS/fmYmCdXTEnHG1dUyf6DpvbWslLRRzRE7kLjgCdO4qAbD/T3usP4oO2mXXsJJde9Cn9TSiRFe7dhuIebUt5F7NQ0kZDtvleth8KZmmEEs9IX5AzdHcuhY0XtCbNYY3ISRmJ7BCsheag85vhqU0NP2sQ3X2PCYc/z0fxDBNFTsfk7mlzCU4AM46BfgozPDjtfz2sGxPUoCRD0WEds0h7BNazcuPOvgeFapW+onN41qn/bHFkTUEoHONvP7OowK8fCDqdpiVb2oAzdwNRv3h5OMBKI4tDGFY8VuVsRYVH0LtXAVUtRey5qtodkxgBNtPP90fdhDa32G0g8DC7RKMGq0iNGkzncFLkyXNTXaGrvcVC90UznbRPpCbzkPsUSTdI
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(5400799015)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(36756003)(40480700001)(40460700003)(478600001)(34020700004)(110136005)(7696005)(6666004)(7636003)(41300700001)(921005)(356005)(8676002)(8936002)(70586007)(70206006)(316002)(4326008)(2616005)(36860700001)(47076005)(426003)(336012)(83380400001)(1076003)(26005)(186003)(107886003)(82740400003)(86362001)(15650500001)(4744005)(2906002)(5660300002)(83996005)(2101003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:09:36.8040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419b7010-50aa-43b3-6453-08db3c205531
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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

v4->v5:
 Corrected the comment style
v3->v4:
 Combine the two patches to one series to avoid merge conflicts.

Akhil R (2):
  i2c: tegra: Fix PEC support for SMBUS block read
  i2c: tegra: Share same DMA channel for RX and TX

 drivers/i2c/busses/i2c-tegra.c | 107 ++++++++++++++-------------------
 1 file changed, 46 insertions(+), 61 deletions(-)

-- 
2.17.1

