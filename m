Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC643F4C92
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhHWOqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:14 -0400
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com ([40.107.237.86]:19361
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhHWOqL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 10:46:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m64cvaQmaM6cmGNfjjdGXA6ojbbv+Hfb0Rgt4Odz8XJheUW3CotdiMLCbRdWh0ZhaH0x1zAyzOtMsKwBWjC5dggz9+1M4E1Ec9/NY6UN8MX4G8VWeUpiCp6PbY91N398gL1U/gCKun3FKp/bOWDDQIV0IonKWEpJRsW4isVRWfVd9HSF7RadfVRSpPxXgR/PYNY6gjtjG8fBKNw0tjCEySeW/vIk2hfvyzFTUOomTrD/QpkLtaQEr5+RrguRMkj+0Ej0Z1jTRWC7uNtshopiuHr13tlesFvWZB5+SWZ8rba4xtZsUA0NlQ44tIVK/RIdrRxG9gwJfno11tkUem6Ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/mFMI9Zra0qHuQXJydlOrl6OiXlhgRK18YXfiJax5k=;
 b=K6laAnzL2RyLRgpCHDAc6685Agm5YLIg4yzIPucdASDYwHE9Tzj8T+2r2YWxfs1AJf0Zmf6Be1YbB7pZdQNE23d4LPZaKYjS3CmZ81yWNFIGzKsCTMvGhwqgepTMKiV66nRzyUxGtjT2kA1vAc7wAc6Is7mo1txivJpaqxu3LRRTSujZqEV7wsY1sh73Mby3TALBLvX37S8713/iVXJrXCBIVlVc/RXbN/CgNfc5mXJ9GoearostMFB/SP6DD6foBDtnbiD+iugjiceyUiWBc3KuXkJaOcBLlYlqPbtMLXfRIcOeiv62B7REx1kDUkiOKHRPXz4kq8GpKNKiRMKH9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/mFMI9Zra0qHuQXJydlOrl6OiXlhgRK18YXfiJax5k=;
 b=jpAb8oqQenUrI/MOgAEHrjn73DT4GduHGVUPvg/3rYf4kCqqM57E1zUqBwBFbsWD0vChKeJ6K3gaP5/wrm17Oh2BfBofzKfYLbfv4OA/mCfLofwIbqfdtvSg22U3eWaz6ZXRj9sUhv3bPK6A05zErgCawgntS4PTi2gNKTNfyNfpfTW9QWT8kpk8jFOEKBGLl/1RU1W0OlGo9ZY4oBqHuAQf5FcaOzm+a3WnB7Dtf6F68CqZgw8g7CsnYGwYo3cIGp5G41+WYeR/RNIv2QE7VGJaHa9MDYvNvN2RPKNOFMr0kNCGvky5nwLBJ7EnJPXNNmTK+IPPC04a8cd4PK9UuA==
Received: from DS7PR03CA0261.namprd03.prod.outlook.com (2603:10b6:5:3b3::26)
 by BL1PR12MB5175.namprd12.prod.outlook.com (2603:10b6:208:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 14:45:27 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::b8) by DS7PR03CA0261.outlook.office365.com
 (2603:10b6:5:3b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 14:45:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 14:45:26 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 14:45:26 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 14:45:24 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 0/4] i2c: mlxcpld: Add fixes and features for transaction polling time setting
Date:   Mon, 23 Aug 2021 17:45:00 +0300
Message-ID: <20210823144504.1249203-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75abf6d-8ff7-402f-a925-08d96644a562
X-MS-TrafficTypeDiagnostic: BL1PR12MB5175:
X-Microsoft-Antispam-PRVS: <BL1PR12MB517573D22E3954D966EEB2B4AFC49@BL1PR12MB5175.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RPaWWlM60xqe7O5bha5XkEfgXDiB07Jn8LEbjoB92KRNP1iFuEx0OBg04wsJziPWbQfxMjnsf1oeSk8Hi9Wfwuhf5x2DIHe0oEepxtJRIc33GOTd2pWuo7Tq85l9+FVQLEJxAcadBiBaQr4Z/B1ghz1fqc0gWdBLOoaxklItn+4JNHw04wYijHVx0FSXxL0gzFEPdwHe/AB3UGHsG8OYrbTD1Q+NkHCeS5Ml9co2BrVC5hTusKXM5jgyRuIp3QpVHJo7ql+si93cCc69FpAna+yOnMsvVti5Ob4oyCk9OffOyyeC5BfekURaa0Z9matgYq8+jjEXdcbqeM/1rb0chKJ8yZiLYQGQVpfjS/ASLMsCozLG1/MoAVRGui+jABaEMXGuzRxzFDgus5n9j3hPqp9u0KC3cnHovS6vckUIVtm4/owRL/i7M3Mh1FnhDtIt/TmeR1rFnzxIIC0Rddn9oUHISQ7JjM4ExmXxLdAy4WIWZXTZhW9R39ezHffDAe46RVXyaBWC/cwFkMA1m0/J7J5GdbLeDoAeUedp2it8t1LfAH8qmfzTXUKcTwlJRG+nyOmUXYJHuYj0ARp1p/ZjBP5o21dh+ESx8TKdmz0tLR5dmj0AnuFwEvk1R9y4s8LlL+F7SXrNLBcPs6X12LpXBn21//8snNnRpQuH5ayyZPxBcdES0cqmXx58E6Ewd+cDaSnH0XXTv1eoAMxuWJii3bM6xLw5SQOjtyqEwWy/TA4=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(83380400001)(356005)(7636003)(82310400003)(86362001)(4744005)(6666004)(36756003)(1076003)(54906003)(107886003)(36906005)(8936002)(2906002)(2616005)(316002)(8676002)(508600001)(6916009)(186003)(16526019)(26005)(5660300002)(4326008)(70206006)(426003)(70586007)(336012)(36860700001)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 14:45:26.7042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75abf6d-8ff7-402f-a925-08d96644a562
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5175
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch set contains:
Patches #1-#2: Fixes for frequency setting.
Patch #3: Reducing driver's transaction polling time.
Patch #4: Flexible setting of transaction polling time according to I2C
	  bus frequency

Vadim Pasternak (4):
  i2c: mlxcpld: Fix criteria for frequency setting
  i2c: mlxcpld: Modify register setting for 400KHz frequency
  i2c: mlxcpld: Reduce polling time for performance improvement
  i2c: mlxcpld: Allow flexible polling time setting for I2C transactions

 drivers/i2c/busses/i2c-mlxcpld.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.20.1

