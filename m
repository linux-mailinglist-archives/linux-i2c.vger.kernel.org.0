Return-Path: <linux-i2c+bounces-13852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D41C14B82
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 13:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6FF1B22521
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B2822129F;
	Tue, 28 Oct 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jLF0DRVT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012021.outbound.protection.outlook.com [52.101.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06C302CDF;
	Tue, 28 Oct 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656113; cv=fail; b=hKN8jGDOVrAP7Si3HzXai0BZeMVlA0NgeTX+J0UQxV+x56gD+4V11ja0etNqCAxGgKbTD2YNNhdAqMvMjUHY3RupROgR1E03sKZlmtkiCsG3nl88fH14RGipjmGCAHXWN53qJhZ2beaD8XgDgpDyYHNaNPm1Xgm5pkEBDMHzEGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656113; c=relaxed/simple;
	bh=Mqr3Vk6e8O6TLxw1bnWKo4S1PkrdlhjPuUlv7I/ZXa0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QU+0K0kirhHBVZ0rlQCEKaOk/Bt+kXy4oY31HVigIgzf7aSsLbjk6h8PDVkSVaC2p3cDJG+9a98xBCjiS5Zro6AuI6ZfDlcHN6D2MV1KY0FFiT27QtVBHNQrI2vi/tY4/aLYj8QnFgvjQ6KLl33iMhO9VOqI7Wkb+uAQ2vAO6qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jLF0DRVT; arc=fail smtp.client-ip=52.101.53.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrJcZE0k13IsgsDPd10XIbrsgwtZ3HLOyEklU3tbDM7Jj7NeVSODPex9ojSl7tErtzDUSrK7S6XmOMvG31GMh3oH4XzlSACEGWjFVCevZ8/qY5XxG1yD42J6oD7FdwNnwZPZ8xFOZHKfp5n1aay6znatt+QqKdj5XjGiggHrdiH1VbGCTQPU5qaTr1/HDvhNTqUTQHvFMs3oPKA2S42a6o+ql9xnQ7eYjsxT5yyNcKbT7eXs9E4EWrfZvETCRosYspT62vaGsktbi0JSS5qHBl3cBJP/dCun69DoIR7NZiG7sNVko9d9cdZj3ppmqgh0sVMveHhZ0BqST6+gEcOb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDYn9KETdNB3GdnmnyKNLRSkIQp6iaJUwYM448Xm+VQ=;
 b=H4RqjnHAIG4j1OlNWH+YvECSeCkdtldIjh+//p/Vx9YPOQhPxnpF4CljpcFw74aaXSEf4vliE1GZ0+1/eZPfMN3DHdHzMYhvaEN/monSe3g/naDIRvztzzTnUM1xRo7D//ilIu0zFJs1cpF8LVS+6mvacLtDGTEcyp3YWOQKs/+nncDN3vMcNJ7MadOmk9X/RvjUrytwNdGQAXVHpoivssiwQtvu3frpQiDGZ3oa4JLuDZeyoC+Ey08tpk4q3k8/QY6tl9b1p4DCMSh97stXbmpCMqUw/tAEvOpiQS/5mKaxcbjQzNPOLSZKueiNlPBba5F+Qi1wBcd1qxQe/ITmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDYn9KETdNB3GdnmnyKNLRSkIQp6iaJUwYM448Xm+VQ=;
 b=jLF0DRVTzQanpc92odeoNFy7cb1fkXBjY+P9FLgcjuz24mXOTJ38H7dBpC571LH1MQBjvFcmwYjikThDNgfR/FuuY6tTSTC+cfHJpmrMrMNskZ51r0n7ln0OWIP+uNM039QUxKu/jTNY+Z6KfpZ/urRCpp26Uiv2VNUMSAwLaLRnE6b7cDjsN01c2rliolPi0b+iB4whOuq9rnopKDlHaEA/zGEybgEmK65Eb+xCeFbw5c8qfGgb9rXV3ag7M/JSv4M/1aA68zsTLPCGnmhFVfya1xQGZCLe7OESLELNbXkri64Dyiyw5zFLzw2jXZHAafI8qZsj/3sNd2LITJtgjA==
Received: from BYAPR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:74::19)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 12:55:07 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::7e) by BYAPR05CA0042.outlook.office365.com
 (2603:10b6:a03:74::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 12:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 12:55:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 28 Oct
 2025 05:54:54 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 05:54:54 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 05:54:50 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 3/4] i2c: tegra: Add support for SW mutex register
Date: Tue, 28 Oct 2025 18:24:49 +0530
Message-ID: <20251028125449.46934-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <96e9898f-e306-4b73-9d06-5515916cd769@nvidia.com>
References: <96e9898f-e306-4b73-9d06-5515916cd769@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CYYPR12MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: cdae2292-b6ce-496d-f156-08de1621389e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q9LgQak0zbKMHXoLk3ILP/POxQHNXcjKXKrTaQOp8tTlIWnyh3PZ781mPbAD?=
 =?us-ascii?Q?L8qYXKVaLOZZB+qDhtqOakBVwjWrJREeKBDs+bUxZ0VSsdQk4JmX6Ke9hzqa?=
 =?us-ascii?Q?tjIXXMZa0xTl8gTEjlmpZ0LhmmI05svYeil97z3uGPwmm/GtwZdoAd3ZzYlZ?=
 =?us-ascii?Q?wZ9GuSa6HIWDEwpqzwVOEMm1gCteXZy9cxd2CYZazMblzzzemjIU/kkHmXsq?=
 =?us-ascii?Q?iWZkmToKWABKxCOBKnLInpB9HnH+Nr0AGG8tt1iF3UqBnXl+a+fNiED1Va++?=
 =?us-ascii?Q?RnRdWhA8JeOE8D/rzIdo6o25sWb3D2iZTq6uvTzECanzeLkHm/qO8UPChHtu?=
 =?us-ascii?Q?XpYpbZ2gxp3UA6KZ+bTUzwRSImdsbBdK+wOCgZzWcHPNmKUKhSBGpw6hmPBA?=
 =?us-ascii?Q?befcOiO0nkEUiEZtQGWDrhV2fXWotEc/dKwLs9GUSfvGdRjc2T1MQSiNNT62?=
 =?us-ascii?Q?9RAsXHT4cxYlQ3HRHO5xaEVbCVnIGlW/+CYPmmRuGupLSHXv6LGVG+uCldZ2?=
 =?us-ascii?Q?DiDZfJl729deaAahNG/nE5q2d1T6hQVzpi1RdsU+CmirAIRk+ZQp4polgiMn?=
 =?us-ascii?Q?40LaYk91dDIlj1geLtQQNvTc/mYf8X3JXyakT5yzLS156gtR7sXVxtyukzrA?=
 =?us-ascii?Q?dtc1A8AjjJvH9x7CMouUL0hX35M5/xq70JYB5YLHye2EOhSHOnFmdPGH0cWt?=
 =?us-ascii?Q?QFV2y9PGbtnHnpfvqg8++/RluV0wElgPcQecuyI/C5hkQ10h6NZTPyPzyPIP?=
 =?us-ascii?Q?soebmchC1PV/dnKCOZyc8Je8lRedU9Lip6pTPaoEhKegdsEG18rybp82lEWO?=
 =?us-ascii?Q?wfQZ/tWqJKd1YZTQ5JU6WSc85ibdbPiX96RFKdr/1jJAtZ25wZWGdqXxF83Z?=
 =?us-ascii?Q?azaixCOubP7AwlBuma6VchYeJ8iftD7rZQ6+yZBS2xFUhhFwXJakt5lEql1w?=
 =?us-ascii?Q?6yruOxmjOo6Ll6cmMA9ULHYb3mzcaWH2CaR7oR5NRlshGsoGoMH957Zz92uU?=
 =?us-ascii?Q?ktimdL9OdBqy1ugJj1u4KSESjcGxpN+U0PjERwA6NVMeIhfpnZUlvC2LP/hM?=
 =?us-ascii?Q?sFnaF/Sg63+vwFRtLLPJVScJizrfkUMAiPk+k3zTxOl1apKb+IbcOdbYojIX?=
 =?us-ascii?Q?ruo7aaJS3ooyh+BHix/TZI8rNqWQxOdkSiAAycxDGD2EXJG0yfTQm696dwbg?=
 =?us-ascii?Q?d84950dh4W+S3iMjG0n6/IHC2CcA+trVab7CYUrFEy4tfLputajUTwhjGoF4?=
 =?us-ascii?Q?AHXRntBA9j1Jt7ib9vs4QdxJRSFmjhNyRkkp9F1lH1l7xEAJksHFmgrSVdub?=
 =?us-ascii?Q?Pp92pwRC3/38/w+qJsiiJpjsS57MuS2z/pb/Okhyluhv3avT7om9nMsjtt3o?=
 =?us-ascii?Q?Or+HglCcK4eqj9wGw6NnQrW9azcWwV9tjG8KhNvA6lknQr5+M0H0QiENwGwP?=
 =?us-ascii?Q?G4UdrsVKYnHtV/of9qt3V3LM7RzSMcF+kAC85wWLmKp4Ee4YCh9TsQyXzj1E?=
 =?us-ascii?Q?fuPWMytEYuIFUT03La8Uy1P1D46L4A/+LbnQPiyBxH19qBVuAECvdpddRorS?=
 =?us-ascii?Q?LawtoJjZbno3qeQ1KGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:55:07.1894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae2292-b6ce-496d-f156-08de1621389e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703

On Fri, 24 Oct 2025 16:42:06 +0100, Jon Hunter wrote:
> On 01/10/2025 07:47, Kartik Rajput wrote:
>>   static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>>   {
>>        u32 int_mask;
>> @@ -1432,6 +1512,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>                return ret;
>>        }
>>  
>> +     ret = tegra_i2c_mutex_lock(i2c_dev);
>> +     if (ret)
>> +             return ret;
>> +
>>
>> I wonder if it would be better to have a wrapper function around
>> tegra_i2c_xfer() called tegra264_i2c_xfer() that is only used for
>> Tegra264 platforms and invokes these sw-mutex functions?

Wouldn't this only add another 'if' condition to tegra_i2c_xfer()?
And probably making it more complex? Or am I missing something?

Regards,
Akhil

