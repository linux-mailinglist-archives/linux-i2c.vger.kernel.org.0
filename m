Return-Path: <linux-i2c+bounces-14092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 87366C60003
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 95BF2360272
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2269A236435;
	Sat, 15 Nov 2025 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2Egjknd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11C226D0C;
	Sat, 15 Nov 2025 04:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180904; cv=fail; b=AZpmdW1mDw/dQ7JwtatMub4SruABE3cjp1LHHRWzTvYLV55E/I2KJQf6Xv8PVSpMBNoHiPdsE8FAwbKNu1x01aTEwewGiwUTAtplBu4mXiqEc6NzP6hkQ/nRj+pQpAqJX+iiW9HdPYEx/3Vixi7b5JJu3HRhEAUwI8j1JMDANFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180904; c=relaxed/simple;
	bh=G38oayv7nGh6tkg6obNcxMcGyiu1OytOcFkyUtCiRyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXmMpjslGVlpL9BJz2EWuqkQ7oljH2oUgahS5air3/0MTdtM9aZKBc/lkJrN65EUfXmxsSbXFofUL/ggjpMnH3qcYcitU0GPTjONkk0ao02zAW0nsnzV1L12lcaANhmwYUdyzdaGVvz+Il6vjJm56XRmyj/PBHvFcVU0AG5qnr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n2Egjknd; arc=fail smtp.client-ip=52.101.48.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V026bAAThuZwL+flUN9B23GubAloeulvGQbFPNx+JGzqzx8BkH6RmYXjOjHxLgDNTpE7L45hdZVRAWHu4MYSPC61HKRXLK6bFdh17hBz0wVVHVKejUEnNUShK2rymyPVqUN0vKHpdgvGPv1Rfmcl0VzQVnPxlhDcOUKvpPDh1gO65I8/7H2U7EbT2vKJMfHyFRnifLRBAc0i3TK0ZDa0NNh+RVMo88xHU42GLZeibhaENqbach6S19s7YuO8eaCXPoGGUT7XABGmRcrwNpOEAeP+RRD6/2bLwpWWbyRntSD09Wx86T2yABT0lOzyi3PaGq0mDVoOco00BR2RCPTVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DA5/MfBmPONsNnsHCukywXwe2LHjhoRiDJHVGEOaEc=;
 b=On/KHeYler6JsVk3qlb3LaUogdfRL9UnBMLLl840Qsh9d810AxlndvlFxBgfWxgHM3JlYgj5JCOPOq/TtakimUklCCxClexcOiVR/xTQLN8NQ14f1DDLopjPBQJugMAqb8NQvgNN0b4p64j8V0TKD6g8MXeAKpiySD8w8piYbM9PtfjbVY3zX/fVJelwu3jStkXuWwVpWOWQ6w3tB81hfmlkuoscjnVZriYxvZXmCA3jATlaTm8hpeTKopFNoOplcS3bDKiBKdGFEgZEHlmuuBIAfnTHloJShRZjjUDJz8MggIv4VxtMgFQIU9IOlvHkkpWWeFvEGrHxL2X/iwpTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DA5/MfBmPONsNnsHCukywXwe2LHjhoRiDJHVGEOaEc=;
 b=n2Egjknd4gp+Cd9Vq6KBXBq1hP/h9Jsw2Y/L7XTfn/wtT1/q0NTN+E6nXTYc1YRP/T/4dRj/FfOuPwnq4eSrnEsYqiqjsL786zIa64ZXf8qzMq9Zsc4p1UCeOSKAnhSgprQR3zTDiQDHo3rFrfBm+z9vNUfU4DlrxpGldQjDjcVNyArMHXM+3yamrcEn3LGByKMKENt5VFZRU6zuh6v7dhVQ4BkX29AYyuI2LMtiM7BvDiNCc07XjLjs3NQlrm/VJLhRsqtnRzsJtPYvRwwl8qZOqXmAhISidw0Rn3pPQcpLCsvOT0YxpCJfRyA8HDQ+zcb6eEO4WozlOmndnIJVTA==
Received: from PH7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::35)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 15 Nov
 2025 04:28:18 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::d4) by PH7P220CA0001.outlook.office365.com
 (2603:10b6:510:326::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 04:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:28:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:28:10 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:28:09 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:28:06 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 5/6] i2c: tegra: Add support for SW mutex register
Date: Sat, 15 Nov 2025 09:56:31 +0530
Message-ID: <20251115042632.69708-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: a9077aec-752a-4d4d-fabd-08de23ff66d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lku5Cw3ExvlSWFHoycZAkgB8RoUvoMbWxDKQcLLJidq9fjJS3jqqHdZClaUF?=
 =?us-ascii?Q?2SgUKRbhMvkgY3rIusUNYjP53Ht5y5ZKXA330Ch/BQKeFEPN1+52mfU0BsBd?=
 =?us-ascii?Q?C4gYWCcAv8snw+AgucuxV7qEGyd05Uw1WDkBaUvttXosXEuIWDFPV20FINdN?=
 =?us-ascii?Q?jZmP9dBDUtRFqAcNKeIXyA0vSxBoCHHfm6397CNCCVrOWVU8k8UtBW9bOtac?=
 =?us-ascii?Q?2k+JsgeUK6zBhOHvmxQKtLudRe3Tvn4j9CsxOCaRz0rWQNLiTGzbsGMhZAnj?=
 =?us-ascii?Q?cfCrbrlDiER5J7TkFgAb7iD307+CX3ofvKMkB/z8wPEuyGiTON+AO4AX9vXj?=
 =?us-ascii?Q?k5sSoIOABFUjUovrSRKhiwI3cBj10Pf/CLOGWfvk/tIobLgwTPaIS208H6b2?=
 =?us-ascii?Q?oGvfgGNs8Ldt8AYU7bf5QdeKEip2bBgfHiOzHu8PuNZujn0qogEjR5AF9TY8?=
 =?us-ascii?Q?/es4IFzSOkzyh9TI7t6z3Pqgly0o9Z5Wk0Rs7ODQukPU82fgeNQSb/o4VE4Z?=
 =?us-ascii?Q?sfmM0VYqqYbpt+rOWTiS6LrpGIbNOkvFJAxitE92Oe/sAvXl9oUjCKp5Y4EG?=
 =?us-ascii?Q?5bko8cqEms9JJHDZeoZMnU47v463YC7LPKQUy5S47REyNs6jHUFM/j4eWiV/?=
 =?us-ascii?Q?51ZWWTEr1rs/Dz/32VZSkgyx9H0HqfsxUC6rZeRRR+KJksXXq9996AZjl4wr?=
 =?us-ascii?Q?JYSidL8f9u4OV6fQvBarcPHgmacVxja/xCC2r0jLKg1ifuPkOfzKM7SO8gt9?=
 =?us-ascii?Q?iNQ3NZ0XFbGfAik/SCAel5LSsrpsJMmAPbO0W+RXYdGBL5ot5uvwVTdlNuL/?=
 =?us-ascii?Q?v5avTjsLtkYenBlRZetUNFxOoDQY7s3Nl0cbCxLQJgQDymO5EIcx12VN7MLU?=
 =?us-ascii?Q?V7XDeH+4NWDJfLQvDPvDQzvxE3VNbfxC7jgGLLXE+RKXOiGX6homoGcqsUwM?=
 =?us-ascii?Q?4DNt5oW8htpMgy7QoAa1WKbEjH+shg2ERSlahMIfpHkD0IPAt9D4VZG9YC4n?=
 =?us-ascii?Q?KVJAyqGuBCpT58rIZsgcKJcAX27THiXzC8OtLbyUguvf+nifPZJoGe0+K1le?=
 =?us-ascii?Q?b5sXppKxHiPU17jPTtGfEv/rqmqtzipiT8mMNNQJRxscaZymeymYPqkr07sc?=
 =?us-ascii?Q?MlwaKExQrLj1A9Vn5HblhHIiakk0CLt7OfwYdtgFYweBnWBPBb24cvZgyMpw?=
 =?us-ascii?Q?PNsGlpA+b0aP9tCA+B4U51vly/rqyHNNb3/W2/BTJMUma7uxHPiE/SGpfSnD?=
 =?us-ascii?Q?s/y3AW1pijy54q7/QdSjt7HPKdaPxLspONk7Oox+FSRhlJSlfNx6v6VwsFa1?=
 =?us-ascii?Q?x2nwLZYiQ9Blp2CYvsJviqMpP2V1epT0nQwcvltRi6SqfHn2TQ0fkkRnlsHg?=
 =?us-ascii?Q?wybGU7gFcwjq1HvH9CLtkSwiRT7/oRVWxZG5sJvknQQ54tXMOO5/JMECKxnx?=
 =?us-ascii?Q?HKtxUJWAN/ibUY+y2lBB/H3ucCOK9nokov8+MfsahomoD/RKB3A6aP/X3R9f?=
 =?us-ascii?Q?mLmgqkV0cDSXmO4//c3OXJ8kNALPud4BoVlSXNyCpyIF4q4kGftvs+UkoVQ+?=
 =?us-ascii?Q?wnjYVUTjrXK64MPf5tk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:28:18.0223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9077aec-752a-4d4d-fabd-08de23ff66d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456

From: Kartik Rajput <kkartik@nvidia.com>

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs. This involves following steps:

 - A firmware/OS writes its unique ID to the mutex REQUEST field.
 - Ownership is established when reading the GRANT field returns the
   same ID.
 - If GRANT shows a different non-zero ID, the firmware/OS retries
   until timeout.
 - After completing access, it releases the mutex by writing 0.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v7 -> v8:
        * Use `bool` instead of `int` for `locked` variable in
          tegra_i2c_mutex_lock() function.
v6 -> v7:
        * Return bool from tegra_i2c_mutex_acquired() and
          tegra_i2c_mutex_trylock() functions.
        * Move `has_mutex` check inside tegra_i2c_mutex_lock/unlock
          functions.
        * Remove redundant empty line added in tegra_i2c_xfer() in v6.
        * Fix pm_runtime_put() not getting called if mutex unlock fails.
        * In tegra_i2c_mutex_lock() simplify the logic to check if the
          mutex is acquired or not by checking the value of `ret`
          variable.
        * Update commit message to describe the functioning of SW mutex
          feature.
v4 -> v6:
        * Guard tegra_i2c_mutex_lock() and tegra_i2c_mutex_unlock() to
          ensure that they are called on platforms which support SW
          mutex.
v3 -> v4:
        * Update timeout logic of tegra_i2c_mutex_lock() to use
          read_poll_timeout APIs for improving timeout logic.
        * Add tegra_i2c_mutex_acquired() to check if mutex is acquired
          or not.
        * Rename I2C_SW_MUTEX_ID as I2C_SW_MUTEX_ID_CCPLEX.
        * Function tegra_i2c_poll_register() was moved unnecessarily, it
          has now been moved to its original location.
        * Use tegra_i2c_mutex_lock/unlock APIs in the tegra_i2c_xfer()
          function. This ensures proper propagation of error in case
          mutex lock fails.
          Please note that as the function tegra_i2c_xfer() is
          already guarded by the bus lock operation there is no need of
          additional lock for the tegra_i2c_mutex_lock/unlock APIs.
v2 -> v3:
        * Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
          use readl and writel APIs instead of i2c_readl and i2c_writel
          which use relaxed APIs.
        * Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
v1 -> v2:
        * Fixed typos.
        * Fix tegra_i2c_mutex_lock() logic.
        * Add a timeout in tegra_i2c_mutex_lock() instead of polling for
          mutex indefinitely.
---
 drivers/i2c/busses/i2c-tegra.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9ebeb6a2eaf5..135883388c1e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -137,6 +137,14 @@
 
 #define I2C_MASTER_RESET_CNTRL			0x0a8
 
+#define I2C_SW_MUTEX				0x0ec
+#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
+#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
+#define I2C_SW_MUTEX_ID_CCPLEX			9
+
+/* SW mutex acquire timeout value in microseconds. */
+#define I2C_SW_MUTEX_TIMEOUT_US			(25 * USEC_PER_MSEC)
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -214,6 +222,7 @@ enum msg_end_type {
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
+ * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -244,6 +253,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
+	bool has_mutex;
 };
 
 /**
@@ -388,6 +398,76 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	return id == I2C_SW_MUTEX_ID_CCPLEX;
+}
+
+static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
+		return false;
+
+	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
+	writel(val, i2c_dev->base + reg);
+
+	return tegra_i2c_mutex_acquired(i2c_dev);
+}
+
+static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
+{
+	bool locked;
+	int ret;
+
+	if (!i2c_dev->hw->has_mutex)
+		return 0;
+
+	if (i2c_dev->atomic_mode)
+		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
+					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
+					       false, i2c_dev);
+	else
+		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
+					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
+
+	if (ret)
+		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
+
+	return ret;
+}
+
+static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	if (!i2c_dev->hw->has_mutex)
+		return 0;
+
+	val = readl(i2c_dev->base + reg);
+
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
+		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
+		return -EPERM;
+	}
+
+	writel(0, i2c_dev->base + reg);
+
+	return 0;
+}
+
 static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
@@ -1443,6 +1523,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+	ret = tegra_i2c_mutex_lock(i2c_dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1472,6 +1556,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	ret = tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1551,6 +1636,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1580,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1609,6 +1696,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1638,6 +1726,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1667,6 +1756,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1696,6 +1786,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1727,6 +1818,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_continue_xfer_support = true,
@@ -1757,6 +1849,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x030303,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.50.1


