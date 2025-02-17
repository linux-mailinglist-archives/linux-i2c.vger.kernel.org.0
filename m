Return-Path: <linux-i2c+bounces-9465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDDCA37DDB
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 10:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0213A5562
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D99619FA92;
	Mon, 17 Feb 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="On53OGY7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1921155316
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783003; cv=fail; b=qkOyxY+dbMktGF8vzfCg/+/ukve/IQuzWL3mrFaxpOMxdJnlpW97+j9cRXXKXFgwwEzTZB6Ws1yk+fRs7cr7pFs9aQp2x+VUmsMsC5fbsMn+au3qMvOhsJJ8K3Q5svevFQn+UbZwtxJSEeMqyZkGMtAh/tj0arqa65TvnfmyEDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783003; c=relaxed/simple;
	bh=1Nozh+HPsh0HDRyAHWJtDZtBleBXqIqVSwoExNpxJIM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DOjPaTpnJmEE/TXcr/lRYH05oyMfauqdLdR+rz8cG3DRYg1JnNoc9vX5zkKAjMVx3SkarRAK1XqF9ZjAQ+Urs23eldWeISLsa7j5jQimKTUDiNHjFZ+lwo/oZBw+ftJlMx+jrcSXnwBUl48p1VdFcZ2uS8hfAtnhhlpPW4vb0VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=On53OGY7; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVZGc/CK2OfX7VHGzuQm/fbAG79QFDq8EDscvt7s+YKSexCaJXhq8V9bY7CaRSfZbPiI/M2mzozcj80b5suFTIkQgYFONZpOTkGkFrukeAWjtWR88EcBdrOIIPZXNRHOn/no+Ya250/chTUe/GzXjGgckLb0pBoxmtlZ+buaW2kNRydbJJEc5RT6jDQlyFed5dPLN1JZpPXue8Dz+zFUg0Lisg2HxnZq0M+EtR24QKh8cXCcKWRiBbUyOGms5Hu5jJjJ5WF+1oXI48Cp+NVQHDfaFJO0E9VV33W+GoeXXVeB+Wrjl/aa1/gtYxU7zkT+IWvb8r7rALDHEAoqbAgQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RC1TPw7u7R8UkVYToVSfti5p/ZUhDVfW6cUm5fDwCM=;
 b=egNf9fK/NYB3iFLnnuhsix8SB9Rv4zH7ORhCOB8/OLlY1C55rE/o2rGFKFxNRXFqCfDeQ5u9bR5SZ2LK2LGQZjImGzLpeh7u6FLDcz8air9fwcQIRpsspwO96/hhetzKncLsA+N6fZfS9ATTIS+nmzJ2thVENhzLjBmkuxmasCmq/B7f6pcH3rZ1a8IWrPAv4vM96F09QVjRHJzHn+qkPmEbyU40IBQ0lzW+j+haJ3maOLjUyOyRdISz8y5z9zcSIO3aHstNIUPSoG58jpHQbffSnh8TKnlFW+spq+mH2PF8MyFkgvr9fN9f7Pt1iS9n1e6W0rllud+axhKfd5HMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RC1TPw7u7R8UkVYToVSfti5p/ZUhDVfW6cUm5fDwCM=;
 b=On53OGY7zOikmSYd9ok/qNEJPKqs8ft7BkfBIrc65WaEFYk4pIXV5wgsFSjg9pJNw2AlXezogXm/xvDSETBm5sWUpsoYYFtV3JjBUxI9TRpOZP0irR+KK+BFnl9Ivcl3alP3BI/Ev7bwqESreneYonaDR9CiDuxMU5F6HbylFls=
Received: from BY3PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:39a::33)
 by MW6PR12MB8834.namprd12.prod.outlook.com (2603:10b6:303:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 09:03:18 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::fc) by BY3PR03CA0028.outlook.office365.com
 (2603:10b6:a03:39a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 09:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 09:03:18 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 03:03:15 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/3] i2c: amd-asf: Modify callbacks of i2c_algorithm to align with the latest revision
Date: Mon, 17 Feb 2025 14:32:56 +0530
Message-ID: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MW6PR12MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f55cab-8625-451b-da8b-08dd4f31ebc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7uUlMw8qX8snwcafimRyb5y8q4h+6j04zMKe8fquIiykO9asQLqxao5y3EvB?=
 =?us-ascii?Q?0MSZV2VwHvoRQDhmwL0L711Lai/GQGtUswg7++8GdzBmt6AgHkHpAkTDIqmJ?=
 =?us-ascii?Q?5YT9LstaCxy7P5s9eXYNo7K8u4QBoUbXUOw3JeuInXurkvFq5ZVpJKzqh1yY?=
 =?us-ascii?Q?qxK+snKUA8W6mkKsLrg66opO+P5s0hNZmZGS6K6LeGhr4DSixnsWb45L7Rbm?=
 =?us-ascii?Q?d3RiLg3wYVRG0/z4OMbou94VylZtO8KhY2l5byqeEG/yF8Wi29nR+QmqjqdZ?=
 =?us-ascii?Q?frBvMNzxwXX4ouVBE+LE0Ut8XjG5yifH4hh7GIC7zhScdDUlLcTjR0URTDSp?=
 =?us-ascii?Q?DW+JmJlmuPWPbjpn6SNjXZcP7ssbodQ2M4EOm+L8F8a8V8dIhfd0826ZC1q0?=
 =?us-ascii?Q?iE0lgL+SIJ2dJKimJpNOmc/vtkP1u3cVLqpCXYN56SzlM58zvplJj7XnaS1C?=
 =?us-ascii?Q?8FwOACNyz2n7k57gaysA2RV8aec+z3zA+copzTFLTBu62ye1oSp+8ohmUn53?=
 =?us-ascii?Q?wJmhW+yLoVFxM2M8MJfVzpsDLfIie7MBNaqzaI52gZku6xIyRpgh3zh0/b2C?=
 =?us-ascii?Q?cXp7JIIomZfyB329KDsIsA/8P1azwCjuV+OZCw4mYHpfzUSCSrgkMZsM4DrX?=
 =?us-ascii?Q?C6xI5QNBZWeSvYA4wkmJKf9KFWIXM85ubwBPOVl32cbc5d9K7Ym+Zf0ue0Wb?=
 =?us-ascii?Q?BlkIWe97w78U3EXho3VXmJD6+l4F8IXxizlNrGKdLvIpebKm4xed2ssxe9hQ?=
 =?us-ascii?Q?UthbOOJNGSFNaGnu2SCOqLG+5dgjSTE/HHmDSDn4/njRpEfOC91Rqz5Z0ygN?=
 =?us-ascii?Q?TFE5pz7tDgYTqXkkKZIJ368Tqog5mDgUtmmlbDaIy5CLE+oT+HOrhIxCRWzO?=
 =?us-ascii?Q?KW41e8fvaM+WJHmckdnquQMNoZeZ05UC1qRXmX+RUsiTsJ12Kvl5yPFtnf/T?=
 =?us-ascii?Q?kZtwSB4tECOUVIKA+HczZAWNpJJsHjzq+15g5ob2nF+2MfPAMCuZEPMBr7+d?=
 =?us-ascii?Q?HLqr+T1lyx3IXg7YSO/WXyjzYUagUW7jEw34zUAPMBsm/2C7a1I0Qb1U3517?=
 =?us-ascii?Q?QSFFE+sNUc5Uvm9lYNjYMF/5tYxSBzkoq65fDIT60GeGN/gQ0c9l5HEyRJVD?=
 =?us-ascii?Q?BFJHHAtWm0dF3QIgB1niDzgJP9nFNTnfU6lktzU9aZhQr72hgvIlImtgzg9a?=
 =?us-ascii?Q?h+WRdCy4ku62+M2LYPfB+9NMddq0iPwV0joEF2P8aXZiDYrCGu42x6b7aoRg?=
 =?us-ascii?Q?s3DLht9SjshDAgExZAe3pvjGv1aNQ8dHNULHQRtWrxot9n8/pY3PJj/oatEz?=
 =?us-ascii?Q?nY5wD9UFweuDmAnqdtwRryWdPNER3FA7KlA0FFJhFBeVFW3/OlO0ZbHrjdau?=
 =?us-ascii?Q?xy0ickyJuKRIG23uaul42IMFgVZ5rcuDFLFMlMita8C8Z37oKmGUzJ/ipTDd?=
 =?us-ascii?Q?79Nsy7RQHlkn+bRt4DN++TLOA7ep5XupFgRQxatesfGBT65hpFmLEJDqppqE?=
 =?us-ascii?Q?1X9L+YDWlx3mx5E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 09:03:18.2101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f55cab-8625-451b-da8b-08dd4f31ebc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8834

Adjust the i2c_algorithm callbacks to be consistent with the most recent
revision by updating the callback names from master_xfer, reg_slave, and
unreg_slave to the current naming convention: xfer, reg_target, and
unreg_target.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 7512614bf4b7..f107d80afcc1 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -272,9 +272,9 @@ static u32 amd_asf_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm amd_asf_smbus_algorithm = {
-	.master_xfer = amd_asf_xfer,
-	.reg_slave = amd_asf_reg_target,
-	.unreg_slave = amd_asf_unreg_target,
+	.xfer = amd_asf_xfer,
+	.reg_target = amd_asf_reg_target,
+	.unreg_target = amd_asf_unreg_target,
 	.functionality = amd_asf_func,
 };
 
-- 
2.34.1


