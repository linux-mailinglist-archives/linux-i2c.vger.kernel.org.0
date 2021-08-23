Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89593F4C93
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhHWOqQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:16 -0400
Received: from mail-co1nam11on2050.outbound.protection.outlook.com ([40.107.220.50]:11137
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhHWOqP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 10:46:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLxlAZt39xh3oSzCmSuJIPEYWErvikcv8SnQCZjkDKaLwLYRHyTXrgpeGjyCdDghX//sKJA2zpk1YqsJZCzg5K24JIGXm9qPx2uAlob/3ty1IdhF0wm/s3AXk5/Cj1mx6mEkUgd/kq17J1inVK/yx+JgTzfMxdloU+0fjyUxW8ed0On3ZQrAoso0Mf26ouAHnt0XeQNIS8X9I9qsg1SgzJTYkuU3v7cllKQlnkwPD2eK0p01l62vPFr9bGHfo1nJQia/U7k5dBVHfn8AXojtHgA4mzQbybJ29e/QhBtAATvnBK3qgYDuMYR3VjzxL4dQ/mmaR2fz4UhJamdtjVD32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDr/Ue3yLTW8MnswZmtHCpqhXQ/0n7tW17bYRAsbhuc=;
 b=Im+0IPqqciJQvyYjE5u4zGG+BMkcUHTA1Q1jct9hnvQZEoKVTZ+2zFrI1Lla3Yw0zB8jCF0Zdhi4kOBR5+RH9Li92oDlqzFiT8kb27IcsaqspUhJ6EvLFMed/TMswxQBwhSKgYz+8XH6eldJww/p3UZ3TjbQhqxbL0NWqLHLzCouMWcpZxKN8/d3zbQGGKU6zIWcfLNQUzQ5xnUvswnlUIUU4qe7zM9p2xJZi3voowdxHbx0w0VKcgabcWDfYz4XOXaS2vt3ieP2WiAFd5Sulh/aZYDNZMawnhIAFrEMmGlV9q4BlE8qelxl/+hL3Tk39gji3TrsXMJZ9O6avlW/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDr/Ue3yLTW8MnswZmtHCpqhXQ/0n7tW17bYRAsbhuc=;
 b=MwHhv45uINQevS3IbUad+UkBIlltvaLvkyqHGBhvIFfNrIDY1cYb/LIvGB3J9j2iAPRiZTmi1i+TK1g5+9r8QdKzPyj53LMXgpg4AzoWyr9VXD0KSfOKFqo17hlxIi8kmk3b8dH8rci/qvGYXFrthsL10tV1igAs3JGiHlk6HCoUbCJLTln+nn7ir+sUEOqjymZ5Plw87+K6/ex8zyQ8YqIp5tGfIVkccJ4NVCjXlk8yVsijCHsNHkjEFQPprE7xkrUzNAbNl0OU2DjuqugZfJW3pKah04D+1M+tKtQ3xBvIBDA8sf4Fu4zfs/yKiZw6UStISX9slPQYRNMSijDeHQ==
Received: from DM5PR13CA0043.namprd13.prod.outlook.com (2603:10b6:3:7b::29) by
 BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 14:45:30 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::38) by DM5PR13CA0043.outlook.office365.com
 (2603:10b6:3:7b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.8 via Frontend
 Transport; Mon, 23 Aug 2021 14:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 14:45:30 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 14:45:29 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 14:45:28 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/4] i2c: mlxcpld: Fix criteria for frequency setting
Date:   Mon, 23 Aug 2021 17:45:01 +0300
Message-ID: <20210823144504.1249203-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823144504.1249203-1-vadimp@nvidia.com>
References: <20210823144504.1249203-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8588d4cf-c147-4658-f46d-08d96644a79c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5242EE496AB67233EDC4DF7DAFC49@BN9PR12MB5242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UiiHIFC3TD93OFP5PFsnqPkiQMZu1YtUqWaHn5CYd5etqiN3MrWQOxMZZUBTivUOaO8BQGJoa+6MIEhdDPHD21gPwCRpY2dUZo276v8PNLrajt5SiT5IKdUDKnmHAgd5+P4mMPRs9W8cVrAdFXXAx/QeMGomYE+peOMMOpv63RyWHhoHjFxbfMD9sjBDGSzOScRDKaV6Ria4K0IrDQDIPpCcGOxdNE9hBl++iyymD4ec6MgOiJumU4pZp2W3UzlGUuMniVUK7aJ9XYFeqbVs05lb9RLw+18thjB3Q63Y0FF/AZyevjCaY2l0MN2DEC26PuJnDEYKFlhzrAmsOMgWKSC5qqUvOfI5vtZfAj6QVNWFimx/gshaRj1Xs/V14uK9WL0wr6yc7+XCqmaDmSiTTXFfIiQVnVM5B8Mxt9l30VTCONJJsN2GvMUKwJJxan9ViePWBMrQtNLepGIkWjhJ46XDZ+7fMSog9+7tzYeyrWqNRSsSxraW6nPx1Vure9NTyReOcTcVK4uHHK4EzGcB+2EqHkieLfKH0xB1olfFlf1uup8LGrBBC1jUhT88Sz/heSnyEmcDFXGQBfyA+o/yhVYkxhcOpimGTzlh1PFOpxVuotpeJlHADpdepCRXY7OfwY40BVFXYe9CpcQ+wE0s4w533yFCcgvb1TO6/xAQ7DHdnVFQU78J96Nc5AeDJUQdJGHTzAauitvoclr4ntkpEMpYVR4w7uAjzWoenpT90IE=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(4326008)(36756003)(316002)(26005)(8936002)(8676002)(508600001)(107886003)(1076003)(6916009)(336012)(47076005)(36906005)(2616005)(5660300002)(186003)(82310400003)(70206006)(83380400001)(86362001)(6666004)(70586007)(7636003)(426003)(4744005)(16526019)(356005)(36860700001)(2906002)(133343001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 14:45:30.4337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8588d4cf-c147-4658-f46d-08d96644a79c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Value for getting frequency capability wrongly has been taken from
register offset instead of register value.

Fixes: 66b0c2846ba8 ("i2c: mlxcpld: Add support for I2C bus frequency setting")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxcpld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 4e0b7c2882ce..6d41c3db8a2b 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -495,7 +495,7 @@ mlxcpld_i2c_set_frequency(struct mlxcpld_i2c_priv *priv,
 		return err;
 
 	/* Set frequency only if it is not 100KHz, which is default. */
-	switch ((data->reg & data->mask) >> data->bit) {
+	switch ((regval & data->mask) >> data->bit) {
 	case MLXCPLD_I2C_FREQ_1000KHZ:
 		freq = MLXCPLD_I2C_FREQ_1000KHZ_SET;
 		break;
-- 
2.20.1

