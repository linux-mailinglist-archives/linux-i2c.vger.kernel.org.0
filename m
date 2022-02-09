Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A0F4AF85C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 18:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbiBIR1n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 12:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238226AbiBIR1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 12:27:41 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A1EC05CB9B;
        Wed,  9 Feb 2022 09:27:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+hXSeBeZXH0GrY0ZBzxrFLeI4Sjy/59/CbtQZY8ck8WJKlz0aaZqnDLmsk7AkoIk+3Ja4OgW5zmzFH97gUlPh2tspl+2CucsQT2N1AgzoaS4isioZwDnDTEKKq/5PK4VYDy6dG5tdcuHoLuUcevq0huTMzmS0XGt8htL4sMsFv+7LUlTec7AGIUkLaqa8vG2Z3ryyneF0b5efNaud7c9NoqK71phfP+miU9DJT6tk6adhpow0cPYWkqD59mfxv5BkD3Vv02vZL6zCpePc5XoN+D1ByimtC+KAAPzdG+/Eo70X3G+oBmIdFj0bwRbDvfeBGRVu76Sq5Wk4zSYIDqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjxTVIUrUTpIybxsqz0tWcARZDasG3wYPZNCf5YznE4=;
 b=j79i1ZJzTjm1k3cjABi3MYWUyF7myClwat7IwrhUNadbLLFArTCWDG85eloQIlIT7uAsO27khZLc/aq/5WKaPvuywPh8s6XwyG+y2QfsUbugop8wa6nKLYos+kH8PToijvc49QMp0ob1xUcSZd+qkIV700XlFuh0ihBmXw4TmVK0S3gZSvDG7XrNFu8yCpZ+bnGtuluB3R6yLPAIIm6L5xl6UkIdulPMBtXsSdgU/j9OD/J8fxsmFGupAXK2NHWg07Nx/V+pd0Dr+FjB+naqp9JiPgJdfMh7Wpehp1Tt642iewMyOpCGVO0LevhVRZs1eQPpmCZ6SpBnCApOwSUC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjxTVIUrUTpIybxsqz0tWcARZDasG3wYPZNCf5YznE4=;
 b=ABXfcfkwMbM/KVGRINXdzjd3Rt5H443pqohypCiHM+Q/TbzLUUBl4OrMYt26/rB4tyc/1YBb8AoOrgoQlJuSJxrA0BwOKhxTMBvqK8uWzFOXSzdjtfT6lLuMuoNTKOxTJH3OcVPmAXS+X0O3Zmr07ebSma3+nJiasto7u6QZSl0=
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 17:27:35 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::3a) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 17:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 17:27:35 +0000
Received: from ethanolx7ea3host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 11:27:34 -0600
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
Subject: [PATCH v5 1/9] kernel/resource: Introduce request_mem_region_muxed()
Date:   Wed, 9 Feb 2022 11:27:09 -0600
Message-ID: <20220209172717.178813-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209172717.178813-1-terry.bowman@amd.com>
References: <20220209172717.178813-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f1e09fe-4eb8-4397-0302-08d9ebf17665
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4445C49122001FE112427436832E9@SA0PR12MB4445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c1KbMgXRL+wzgnYfETJMRd2xXw1g46wx0o4i2QJtomyttaZkMSU+kR3sUqnsrDEBXulAlLarR+tsoe1wF6p7KAYlpby/dxL4p3k+JZoRPLMV+zuex7A+hmWgbhgmvQXQhXZvHGnIwUXc2HfZ3h13nQxZKOZCcFiZCRPKx6raS/8VjdqjdPiCG3lYyYy116sViQUmbmmcKB0vdK40jvKGDYQ3mfwcyJLjI9s7fQBogMu71/GnioA4k7Fzsn1N+6YqxVq1vs/kchBn0vi0zeK9KcygnlPcAHBfWD6uWdzp6oLXOEvf9dK2/jE/AtflOhAoxTRlj2JETNV7Y3kqKNlvFoSy4thLWpAF9gzZ1QsLvmhj970KJ7kyQ4RRLr/hSOMFmJBIWIzskdsa8nSeAm/ilbejmYkb2ip0b1YvS/ag7ltvhxQ2umLXZzbUli4s5K7CehfBlWGmlMT/32MQx7MPTkW7Z+ujtfZmWVIGldBXuG2AX2BERUGwBx+BS4B4VA09QUMBEhYpHA+S0wF0/gKatMUBGFTfpdzOiGlwfFmzn9oiXFm5PdUkOXGkePefX7M4rpLUrbOBj8N8KeGjDQuNiND3/0Q3vtYyzqMrPIxrR67+GIcN5Q6xcfQLgelDaF5k7pJyG/QqoayfJwwq/3Ol+ekLJGZeQTbJymUSqpBFBDG03ZrV36zI1RSeJ3KG8uszJgvb5eyXQQ3IustG1BQ5HwPYfaVIb4AS8DmRZN7/L2s=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(508600001)(316002)(110136005)(54906003)(82310400004)(5660300002)(83380400001)(44832011)(36756003)(40460700003)(2906002)(70206006)(4326008)(26005)(426003)(186003)(336012)(70586007)(2616005)(47076005)(8676002)(1076003)(6666004)(356005)(86362001)(81166007)(16526019)(7696005)(36860700001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 17:27:35.4831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e09fe-4eb8-4397-0302-08d9ebf17665
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

