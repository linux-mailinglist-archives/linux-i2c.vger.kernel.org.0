Return-Path: <linux-i2c+bounces-11382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4FAD76A8
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 17:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 805DE3B412F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E60B29B771;
	Thu, 12 Jun 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nZJxjBIx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8D29B205;
	Thu, 12 Jun 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742441; cv=fail; b=kGfeBmz+dIzrAypdBKl0wHJBa/sUjha8RFwK9AtDs1oqw+CCUmNds0fNPeQhODH/4iCl08dwH5EfN+9Ea6CcmyVDcUB/r6BAiRKgkN8HtLehTkQywu1jTvjL0Fy4eiuzpT6t3YS/OAW9DlWm1IwFsTDM8dKDbPuNb2Fivd1U5vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742441; c=relaxed/simple;
	bh=sz4lbuG++nrLLs/iablh3ckhGGeW0mfaTFPh1WxnfGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwgRhl1KyEO1n/GSQYr55/qrpHf2dvZNvd7hSruNwtKk1ngQqEAGQUjD1ot3wXngu8+m00mnQMl+8rcJ7cPKRMhbcX4A2vjrFMQJyxoI87/rcXqUXlm8w1awrqq9fTMo+M49Qtrx4HuQAGR7LPdxzs5CJ5fMHKildZfUdQwbEiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nZJxjBIx; arc=fail smtp.client-ip=40.107.244.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrgBRte2DgyUmXIxM5cXqehdjAWMvkx/E+GYCQxvFdx5wpfuzIxjsg991QjmkvglWrZkSEKooIeUnzqdxbIvTYuXmqw4QPINN9CCqBTBJ3EelqAx0jFZDZzetq/uSEqvbQMN6uNxuOR/mJDMka0XqsrSC6IQKmnfZ4nFlC4oVjesYzJnpMBCaCvnaIi8zNfmtZ4tCpfnlEZolZ+oWo3LukQXPhRck+tEw7yqXU30K5/AFfTLglulv6RqRiMnWszYO55Mc4SbS2wOC++kfr4pW4PhCdT1VxK4ROfKXNgmVw/x3vepiHELdAD+vTONyEW/JlPRh0hkSeGGZu0B2p2v0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s85QRF9MliYDacKlos8bj2+gTne6jeBdzF3RN1+P0DE=;
 b=g5bcV9Gaajg2JQA37vZPR78wfthE7Ag5Rin7F557ejWvYOMzm017IHIwKI4je9zimHX+bafzOPXBMRtALMJ5XZD+fgBpJ/I0mM120hmrPshcFgJO/nXxGrhcDtg2ioJQ5s5le1KrRSgkXAyewJB64M2JPwyofpZr2I3My+A486UMSGu610AJEd8Ge5pHCuRrVDkzYUb2hgsWpAkXh5WLMs2d5wv1ayt+ts9yHOJDVaBivzJZpfVCqgluDnyas2Y44y56CMnpA/DURqdrf1ecr2oQ7O0aHm8ecUsBtl01mBOWGZ597IWYlSuZRH+DFW+G3+mZD5+oB1ilzwdSNBi5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s85QRF9MliYDacKlos8bj2+gTne6jeBdzF3RN1+P0DE=;
 b=nZJxjBIxuZ6il/Yb53w1M35B4wsrYfqYJZBcabrd0lzehmlqoa0hD0D+UsPBGYgQyg6x2CyF88stj8/qxt5vgWYPgolMAymHce4FkfxHPDLZZZkCNneaNmwNLO/iA6oDXY0R6qx7C+SScIIPMdI/bYtFVWhoBbGvI1NsTN51pTLr5B8oXvh92mUnEUYU9fGAaVn1cp+wnh0bm3WIkts7b6/SbyUo3kdA9m6ZMs+oF9pmTXYp3usvC6bcl0pPeq5bwTT1qgKSFUiouD/8P8WdPxLVMwEFkNdtQ5FwSg2MGokErxUQA5yLjRT+z9DXff3rcom2NTkum+/t/5QayoXDwA==
Received: from CH0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:610:119::22)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Thu, 12 Jun
 2025 15:33:57 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::1) by CH0PR03CA0369.outlook.office365.com
 (2603:10b6:610:119::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 15:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 15:33:56 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Jun
 2025 08:33:43 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 12 Jun 2025 08:33:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 12 Jun 2025 08:33:39 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Date: Thu, 12 Jun 2025 21:03:38 +0530
Message-ID: <20250612153338.68829-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aErOOSxt0ovCIeSA@smile.fi.intel.com>
References: <aErOOSxt0ovCIeSA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b352980-2306-4050-61a6-08dda9c68b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CF9l0IN9SrsJRHPA5NsEU8nVagJW6lItemcwvYPtcRiwPSmuQcQD4oinEPXh?=
 =?us-ascii?Q?+F8cc/9iUxWyauPLtJU6TG5TXxxxntHtGOXOX2GYMppwvC+fQhhHBRPphSr+?=
 =?us-ascii?Q?FPg+02EoHcd+E364LzDOKnsff14UqecoZkIKib1qsOKlClUdoBXJxR34GEaa?=
 =?us-ascii?Q?Rdb7m1qblUtPCbGLVq4IRRaWCnbKS1ZVeVxrQvlqRAnddXYW65eMWI5g57EM?=
 =?us-ascii?Q?/025AbgP/zbWi/0PZLFpqcdXW8gAW8eYOTexJnIxRsMfiViw9LNNVghTOC83?=
 =?us-ascii?Q?R6PZp2X/lgbTnTbk2PObCSOyMDiUem+gIjnv4Z9q2/PPBhEoE4MpGjqZm9Em?=
 =?us-ascii?Q?FqG6Y2qIllaa3HjVn+UCJMjXEr2sxIa//dQWe4eh+JNi0YeDjaZ3k8JRHbd3?=
 =?us-ascii?Q?fykCcwVHEboJG+NHmdhIotn/rdVrCwHyFcUiVFKGIAdZF161mIgCTVoByruU?=
 =?us-ascii?Q?1sFUzfi5Ds2c2ieFkrI+tWmX6vZ3jb6W373cPuv+GwviwBNRdHN3A24ESv1w?=
 =?us-ascii?Q?BA+C+a9+giAelsMlWdtlCXmUqiajd7QIkoxeWdCeKBBJbxOwJ1nq6UnSixub?=
 =?us-ascii?Q?TpoDsDv0uZ+WwcQslo2kKm31Fq7smVi03zYz8JFWPbRhGDXgv1LtS73j5G8Y?=
 =?us-ascii?Q?lqmI+EA6QpLX0SghNYE7VJpOrorQ3LlM0ay+57avrGRLff6FPS5es9y31FPP?=
 =?us-ascii?Q?+OQ0fQBMnpTeJ4OtTQDZUjKnMhBxhjOKroXva96e9YBHRQToCa45mbFTlkqF?=
 =?us-ascii?Q?mRyLhN77QHcXAzMDcQ9OAOMNBJD4VPdmKOTeqrUosF4/Snoc/yvvFlawY1ck?=
 =?us-ascii?Q?ZIW2xR7w0ck5L3+5cY1iDRxKYpejtr2Z6VrGycDG80uUBTP0j5jEvweiFAMd?=
 =?us-ascii?Q?1qWx/VApGtWVUAMw5QJZIJsDPVmAddfspaC/SLVLfFG9Bmzn9puC3qkShbSj?=
 =?us-ascii?Q?HLLybp7ZdcGmRLh+4qzdmqqIzKKoSF0up4NTgKQ9yo0/ibDJgdUyiPPH9++g?=
 =?us-ascii?Q?cYLYResDD6U7XFtUcdvjPzKnogO1RI3+Go0YKq1x2ieJ7sF8/n3aWRLL5ku+?=
 =?us-ascii?Q?L5hOV5PzOKpi0HO7v84cDhHbQicEF0EGqng84tdU0sgLtuKe/ZU/JgcYjI+t?=
 =?us-ascii?Q?FSEPHBmDEBU8Ev/t4xlrQEvMk+lsvgCaDic4PJg9R8rukkXBsc/jacUHLGoR?=
 =?us-ascii?Q?W7PPMGOA1orIENtwiOLjiti5UpRqTQi6dOb8vrWp8QlOjA2JNKWe9f+ZZfe4?=
 =?us-ascii?Q?xjer+9zCnR9z03/BvcxRQURV6tfSztHKnPS6P5qqkya5T3ee0X38XFxRtjYZ?=
 =?us-ascii?Q?Wecpj33MM/dxx/QOApsdZBOMaHdWQAq7hIlo/zaNYNnhlANHyp4gNI+uFnPV?=
 =?us-ascii?Q?Jek9vQWw0Aap6bm/ATaA+ntNd7Y5t0JT1tGIsqouMml1fnzmSgACpt4I4Dcm?=
 =?us-ascii?Q?doMQ/6Td20mnM+Fu5X/Iq+uz1dttEHeSWifxH8k9sR473e9S4GgT2xcQJfAe?=
 =?us-ascii?Q?nqfNU5LdxSlkjDcoC3d6jf4WhkiAnm3iMMTU?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:33:56.4804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b352980-2306-4050-61a6-08dda9c68b8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117

On Thu, 12 Jun 2025 15:55:21 +0300, Andy Shevchenko wrote:

>
>> >  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>> >  {
>> >     u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
>> > @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>> >      */
>> >     if (handle)
>> >             err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>> > -   else
>> > +   else if (i2c_dev->rst)
>> >             err = reset_control_reset(i2c_dev->rst);
>> > +   else
>> > +           err = tegra_i2c_master_reset(i2c_dev);
>>
>> Can you please take a look here? Should the reset happen in ACPI?
>
> This is a good question. Without seeing all the implementations of _RST method
> for the platforms based on this SoC it's hard to say. Ideally the _RST (which
> is called above) must handle it properly, but firmwares have bugs...
>
> TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
> the workaround (quirk) needs to be added here later on.

As in Thierry's comment, I was in thought of updating the code as below.
Does it make sense or would it be better keep what it is there now?

if (handle && acpi_has_method(handle, "_RST"))
	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
else if (i2c_dev->rst)
	err = reset_control_reset(i2c_dev->rst);
else
	err = tegra_i2c_master_reset(i2c_dev);

Regards,
Akhil

