Return-Path: <linux-i2c+bounces-9471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB8A38358
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 13:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A56E73B1C7B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 12:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C704216605;
	Mon, 17 Feb 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="huH2k8JP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8652F5B
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796457; cv=fail; b=d1ysp0jrUbSXPEEy4PqM3ssTaDrP8eO5/3bNn74dicIqYXdD4lONPYX+v9KcGRBIjlF92OjqXFovt3DIAKxfoPRs3JrMf7wWsIjlxRaqmYQg4DWzlgywdD2gmk1QXr25C+E5OLqHOsJMXKf9MOhHyKg8axhOQjxL4tpcnKQrQlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796457; c=relaxed/simple;
	bh=fiN3k8iq9Oo5nYa2+D9O/r5g7zR0qfUCteUeFQKe9XY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AaV3NbpMdNr9qkZtG4zhYDjQ8aACO/rPPBOP8SjvcAsxwYcWOIbCdNFooUJTCHiISLOoigNmdF1ziryy0MAeKYU3CJbJp5r+7QgiPIPJHrsqIv45oMgEOLFQ0BqHe+uOtXnpC5D7106FFhIaj2Z2u86ocAHMDibppOt169GBnDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=huH2k8JP; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXuq79dK+eBtwPBrCB1/jGH0hKZmpYkCbRSfOeA1Dsk54vcxJvqS9d09FH1+1SCY2n55c79xRL4WFWQu4yrphWCTr52FiAPxR4rIw0aiMnMuRbTjnT6wTsbIk21/gFiuyoqAOz1VSd0yU+re5ki5Igkpo7HvnBo8o01L4byzD00FfMvoyCdJRyEMJJfikpuzjYmCSE6yYzAnxD+5RH8jw1HI3tvUVqe97b51shPnhJChXM1ADHBkstz/Fc5W6jHyn44ZXwk+BHvJxkY6iBwj8wcS513/HP5Y/b6p40hDDr88oAy9+5RgACrxDaUMVcwNWz82UOKWDPzQGP7PGB5nIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+Xsp8JWC1SotMpYMaINVK9VCvadIsK7lxTCcqHl9mY=;
 b=ygTfKM1D68PG7EVVR7Vf0oKeipCYRsWYEXwdXYmdU8nhu/giORO60sRLxks77/TW+18ZdrOVGGm+0Va9AhwEXZpjHREpcEZrIBCPfKS83sg0n8jccaVXiD1l84x2FLRZ5H1Nohs6qCKaoLvJMWSgRCbh6wm/1FBESMnaSJzecsbaIuyoczlnCsF9QpFJ2xeGvKLdpMfUBcEtss4nn5lSTpAFjaoRxEzQB90ybIZ0JhvOVWpA68Ul47DbiiAkRQZkzwf9mjn9NFG91Frle3vL/4REomkYsvymjHPPGO6+M2WAJs0o4mDpbCp35q5al2sPGK0nkag7/0tmNB3fUYiV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+Xsp8JWC1SotMpYMaINVK9VCvadIsK7lxTCcqHl9mY=;
 b=huH2k8JPzvWDXyhnI4Q/M8g683f7gxZod+fEnSnisNjoA2GqNqvJyS3AYpHVDxIvC9ZqRtof9JSvukYwtx6fbJn54ezTe/iaRQR8sJXGTP3GB7yjd3OtGoXlhaA3HiEB7rEMGi9H80IgyZpPPiXUzzh6r8awXZcJ9FO9fCN3cmg=
Received: from CH0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:610:b1::21)
 by SA1PR12MB8700.namprd12.prod.outlook.com (2603:10b6:806:388::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 12:47:32 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::4a) by CH0PR13CA0016.outlook.office365.com
 (2603:10b6:610:b1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.9 via Frontend Transport; Mon,
 17 Feb 2025 12:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 12:47:30 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 06:47:27 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 1/2] i2c: amd: Switch to guard(mutex)
Date: Mon, 17 Feb 2025 18:17:08 +0530
Message-ID: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA1PR12MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: c60ecb37-493c-4ca5-6be3-08dd4f513e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mc1cUsowxpMijdIoR+ytsQwBdZvdYFaQKIg7dzRS0qPQaLwGG3n4jAfpxlJ4?=
 =?us-ascii?Q?zSxbjITiyR5qC1U+FaE50UCjnEVLb6P7Xm69PgffgfP7Rpoilg8TG+lKSTmb?=
 =?us-ascii?Q?U/JNYnIQovKDHdKovS40GTaXe2STC8E0IXmE+0NRjOKdBLLA2W8mDs11SHrA?=
 =?us-ascii?Q?UTpLrSfg4IL1o+LmNIvf5afv/tpy6YZhjH5O3zKPex7ociuJw9vzYRMe5HXj?=
 =?us-ascii?Q?IB+g/0PPn0zc/T6nDqFcwpcBw3Kqc3e9UgkbuDzAm5zKnlrPnpC5KWTCqgCJ?=
 =?us-ascii?Q?HpqZ4Y1IMUtLq9O3+wJag93XzLK+ZgUuVGAwqo8cwa+9W/kFy8JU7U4XtyJq?=
 =?us-ascii?Q?gGSXjx5b5wR6gAmE1LgiBljEQjg1X0W+GE6vfSpGd4vS0JaDX3pe9Rh2Bf4I?=
 =?us-ascii?Q?IVBokrk8kBkd2CoTmXh3IsxeTMdsoqxRdRqylF1LZKQW/bJ7OFAoVdvPtYh2?=
 =?us-ascii?Q?s2x3LcYmnBZz9qpTyhTF+X5XGeFIO8KWKOnI021yiCy/ZAThRAON7fYg7gzp?=
 =?us-ascii?Q?PZI5tTU/T/qEYxoE5RcS9Ryti0/AX/c59mXutoi6IYTOAMitD81ITvKIUd9h?=
 =?us-ascii?Q?vFw0xMSRjms4krG39H1PP2vMuS24tPCbv+TtaAETs7buK/PIhOOLtJbNyUb7?=
 =?us-ascii?Q?FkBS7eRE2AN4wFVYzDiWwfdWKKbcFGymSTYXK3rO8Pdsh2lDRRkFxKg6Ac0G?=
 =?us-ascii?Q?gk+NzDQF6jVPtJtfBbWFxMf8whkbgTAfraQPMmdXybZ5cG/azb/k0rYJdnxH?=
 =?us-ascii?Q?mg4MfOTAQOKt1rHlgRCGZi6eBob3UHtHaG1vg4y9PAgoV+QnyYxTAa9tZ6u/?=
 =?us-ascii?Q?ZZclKDqKzjeLoYfkeCIs6kvj4WjTQ3f9mDx/kjirujFJr2hmi5kuLJ8jTojI?=
 =?us-ascii?Q?eD/H3rav3UjqWb2nTqJjBgzshB/4JOy5wBLlbx89EwY/9DxMEJpEXnbxvT72?=
 =?us-ascii?Q?4Fx2ftSvsuhPNUREM9jlLfV122lsLjMTjFumZFXnRWD1ZbmnKHd7erNwZhfY?=
 =?us-ascii?Q?a73yeRZcdaXMFqi9yYtlVcJLknEIZZ1LTD1MOX/dYDSpxmiTWJlQQd3EzVaS?=
 =?us-ascii?Q?gVwSMUYhceUaY87Xv+qz2wSutRBTXFqa26MTsns7pun+xOKz7BRfKMOYcriM?=
 =?us-ascii?Q?ZgKhv69+sO5s/N1YCcjPrC7ulS1WqcVVgNzXofn1BdbD9dJ2DkA38v+ITk1z?=
 =?us-ascii?Q?yAtV9JUB5p+fsmuFuA/ZgLPYxZxSEhw8tqOgc0r9iZeAUwmPVmAPYb73Pa9T?=
 =?us-ascii?Q?qOdQDYldaU37kXG0J7QlrEX00lHApZhVyRQc3SkvvNfsel2RpWZHVK0ToFaF?=
 =?us-ascii?Q?cVsq9jgKPotia+aoANXId3k9+Q9OefOAWhl58CYf9krHeekPyyJVjL8Ppiy8?=
 =?us-ascii?Q?WvEmMgKf6KRjqr8/C8TrQS248LnNT3nmqDCUHtxmH/QVPwGn7B8gQs+W8OI+?=
 =?us-ascii?Q?x7JOgwgq5AspVRDaszxo1VIpMh+nRLNIgJK0QcummmEIufxorIqc/SJypZYd?=
 =?us-ascii?Q?1IcqOJLQ/CD7d+Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:47:30.7200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60ecb37-493c-4ca5-6be3-08dd4f513e0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8700

Instead of using the 'goto label; mutex_unlock()' pattern use
'guard(mutex)' which will release the mutex when it goes out of scope.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 26 ++++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 8fbd2a10c31a..404571ad61a8 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -151,19 +151,16 @@ static void release_bus(void)
 
 static void psp_release_i2c_bus_deferred(struct work_struct *work)
 {
-	mutex_lock(&psp_i2c_access_mutex);
+	guard(mutex)(&psp_i2c_access_mutex);
 
 	/*
 	 * If there is any pending transaction, cannot release the bus here.
 	 * psp_release_i2c_bus() will take care of this later.
 	 */
 	if (psp_i2c_access_count)
-		goto cleanup;
+		return;
 
 	release_bus();
-
-cleanup:
-	mutex_unlock(&psp_i2c_access_mutex);
 }
 static DECLARE_DELAYED_WORK(release_queue, psp_release_i2c_bus_deferred);
 
@@ -171,11 +168,11 @@ static int psp_acquire_i2c_bus(void)
 {
 	int status;
 
-	mutex_lock(&psp_i2c_access_mutex);
+	guard(mutex)(&psp_i2c_access_mutex);
 
 	/* Return early if mailbox malfunctioned */
 	if (psp_i2c_mbox_fail)
-		goto cleanup;
+		return 0;
 
 	psp_i2c_access_count++;
 
@@ -184,11 +181,11 @@ static int psp_acquire_i2c_bus(void)
 	 * reservation period.
 	 */
 	if (psp_i2c_sem_acquired)
-		goto cleanup;
+		return 0;
 
 	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
 	if (status)
-		goto cleanup;
+		return 0;
 
 	psp_i2c_sem_acquired = jiffies;
 
@@ -201,18 +198,16 @@ static int psp_acquire_i2c_bus(void)
 	 * communication with PSP. At any case i2c bus is granted to the caller,
 	 * thus always return success.
 	 */
-cleanup:
-	mutex_unlock(&psp_i2c_access_mutex);
 	return 0;
 }
 
 static void psp_release_i2c_bus(void)
 {
-	mutex_lock(&psp_i2c_access_mutex);
+	guard(mutex)(&psp_i2c_access_mutex);
 
 	/* Return early if mailbox was malfunctioned */
 	if (psp_i2c_mbox_fail)
-		goto cleanup;
+		return;
 
 	/*
 	 * If we are last owner of PSP semaphore, need to release arbitration
@@ -220,7 +215,7 @@ static void psp_release_i2c_bus(void)
 	 */
 	psp_i2c_access_count--;
 	if (psp_i2c_access_count)
-		goto cleanup;
+		return;
 
 	/*
 	 * Send a release command to PSP if the semaphore reservation timeout
@@ -228,9 +223,6 @@ static void psp_release_i2c_bus(void)
 	 */
 	if (!delayed_work_pending(&release_queue))
 		release_bus();
-
-cleanup:
-	mutex_unlock(&psp_i2c_access_mutex);
 }
 
 /*
-- 
2.34.1


