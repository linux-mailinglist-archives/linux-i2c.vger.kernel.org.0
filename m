Return-Path: <linux-i2c+bounces-6141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BAE96B981
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73FD1F26019
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40941CEEAB;
	Wed,  4 Sep 2024 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="13LgfLc4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161361D0148
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447501; cv=fail; b=pqV4gAsIoOqoDcEp7xzV7IGPypkhY1Ci9ym0QR06ZHjT94A1UtEFfTuuYZNO5mlhYO0gLPxwXp4GyUBxLvecOW8UDnv6pAFQ4/ChEruMJxHQSIsezW+yTCTDr3o7yySrziftmHh/JHtDuWWcUJ+MqY2l2azVWADlOFZoPQEuOCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447501; c=relaxed/simple;
	bh=Fyfa6vL4DXYCBKrt/fC6r70fa6h6CTN8lNbvHIqaX5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=By51vrXDWB+tEbe0WzecH+bq7BVtZjmyJv2mFA9L2394oSBCXiexk+fmp4LeBFAKjkSQWyEy5+OZLAXeHDTieS5lPWumZNkEdxBcE/TTgpnvKuzRM9toDLqPfRPRfRSPNnb9r7eUf16CGXhFgHRH9rRDeXKdX4Xn8AV8s7E10wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=13LgfLc4; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8QJ8WiU4s2b8ERp7P1hY/bEFNnwYZORiTniLR3oieTeSeYk4vHtKYR8PtDRTNVwgCRD3xJNlTeSINd/bESO8JSISc7cDtXwejDS728yi4J7T0yb/us3e5yWctZ3xAscv5vNFMm2i/PsBvqUwlArk6/OfEHoDp0Ma2knyxr87cbUyal5M8BHPjINv4HlhtndHLNR3C3sDuSh2nXVBLtBH9NHJROU6ogCi4z4BUzSvlT2/Xs5ptOccapoc9AEhE6mOFPm/rjcxcj382x+kfN9xAoVz92jM9ojk2+8Bb+dLLOyHf8Y7tDdUaEgoA4h42kQP95EEQ5WGUiGMlJpqle1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2InwrH3YSgKOs3ETHFyCu4EWhfh+M1IQA/bs1xzQrOw=;
 b=ohEsf8grJKMsBwBG6ilW0LQoogKy4tasxlSfqk1zw1CgkpLnBOGR9B83w+W4AI9o0i+W5NE0Gb/GF5glw66jPCYfFS/bQ5ZqvI5uasi5at3pBcUMjjsJQFZKizr7fqmO34BCVX8hXp+SnZWOK7HjY5EQEpYSslbD6y6yxjmW3EeJw/12OEsM68Zd7k5vFcnLwPMAFGdT/HHEEwyvCLPqI4H4zaikQDI2/fJ6Ly8q31NQJdr8ahdwcAJM1E7eXM1wbMCht3zM2ovAmnNHdwEfzBkUaWIone+26++2DVSuWQ3kSPd/vqnSwS5iZMuvoMa0rlVOZRR7U+afz4wVnUHJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2InwrH3YSgKOs3ETHFyCu4EWhfh+M1IQA/bs1xzQrOw=;
 b=13LgfLc4CJXru0SHwf/M5sFvWOX6cVKo7ufz0gXkbMrEj6uOv8j/Wxiw8c3Nw7faTQM5nVi86szM6JRFYz8CRzfHTWk7v5nCK7VLXArKiNlG2IXK62e75+3Bk7JdLYLhHQMD4THzllnWtDoT8sv/fSsYNGjtsSEVVTAmTa+yiGQ=
Received: from BN9PR03CA0923.namprd03.prod.outlook.com (2603:10b6:408:107::28)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 10:58:16 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::c3) by BN9PR03CA0923.outlook.office365.com
 (2603:10b6:408:107::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/5] i2c: piix4: Adjust the SMBus debug message
Date: Wed, 4 Sep 2024 16:27:30 +0530
Message-ID: <20240904105731.2246235-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
References: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fc5ff6-25c1-45dd-f2d0-08dcccd07a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uf+Rnq+kKd9Tek/VWATe/3Ge/FUCC76UQVU6yPqxaJnb077UnNRG+MC/cV5a?=
 =?us-ascii?Q?qx9GNCWRI5GPpwq9GD78MaKwD/uJNa1gsq6I8yO/V5sPk+k3OgLL/oSbAWas?=
 =?us-ascii?Q?EpPJhRFNnd6hRU2lkVIUgHoIbwTtDqUIMHPPOu56i+W85BmxTOoV9AU9Pnlr?=
 =?us-ascii?Q?gN44qYT4SXYGKZnTn6/MQz8rfsgzn5VWTVqK19WlRowDMlbPdsCuPRiF3Epv?=
 =?us-ascii?Q?z3FKWB7EGeFW40l6mGY4/6IwnqVBTNijM43QUjTlLv5n1JR9PNkZrI+aXcP2?=
 =?us-ascii?Q?hJ0g6YNn09agtR1Uk8+XnNeg5QVDOGXrtFL7U/iortVGCe1A3lgVYerUCAL8?=
 =?us-ascii?Q?Y8O2gk22PBIUZJpa4e3xP7CNxdES6Ow/Mi0QLY+V8MeThfCd/ErzK+kYFyuc?=
 =?us-ascii?Q?CRVdRXqof/Dup+0jND9qZoD+zHyAckItvEtwGdT5Vaf3mjz2osbFaHX16MYr?=
 =?us-ascii?Q?UsTyByVNr48IGodyOdGI3F0BX5aEgbUhlLjQwmu6X1XttnUtAuQm5uG4DBA6?=
 =?us-ascii?Q?elyDLslZlX4Mud8LFMmxyo88H0IwgqvXDAL3y5G1CYy5JwZaj0Z3vT0sFXo1?=
 =?us-ascii?Q?cBJatr6jPmW68sNZg7OPRjI0IIjsILjPW79CGcFsTolBofcQ0LzhtEu4xyHX?=
 =?us-ascii?Q?ZEamzZ3OAsaWkcIsBZ4/4vkvLQ03JE8znyMf5xh0KnPRhWpiW4XhGPWF6f8h?=
 =?us-ascii?Q?5CnWpwXKSVsYIj8nTVVxvfW3iRQBnQ/lnj8sBYoL/0v9JDSOOKtv1PorfqBv?=
 =?us-ascii?Q?C4A4XePt9RNahKUzdaCV5/uuOkS0mfdV+pu6JSw+Ae6Tu0wN++omz0YxJ9Qn?=
 =?us-ascii?Q?hoQUqyUDKKkKsgheT+rR0HmL0oLQwBK29yCvJX0XS4K8bdaMaTpzNnR0Q8NM?=
 =?us-ascii?Q?wKTmEgYR3Y5kUWrhmvYI7VF3pxAzEi+2YnzvqnrV6C7Ngla+FasdA3LZaqec?=
 =?us-ascii?Q?Bd5NEXEw1COLvm/gmw0Xn0yp8Ff7iqk/hW/+RQjRx4T5/6rknEm3MeWpfHcu?=
 =?us-ascii?Q?ztbMNkLY1tjudjWMM/1FiiJ3i7Ph7/e12sTB2tefkwxLHFwOemKPjD+ZbDnT?=
 =?us-ascii?Q?fLAY0is58kbeHmMfOVknEsdzHu+t/XA71CRU6W2t10b/8Fnf6eeCvyHCKbc7?=
 =?us-ascii?Q?SfngfUms6+pM1azQpsNV3DajveCowLcPGnU1+F6nGLzqqhjJy6K0XJ7pjgVb?=
 =?us-ascii?Q?QAFdf4BUc/MJHmkeVq8+leM8phr27/R+TcCk95NA3ed4sXb+jL/8FpNbVktp?=
 =?us-ascii?Q?R4kTxMb6SlLP/Z3BshAHbpbweV8x3TphYDJb//Vp/gfbYzi1Pxva9//Alnpr?=
 =?us-ascii?Q?PGiDrW+QmvVMBb9TVTAtuSccEOu1drlE4aRebjFVUNLSbKjoQdRFx0jz1W5R?=
 =?us-ascii?Q?qN8FLY8mGM4QWdVhfyW24EHethRVFSSmEBWOuaYlcK0mLlpt6Oy0VELMC/rL?=
 =?us-ascii?Q?Yqzw5aUqO0Li3bxTGCPmojkwAdEnSDTq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:15.9889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fc5ff6-25c1-45dd-f2d0-08dcccd07a88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

With the addition of ASF, the current adapter information must now
correctly print the SMBus node details, whether it pertains to PIIX4 or
ASF. Update the driver to reflect this change accordingly.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 3bcf2e8b24e7..789dbe832012 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -1194,6 +1194,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 {
 	struct i2c_adapter *adap;
 	struct i2c_piix4_adapdata *adapdata;
+	const char *node = "PIIX4";
 	int retval;
 
 	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
@@ -1213,6 +1214,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		adap->algo = &piix4_smbus_algorithm_sb800;
 		break;
 	case SMBUS_ASF:
+		node = "ASF";
 		adap->algo = &sb800_asf_smbus_algorithm;
 		break;
 	default:
@@ -1243,7 +1245,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	}
 
 	snprintf(adap->name, sizeof(adap->name),
-		"SMBus PIIX4 adapter%s at %04x", name, smba);
+		"SMBus %s adapter%s at %04x", node, name, smba);
 
 	i2c_set_adapdata(adap, adapdata);
 
-- 
2.25.1


