Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC5494371
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 00:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344045AbiASXGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 18:06:52 -0500
Received: from mail-sn1anam02on2060.outbound.protection.outlook.com ([40.107.96.60]:10891
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344235AbiASXGr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 18:06:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ2Hutsk/8ZnGBLtuDFhhPP1gi9aZEI+AUFplsUyN+pwO6boRLCl9WgFpUrVY5JJIt/0LXk+rjULsTPBhNMBXRR60GOM1RhtUDcxdNMCVCxXt2vuYorpXI1A0cmPCu3gEKEGR1Re/rXRBA23HQSwwy1NtS2hr/nwOVp11OuI8TbJRfaIicjwXzXMMs0jZhD56pRev1TT7yGotKUm6fSVplZmoG7yR6MuONW5aaPf63JDIpzK2Q86GyspQ9rSiJ1CIM4ToIzB/Ely2b6rtQuqvnPlWstD+6cG/vsmTzxSG8YsxjaoS/nq4k3ZAYEtGFL2EFq8hoUIjUsTnPXw9YYIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eU624T2OHegeHXTVWHITMBKQovRd21Q8K8tCTHknKw=;
 b=B3fUONmcDwydJdCpRa8Ehe+zImU6uHRxbDaHlAWD0kha0QMwXtwYlOHMHXKLy7DZGUAy3YXSEDtfpwYdqhxSMiOx6/q4Tg4Ok7pUZB6+X8i8JThfEGAOf3iiVry3jHTbvD57poxqK/HxnjMEttegU6DoLcs0uIgPLhVhqqN3e8wE+vKuoXJaB+I72scfus3msR6k93WrZlAOksFSDgszDzrPOgor/dFcoUXJ8ILU+JrD+dE0RRjU0/Bam1csLLpKF4m2Mep8NEm/71F/csoIWYsnNt4hBy7B2BQDO24kUvKyB/i2PbRuBZQ6AOZpt+PYbu6SvnF28gFN7W9sPsj1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eU624T2OHegeHXTVWHITMBKQovRd21Q8K8tCTHknKw=;
 b=BXf87y1EWMyMsz47JfHtCZ9n4KTTm5tkMXePeOWGK0zZexhUXQMqZnK/m19pQrnoFzeaefFeC7mpUBfHkwCZZsjqXARgCbNYid//XIiTUpuIl1qSmATyjqlEN9vP9zjPepi5BaFzEIIVZr+ZFR63iUEHap560gpv9Dz4JRhcCBM=
Received: from DM5PR08CA0056.namprd08.prod.outlook.com (2603:10b6:4:60::45) by
 DM6PR12MB2748.namprd12.prod.outlook.com (2603:10b6:5:43::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Wed, 19 Jan 2022 23:06:44 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::4f) by DM5PR08CA0056.outlook.office365.com
 (2603:10b6:4:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 23:06:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 23:06:44 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 17:06:43 -0600
From:   Terry Bowman <terry.bowman@amd.com>
To:     <terry.bowman@amd.com>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <jdelvare@suse.com>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>
CC:     <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: [PATCH v3 1/9] kernel/resource: Introduce request_muxed_mem_region()
Date:   Wed, 19 Jan 2022 17:06:18 -0600
Message-ID: <20220119230626.31560-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119230626.31560-1-terry.bowman@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0ced1c5-f353-43cc-25a4-08d9dba05ca0
X-MS-TrafficTypeDiagnostic: DM6PR12MB2748:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB27488149528CFA7E2CB3BE9383599@DM6PR12MB2748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSKY7pR9OOLWPuRkEY7C5j6EwVCRSVnK9g8u/Fe4hjQXHTu8X4qsmeWgNUEA2fZSjGiMFvwKgIe0aEdFEYZHWuT3CbNJv4D7LG9LZxUJT9YVC147NqvOzmvqCQSvQMPEzS/JSwmh/xDlm0EZ+OSR6vZ9hyHzdchbaLqi1hLXQr7hll0Ptm/mi8hl4b2dTRmjaFIAjQMWvVlFU2k0oFBsHuqNpbuePlRuoRo7AuRqmZvTrhHYGBVKS5iGxc7H7CxUxMpKzVDv4++GJ61rAEjJxZCFrZHqQmfiOQdu/B6dIbGq5FXwZZBknLWtLy8s5+lUWNy3Me4JUA3aGNL1MTL0gf3Tncb0wjGhKadPPsOJ2ZY3i+psBaQ3qtVKpqWAcJftl2pz+91/UCk8K0fnxz3vDsrAw+PiHgpu9brZFUjWz3ECneNi1VtTuG3TtNBGCgE/tcrtyBZbyZy6m+6P0qxCF3yDjLHKRqUQi/ZbELIv11uDwo1Lq7dPO1Lx+fJda4P7U90Xyahou1x+EAuQ/N06U66Qq9Rb5dLMYNMcSbJ2zNvB4z+M0jRsVIVdNSnQUUsiKPEIwJoZvh92G83UmIJYLq1ZC4F8Nx3aU/YHlepOxbDdvZ3ZST1q16UZ1ZMoIUUKxUqqLFMxHLrQPelRYUfAvRcl/dsQ+7Eues+tXuq+ao1X+1GP/vkxiX1EtpEp/Pi7grvixifr1mBRQfMQUjIOFB4WHvGnJe5ccmL3sJRj2k+/2GWAVRGl/gLcCPPHwwzqGbNO/F037Des+go/pFd33jR8MhSwQyaqtqV96SdgnCZm6LbW81ExNa6cC5PWZJFU
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(8676002)(426003)(4326008)(7696005)(82310400004)(26005)(2616005)(40460700001)(6666004)(336012)(44832011)(1076003)(2906002)(36860700001)(54906003)(508600001)(70586007)(83380400001)(16526019)(36756003)(5660300002)(316002)(186003)(110136005)(81166007)(356005)(47076005)(86362001)(8936002)(70206006)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:06:44.3947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ced1c5-f353-43cc-25a4-08d9dba05ca0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2748
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support for requesting muxed memory region is implemented but not
currently callable as a macro. Add the request muxed memory
region macro.

MMIO memory accesses can be synchronized using request_mem_region() which
is already available. This call will return failure if the resource is
busy. The 'muxed' version of this macro will handle a busy resource by
using a wait queue to retry until the resource is available.

Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 include/linux/ioport.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 8359c50f9988..2a5567de318b 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -262,6 +262,8 @@ resource_union(struct resource *r1, struct resource *r2, struct resource *r)
 #define request_muxed_region(start,n,name)	__request_region(&ioport_resource, (start), (n), (name), IORESOURCE_MUXED)
 #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
 #define request_mem_region(start,n,name) __request_region(&iomem_resource, (start), (n), (name), 0)
+#define request_muxed_mem_region(start, n, name) \
+	__request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
 #define request_mem_region_exclusive(start,n,name) \
 	__request_region(&iomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)
 #define rename_region(region, newname) do { (region)->name = (newname); } while (0)
-- 
2.30.2

