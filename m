Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CA2496C0C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbiAVLYO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:24:14 -0500
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:59232
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229847AbiAVLYO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:24:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WogbfjSnWUJDiYO6w4693Vrlzv/k0PccxwPlSNatmA8I2SCiIo/82TkYQNBFwNnzGmjTG1+glz/wDQu/n1kjaegY70BJbgLCIdNYVnNs9gml7hrDZiawqb+XU6atSTjYJvAkYHjniptOMo5Ua1ziaIh7OMkIeovyyCLFj7EqPGk/xgj/canjBqW93y1Q+Kcdk91zH2QIXNHhs6l62qWSznZ0/jvn5c9myrICIgXDuURd6TbIiM71MWPxlsRlbNcErqiYG9mam0tknZgpI+j7b7MCLBsOYGWViRy78/MdZrft9ivEZoJp1zacRjiyiQ9pYmhDQRHxo93+3UyhnYgX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTxukEj/AvQXzm/AmMPG58QMLJsOoemDBx9tF1Ds9Ho=;
 b=Usn3Kh8kf1eirdJ5sHLWaD0hPV4+6j9fEmQ20Nk/ilqhC9pZqDR34M8Q+ixvYSERAZ2zgqrxzQ8guAObUq38AWZQD/f91PAGpL9LJIQJc+RVhCfSBaesmsTq5bBQTN8QrA66QrU5/PtPjUYhBmL3ebmJ0zs+ZK39UREqFPw3uVYVbIwEdaeftgwnDLiqrUFtGdxUM8U6xNJqVRzkgEgkeg1RUo/LL/VyoLAZMbClmd+j7I9EXKOEgXart1Zzve0CRTCee4GejQBwxt5hE6pZjiCDKbdpFNoyCViSXI448y0qBy6HabUgqTzWTbWcpqYrEfB/nwXqPVmPUlqm8/pSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTxukEj/AvQXzm/AmMPG58QMLJsOoemDBx9tF1Ds9Ho=;
 b=PNqbKPW3rNQGcIvRFFKPVD0cHpG1AA/yxop2ihUjcn2pjq6DULd7XfQCK3qlpcL67tcgOV9yho8KUQBgm5VZg4So6WA6IwUe2vfmkewS6J5TcqIFJw/PfI/dPX4ejfSO58ifye09Gc9soxknArDGSEGBecizpShUq1P53MyZ4O+pQWKhOx/QDAUFAxp39tgCR+6ldHq2zGQUaNJwQN5jVPFEhnuJtX44LUQ3JFVSUt46RbjfNxqqZ+yA4VCFt/EDkxyhokkPuYhF5G5xcMsqHAWCWNcV+NrlYkbyVcd57puiiK0XsK1yGc96HyjFoKvWhmPb0YOSIBdD83hgyXTZAQ==
Received: from CO2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:100::34) by
 MN2PR12MB3853.namprd12.prod.outlook.com (2603:10b6:208:162::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Sat, 22 Jan
 2022 11:24:12 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::7c) by CO2PR07CA0066.outlook.office365.com
 (2603:10b6:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Sat, 22 Jan 2022 11:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:24:11 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:24:10 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:24:10 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:24:07 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 0/4] Add I2C and PWM support for T234
Date:   Sat, 22 Jan 2022 16:53:23 +0530
Message-ID: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd3d7a4-e9b5-4a78-83e7-08d9dd99b6f8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3853:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB385333D85805D6AD02718682C05C9@MN2PR12MB3853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k50O/VITK9yrl4aI6WiPmchGXJoPrdMCoXWkH9Lje+PAahJrVRx2iad6KmSFFyuTioEXcGdk2WEJt+j5jKEKjlO+UuFIMny78pMb9f8g6lWkHBZatol2hT1dIhnNaCx16yVL0TwtJQyclz26nQh9DVxj9rgVcJknVHDFKtgj0XBOWcx/QVo9ZeRoSdaKGA0ZStYEzuQa/89LS15TMIwAottrdcPkB9NieemagkKAn2UJdOOXM7CwB4NtLRM0aS4/chd2eoVXtDk31ViJkbeJFeAYn5spebYh7SOKT7m7fBy0gUHNU8LiB0ytrlcxq2wNmilygmEzw+R/KSWjqpdjFzNVL9fHQ5+bqm9c7NDjNyz+uIqUzJrjx7CF37HXwcT9sPKydpGs9zGHOJKoO2zoPCc11bohv7Pix4+mNY84HUl74NdzMCpnz1BYLLyGj8ILocb/Y6+SoI+5KUxbmeoP40le4abm+SAXuzBQ90RcvaFDzF7OmCigO/EgX+DdbHghiUrxEJj7TY9+9vH3lrVhIo5PsBUx6SBl64Qk1G4+elT61g6xB6/G8jIyT7FpAfrJT4LwW/6gw21JWn7SUi9PBWSJ9InkAYahnz9/mKRVZ+UbRHQxS/conSGmsqra70jtqTT+BUVkVNIRbEqSF+5LtlJ9DeKVpliGFjgUI5b8lqTQRHBM2xLWB9CrtgabPJvQoPOoEFNhKOE2Jlh3PnOrahcJVbSYJvWH3PzIRtFSLi7u3QHQoxr5Fry2npkcWhnJaP2lOr7EFN1jjXiXpWQgY1bom54rt4sBWFDZIBRhUL9Q4VSdx0IqWT6WiEmnRyujolAv/abTMba3fjXDbi/ZjMEA8zdwHlXQ2i7hmDrqHRc=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(70586007)(6666004)(70206006)(36860700001)(82310400004)(110136005)(316002)(2616005)(107886003)(336012)(81166007)(4744005)(4326008)(2906002)(5660300002)(356005)(921005)(7696005)(40460700003)(508600001)(186003)(47076005)(426003)(8676002)(83380400001)(86362001)(36756003)(26005)(8936002)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:24:11.8016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd3d7a4-e9b5-4a78-83e7-08d9dd99b6f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset contains driver and devicetree changes to support I2C and
PWM for Tegra234

v2->v1:
  * Reverted changes in i2c-tegra.c. using tegra194_i2c_hw for tegra234
    as the values are compatible.

Akhil R (4):
  dt-bindings: Add headers for Tegra234 I2C
  arm64: tegra: Add Tegra234 I2C devicetree nodes
  dt-bindings: Add headers for Tegra234 PWM
  arm64: tegra: Add Tegra234 PWM devicetree nodes

 arch/arm64/boot/dts/nvidia/tegra234.dtsi   | 133 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h |  36 ++++++++
 include/dt-bindings/reset/tegra234-reset.h |  16 ++++
 3 files changed, 185 insertions(+)

-- 
2.7.4

