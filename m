Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0D24A381E
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 19:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355119AbiA3Sl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 13:41:57 -0500
Received: from mail-bn1nam07on2072.outbound.protection.outlook.com ([40.107.212.72]:36462
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354973AbiA3Slu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Jan 2022 13:41:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EglupFkOqorpWisx0u2OP7rReze2TfNF1iFFBV6XsquV99dRwapRCINxcFz7Sugrt7myZqLqaj+3R1gKC4GIKpP+SEt0ET4yI9gc7hFmaMUdCI69NRxaHeAePIznNLp70cv33o/oZiR7mZ0HD39aBqMzCa0ahk9JWolFieRr/+0MRJ12h1TKtvFAdHtQUWAN/1mKhhwnUr0UKPINsJxmC2Inc2mu9R2yrBhiZ+bsU02lchGLLYrWm2B0B+QO8MC6majcOrNGubqdQt3ZClvhiT0H53WBMdNvbtwqOtTBBeJC4mPdpt6FEI6mwiwB8jec7JSwzftJ52gzNWPI1c10Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19JLUt6bJpGtuAkGLDWExZMhbU1X8lsFCDnG1/8nrmo=;
 b=PRWcuWhA0S7zj/umIhAfs/PIuyIiQo2tknSsevItqEpKqJdbk7AKjepBR3vr8BZSgSxYiT9YCQ6xkGj4cBm/bZXZtShv9cOgYt9UCMICE6Z35juQnaUt12SPDTx59b21wH4I0qycRJHkyq7Gtp5XnQ/XgCUBXeABmseAQ++86NqV5mjX2G5l+e8xJiPB9iHGRTgcVTkujl3F29MnuePrCyUdDsdAUjvIvUCNkQ9OL9zniLc2aDbFBFmX/kM/Gdx2kyw2Ln7JzFKEFDahCJBsp9l1GVbKVRLvnNF1hQmYHKht1j14Ugz7bsVjyg1tL6zsvCXfdLSSHPMaZchrEG8pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19JLUt6bJpGtuAkGLDWExZMhbU1X8lsFCDnG1/8nrmo=;
 b=ZP04JFbaRcvuzlBsLLsNl7Y9A/JWDyT0SafVMBFbj6lFp8AJoho51seVaxPcP965/OheJWTa2Muso/jRwJA1FYT32HecgvDPZxXY85+y72SWdblOS4zksunEMkMyP9N8KAOid0wEuvFTcrIVJeaKQ+7F9e0lMXTaK6qnBtaUEzs=
Received: from BN9PR03CA0305.namprd03.prod.outlook.com (2603:10b6:408:112::10)
 by CY4PR12MB1223.namprd12.prod.outlook.com (2603:10b6:903:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 18:41:48 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::3) by BN9PR03CA0305.outlook.office365.com
 (2603:10b6:408:112::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Sun, 30 Jan 2022 18:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Sun, 30 Jan 2022 18:41:47 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 12:41:46 -0600
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
Subject: [PATCH v4 1/9] kernel/resource: Introduce request_mem_region_muxed()
Date:   Sun, 30 Jan 2022 12:41:22 -0600
Message-ID: <20220130184130.176646-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e9956f3-be09-4f0b-5aff-08d9e4202c1c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1223:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1223D2152F47CE8C6BDAD2BD83249@CY4PR12MB1223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNgHIy+UaEDWcMB49rQxWscaV47JaHCyRZg/wBQvD+C91KhKD1pWUOyhs7D0u2Edi3sAM7V4BbEMcDZf5dYEkEo4RG5vi/OefExDP/2fput5xHqhR/IfGPKpzEfR7yXvZ6aTs4MpRLvcxB8rSxPkcXawRz1vl1MFPq59szPrRQfr22l1Jsh9wOW9naIklcA4poGLBu88scDG/j8gpaJ1w58ZEjj6hehxkzfPjVxnVw4CXZTQp0s4mRyYY9jxpMIepyqcVkTVk/4zmk+aO1lKSZ6WYxy8XUqUFm2kgDKEmMinF2kCZ7/ACdcOSZ3vnUFdl4Z+cAf3e2DH7HTOLdwE5VAsGJH2y3/WRgX4lljizEIFLKLLNtg8Mgh7Ps57nNnB79CF/VFyi8dQSbF5yySDgrVHSnHLRZvwjlb+3RQ/z/ykklNFkAQwrMQv+Gn2xqBxkH/ReEKYxEzSWGXzl4awavHEE/N+Fu8jDwx56/f7iWOBONTkhDlPNRNIJyENSAsb8ihC/gfinOMB3Cme2cBHa11uLs196zsM29pavypvbUsIgloDNulSC3izuRF4jKa+DOQbkizHYnYQQM5vXNdGlO26SFBt25MVY5M78MsfcD5qQ0mtKc4EMdvgdzANYZXCugUO+ZVy9wCg3HQL7Cvhjijem+U+CmNiatVNRsT/E5KZiLCx2fwyaV5EmwPJXgbFk6tvBOeXgC046puC+Khzw5Ol/FE4DDSUuDbXRmc2Qx4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(2616005)(36756003)(6666004)(40460700003)(47076005)(336012)(426003)(86362001)(16526019)(1076003)(26005)(36860700001)(44832011)(2906002)(5660300002)(356005)(81166007)(54906003)(110136005)(70206006)(4326008)(8676002)(8936002)(70586007)(83380400001)(7696005)(82310400004)(316002)(508600001)(36900700001)(2101003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 18:41:47.9153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9956f3-be09-4f0b-5aff-08d9e4202c1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1223
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
---
 include/linux/ioport.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 8359c50f9988..ec5f71f7135b 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -262,6 +262,8 @@ resource_union(struct resource *r1, struct resource *r2, struct resource *r)
 #define request_muxed_region(start,n,name)	__request_region(&ioport_resource, (start), (n), (name), IORESOURCE_MUXED)
 #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
 #define request_mem_region(start,n,name) __request_region(&iomem_resource, (start), (n), (name), 0)
+#define request_mem_region_muxed(start, n, name) \
+	__request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
 #define request_mem_region_exclusive(start,n,name) \
 	__request_region(&iomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)
 #define rename_region(region, newname) do { (region)->name = (newname); } while (0)
-- 
2.30.2

