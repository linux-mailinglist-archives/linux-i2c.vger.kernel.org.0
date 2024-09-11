Return-Path: <linux-i2c+bounces-6556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 050D597513D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8663F1F283EE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8107618732A;
	Wed, 11 Sep 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ti7veNRm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA618754E
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055705; cv=fail; b=rqaxXWoHFMxW/OrieNwGKEm84XRqFM+adYjcqB8LJ+5PmLe/iWr3pNJp3z+CZaMZsxOU83DGwZeLrGOMBdiOzMq5DrFWoFuUjeEjlWyrhdm2htjODf/4r8XqeCxZ0/36GniEkR8UKls63xeDip4cCEkoqZpBr2GYF9DmpmgY7UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055705; c=relaxed/simple;
	bh=0jASz4pDDI+7tLG85wbL6aIEUOlrpaUqP8MHVRtVURo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dc7HUQZnvCDIeSzR0SF9NfoOywH+ilbaAQvVqtPGepaxA7SEsppk+KTD5og5Xenj1OBvivNFQ3cOE3AyNTMaxP145YTYuDqhrUWpP48OjfSeMWxlzWsn3sf15VwH6YUJIYydmRWnmF/eYJVFJ0q47btYXFLpJ4WVx0QQOwVm4FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ti7veNRm; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4Nrx8/hdIsc4xrF67CRhmQn9EfyqovBsG+vsSolKgSHDAsO2MIdwdzh4Dx0zLTwLwAnSb73SRLM2FRqYfLKL7sg0YH8hN0qG5aAeZAUSJVkDpNoNQjmkdXXT6ltRD9n347RA3xjAWyvl1wx/sM95OPSJuYp/wWwmF3e1dUj2hB9/VKIw10Z6oZd8xlMHklIQxEawDsjonhhbZ0F8kFQhMQWMpQqyJiZJha2SmgX/Rbm0nx0sASx+6Mmbhsgy7PzsKNZKNdSGlEyC1TqXFr2gqI2qhoihtEPHOrFFkcDW+mOrVi/ZxPBlNfd29e3VjIpySYPj8aq2YovKSecGOquMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70uaL74fdj4TD6eP1KHBoDkBUeLL0nXwecX6kkmx1ac=;
 b=Ve5ooVwOwL6HVPN5CBbI3aTaBqAY0JJ1zUfzmXzwSHsylqm36Rgn4ho5qm4d16iPWaS94GCUknD9fg3uLsCQghZvxd1a/vBKKX9nC4nOprjGV9HEgGB/HIIJIIG5B2kZ9izq3GjFdfIQ1cwHiONKTMIXlEioJKMb9XJoL0f9h9EF6xaKmny0SyrH5EZN9soJiRlKn0yC6L9dpBZZJuMWmJsw9XplN+DQaCkQwb7AjdzwQShGajGkvOcJ8AyCQYnDudRnQ4KJs+nGC9TWYAZ8Z7qCH8WvrhcN3c1TQ5Mo83Y1JrEEl8S01biKXG82D3fUY+XoO9j1ScvFYxw0PndEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70uaL74fdj4TD6eP1KHBoDkBUeLL0nXwecX6kkmx1ac=;
 b=ti7veNRmGAmb5jgVDJLxI5dCp9HnN+UD8gqP4bYEOyj8hzjw3JljYfGiZpPDdxQV//LRA91w4ex9NIym1KXwFNUWM3Y/X9qB1O+eBu51qp87qBIN6BStJf5UmIBbVtyH+NJejHtD039IJ3sbK0wGx7s0wY8H0klHdlCd+fbt3QA=
Received: from BYAPR07CA0074.namprd07.prod.outlook.com (2603:10b6:a03:12b::15)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 11 Sep
 2024 11:55:00 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::2a) by BYAPR07CA0074.outlook.office365.com
 (2603:10b6:a03:12b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 8/8] MAINTAINERS: Add AMD ASF driver entry
Date: Wed, 11 Sep 2024 17:24:07 +0530
Message-ID: <20240911115407.1090046-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: d628d4d6-76c8-4825-996b-08dcd2588fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WOflRVixQL+4Tf96k2q9zzgC9UH5ZrUIBo0j5C/B0xBXD+n1EInkDg58RTo+?=
 =?us-ascii?Q?uuYmT/4a567OCYVcy4T/4C9/NpOdSq+Ici+izcoafXNHnQT5Ur9tQJpdAcV0?=
 =?us-ascii?Q?RIkyl5hh0AcNgyaOqJKSagWuIQ1bvOwZqqjc0XSDzWfE/VskV5OTSV9niq3X?=
 =?us-ascii?Q?tKSbhqiEANMy4H3SazbrW/pzwOU6JOnm8+YQXvqPCIkkgIEwNUZ3vuOfkiAl?=
 =?us-ascii?Q?GJMHf15DOqwezVFnWfFHhvgekMkGBFnVZuYEaLcIflQ1nEeK66C1qVq2wNyg?=
 =?us-ascii?Q?ROfvEfHe49iXPu97o06TZ0WbrUC+Si3hkDGloRCVhto+YgPUWf20cqoTADtj?=
 =?us-ascii?Q?jm9kXBWIfnJN/ksUWO4kzT7ZgeJTKvbOBdTkhy+YZCr1rtdsobXMHt6qxjnj?=
 =?us-ascii?Q?X1kjZTAq3N82JlFzrsj41d/GQxUBJ2kwz1mGQmft6C/lhnfSNcOFWaiG6K5a?=
 =?us-ascii?Q?bR1KJj9G8Cuvrf1gcJWGM5V+o3MbgwW+jLfoUorf+JumKvdcaEj9Mk4k5l3o?=
 =?us-ascii?Q?MMZG1QayEshX9GPmoa3xYhOSJyau6QdvJ6YAjsvzS15fuemf4G2idJJ5HZuB?=
 =?us-ascii?Q?/72enApQZKGTv5j2ZLUb5gNC55cIJe8zxeut9Gi3m6DqRdF4v2ZwDv5iUdQh?=
 =?us-ascii?Q?Hz86m+BHN7hhT0oGreL9IsC42PPEqwOnmlEKC0llP6nJWAqhAXp5LlPPW87Q?=
 =?us-ascii?Q?p4PAQIHFnFQE+xmUFy+zaxaaXUI7xGQM3Sck9RRLVtt3JOlvGesyWX18igWd?=
 =?us-ascii?Q?HTSPx7q/qR11T7zIXoX3RwN87zvJQl/nDfV3bApcCO7L0bmHwEcF18ulpd/k?=
 =?us-ascii?Q?EaPOc7hn/XfPx4M6eaTz6G/ZIYqID1oqF6QfwBntVNKUz7PdiJ6i+b33hAWq?=
 =?us-ascii?Q?s4uoi24+aqpwZ4anwHNirJpsbpvgQ2b/6nIEz4Y/CleOZmn1JnmHLxt2+v99?=
 =?us-ascii?Q?5RJTaG1MaTcBxo+jW56RQILPkNYbXBWUiI7uTqN8WsY9/khLvMrWrsJie5J7?=
 =?us-ascii?Q?rIFak8TE4POz50cHS8fiZ2d429l8kMrBtf3FPZWP/IQGcpfdUCLw2PEMrpQh?=
 =?us-ascii?Q?CsIxHXK8NacOqaA5i7Z1sZjs7Bcxa2mEAHiHTM16oNvxiSSHyH4yHXQ14XJr?=
 =?us-ascii?Q?wtMSaj6zo1LHTRoz1/wQyJTd5SvLkCxlP2d8zcAsX6hjk0ibfJ97/nl+fJOo?=
 =?us-ascii?Q?koaI1e57XHpfWjaWvDN/3qkyfP3lz4cPlgU6EZpyLaZGEotoXYEjTpE7Zsu+?=
 =?us-ascii?Q?EdBgc6Wolbj5Q6e6hJd8sy7NqfLprGbONeSiF8Wo+I6csw+W6ogBqXpwC4Qt?=
 =?us-ascii?Q?/uH8EwO6u+aqF4xPpL5+lYArBSzxpanz2HIFq4Y6jfFfGMCp0389DM8rsFEn?=
 =?us-ascii?Q?CZh7HE3QXjDrQixNuUg/2YVu5g7A3pssGko+qqGOr5uIBpDAWXMu7M9Rhuny?=
 =?us-ascii?Q?Ml9BDvnATNauYeFEfW7FTMqIQ8GYY4uM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:58.9685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d628d4d6-76c8-4825-996b-08dcd2588fce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104

Update the MAINTAINERS file with AMD ASF driver details.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f348b71b9c9..18b8975dd058 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1082,6 +1082,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-amd-mp2*
 
+AMD ASF I2C DRIVER
+M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-amd-asf-plat.c
+
 AMD PDS CORE DRIVER
 M:	Shannon Nelson <shannon.nelson@amd.com>
 M:	Brett Creeley <brett.creeley@amd.com>
-- 
2.25.1


