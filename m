Return-Path: <linux-i2c+bounces-11927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13540B03596
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 07:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399D6189ACA4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 05:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A931F9F70;
	Mon, 14 Jul 2025 05:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXUt6Q6J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A234CF9;
	Mon, 14 Jul 2025 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752470571; cv=fail; b=uqqHmwz3eF+Bv4KymWncV85ckcT9NfQtXFtGiSk10V8bl2An9Px8skpWwlczs5adyHk95y1jS0u7HUu9xehCnUPhDBcXjMqhR0WIkdhcSmiSt3uXBUCOe+XMQFrKPprCkQl4Y8PnkM6bUvk7l8MJonSAkJ8AUqIu+DIC43BqIEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752470571; c=relaxed/simple;
	bh=RZWXscnvSccL4dJJdLeOb67XMYDccKGtnqq+I87z9l0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDfr7OgZKNdKsOjtG9pxKfFaH2eYpf0YlMwhJzvtAfikUxJUbRI0ds9BgVgilB4APRtlFbLSXqEMs763+LCyk069xA16rDLJ9dcrL+1sqk3g/nGRRir+FcB4XECWjWVJPMsmElXP4Dl1HIb9jbFAfqYK66ZoQ2F7pgGMVvcOHKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WXUt6Q6J; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6pmAXGGSeGpWCZDN1Ml8Lm57RyjxyX0yOwY+rH5mgJdqPH36CKTGFSWFndjwC1JyPsbJpk/aIcoJwYgtdGS88SsrISQKS+d8uOjSVkvNb2kyLIA9uiJaKo5VGpDXb+x+WMVS12NDZgqZOiUx79Kzdw2WgQBGzl/3KXnSxiF+XDmNuZfNeRqau7BJmsGTuKBrNfawtd8pWiTNXur3A+ks+rur9s9yPerT1G91E4hG96VOEqaKBMzo6Z0eHoh7ccoIduAn67lWHfI27SRZHS0KANNL6EUnP9sXMw9EoCA5yq/NZ6w9B7DHHzENkPidg3JDtZxLdk+LbVp3hvwABljaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA4dOn2mrROmYiITzKV4Dj8Vbh1TrsO8WO8+LAClf8M=;
 b=hFCaPx4aSdHwy06e8vFxUXr37cBcYmEnNwyVR9MLgALVJySrIn/kPmjQUEglBZZzdviCKfc7A2bCYQJWSfZuvp5FhXIY5vdjAOfRCNJuqvNpl1Eu2kbk3s+2oHsCQ0168I28N7QQzNH64/RlQGs4Li7a7GukLoxl8rm6G7SLszLc4TDhrl1RhVU6VZjKl05LZRLSqDiSvuo3wB8VBOws9qgaKWAMmXueA1QUCDEGKEKXdKQF5YjFd245r9VmcsDM66SNO4eSyZwT6poSTwU8Q/JMp80mUop6dPnuXbC6+PnquzEHc/lRPt0CwriJa6PmBoWEvs5iBmJFDx1LdEFEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA4dOn2mrROmYiITzKV4Dj8Vbh1TrsO8WO8+LAClf8M=;
 b=WXUt6Q6J1QERqlbJyDBLq0OXYr+wF0Sc84KAWwEn5t1C4f5rEWlUVDl4/d0MGxOWHZ2dUAAft/3G2n9W692YuU1Lr9mcCOqzY/PCsgI031vka1mPJuQvUkrOGLKBA6tzIg8rw1ONYhFxkaEirea/z9B51lP/lJXFib3B1zZd+U3UQLJsNDdIDnGrgtGRktVQGHeGegqRvMf6MElc66BBTfJieuXJM5qB1VTzPWNKx4Vk8hTQq5mz/MlI8iNoaxwzF6zle/qm0rCeavVDGsF0OwH5Y09oTZwSKdGI7sH8+Gj7KDd8Y8QUslkZJvUQ22FKBUtEtXI99kjO5Z2UTev1mw==
Received: from SJ0PR13CA0200.namprd13.prod.outlook.com (2603:10b6:a03:2c3::25)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 14 Jul
 2025 05:22:46 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::72) by SJ0PR13CA0200.outlook.office365.com
 (2603:10b6:a03:2c3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.14 via Frontend Transport; Mon,
 14 Jul 2025 05:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 05:22:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 13 Jul
 2025 22:22:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 13 Jul
 2025 22:22:31 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 13 Jul 2025 22:22:27 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>
CC: <akhilrajeev@nvidia.com>, <andriy.shevchenko@linux.intel.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <digetx@gmail.com>,
	<jonathanh@nvidia.com>, <krzk+dt@kernel.org>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<thierry.reding@gmail.com>
Subject: Re: [PATCH v6 2/3] i2c: tegra: Use internal reset when reset property is not available
Date: Mon, 14 Jul 2025 10:52:25 +0530
Message-ID: <20250714052226.72876-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <iqx5wzywy2x66n2y36mx4fckrr7wy4lqu3dsejcovghjtmgoz7@zwslylpivy3q>
References: <iqx5wzywy2x66n2y36mx4fckrr7wy4lqu3dsejcovghjtmgoz7@zwslylpivy3q>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a56f835-aba2-46a0-aaed-08ddc2967710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZagaB5VD+Bs72YLooDi0d1t7ymhnCav8bAPXDAOzQG/14z6OdOWM2gegBu9b?=
 =?us-ascii?Q?kZd+FYb0hSKakIQV4/psOX5kSfeZIW6lHGH8byvZiM6tYKNjs65hqaclR9+w?=
 =?us-ascii?Q?HSEAXp5yvj4tfi3sivOxBp9v1qe9Y18qe0ytbE1CAmMAIBBmIb0ztwiwrxR3?=
 =?us-ascii?Q?Js69YtX3BYKu6gwEbmr49lhjtMJqFBoG5HWNLkLFFEW73yAPI4VtMTJc6+EZ?=
 =?us-ascii?Q?IgVuQke4Nm17Fs3x8PhENVPnmtfCTXUPd+oQucCJSWJ56tbgG3wyqUPHg6O7?=
 =?us-ascii?Q?fXUqUj44PoloPsNgRZPDqWUEe+HXNET2cSb6RtVOYaKClTZt9h4ag7lpzyZi?=
 =?us-ascii?Q?XyOrT2Xlmu5ee+WSwQEl+TK9GcUyCQeUzrq8I4Z3hFsE0CXVZx7QwbKmfG63?=
 =?us-ascii?Q?BuVLayMxadH7mgl/ImOvKCWKrBBdgoTaEYnnravar5Y2Q59binTBV9xV5tc5?=
 =?us-ascii?Q?61oDONZjmvMHxCXQu87Z6n2WSfsgwjWghDYDKkwmcc9wtY6drdzBSYEBMs0G?=
 =?us-ascii?Q?cNPDS4rITmiNuXp8mbZjTwP6SznAM1roTp5FXXlR2kJ0ftpzIXR+WPBvv1ry?=
 =?us-ascii?Q?voYGKM2W2JiK0qDTThw5owTnOJ8qsZcbKLVfKnm0kdYiS8mK34zyXtFGvF/a?=
 =?us-ascii?Q?wa3cIzGvHaJmMpZ+AHHBu5F7Cjy3xihtA+fLjFUL5C+LvZxWxQ1Ht2eYKsjB?=
 =?us-ascii?Q?gyU8C5XpFDj5YxyifMPRM1/eJ5/ySuhQoyZArbB0mVjnURmwhX8BTQaJpJNQ?=
 =?us-ascii?Q?HvW6S3H90aib0HF9iYboqIoIIR0BWkrqrop1kaf/w40YwXSMovyLrNXO8iHQ?=
 =?us-ascii?Q?UcB1A4XGTY4V8Ds48C3XqgollQy1Z4WYlEZ0IzlKcJ7C8XpeVwUIrtdid14O?=
 =?us-ascii?Q?7ZiQktmo7qdyy54i8VtW53FXbGQdLVahNviM5DAB3a3mpPhXVW7h/Fz2LYF6?=
 =?us-ascii?Q?F0LiPz+Cib+YBKhT4lRSjPynva10CG2MWZgK/tQos8ucnXkQjGR7kFqkBJnx?=
 =?us-ascii?Q?Bw2/6Fuaao3L/R9gbJI4RhOLNfaKRk41kwEWEfBfFlq+uXBxR1BJIfOKo2WY?=
 =?us-ascii?Q?x72zay3Ay8MfERmHrmA7OARbSHXm2AY6Gt7zojtM1H+KvA1/W5Kx/ffK2EXj?=
 =?us-ascii?Q?BDxbm+7SXfewGe6HflL85dW5dqIuZ0VpUpHdq5zYdUXeILn7FoVEFqLoZPe8?=
 =?us-ascii?Q?oM+ibD7CuWrX2XQRPS544Ds/NblzQ7cowD5aSNx25gx8Lqvp1vEWPavrvH1a?=
 =?us-ascii?Q?L2+x2lNIjIgXOyROMHXI+8WA0+lFhhgW3ibXhzn9tePIg1JTHPI2bo8+ly0R?=
 =?us-ascii?Q?Z+tMAipS8w5MAouDjgm+aUGDUFEyMD/VM0KJgLA+wasHasOvbgh0WwNskheJ?=
 =?us-ascii?Q?plwefsTvz0xCmmMVhWQS5wic3vNelp9KdLqKuR2gBy7fkcWgRM+DqFSOKgQ4?=
 =?us-ascii?Q?zJhvy8jJV0s/ab5Ohc5+5G4ytH45M2OqlzJCvWwj6+Vz0SkivJnpXEtnGk4b?=
 =?us-ascii?Q?zjoMnbmqT+Sd3lGtkJXtB/t0ptkNEDvuSZTc?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 05:22:45.4623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a56f835-aba2-46a0-aaed-08ddc2967710
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930

On Fri, 11 Jul 2025 18:00:45 +0200, Andi Shyti wrote:

...

>> I would perhaps expand the comment here to explain ENOENT check and what do we
>> do in this case. (Note, no rewriting of the existing, just adding a paragraph)
>> 
>> 	*
>> 	* In case ... we compare with -ENOENT ...
>> 	* ...
>> 	*/
>
> If you write it here I can expand your comment before merging.
>
> Or if you prefer sending a v7 is still fine.

Hi Andi,

I thought to update the comments as below. Please let me know if this can be
folded in. I can send a v7 if that is easier to merge.

	/*
	 * Reset the controller before initializing it.
	 * In case if device_reset() returns -ENOENT, i.e. when the reset is
	 * not available, the internal software reset will be used if it is
	 * supported by the controller.
	 */
	err = device_reset(i2c_dev->dev);
	if (err == -ENOENT)
		err = tegra_i2c_master_reset(i2c_dev);

	/*
	 * The reset shouldn't ever fail in practice. The failure will be a
	 * sign of a severe problem that needs to be resolved. Still we don't
	 * want to fail the initialization completely because this may break
	 * kernel boot up since voltage regulators use I2C. Hence, we will
	 * emit a noisy warning on error, which won't stay unnoticed and
	 * won't hose machine entirely.
	 */
	WARN_ON_ONCE(err);


Thanks & Regards,
Akhil

