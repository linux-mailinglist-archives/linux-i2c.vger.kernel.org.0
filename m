Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467C2494F6D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241305AbiATNoy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:44:54 -0500
Received: from mail-dm6nam12on2087.outbound.protection.outlook.com ([40.107.243.87]:50784
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344937AbiATNoq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:44:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmmtEOMfxOMjE/WuXGhoROTwFcq9klpQw9kVDoeGI4nxJuBAkQsgVWjM7OY37/YX6wBJpKB+j7tcq132wSxbX7MQ1cN4xWvWCR4XhUzDHO15n4VqY908SBgMWtBGxZLO6/UF8go7NrF8PNFNAO4gY5xZ4g2V13rWAgnPvJELOYVYQlYw//r0/E61w5t+j9f0AF8Tcip/CsOkNQMvg9f6ZDQGjd4G7KWHpLTZUctZC9QS0gg4I0jat9hbi0dMgg32eDQspYzmEk017U+qYlApoP4vgsll6zhlbdsgioyaKa5ieVzyk9VkRuskoGht8FiGDovQrU+svUgeM+8HRJ0C0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHAtooxKodZ28vzEEKAP2N6UJcd4iczqg7LNS6m/kQM=;
 b=gQW7dJZfz/fW6JQyF7j1C1UCEi+NbamMnajBPZHULSieHmnK1dw866Nnzl2L9kNXyWWRKcGJb4HFqiczZlQHA/bBRPLqUnqVnAlNd0nr6ZOCkAyak6KENG5tc7nX+Wi6/BAxnRCNcizx8FwfGfIaAe0nYtyPvU1ZQngjmq4pfR+D3AMHaA9EoDWft1TiIc048qGUBvK47lDXPw4v4/05/PpF+mDeTO1mr9KPXdsw3fnxCGveu8HPKEZWfOgUonIWrvvo1h/W+FAmoCdjiviS08v9Ng8OTYG1F+fZF6RPnTnjvXCPE52R7r9uvBrvGTsSnb2TWlvIBxGkuMYv+X44ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHAtooxKodZ28vzEEKAP2N6UJcd4iczqg7LNS6m/kQM=;
 b=SUq9ntwaw0xMyhV/bhXbatYj0CmoDYukOuTbPkaVnpJdyZye87PwccKHolj2/kdM5RBZEcJNzwBhYp5tOCneLUrCFUCUy9/1bWsACr7PpB0203JqQ2vjOuvgAfK59n9LRxpEnZAO/4lk1W8hIyfKv21UM8Osh27n8SfJsGmC0ahdGhbQZafzvGiu2IU2DlL0ZYw2nTgmxnBZNoh+e/PhivgzHbZ+GXsSuE1hJugdmTSbNSEA83bnxcj5/ZEIVbtsCzsuZI8E1yD+Z7z8H8cmfC79hiBBGMDYLCnvKMSpUrQdf01JOKvvm7ZqV2dINDoYJcNaTyTjuA3fBqBbgbefug==
Received: from DM6PR02CA0118.namprd02.prod.outlook.com (2603:10b6:5:1b4::20)
 by CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 13:44:44 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::95) by DM6PR02CA0118.outlook.office365.com
 (2603:10b6:5:1b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Thu, 20 Jan 2022 13:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 13:44:43 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:44:43 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 20 Jan
 2022 13:44:42 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 20 Jan 2022 05:44:35 -0800
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
Subject: [PATCH v3 0/3] Enable named interrupt smbus-alert for ACPI
Date:   Thu, 20 Jan 2022 19:14:12 +0530
Message-ID: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b64c3c37-8a0a-4b3f-5a88-08d9dc1b03f8
X-MS-TrafficTypeDiagnostic: CY4PR12MB1576:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB15766699845F9213D5F317DAC05A9@CY4PR12MB1576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79tvob9jdEkiGJ4twFCAZ2dzfHWic7ZZg/+jAWuAaBjTGHunsVtJfWY7H/pZ/P54dbisNRF5vW/MS26efQ+P62MIAHU3evB2K17m+OeMnPMRRqUwv0VEfPTKgP0wHpnl0CpXf7Xsxz2KqpNAjdT9/XAnLxCZXt6fZ8VEQbFl8ggRdAmXA3owo9QshtWRUf8RfIMkP9ijuAvNjiOijQpi8LE3aUuBoJGmw/w/3V8tbUnqDJQ7PUoljEOLpm/iTlc/wNoM0agPDpQQBGH4ZUniC5qIqUSIJX2fKThS4zgA6fYGADFWdY0203AiSgzUWlGxCCFdtjmiTZ/yQc/y0dJyzOZQskB+N+pCmo5z2m7UiuhR7iFiACGX0y6GMdxgW+7bh+XSxkuUEddIuRyoFXllJA2lFOVgVMmWpZqJyarVRj/mSRT7OiyuT1mTpjiqxU917ri3ynJF1n0N1f1ESNG9ctgm/qPC2uX+RBKVhbslHfeXU3BrPaKNev2Qn1/66g89YdGM28lwigVjIGahq5E2OoimVPyAyV502fGKNY6a1JsG88GNe1GnsDBpVRw3fEny9GdnGLV1mZcYjJT//Ll+XEFfVXkaf8+Ffe6RGq3kU/BXsK5xfvSDBiBoUeqt1CM+7WpCrzO2ieT3gMlFBKJ7xs1Em+FrFprnIg+M1mXUSjaKEUjyMNbbxS1IzLS1FpULr2lhEsP344nk5TNgbQ5Pd4HYJVcmoDCOO2T0m9V6zBjOqgp5uyOSCl5KT1/irushvzwp3YwsicH1hohKkCcvBVa7tAmDoLN6DpPMBT5kOqANX2g0tHtYyqEwYupZiYOZb+RuCateL5A5rS3fVoOUhTA9+IXnN7uyaVygZ1rzaSs=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(2906002)(81166007)(82310400004)(36756003)(83380400001)(8936002)(7416002)(5660300002)(426003)(6666004)(110136005)(316002)(86362001)(2616005)(921005)(4326008)(7696005)(107886003)(40460700001)(26005)(508600001)(186003)(15650500001)(36860700001)(70206006)(70586007)(336012)(8676002)(47076005)(356005)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:44:43.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64c3c37-8a0a-4b3f-5a88-08d9dc1b03f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1576
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

v2->v3:
  * Grammar/spelling corrections.
  * Added description in function comments.
  * Removed 'unlikely' from NULL check on 'name'
v1->v2:
  * Added firmware guide documentation for ACPI named interrupts
  * Updates in function description comments

Akhil R (3):
  device property: Add device_irq_get_byname
  docs: firmware-guide: ACPI: Add named interrupt doc
  i2c: smbus: Use device_*() functions instead of of_*()

 Documentation/firmware-guide/acpi/enumeration.rst | 38 +++++++++++++++++
 drivers/base/property.c                           | 51 +++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c                       |  2 +-
 drivers/i2c/i2c-core-smbus.c                      | 10 ++---
 drivers/i2c/i2c-smbus.c                           |  2 +-
 include/linux/i2c-smbus.h                         |  6 +--
 include/linux/property.h                          |  3 ++
 7 files changed, 102 insertions(+), 10 deletions(-)

-- 
2.7.4

