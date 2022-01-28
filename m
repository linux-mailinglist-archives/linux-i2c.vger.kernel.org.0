Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F6249F888
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 12:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238810AbiA1Lou (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 06:44:50 -0500
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com ([40.107.92.65]:59616
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230102AbiA1Lot (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 06:44:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ak87Gp8ZRVH/ySOW0QrAR2Vk3u8OlXCaJccH3TK9znBS0PCybHd/qYgpmIZJPIsaPeOoI5CGE+tZ19b3qoApWSpenzOlKNFtcpxIL+AuOY9OTtETXEyNJ34L95OQTtqy9p8GMaTR+iFUDxNslK42lAxg//mB9+/KbDXf5qa9ViW/5JtorLlQ3u7ki51dv1Lahlr8P1ZCWe8aK3EBpCzblADkenP2eS9Hw1457buPcJaxtsiAt41I8uwuRNlCJsYq4Pp8Z0kLmMBHLJrwIi6r4crOaoIm/MSZSmYLdr3SFnJ4cZmjlLWjoTBBV6lQWZloqbVhW8ZSPWv/tE7jUVJOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZW4Rxk9xx61gTH+XiH74IZq44ebiVpxMI2ZU7jUY0w=;
 b=J5a8vlzyLhgxluaEZTrA2RwQaPBcGc3IipLySVi8URTPaPdZTsCgcy7LOfxdwolNIWpe3v7+RIFG10ylFDMukVE3GRzT/gQiS/UK2oUEJAqIbfiE/bhWJEabOEbfvRUKMjzr/qyjw9grYOsooA6csz/XKado7Bmny7vR9IvEbJL+krRjJb+eIK67Hj9X+Q9Rz0FFobcrT4VlpQNnAryAPYdCXuKY1WWvMVjcb2sxbCn13Lfo3btJtI86UVu+JxbtMsw8QHiO3FSnqHePIl8PdaU1MYXoMOD36WajJAyhQnR/ulmHTSo9/J1g6Irin/HFsaDk3WfsiDyMNtIpX0jQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZW4Rxk9xx61gTH+XiH74IZq44ebiVpxMI2ZU7jUY0w=;
 b=jZMfEczHboC4nwbk9qR25SYBdt8RxB/tWmoViuYKB+hh/Pc+AVW75aIDlDHX8CfX3iBKUEeceA3oNFGfwffJEIxTm/wWIzvRUsG5RLYyYl+QWCyIVoZzrBy1SbIpd8C25rE/obL3Luin6FPX9Sut87+V8isRpfD0/M9FT2sp+4MNBhMaX67xPzkSjqHwkm3Tu3Rohc7/XwcJLzba8+2+tRw6zLoEKC6f4ASgDY1TqAFVX1PlOmRQ0q+VAnflGUNBrK26sRm5ixnB9JDyjxberk6jxbrfDCZjQtSMj7N5DxrBrwHxxBTbYnTMdQS7cogmLZH8v2oISLA/YSc3Y28yTw==
Received: from BN6PR14CA0020.namprd14.prod.outlook.com (2603:10b6:404:79::30)
 by DM6PR12MB3833.namprd12.prod.outlook.com (2603:10b6:5:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 11:44:47 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::b2) by BN6PR14CA0020.outlook.office365.com
 (2603:10b6:404:79::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Fri, 28 Jan 2022 11:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 11:44:46 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Fri, 28 Jan 2022 11:44:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Fri, 28 Jan 2022 03:44:41 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Fri, 28 Jan 2022 03:44:37 -0800
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
Subject: [PATCH v5 0/3] Enable named interrupt smbus-alert for ACPI
Date:   Fri, 28 Jan 2022 17:14:24 +0530
Message-ID: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca85bbe-bc87-49ac-40ae-08d9e253958b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3833:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB383375AE00AA2F5B24B144BBC0229@DM6PR12MB3833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sMpC4OPbBaMvMlyYOEZlH8cM8UTmsh7ak9PkGMWmr2tss6ftRTuDivpOPfcespIhTPY+J/QFFxOKWgJMzbA9eyjjN0YOBbqk6zLDwJX9+U8Eot3n7eZM2+du0XMD6j402UK7nUHNyj2MNahxw3ignCyhB66gBHxp9FWpIKhsNX66nfP3LD7wOgKszfE7kJU/lVLroOfhpxtKfHPjUfRukMer2Sx5LW4ux7eigbDSwV5nJ9ag7C1omJdcifdqqsmsAvuwdMyZH0pSlg30W9JYWGStidsAzoVtblgOAkUA2x67EMhDG+5P7qgDRJS4jdlBkdIhGuOc2tt6ToohsqveLCZiUXLGL1BO3L9CnVep+pinwYDiYBNHh0LuYZOALaxcC27xPzyKL4LaD1gpQiYzXpzIs0wmim2M1R5ElWfNhO1+32ftOIcW3ElXnLOo1gP/RnpgShvn6dot7/uo5hAyoSMjtyEk8nGD1aeEgwH16V3gjgZ8RNV7pLocAZVryvuQZbECQFwRSOUK1ZbfQro1/Lami18XjTKtqAxfB8io30lkPSoFGVsUzruqB7FG0//hmt8zxwig8VnQzDFDGJqNATSlmXYL8/RFPLVsADKhAbthoP/A3T9ZIoFnUNdVqA2/VIifqP59hyrE9tywH7Rk9lu3ah/sIJFL7G1+82WZJnOzr+hYtAU7JktBE0mD3iNvKr0A2muZJClIQa7MJcTgmeDvaK0Nv9YsThyF17cP0qb9KmlcJzGKvgO3p6mezTjt7+AMVpAu6JIdsz2PEX8oA==
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(86362001)(70586007)(70206006)(26005)(8936002)(8676002)(4326008)(81166007)(36756003)(83380400001)(107886003)(7696005)(2616005)(921005)(356005)(7416002)(2906002)(336012)(82310400004)(426003)(316002)(47076005)(6666004)(40460700003)(5660300002)(110136005)(15650500001)(186003)(508600001)(36900700001)(2101003)(83996005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:44:46.7011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca85bbe-bc87-49ac-40ae-08d9e253958b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3833
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

v4->v5:
 * Include property.h in headers of i2c-smbus and i2c-smbus-core
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
 drivers/i2c/i2c-core-smbus.c                      | 11 ++++---
 drivers/i2c/i2c-smbus.c                           |  5 +--
 include/linux/i2c-smbus.h                         |  6 ++--
 include/linux/property.h                          |  1 +
 7 files changed, 82 insertions(+), 11 deletions(-)

-- 
2.7.4

