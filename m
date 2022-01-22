Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A43496C28
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234401AbiAVLdF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:33:05 -0500
Received: from mail-mw2nam12on2051.outbound.protection.outlook.com ([40.107.244.51]:60330
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229678AbiAVLdE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:33:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LB5r8JS5fvc3rpJv6Sz9rzQ03ya/Gs4P6OyKl6o9TtCLWZB0UOwLXfdlXF7/H8IwrzovVKJLvZn4Jp7sx4nlpxx7XKAsIgU02UQG0NDEHrtbcQv1CaNdKh3f32ZK87vJQmApgR+TjGtu7kX5MfMj2lno5t4tEy/TZi4GQ0o4qaQsrN65Vb+6obR0iqK5CVaXZJ1TbOXXIBz28q/uc8wKMJB2pYCGNpjcQAj25m9r6bL5cDkls+OGBF/p01HqxHDfLfJYqsc1L/BxrsozTSH1Io6Rlbp+xbfxYbzasXou71rUJVRBrLytl1v8qqDDMvdzQvOzSqGvDO7FKKObejJS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLmuF3o2KXD3Oy3S+0aQq20AB5vK7E0/S9PyXvvrWQA=;
 b=D4E9TgKbSyyHmXMPAKo2jIWPRoYfr6TRt6tlOkU3w6UEcR7OM/xdT1S6ctGZnauphK1kc4frlLo38Yv8RgWBYei2HTShXp+dmyBieTmmtCWBxKW9+OdGjU71j+BZ8KZrgERgCAXNPxgZ6b5xtZ08Juc4IRVFXiXUHjym1rsby/uY3vDGvY4SyX4rg8f0R7zTtSAnWHTaSl9tZYaNTUWvrGZ5VH5Zz7csFGGTVD0c/99/7DaanIkVybFIIpFLzZbX1WqSZVk+su1z4uIPPVg59vYJhrhFqDQgQ4f4KhEXg5QbX3cWrRCDpwbsna1S+zqgof324ZQ2fjHkSiYkJOHMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLmuF3o2KXD3Oy3S+0aQq20AB5vK7E0/S9PyXvvrWQA=;
 b=VsEHQCrEvmK6qDuRIcUZBdarYaQjcivKWKvCyDMbLPK3obZk/ybTFVQRmlJ/DFighjcO246mc49TvKhc8Qy782D+2FO92IMw+oILjyFbKOWaeirkr5Sj9CK1n6AymKcOs2q3T9P1qGvZSHP63m5Pn5j0NzfSYM/1k1CLdkkmHO8qTxqPG3FmmPm7hCcl8OUMQNNhtu28Q+4BT/gVQgbaT1ew83gqW5EwSYpB8/v2gK3SfPpW6eVwbYQsORfym6UEq2JAQa69GD7jnMQn7pqjUjq2R1/pXj0RNFRll5TFtxejhcuhL3UupiZ6qxe8uhY/eenHaIe5MS4Dz+EE6Nn7wQ==
Received: from DM5PR06CA0060.namprd06.prod.outlook.com (2603:10b6:3:37::22) by
 CH2PR12MB3830.namprd12.prod.outlook.com (2603:10b6:610:2f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Sat, 22 Jan 2022 11:33:01 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::3b) by DM5PR06CA0060.outlook.office365.com
 (2603:10b6:3:37::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Sat, 22 Jan 2022 11:33:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:33:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:33:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:32:59 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:32:55 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <u.kleine-koenig@pengutronix.de>, <andy.shevchenko@gmail.com>,
        <christian.koenig@amd.com>, <digetx@gmail.com>,
        <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <ldewangan@nvidia.com>, <lenb@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <rafael@kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v4 0/3] Enable named interrupt smbus-alert for ACPI
Date:   Sat, 22 Jan 2022 17:02:43 +0530
Message-ID: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d390b81-0054-47ab-f264-08d9dd9af2aa
X-MS-TrafficTypeDiagnostic: CH2PR12MB3830:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3830DAAA49F6CABC04FB916DC05C9@CH2PR12MB3830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O92PQq7mPidZ2ZWu6nSVWOUjDBDWhWSmJBNhdkmKGMClb9VOsZMo3Erp27iZXZKhn4C4gS2PujNyO8Xxrji8pvYjqzGdhGH9w+2luZ4C+z/E7pICyBiSt/NQHE8PqFsKrQDi3QRs/YPFRG4+VT4mcSTpGH4egm+A3Q5keykVuIuZf3KzDcv/y5WJU+/127+AsSKuCeMjuIs/n3Sfk/902U61I5QNupqFT5e+TC9zmLwo9+n97pm0yZwkrH0tMkaxohvEzBIJpmwyfNPE3PdnO6piued8EBo137eHYpqrGv14A1oijn6j5DLXc9lELdLTXR/U0baBe9x1JIF30AnI32OnxEZObaJFSHJ/+H/j7L4oL6kzg0ojZI2E92GwJ0vQeag2LYjEGmgf+7itnPQR6F33U2FJIdXQ/4Nfyryz3Av+3hsTH2X2J2JGIzdUJTqy9JXL0EoXB3O5yrZQIr7/TD7G2GoELo70/gQ+UJ8otC7G7Nu+L01VNd8HUEdYAhUoWbkasGNE7VB9pkaqPEugzEIo335wwX68UheUn3q1gLR8ki9JAcZSoLgy73fbn5dvwTCFBLd3/2OvtsOoqyirwFV/+wWq05+h1wTRyA5rmdOggB753Y/9h24BumWfiDw+yJHnGerSo8GG8psiGbKmFuBUTmrCXzkAZmxbdckOEh/T2I4TjY/abis0BFDz8KGGCY/lQCGY/xvXwPIFwBOqU4Gh7FXE4wRFWG+3Qx3pvJrYCT9U7RelmGCnNzFSyrNqe2zqXA4mb/eKVoacYqB5q0rO1JIKkgVhAZWu3ro8i/l9awR8SJJEB/y6BldL4hoFsPewxg01F6tzCunghn/EoB+x6QB+9gVWxRLINpY9IVg=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(8936002)(7416002)(40460700003)(316002)(5660300002)(86362001)(336012)(186003)(8676002)(82310400004)(83380400001)(47076005)(6666004)(7696005)(426003)(81166007)(508600001)(36860700001)(2906002)(15650500001)(356005)(2616005)(107886003)(110136005)(921005)(4326008)(70206006)(70586007)(36756003)(26005)(83996005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:33:01.4221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d390b81-0054-47ab-f264-08d9dd9af2aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3830
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C - SMBus core drivers use named interrupts to support smbus_alert.
As named interrupts are not available for ACPI based systems, it was
required to change the i2c bus controller driver if to use smbus alert.
These patches provide option for named interrupts in ACPI and  make the
implementation similar to DT. This will enable use of interrupt named
'smbus-alert' in ACPI as well which will be taken during i2c adapter
register.

v3->v4:
  * Removed device_irq_get_byname()
  * Updates in comments and document.
v2->v3:
  * Grammar/spelling corrections.
  * Added description in function comments.
  * Removed 'unlikely' from NULL check on 'name'
v1->v2:
  * Added firmware guide documentation for ACPI named interrupts
  * Updates in function description comments

Akhil R (3):
  device property: Add fwnode_irq_get_byname
  docs: firmware-guide: ACPI: Add named interrupt doc
  i2c: smbus: Use device_*() functions instead of of_*()

 Documentation/firmware-guide/acpi/enumeration.rst | 39 +++++++++++++++++++++++
 drivers/base/property.c                           | 29 +++++++++++++++++
 drivers/i2c/i2c-core-base.c                       |  2 +-
 drivers/i2c/i2c-core-smbus.c                      | 10 +++---
 drivers/i2c/i2c-smbus.c                           |  3 +-
 include/linux/i2c-smbus.h                         |  6 ++--
 include/linux/property.h                          |  1 +
 7 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.7.4

