Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6D14772D2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 14:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbhLPNOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 08:14:15 -0500
Received: from mail-bn1nam07on2089.outbound.protection.outlook.com ([40.107.212.89]:19401
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234006AbhLPNOO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 08:14:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kX+W9MEDr1GTvdlgdIh8qA2++Sh7W+nZyajcn+mZQIMiHhUpD5DOg0BkwOFIMkAvv/rkAMEbb56NLlRSdklKpIWcXn+jU/bZ+qj7C5aza2Mkp9kUYvLyeR04eci9VA+quNLq7yQNDkypB5U5zrA1eabndmNem6oB4SHfXEQzksTx5UXCdJUwuaWEMesLPUP3LrEW7XoipDW6Ax6oxtW3Q8ExjQcDPM3A3bWCnayrjHhiKujaerrbAKkAy3AfK4nPZMsriP3LC8JhQCZWr0ILv8n+gn5tMEduNaeLx6Z5dNISChWbw4yOdjerfILh9fzekww4QQ21TJj27qR0MMpoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coOwQj9i20YBmMbFVOHUy9oy+RwLRCnZzuQETAfYsNU=;
 b=EOpLDQAsYAUcGTHXAYRR+56wp8LiBb8lvbMiQxLiQ39dTKyGAbiQ61+iIYlw3+YSSIM0zwtwWPOyfi/sid+A5i/iSghM0jetaOff6vvwHKQdKHqkb7rT6HVYgdEAdDACGcQ3GahzVPX4wz8rJ7Yju1shtOcDiLN+vLsd2Hu30fLT3mX0hRxyL8P2DG3LNuyPbxSPjkzjRWWxUuq81mCUpY7sQ9ljxzNHxWCkbL6xJMugSOBiniIW9GBQis8xTCnjciUgQNvGtWDHTFuxhds94cFYZKxUGKsH1QM9KAQHZQSijAgsEq6yIZbmJ49Cl7PjV72wn72ZCDrd08nEALynsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coOwQj9i20YBmMbFVOHUy9oy+RwLRCnZzuQETAfYsNU=;
 b=gAAXxdV3ptBEtZSBIizjz7qtzAdx6/ZIXcLG3ggcsXgbww71l9jn1fYk23egH4qFlXcimcIsOCKVKZy8tDAcs0kFNTXYB6tZ7xg2obnGvnNEA2/fiWo6eN5MgTL4D7Xc+Hydd+vF949CU+cUVc1vVXWme9WDkfYbNWVeJ66fu3Nn/u1dH+vpcX5vQIyeL5eegPWb69ufjwaG/c3F0+IEQkr0pCnJHvSIRZUxX8MoBRaN2jMHtR6a9br3ovMDik8DtHqmxfYVMha3/AP084bq7tN0kLQjon9P5Ql0XdNTtwgAaGUlpdc9aK4iFiGY2BxMkLQss+CSyDP58yb6P1b0TA==
Received: from DS7PR07CA0010.namprd07.prod.outlook.com (2603:10b6:5:3af::29)
 by MN2PR12MB4421.namprd12.prod.outlook.com (2603:10b6:208:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 13:14:12 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::d5) by DS7PR07CA0010.outlook.office365.com
 (2603:10b6:5:3af::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 13:14:12 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:11 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 16 Dec
 2021 13:14:10 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 16 Dec 2021 13:14:06 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <wsa@kernel.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <andy.shevchenko@gmail.com>,
        <digetx@gmail.com>, <ldewangan@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 0/2] Enable named interrupt smbus-alert for ACPI as well
Date:   Thu, 16 Dec 2021 18:43:20 +0530
Message-ID: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc416bb-643f-44f8-57cf-08d9c095f3f2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4421:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4421044E259DE3CA8FEA0D43C0779@MN2PR12MB4421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82aad6X4hNlfZwnSFhZl6j1MTiKeeK7vLzKTC2DRzzMFurjoltUCsPb324rzdTvh6UPFU8274sThVk2YYbrWkRw/KoCKt6vHriWHyMi03Tf0Xco2RPs3NVdiaLHROmTACndpT8/IWC5fy2lIrrSp/qdVcvdMyDEpY5I+v/aEz4trs1cOBCUAff0UME5l0mjMCnhGBiYL89JH8xe+vQTenYPfNLbUPJmPeTJTMOvxx8RgpwxaIv9SDnI6G9PD9HFc2AWxzf67y8CCYnB6eGVef6e6ISRjXIUQiRKsA25XN5LMSQ7P8MWOx6WI0eHSwafiFGmqurNzm2qKGtOq1aPe4d19yOwz6pRv0NeHGI4SyfW4AEkK8O764Qx4tolxDCyVHtJAOsrHQkusoMy8BknYgKUTsTC3FMT4Sn6Gs+/ijV19lRJ4aGszeykxHSy/v43VFJ1gxPHi91TP+OHpP1FjAOqYXTWPAm98gxsGngUrjWE2KqD0zKFAbOCGux0c9rL78TsmEhAKklQX0hBTLmpNDaaNECKGLKgjSnOlt4YF0St4nwv+Cqw+j6uFSEYEeDJTIieuhkQan0VUMIBvYfj4OT9ZlIvoOHgHuYjBa+crjrdcCNTSksxxj0/wqKgj2YlUtRAPEFzpp7Lga//1LvktnAZv79edH7NzxM2U3SCuQE6KLBIQXmBKAJDVFPBlKVysSIyAYlDkA/sIC2jPz9fXnn2R2vo+2GWsV5Bqp+AQYL9EQimztZghznRQjLYbGD0SP6GpyD6AkZTawhfYTphELz9vhCgwVuFIezXMLKjTrcJa1nt9cnYzNGXL3tORj9bttVSoLPmRSx95kOGwjsCG25ww+HxmnNTtViuBaJZ6b1I=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(110136005)(83380400001)(40460700001)(7696005)(316002)(4326008)(34020700004)(70206006)(86362001)(8676002)(336012)(107886003)(82310400004)(186003)(508600001)(4744005)(81166007)(15650500001)(7416002)(36756003)(921005)(426003)(8936002)(2616005)(36860700001)(2906002)(47076005)(5660300002)(6666004)(70586007)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 13:14:12.3947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc416bb-643f-44f8-57cf-08d9c095f3f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4421
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

Akhil R (2):
  device property: Add device_irq_get_byname
  i2c: smbus: Use device_ functions instead of of_

 drivers/base/property.c      | 35 +++++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c  |  2 +-
 drivers/i2c/i2c-core-smbus.c | 10 +++++-----
 drivers/i2c/i2c-smbus.c      |  2 +-
 include/linux/i2c-smbus.h    |  6 +++---
 include/linux/property.h     |  3 +++
 6 files changed, 48 insertions(+), 10 deletions(-)

-- 
2.7.4

