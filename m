Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF6448D8E3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbiAMNao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:30:44 -0500
Received: from mail-co1nam11on2044.outbound.protection.outlook.com ([40.107.220.44]:27233
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232034AbiAMNan (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:30:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLY79KATQKh1oayG7+SHdH/GsWcBb9jy9eExlEt46qH33NYuIYuKQBM7IDu79DtWTvm03r661lvSTkrVQfW1q/FE8/SHcZ7HADAYfTgneVjF2YJREObYSwrdIRb4r+V0JD8cMVso7fzDprbbKGygmJTu1+DKgOHKkFKkrDKOaOlJbnyDghAhGwjRbOa2aRUdBl4/LFI6ah8s0zZs5MP3EUIzi3CnTvWh6XdGofqG3vaLjK4aIottrpu1FPR1lAp2ZSkOf7sQCNFfL1S8r7xSBQg5vV2aP2GhbOWr1EMYAPUd0GDlDVuBI3v6aeO6m5jOHmiSFIt5ogDlVJD4qtbE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBd3iv8X69U+lFF2QFBUHQllG9OZz/fQUw8w5+UIbWQ=;
 b=n9YVAysfD/QaSQ/+ldEogrV9t3bTDaYpxECHX4pjW4/9x226jLeLHhMWxqxYvprih3v+fpHa0eORJtfhNWHx4AOwojrrL1X0vqmRV+TL5mupiR+0jw1eu7m0+OXh9/FQE3nuon0L0bkhJZSa2q6QOoU9jmnazvb6srnwapocHYVAQmP6WYiu2SBAtGG6M1vPJmeQ41PGAhYjFLbWb6vab7OCiXGvHiQYbWt+84Y+xjQE3FemxnaekQzs3D8ahmpm5x5RRqqChIy44YWoSpHCoWHemR2vUtm/pjzpHcu9Ehsal+z6Lf0XlEpeOAKDH0oXlNtDvbTAEfOSrgIDlmR58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBd3iv8X69U+lFF2QFBUHQllG9OZz/fQUw8w5+UIbWQ=;
 b=VHEq49V5pjmch1WGdEZF1G/5a22rmG9sqqsTnJnJl22GmBDs5BeKfnnvHII+zJuzBnme4G7ESQl43INg5Zo/Tmyn0+AzNeQjXlWdLrhhZTnynBMpb9hh2fl7BmRLXSM1jlrUZJ0uuGfhNCBhGlgVHBEVd1f6eSlxfDej9mp/N0gn60oNAvKpevtrJQ//vkuKFCxYnpO9jMO6ofw+JK3KSSdZYSJ6vHyYRquycDQGxoAn+q4qbSWpeqfwbuVuBnw7zq5Uhm3AncNOcoQFcVn9uwA0oFu2PQtMTiXjlnsM+OkbsJ4K7Yryy6zMgnJlAXoi7cEMi+5SZkEWw9+lfrnhkA==
Received: from BN9PR03CA0295.namprd03.prod.outlook.com (2603:10b6:408:f5::30)
 by BY5PR12MB5512.namprd12.prod.outlook.com (2603:10b6:a03:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 13:30:41 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::cf) by BN9PR03CA0295.outlook.office365.com
 (2603:10b6:408:f5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Thu, 13 Jan 2022 13:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:30:41 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:30:40 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:30:40 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:30:37 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 0/6] Add I2C and PWM support for T234
Date:   Thu, 13 Jan 2022 19:00:17 +0530
Message-ID: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8d2b21-3f33-40db-41e9-08d9d698e51a
X-MS-TrafficTypeDiagnostic: BY5PR12MB5512:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5512C7AD3C4E781BFF0CA946C0539@BY5PR12MB5512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDU3VY3i2mbsK++YzUhmuC8fapnrphX+Dt1K+L8/vTFo6AsSY1w7JIyXRo88THsGPLIQpMyhOKZABe2laraAOQOcWpAqnkiVDlplZVZnA14NK40P9sIB6N9+Bk/Wz+5TCdY3Ntz+1ujJxBXeKlwpeLOTji1AUdaT7m18WHQ87ULNHWjTm0PSHM2HuJTg+dxqFbk2J7BIthq/09guMA89K2u+RKgqGpJoihvfHBEh7fdVsWvjdyCBvg6SUHmk/KU+9YARMPqlDKlW0p9JoYJz79Y+3iPsibCNS4OZDXoUoISq7tJnGqe+mOyd+T/qGll6+nrb+jS/gWhEpKYcw45h5FqJEMKd3V7Q7WOBoePhdY/HstScsZ8L+wkkisrXKUMkNVcaSlH8S2SLRd+4skiS75fP+MPRYXFJ4oIruvBZH72Igp4Qcq+4/TYrMva2wflJvbrUzYf2kKPFm+xbG48xEWbBlRJjfolge9FHb9Y85JACBdc4At1ZaDH1WtIgOuRJmYxIEOlbPD2axeA3voENM+a0wGVpu1XugJZ0kpoFMA9S7ZUoxcJOaA8rXCDNoBK1Dj1uBjrMRalWp88rhsdzS0LPKbdKQi7OPfZeQbEZ4PIggX7AwBmmojBknIeRflKjswT7kNsl6mXXRWwjq2ZWuo123QPm1yGOQex4E+U1I8ZP/3INgFdYbTQOI28SzT88DTEZ6ZQXgcXQ9a9SqFTKPKrZOd35b59zABxufIjQsG3GVF2AbP3c26I2MuR4HmrlQ2vlkTUXH8MK42bmTq9o1RJtJOk3kaqb3DK3sMXwpPfGAFv2VIQ5XrvCzG4TH0bJ
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(508600001)(70586007)(5660300002)(8936002)(6666004)(8676002)(70206006)(2906002)(4744005)(2616005)(4326008)(356005)(426003)(316002)(186003)(7696005)(336012)(26005)(40460700001)(110136005)(83380400001)(36860700001)(107886003)(47076005)(82310400004)(81166007)(36756003)(921005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:30:41.4993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8d2b21-3f33-40db-41e9-08d9d698e51a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5512
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset contains driver and devicetree changes to support I2C and
PWM for Tegra234

Akhil R (6):
  i2c: tegra: Add support for Tegra234 I2C
  dt-bindings: i2c: tegra: Add Tegra234 details
  dt-bindings: Add headers for Tegra234 I2C
  arm64: tegra: Add Tegra234 I2C devicetree nodes
  dt-bindings: Add headers for Tegra234 PWM
  arm64: tegra: Add Tegra234 PWM devicetree nodes

 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |   5 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 133 +++++++++++++++++++++
 drivers/i2c/busses/i2c-tegra.c                     |  25 ++++
 include/dt-bindings/clock/tegra234-clock.h         |  36 ++++++
 include/dt-bindings/reset/tegra234-reset.h         |  16 +++
 5 files changed, 215 insertions(+)

-- 
2.7.4

