Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF2848C5B2
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 15:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353992AbiALOOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 09:14:55 -0500
Received: from mail-dm6nam11on2055.outbound.protection.outlook.com ([40.107.223.55]:48672
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354008AbiALOOj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 09:14:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGN+swTOFDkyPnLw1sa30c68gIEblmwteDlOjvK4HAEdloqeOsrrPOCSaOzNwZP0eSGp5pYwv9u0arOBRszuxdNxjHvu6WV4jF0dYIkMuTOWZNheYg+SwcHvK8YEg+zQe3s5E8YG8VCmTdokEfJVoz88APxQp5nPaDhwqzpenKsQi7fHeiPHzWLeMQhtBDTG5/iNBovc82Dpj01fVVudU7dZI1694l/3TKHfcFVHnMD4gcBAdiOKt/maKmxD6hzvw7o3ZSFQL6aMJ00BIKZm3Ppph7Vpu/iPN5MkOVDpc5+GmXyzsstM5nibAED38slhseXCLSmi2XnsxO64sp67Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPbWtDoCVN9Xs0c1Pd+/SIXWxjO2ET8nlqoiXiUJ06w=;
 b=Ru/khcnEmmAQrKALVsW6KMLT9znpFYGoXEoDCd2iI8g+eIgt5DtyPHv+G2cdqisoMAgl+UxRqW1rIHmjQU0lgw+MmbdagrhQoyaU8pEmpXlVhxtxq18KzKIGa3PySN/Yl2NVfIl3/wDb9+YKPYDKqY6A3vP9/RNqUIeHEmdKusjDSthoH3hQa8DkE6l0bzsKnRQwTDTI1aqY3NSUy9JQ/AqeeM7LcS/oI3ipbNX0w4/jJPqO7gUisulGEhWV5VAMJYzEXReb6w+zISBalgBYHd07zQ/ps4IAS8UzLOAouLrRm3/WN1nvH8vv09p4sAM0g8sI/ei2zRt3UHAEOtws2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPbWtDoCVN9Xs0c1Pd+/SIXWxjO2ET8nlqoiXiUJ06w=;
 b=fId022X3CvNcQKsuKZG0a67HSfgrXAjXD7q2nx9cpe5Jp7D+ZRKRxQkKpCahO16lMHem8woITIIewDI2Pu22g9DeoM6lumN3BlvNEChxjUgclriwm96IOw6paR6ooYyawnx5ebhtbh4eKM/nnZ2kYwvi7KQeh7L9ll1hG6WdiV5uuVIo+CRic1z9v0Vaz0PdwES17Cod+nwdcfU32wOiELGyrTAvn2rHTxRzWq2R3I3aN3zUmG7oXvenmYsCdnjiJnvT5CRnPHBFRl6yk7ayg5NXDhtRe4x8XISw3t6EZwTTCMQD/XFnOWipOIMN72Ea0gTFra5yZ+g/vRsx/7m2AA==
Received: from BN6PR2001CA0027.namprd20.prod.outlook.com
 (2603:10b6:405:16::13) by DM5PR1201MB0219.namprd12.prod.outlook.com
 (2603:10b6:4:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 14:14:36 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::fd) by BN6PR2001CA0027.outlook.office365.com
 (2603:10b6:405:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 12 Jan 2022 14:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 14:14:35 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 14:14:34 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 12 Jan
 2022 06:14:34 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 12 Jan 2022 06:14:30 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <rafael@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 0/3] Enable named interrupt smbus-alert for ACPI
Date:   Wed, 12 Jan 2022 19:44:19 +0530
Message-ID: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2350ef9-2bbe-4d0c-6e15-08d9d5d5dcc4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0219:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0219883E5A0D8DE5DA2BBCDEC0529@DM5PR1201MB0219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WyFmiuSkAy/3/PRE4eKgWQInGBKSFzgmsxjkV86Q/5A0BEtdpcSXxDK8elT8qLRmyAa0YF8v5qS5sH1/zM6SDyqMm3aE+qzob/PnpFgo9W+2nR0QFX8nHzCY8rgAqe37loVH+Hwpqmrv6oJm8yX4FQ+YHO/8My7OkSlO/ZSn4FP8Qq+rrXthBsa4oCEB9W+WmucBjSQiFK3D0eA5wzm7yoyiJFaOQUO27qZDYVoUfiiFKQ+F1iNcMd5t5tUMBhhqfT9jA0GmMdzamsYgv+UbVJtkPWxDfLbvugPJRtE21e1JB1K2v5YK11y/vcX0cEPMpxpR0IrLc7HW8MVDnCH+FWfU2MSpy/kxBeDBwSZASRTXIqfjyoEsVeOUpgJ+psaFkiy3JvZGUEAGk67g23Ws63FW6hRpg8h+FKlWhZPgQF+cYCRzbfFXK/+YgRjbkIkn3/hT3y6Qk02kkC5D+Bu+lJoI+dTiTPeaukUa3ZOXlUuk2DEQsy/OyDJ0Ai4An37b8zvJedW2BbURkC3WAzHU20NanLgIez3E8J5pzNcavqoAEICHLoMHo9RQMfF6ilBm8xmHsPHxDxRil8FjWdApEaySM58tZtltIJ0hFj5XrT/TWqm9N0hmbVJE3sQm3aCWiDcpcCYOdL5s2sdOFcsUEku5gJeBp9PSCAqus3/i99h3ubpw143sowOjIHs0T9YwqJqAo/LPxcnGrZ4bWLNGYpwpXZCbPWdkZOo4qnuraqHFjIOAkYhWrQMXCNUGdui7O7WyDjtu9OtIt8wm0T8MHIaM10l6406XX0G8353zfpnY2FthBt9T9hY3PJdUd7aQHeo8siXhCbh5+mgNZXusWx64r209hPY8XNKMbd68rKk=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(70586007)(86362001)(40460700001)(47076005)(70206006)(26005)(82310400004)(81166007)(316002)(7416002)(186003)(36860700001)(921005)(36756003)(15650500001)(107886003)(336012)(8936002)(426003)(8676002)(4326008)(2906002)(83380400001)(110136005)(2616005)(356005)(7696005)(508600001)(5660300002)(6666004)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:14:35.6528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2350ef9-2bbe-4d0c-6e15-08d9d5d5dcc4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0219
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

v1->v2:
  * Added firmware guide documentation for ACPI named interrupts
  * Updates in function description comments

Akhil R (3):
  device property: Add device_irq_get_byname
  docs: firmware-guide: ACPI: Add named interrupt doc
  i2c: smbus: Use device_*() functions instead of of_*()

 Documentation/firmware-guide/acpi/enumeration.rst | 38 +++++++++++++++++++++++
 drivers/base/property.c                           | 35 +++++++++++++++++++++
 drivers/i2c/i2c-core-base.c                       |  2 +-
 drivers/i2c/i2c-core-smbus.c                      | 10 +++---
 drivers/i2c/i2c-smbus.c                           |  2 +-
 include/linux/i2c-smbus.h                         |  6 ++--
 include/linux/property.h                          |  3 ++
 7 files changed, 86 insertions(+), 10 deletions(-)

-- 
2.7.4

