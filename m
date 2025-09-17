Return-Path: <linux-i2c+bounces-13014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A4B7DDB7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BCCA4E33B4
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A0A3101CE;
	Wed, 17 Sep 2025 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QwpYXKWc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2430F949;
	Wed, 17 Sep 2025 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099449; cv=fail; b=JMlJwRiq6U/9b0jmZPdgjLBMy4RLppqTE0nLwQSLHhmFXtQfdBqk+ZIU+cK6zMeQaOzeKlqnXdcH8iPq6fLo/aYC/O2HnmRwQp7wKMSHFmot4WuogECgwIxZWLyTP4MJXkHtLpZaayvoG3tjj8ELWWD95zRWi+Huib/1iM+XkCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099449; c=relaxed/simple;
	bh=rwAdHBgobGbivRbWgIntS6cdjNMNU0eJymNGcVkMGdo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lr6hMOjG/UvRZUKVx9eer3q5xKXZvU+PD8OLxgF2Ku4Okn3YPT+I3V+dmSWHBMU2CUp6HDtX1xyRFA3W8p+KX0OXaw9A9NEwb1g7tX6YwhTMjybMwBDdWsAnRzHspN1hbRQyLmadNPvPGCC3Omjy6h2LgI1f52B/UrBuMU+7C5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QwpYXKWc; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwKIDZnOz8m9ZX8mD0h/qygAxgBydF9Gbg+zsdtALSKmwKbRZzTDRFvZE6o9sEzfjIwdrNtiz+aKTrjQ/rz8U/hXBWxWRqR4AjREkIPLeHvo0CAwzBtr8Fl0zCTDf7aFRpjApCdBq8eHoBDtwPgiNK/HGvl+EM6KdEjy/s0x+Y9hfCY2iITiQbeAgUvj/sPi3rTxDDXlOju88dA7GPP20QxAVW7rJOrKLEP42h8CHW8G9u2IP/6sgMLk6iJpUCgPaeUe0nHJIsb7Chg4M55z7B+AI3lpuiL+UGVygCjiafFLklfTwr0CqubIqkSUyCo2mlWk5K/kBoSqmmZlPTS1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Prmh1JvKWsHTOj9kwhRy+OX28FFes7iIjFl3PFo9WWM=;
 b=upAH/rPI0rwwTJzecUFeAwwqNqwpB/KYMuc7MsLhNB9GCkewD1X242TSF+LWpFWz2lzPjUMy/q2rU7AUmGqYOS3bPqBro3sqVDLeVFchJqNPrYKyGTmmLKHTImhg3UhwuUIwcDETBBM+kk4/RxnCQbuLI6T0mZbUe0dVL70IyYndRuqSojA68f8hsDpMkId9UEN0a9EnXOSSgKryHlQ1ON1IlALfwUZtW9ax6pBR0j5tmQrpLswzNT04aC+8j4nbHZJdHiYFZilc21sxNMGZTlfZqs7Tf7vUdH9qnjPsRgn1gICfZe0b1PAcwVyBtiolBP3pQeOhN5BLz+0HM/zQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Prmh1JvKWsHTOj9kwhRy+OX28FFes7iIjFl3PFo9WWM=;
 b=QwpYXKWcwFjN0uBxzk4DrIGRM5zRMyYGHHYOa+w8hqpwQhpv++KBLxJxz57PQ8Q3K5HpfdyOXgQd2gHhBDQn6fG9uuDRZcIsHPseN3WMvFhzFwDS7CGnv3uqJUjSsghniqu6rA+sWJWLM/j6jGaROGLe5H45gLcpk36UNeIbYbgGGDi9U6xuPpL/ujcAX3O4OEDvsnmcf66zUpQS+v6K6dEBTDSIDNTTeXdIFQ9V5L6xODHqsYhUcR2n807LPXQQ75ES31EU5BNH2aKuZEqTUNYwp1Sh/E06vlcfS1P2MuQ0uVVV6gXNjfTluweDe191D+nv44iuDNMZHpkih1YXWw==
Received: from CH2PR05CA0064.namprd05.prod.outlook.com (2603:10b6:610:38::41)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 08:57:23 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::85) by CH2PR05CA0064.outlook.office365.com
 (2603:10b6:610:38::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:57:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:57:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 01:57:10 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:57:06 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v8 3/4] i2c: tegra: Add support for SW mutex register
Date: Wed, 17 Sep 2025 14:26:49 +0530
Message-ID: <20250917085650.594279-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917085650.594279-1-kkartik@nvidia.com>
References: <20250917085650.594279-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a49553-2651-47e8-a7c7-08ddf5c837ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aw9v/DusVfJ2rdHPir3gtFgJJVsNpE8qzQQM5uwTrCXmRtCrSeuAR0G6n/g+?=
 =?us-ascii?Q?VpAqsyjwtnNqhu5FtFeUVJFP27ebns/+lQK4CnzMjWJ1dQQllHDOd0BFB/HO?=
 =?us-ascii?Q?vmXMOcigfC4RvPzqANXtbsQClCunrt0MgmRfbWGz1Tsd0rwEBhGBBw10G+Ei?=
 =?us-ascii?Q?FraWkJX+M0i/3SiufdrdgzQsfvcc2ccgSwXoToUSfc4l6HkSBwcpFPYb2BL4?=
 =?us-ascii?Q?7bsnxCb0ctaDbG/nCF/IfrB1kIknGBiKpcbJM8CMwadmE7o67US8c+95QW4g?=
 =?us-ascii?Q?8+McybIwLgAzLJIfPyXUgoyXIsGRCPZf2DqEwif5q0vkLNeJ3Gco1sRJomPB?=
 =?us-ascii?Q?nik9vMi2RxsShbCwRCT9JDITlynIQKrmwkyscpsWcg14AlFGf0EciHovF3vS?=
 =?us-ascii?Q?tFBk6yfVbd2+6Cm3xCxUbR6CeYnp9Eh8Tl8Md4MYr2C46ZBr102J9XhQ1uhO?=
 =?us-ascii?Q?W85Zkgy6hGjgTwKLi4YW0/6i43ROqYycIP+zt84T8SBobCh6q2lWxDJir0w0?=
 =?us-ascii?Q?p+W1j7SFAbLRl9MXPMdETydrmobGuFUl50kILUQbSBQIy6pQi3l2vzGvZACv?=
 =?us-ascii?Q?zz+49ESD+hxfg2mgMpS7qxZQJs0ofmJJhNRnd/xdSNfBRKhm/GJfnvdAkWkH?=
 =?us-ascii?Q?XOorKtlu8nQQcSnC4B7jQbacUxTU+HKj5qvCNArUUEYvxF60HqoI7iikDMbF?=
 =?us-ascii?Q?RmTSAMb6DbSQOfaWD/ePdnVWjMby7DZK3pHrJu8h+HQkkGRyiWcFb2jd0X4h?=
 =?us-ascii?Q?/pIe5htWRIyr1mufMDEzfXAx2GiAIwYdMm5uYaRenMsm86GkeeB5QHJXOdg4?=
 =?us-ascii?Q?PQXCr37UjqkPRhNlt4YnrApPwbD/hgFwvcGxLGTmw1qGE3q94VTa5akkkbMP?=
 =?us-ascii?Q?J8j9w6VT8KTpGC0mfou4XoCxEbOyEfN269QGn6TWX/jooSeanz3lgZlwS4/A?=
 =?us-ascii?Q?FqJHSUO5sNgD/MewsDRX4k7XHr2Nd+LGPF0RWOZ82wFIzWfZq4cXFWMF3KYg?=
 =?us-ascii?Q?d2L3sRMnFs1lFqUvLTSAPyZijwmeGY0mj0sq/lfIGA0yWsxgOuvg7gPKSffb?=
 =?us-ascii?Q?zu4iVzQx2tGUDQPZN7kpg69OycfHe17p+p8xYHiXZnp6WODVeyvbWfRIXjAX?=
 =?us-ascii?Q?UyRioFHVJorIzQKM7hCmm66hoeyqGfKXunTkYGJf4YLvIkJqABEC7Qepccsi?=
 =?us-ascii?Q?g1oKhGFVwsnJk9jSIP1gPg7heRaMBsx2OTbih8+4syd/4k+PK19dXzKIPxls?=
 =?us-ascii?Q?+Akc2pFK04g0BZCUz4OMh0sInSth+r12mF+8JpsXbpc4idhbvMPdffKShuC6?=
 =?us-ascii?Q?88Q7xGkt7LOhdx3/49jnCPGwx0u2Z44gXTTchCTXsTZt+4r2R7a6L4vQXGIK?=
 =?us-ascii?Q?kTF0mw5917RZaiEd6EYyLebg20guMp53TVJEfdMGYfVJKR9p9C5fc6zd7gen?=
 =?us-ascii?Q?2oxRK84SEoeRnJg+4TZUnloZk+xBKbfyGxmQbHNZXDxIOLTRl4qPDWHEG+Qt?=
 =?us-ascii?Q?E8q2N4vx+R0gwfjclRkiTGk0jsAZpf3XeuwQKRvb70xT67/tFHFPrc/AEw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:57:23.3579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a49553-2651-47e8-a7c7-08ddf5c837ce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991

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
 drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f816de8b3af..a2119b8bcc1d 100644
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
 
@@ -210,6 +218,7 @@ enum msg_end_type {
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
+ * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -237,6 +246,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
+	bool has_mutex;
 };
 
 /**
@@ -381,6 +391,76 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
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
@@ -1422,6 +1502,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+	ret = tegra_i2c_mutex_lock(i2c_dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1451,6 +1535,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	ret = tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1527,6 +1612,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1553,6 +1639,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1579,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1605,6 +1693,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1631,6 +1720,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1657,6 +1747,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1685,6 +1776,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.43.0


