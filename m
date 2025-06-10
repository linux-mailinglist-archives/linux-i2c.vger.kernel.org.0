Return-Path: <linux-i2c+bounces-11329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A314DAD32C0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 11:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2779016160B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1945A28B418;
	Tue, 10 Jun 2025 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dl0J1fLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDDE288C34;
	Tue, 10 Jun 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549142; cv=fail; b=V1v3aRm61oDN8TsbrSDU3YAYHJf1LaV5hd86lNpQlLlsJRuY/yJmlJuGPy5yu1lyMlxDQ5W/abeLTPU0tzZe5fj3OdJOITL+RWoZEe96C9Zdag2VfD5Htas32GlHChGqcTP3myvqvs/A8kX5NpUfSK0XPg3zQc2wZ2mVU8YjGEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549142; c=relaxed/simple;
	bh=F/izLIFxGTY828OgjwKl4X9qWxbz11O0L+ubDiejuMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJuPHxC2n5DewgloLi/782St/19UEUOusbwHiWUetbPp/SLy9DWtgcUxIYzcBIxxPo8bvZqkMYpILxXhEOIa3cklFJy/jmYdypCCpl2ePThjcY4YUVuyzIffBCXbUbMLUNh5T00E5dE0C3VsXJEPn2K0F8jvdhTHCYwGtpIfBgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dl0J1fLv; arc=fail smtp.client-ip=40.107.94.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCuI7KChB5xfJx9sogZIiyYLlqjUybIEm//NU2ILI2dgF2xm77xCesMzL58/qLA8U2nHPzNLBWK5p1vIez+UBKGpI/doE2UCy4zhFOQQ6IHIZmjfbL0HIsWyeoipcWsI+2Z9tkfF3GrzmuwZ0UxTbhW+tAIQiEWxfHC/aopMFnmz9Q1vECQinjxCVs8Z4QSP5Ybar+SZDfCHYVMGnnHQAL+Syat2p8YBWBL+twfFo1AU1l7wOp78H9aQm2bO4MC96L/Ge1r7vSCgjF5xSgTft+oixcHvMzHTMdTwlhQt9Y3eskoMPd6AOQG8AVFORX6ztyJ4LK3t8/gttp5eT++S9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtbfbtyMJN0zIkRVU9DSKM/lvIzkJ1XYVY3FgWLd+m4=;
 b=EpihUb8HBGVQmvr1HEIMpPbZcFFN0hsHSSChZR+HRzDYuomBridPDJCQrt70IoW/WA2kYNmJv7sLtks9r9KYp1r5ea9Q0JEM9XVkMbQEZl/lXfKs7CSNKTdefrYZjFWAZpdtAuD6F8MmfVOjeR52j7fjP3Y2DppCuiDgCox/JovHRAr3JE9FlULi5zdPv6iYIaa9hZxP8mMAbnFJR4uFCc4vfTBmxTCq7iLRwsCDUcTIGr8IskwnP4qaVtWVznzlLf2JeqfKRKm8JijNYGzy5gY9IjTgKx3n6FIiqPETAQaRzLPIgi1H2qvPciPWbIe5/mWBc3h1z3sINSTO6mlM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtbfbtyMJN0zIkRVU9DSKM/lvIzkJ1XYVY3FgWLd+m4=;
 b=Dl0J1fLvYxQgIH3ungdQGJCs1ZlOQbJ76WZ/Aqwgs4iLCvvzGPQGeGjdFh9y4FiltHsPF5G1JWoeOpfYBcUZzIoaRPCI+rT10J1OXIA5bDEhM0WfAgOBXAqz5oBJ17ysGiHJJuLI3rX/ZSzkY+va2pTahnLy1ug6w0TZkBrFJO8YJCnbEW4EpHlC7oI217ErYwBuU+2HYWJjnNB4VNJM7E/rv9Cp8W50wy1Ni8rUA9RzFI93IngsGb7rb/13JkAKs/6P1kZaGBArLhge+cbqIOY3qNhMXfUfAGygONYSvSHxQJ7ZOrFuoYFmjNlbF4MO3URnTwNQhZMLMS5tkOYOFw==
Received: from MW4PR02CA0020.namprd02.prod.outlook.com (2603:10b6:303:16d::26)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 09:52:14 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:16d:cafe::75) by MW4PR02CA0020.outlook.office365.com
 (2603:10b6:303:16d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Tue,
 10 Jun 2025 09:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 09:52:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Jun
 2025 02:52:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 10 Jun 2025 02:52:02 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 10 Jun 2025 02:51:58 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Date: Tue, 10 Jun 2025 15:21:57 +0530
Message-ID: <20250610095157.12138-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cs7polavxoyphttd4uuzb63eguayc5zrd6l6tvyq5nbizpkq2r@g6qvgewu2d2d>
References: <cs7polavxoyphttd4uuzb63eguayc5zrd6l6tvyq5nbizpkq2r@g6qvgewu2d2d>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bcba37-1e0b-42ba-8115-08dda8047a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QACgVfVlkWxJEHehy4EUFNzajC27PQP+gmiumETLRGYnkA2emhyp9z+UL49n?=
 =?us-ascii?Q?cQeKeI5dMw0AMObrl3aQU3XlbQxC0oEE3tR2kBdTX7NIk/rcTiB1cjco3eQD?=
 =?us-ascii?Q?ufpjOycQKGqzy9KoOYP2zJoEjcRvFJtZjeZuX97Q9Z/PamcnFoRG0jjrSniU?=
 =?us-ascii?Q?RsuKzmH21d1SA+iBchtY2EEEbMikL3fQP+bkRulE+sVs2r0FjgeVrM7dP+pT?=
 =?us-ascii?Q?qBtks/Le6p3BwR/eaj+cx0id4iNd+DEaAEQV+uCIOFNpLw3inPGZOrBn0Z6X?=
 =?us-ascii?Q?/Zlg4BslAjKKhzp1TBrcQ2eTTo5a1wpv8n49xpsOR9jjfAbmLNRYTfOpUwRi?=
 =?us-ascii?Q?36jfiQUoonlMCbpVHAIxC1vRjxvJoFT1fW+Ry395LhPHzf600nIA9GPSLvIT?=
 =?us-ascii?Q?pSCXi+rKYfxBfIBMR1TXxZx+hK8RkLaHP8SH1TEwYwARQfqFJufeU6YlxoRU?=
 =?us-ascii?Q?NclwLcyMx3FpjqrsazDXp8yo6nZ7fQXd6aNZa2qTfiDbvXeWGBXaWxx+vbki?=
 =?us-ascii?Q?WxY/mrdA192bEsiF80QxDW4vZR2qLxxIdikUWEQpIziVOfAbEuay4QtxN/Rc?=
 =?us-ascii?Q?SmTRngDYXb99GurDoaLoYeFcU/8Db8sZQa6fQWez3Xl3QsF4vqeGCSgS8nq2?=
 =?us-ascii?Q?ucpc3zETAgz4LhJW1rgjQADf4PM4zokLtHtYY2UQopCWpxVMaFvRE6Ybi1iT?=
 =?us-ascii?Q?9J82SojtOgwcqkgagrtPmGgvnG4ZBwmLExdrw8MIaPlmaC7M3A/P6w6zuk2T?=
 =?us-ascii?Q?ByFjn8J7j9dzR+EOeH1E5alCLmDAz3+JVAsjpjXq2hqR3rrriyK5f0eEEk6x?=
 =?us-ascii?Q?uo8nKv4UUEWCwcKWl4XkN/NECanQWI/YQnkmQV9mRgVFAOw3EqiCmdLyzx50?=
 =?us-ascii?Q?Gqo11i2C1hgiv3eOwwh5w2GReBMlrQ3k04Wy93MSzFk7NmcvSwHozuX/XrOb?=
 =?us-ascii?Q?KwWSBwrsTNaZX53spFh5zUJ/9DXgVuljWkkFaQgsKzwy/dVddB/b5gRl7iSz?=
 =?us-ascii?Q?z/W1Qe+p5roLJA9INJ/19V29xNxcnc3I8h5F11g9EewW3ptv2gWykgJmnZU3?=
 =?us-ascii?Q?w1ZxiFT0/+Oso6cdFp9nLuxYuXStYNRb7KfqWjrv4LerdaizsIP3Llr2m7f4?=
 =?us-ascii?Q?Di+mdfponydH0ua0AESNvLy/ylm8lEIt7Qvndli9Pn4ryqb8kjLYizSBMZug?=
 =?us-ascii?Q?j1JurhIwdGSnJgTPXny5fJcSNJ3506qUbhxLjvEJPS18BXrDnLWVntWXoYZS?=
 =?us-ascii?Q?bbf4f8y+gsuyl1/pyKKuBsjmeRq0Nno0zmkOR9REZj64y8DDGGWo7Ss7BywG?=
 =?us-ascii?Q?D/nUsg8KS+biWrDem3APPpgeu2m9IefQljquuLxshf5gGix8lTv1u/RI2qkf?=
 =?us-ascii?Q?nwy2+kFB3MtejX3Gjy8jzzkm+rpyTFjiA6WK0845DyRUt15utqCKdKxR+Y66?=
 =?us-ascii?Q?swaWjUgMSbwKF49hqtBDXV/YIR/GP6YNumRiRNKGcFEdiaDb1IWa/Zb2rzoR?=
 =?us-ascii?Q?rcQTTkslE1/bZqQt9u5Qen8p3FhsmBdNHnGQ?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:52:14.0002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bcba37-1e0b-42ba-8115-08dda8047a37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

On Tue, 10 Jun 2025 10:32:56 +0200, Thierry Reding wrote:
>> For controllers that has an internal software reset, make the reset
>> property optional. This is useful in systems that choose to restrict
>> reset control from Linux.
>> 
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>> v3->v4: No change
>> v2->v3: No change
>> v1->v2:
>>   * Call devm_reset_control_get_optional_exclusive() unconditionally.
>>   * Add more delay based on HW recommendation.
>> 
>>  drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++--
>>  1 file changed, 31 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 87976e99e6d0..22ddbae9d847 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -134,6 +134,8 @@
>>  #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
>>  #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
>>  
>> +#define I2C_MASTER_RESET_CNTRL			0x0a8
>> +
>>  /* configuration load timeout in microseconds */
>>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
>>  
>> @@ -184,6 +186,9 @@ enum msg_end_type {
>>   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
>>   *		provides additional features and allows for longer messages to
>>   *		be transferred in one go.
>> + * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
>> + *		provides an alternative to controller reset when configured as
>> + *		I2C master
>>   * @quirks: I2C adapter quirks for limiting write/read transfer size and not
>>   *		allowing 0 length transfers.
>>   * @supports_bus_clear: Bus Clear support to recover from bus hang during
>> @@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
>>  	bool has_multi_master_mode;
>>  	bool has_slcg_override_reg;
>>  	bool has_mst_fifo;
>> +	bool has_mst_reset;
>>  	const struct i2c_adapter_quirks *quirks;
>>  	bool supports_bus_clear;
>>  	bool has_apb_dma;
>> @@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>>  	return 0;
>>  }
>>  
>> +static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
>> +{
>> +	if (!i2c_dev->hw->has_mst_reset)
>> +		return -EOPNOTSUPP;
>> +
>> +	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
>> +	udelay(2);
>> +
>> +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
>> +	udelay(2);
>> +
>> +	return 0;
>> +}
>> +
>>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>  {
>>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
>> @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>  	 */
>>  	if (handle)
>>  		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>
> How is the internal reset handled on ACPI? Does the _RST method do the
> internal reset?

Right now, devices using ACPI would have to rely on the _RST method implementation.
It is unlikely that it implements an internal reset mechanism.

Do you suggest adding a check with 'acpi_has_method(handle, "_RST")' and fallback to
internal reset when it is false?

Regards,
Akhil

