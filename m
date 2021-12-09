Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5048F46EA96
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhLIPJa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:09:30 -0500
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com ([40.107.223.89]:2369
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231782AbhLIPJ3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 10:09:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I13ieZbBdaoQntlm2FTwNhTd9ceI6nfzOiHrdlKl4qQB7Su+kdZCzVRwJT+Ms4Y8BGnlLj4B6I1Y+f7Gq/XRD+UwGqid1jUYkzMEnO92yMxPBaXowCLpOeUolnO9Y128JOo2bIdg6udbn+4ksF+eVeYkmKda01S93U8wcXziIh/y4vKEguu36hJIg3i2LRj3eqf1mqM/6HgLBOfWSEXnGGO90Xer/+mpng58/HeV356w5I5i3Q32H2ea17pFXmCrlNvfmCh5fE5I3V2leKrc5Uxcblqf8V2uGCOhZSxsbgLAzkgC/NBtmm2nmQ9rKiqMy3jICh4wJJimUiFJpiX1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGbD/ZtNUULihlvi39rVGAJZ5YlqSUUdShSV/Mxte08=;
 b=P8ZOoh1J2yVlLKXTIsJeqxIPbLqGvFibtvmIhLiE+dyYv5TmETbWuxxcZ3Vu9PQ8+Kr8jVYIQBdhXRpO/VENUG0AzQm0ssafv9HTRC7KZFdmgHiRtpexjV1j4RUzlO6aRheqjykLAj3zp+iTWELEDNIZOG37iKpSNPVV9Df0URNcyH/bK4XkRs8V6wuS7I/jsXmcI1Lmm095/46MNVQdi5pjTPFqjpXPPZtf0bj8jjiHH/ximlk14fkdNSODhu+RzBZdMeoBu2oDjuuYT3v72XqQE6Jbk2K5M6VYwGzsuNBjPKW2B2dJAuSUVobjW9oXIVq1vRNPC4K0EgxkTrXi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 203.18.50.13) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGbD/ZtNUULihlvi39rVGAJZ5YlqSUUdShSV/Mxte08=;
 b=GlipjfLVflwAXFPQyqQ3qzoHj+Z2ND5naldlLDpli2d2EFLlEofEuazo1RRE0oQnEowzNDBS9zd/pXcdBpNjSqaShgczdFmHlp2hgHj6rOWADBYzoLNqixX+AASJQvZgHgLXkQTsbbtvZXHil5yVEUk0jQrpKlm5zIx1LdMDPj5ZJiG6Z6mKo9S14O/ISpb6iGasb5IjpcZeCHfwFw+uJR4PsokEQ+Lmet/48rzj7JrM3Mz6KvErDAjK1aNpp1arUcSv8bXIf5hmOIw+AT9uW6q1Tb3a+47qz2y1zlPBqKJvv22QqFWYWVfEkxM8fERvbS+S892V5nyMc+T5j4jw5A==
Received: from DS7PR03CA0184.namprd03.prod.outlook.com (2603:10b6:5:3b6::9) by
 BN6PR12MB1875.namprd12.prod.outlook.com (2603:10b6:404:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 15:05:52 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::e3) by DS7PR03CA0184.outlook.office365.com
 (2603:10b6:5:3b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 15:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 203.18.50.13)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 203.18.50.13 as permitted sender) receiver=protection.outlook.com;
 client-ip=203.18.50.13; helo=mail.nvidia.com;
Received: from mail.nvidia.com (203.18.50.13) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 15:05:51 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 15:05:38 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 9 Dec
 2021 15:05:37 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 9 Dec 2021 15:05:32 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 0/2] Add SMBus features to Tegra I2C
Date:   Thu, 9 Dec 2021 20:35:19 +0530
Message-ID: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae97c5f4-d77c-4a84-006c-08d9bb25642c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1875:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18756CBCEDD4B4C2C7A826E2C0709@BN6PR12MB1875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x037NUYQNjwHJXBsyMDU3XDAvf7hyCFEWA07HPWWOnBstGJBGzdzbJNy27KUk0aohzgOt5BGUHIUnddWC/Av1+oLzp76zeVX5WhFnvENp5uhxVrMsNytTQ9ll1kUK9tUcl/1W1u4WWUXJtgZBp9fCjO/2+TqoXL5Y2usLqFSRUg0K8DrZa0Kg++16eyRX7nui9rANRx8Z7UFpSJv/TUf5onCVIetlu1Qq5zV/pmHJD0BKQvPQwTPPJzDG4bdJrIy7dU/qFhwGSFWpHYKEyqupoLEIDlmjDKngHdzEcQRjp3Lzz8egiS0hPNfQzjN0plCgg3zt24pThkH6vDfj2UWh5U/LZuS3AKgXwtGp/VDdRBd97WflOd+cd30pSXYSMYspGt9xcXDDpL8L/6I9YWPqnvqT168v6nRzURj07PxWmKYdVuy66jSQaVw7WS1MSCJoSxnF+Lu5Ow7JtWZ9rmscWvkWKta3T/j/w0GkEjpUnt4lU8CjeGgeAUiONgAE1sdcIA+4GQuZ21KzRGdgJ7TwraRZF5HHEd3SNCKkCspP7lQU5Tjk/UxJxVH2OxmfGNaXO1uF2Lmv+0cLMiVYcGvferNhFvY4oKPiyNVtW91vBgn7WqcFCTR8SzF7uR7BqwTHOb8naHnmkNgJTi8dWnC+LEGdqAjsmVYWu8SHV4bhGGXBxUwWcT57XaSa66FtvfMQlKlHzxkicxnhZjnkdvYne0L71dky479OzmpV78nOoYbFHq2PKIhxqATpfeXPhRlqMJ4FQ1KSHIJqLYVKGnGB2WlQrlo/79mXAMMQj2IdASz9CoZnJ1dtxpXkHaKazVU6wmIzagDLiAQV8wMx8q9B6xlctMHMD/hv3SUp27aTfQ=
X-Forefront-Antispam-Report: CIP:203.18.50.13;CTRY:HK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:hkhybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(186003)(7636003)(26005)(7696005)(47076005)(921005)(83380400001)(356005)(82310400004)(6666004)(86362001)(4744005)(2906002)(36860700001)(5660300002)(7416002)(34020700004)(40460700001)(36756003)(316002)(336012)(8936002)(110136005)(107886003)(508600001)(70586007)(426003)(8676002)(4326008)(2616005)(70206006)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:05:51.4050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae97c5f4-d77c-4a84-006c-08d9bb25642c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[203.18.50.13];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for SMBus Alert and SMBus block read functions to
i2c-tegra driver

Akhil R (2):
  dt-bindings: i2c: tegra: Add SMBus feature properties
  i2c: tegra: Add SMBus block read and SMBus alert functions

 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
 drivers/i2c/busses/i2c-tegra.c                     | 54 +++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.7.4

