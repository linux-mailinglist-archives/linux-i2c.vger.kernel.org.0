Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FD497DB9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 12:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbiAXLSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 06:18:34 -0500
Received: from mail-co1nam11on2069.outbound.protection.outlook.com ([40.107.220.69]:42880
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237227AbiAXLSd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 06:18:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UleyuRVDphjFcf8XxItaiODAgqP7beyFf0y5xZRC/Q8AZKEUuw2sEtB0RSMVxs4DOJCkvvl7fClcXL7Y96bZ6wL97eVwfcsrxgFslF2LXy9BqlVspgA4B0AGuenv2wrHZLOAYyLx2k+ekT44FRtiNr6H1Obeu/7MuN0qQ9GJCgi7iKaZSQQvCvZq9XCLfeg1FUnRmPeWJJTSpdpBmU4JdFzXAqCAwP/y9O35NaWz0c4/tvIE1FbS57NOEp51lG3aM9HotalTH5kjJF2V2LhQh45QwGV/SyHgZkIFCgolRB2w8erCIptCOk4fugQzQipNYrHkIByMcVZjQdwFIsKZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15Dlj/HNyqqj3YLwdIIXt99VkBTc0ALkmizgvh4Pz7s=;
 b=HUSdlH3KOGXHWYk17PJqScC1mTpEZNp7gQPuMTn9RoKoUUfbB7HnXVNgFYMuAThW80Yuppoz0h2Y3pT8l6umUYWbr7m8pM34oAd5+Uu0NzsfiOfN3zwVpP9ZVe+uBnPQg9RCBO58cGT+EpeFRQPvXpxuKIl+7sghPl88p2XYPSJdVrOZeRDWSO3z+gh5uoNhGDC8GfYYIf9tPKtFYL6+cDoR7h/qrGbmagtKFS8+Ib7VWJHC4ReFj/ncv1dN+JCIyNTTZKH0HWX4Ax8HFi/LBEFAKOz9bZ2e5ESQmjfDIBsQHYCqNnk6gF+KSrsq2hRtFd5BYLTilou5KH8tNzOPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15Dlj/HNyqqj3YLwdIIXt99VkBTc0ALkmizgvh4Pz7s=;
 b=fu0TxYsPecWEzvhn1l7y3YAPSVtAh8jVTVreQOQ9nyxxf+Npq6CePp5wylJUkOgjBiCjMZsrre0HsXUvjRPqtkkr4VWTk3AVKwZpAr/ZOqBlt2b+L7BseAK8sRF2soeAqSx+sgvbxKg7CY7LefBxXMdPoEeSuGAyvT0fgQH0NMAGBHcYLUeUKE2GZqmFLiUsct+51HpgwH2UoETGHjlXoPFMnViXpmOJKmGEhAk70Or4siMrDmjUq3rieEFxjrhe0lzaLw/pspvgxUEdW1KmpbPvokkm/akXVoxCO12zBJlV5KdlfVnmc7/paOLNI0+2MI2LxrtRupwKiFQeK89gWw==
Received: from MWHPR11CA0033.namprd11.prod.outlook.com (2603:10b6:300:115::19)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 11:18:31 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::91) by MWHPR11CA0033.outlook.office365.com
 (2603:10b6:300:115::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Mon, 24 Jan 2022 11:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:18:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 24 Jan 2022 11:18:30 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:18:29 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Mon, 24 Jan 2022 03:18:26 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 0/4] Add I2C and PWM support for T234
Date:   Mon, 24 Jan 2022 16:48:13 +0530
Message-ID: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea79e0ce-36a6-4c83-3f32-08d9df2b4043
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3790D5528E0BF857DB224C7DC05E9@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZsGj6Mj2Uggf3qFxLk8uv53ZlAvQzIA+qDACyMVMx380iBioSpwxpCq9KKT9GbjG0lcyTNfsXGC/uhOL3uK8j3x4xsdj7QyVaoB8HbyNLWRTOFvuaRLW7fw5ch99TOSC04mCLhCT4x11jCp/5lt0D+xurm+x4OjhqtakHToSJdIEYqboP1M5UoXy5vet+oqr5US5BWXb6z605mIErkaIeYYpZLFCLYszAiEZL/9xKB4JeCDC9qYzx3gVLObEnB1XqQwPeStLjBVoztaX+neg8lMbXXxAX9qOYQhBr0lth+4+Cvs5eJz8wg9UjvH7eAHkDCCpEM7Z5CKO+ckahtkHf7r5RmwE7Gpa9l7XAXWlCiIzCJocwNk/IR7lKona27Vrdot4eOgZ3nLtz21TB+DgFkW3KCSvGCl+cDr0Q355IyM0UAckEeUMdNXOqfu7pXy2MnUcFVY9BbvM5Td9J9ZR32vJtd/Vp4+Ld/JF5/j4/ic0rjwpmcC/s/K94C/13TXMmUXQcmxtlvSTAER8S9yNl3Uth9TsO7yZKFyNH1NEL/+SJYcKV3yruHv4nc9NPKqjvkwBdMMQHxKIU6cPDsmQoKkvyig1XnuZxKPC1Mpgjq71ViRq7ROLkAf4aH5mHtcZDcoPWOfV8EiXaPczUN7zl1R23a2/VYQBfkzeHkXBfrgfZIWVrnbSsNamnmN2ind4GmCgrmd9zXlN49FfVQ+T+ZMa8EDENrSfwaEzPGdFbo4EH0EQ4apYoZODmj8MCbdX+WS0gdlcA+GV64kkDxZr9fXDtDLQy157e/BwklzjaQpUU6+fdK4EMYUg9N0mj5PkL+tOAsEZt4pNxTXuOYLQ6Zk/CHus76g1/z8jUWldC78=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(82310400004)(921005)(81166007)(86362001)(83380400001)(47076005)(36756003)(2906002)(356005)(40460700003)(4326008)(508600001)(26005)(7696005)(316002)(8936002)(5660300002)(186003)(107886003)(336012)(426003)(110136005)(6666004)(70586007)(2616005)(70206006)(4744005)(36860700001)(8676002)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:18:30.3278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea79e0ce-36a6-4c83-3f32-08d9df2b4043
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset contains driver and devicetree changes to support I2C and
PWM for Tegra234

v2->v3:
  * Sorted clock and reset based on ID
v1->v2:
  * Reverted changes in i2c-tegra.c. using tegra194_i2c_hw for tegra234
    as the values are compatible.

Akhil R (4):
  dt-bindings: Add headers for Tegra234 I2C
  arm64: tegra: Add Tegra234 I2C devicetree nodes
  dt-bindings: Add headers for Tegra234 PWM
  arm64: tegra: Add Tegra234 PWM devicetree nodes

 arch/arm64/boot/dts/nvidia/tegra234.dtsi   | 133 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h |  35 +++++++-
 include/dt-bindings/reset/tegra234-reset.h |  16 ++++
 3 files changed, 183 insertions(+), 1 deletion(-)

-- 
2.7.4

