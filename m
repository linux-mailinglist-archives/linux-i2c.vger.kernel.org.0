Return-Path: <linux-i2c+bounces-1498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D338083F5CB
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 15:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 331D7B22C3B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 14:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B9241E4;
	Sun, 28 Jan 2024 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rv0Skood"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852441DA44;
	Sun, 28 Jan 2024 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706451504; cv=fail; b=INOd3ATHydAsUFT4UMjv7yNhuMeP1ggMt7GO8udAD2KtSfMR7H8vOdlc/3m9yR4BbKa7zvwpnjVHnou1gtu6z6JgelbF+5xp66jtcjHPirdzVOPm5yVchhm25mpkVQBUi+8vFOi6NYr3nPlUAX7d0rK1fbch7FRpw+li5pO8oCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706451504; c=relaxed/simple;
	bh=KpBWSS4UTQQw7X6y30cPCyxcMF0AI/DqGZ6xMTtRAQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FlQVqIZf0PBcFR7wcbBKcK+/VgnpxE8myQgjGLefjOK8QqSNyioDdvwBAbwZY7czhXxyDc4nByaVwYYtFVR5sxz1jbHzifnYOuVbHibvJcllQjzC3zaoPvVsyqeGVOP3/XExTl80ufEXxeXc4eo5CtYKqK/TF2GE1BQA/fz8Ua0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rv0Skood; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbu3Ilbx5uoxPMhzG1fKgEu9xRqFQE5ZhYRPKgKKbp1qrDlNdb68W/Icz57dUyo0kSE7AliEphQi4AVZgDLprX38HONHHR0tGsAgh3RAQmbUhO3VGWop7w8vXUZf6ZSWh9EczDPT4tUqXUypb/dY+za1kQWy6dljhN3hILSC7gr1O8p158DeutMGrR5YRoKiAiD0ZSIkLx7UPjm88Jo265eXKde+RT0LsQiy6NYXHy9B4mYzeorBZ+T00YuGEXLVIi6SBW9qQxJqcOBDhy+dRw3iKX905krWGvrzYPIaGJVNFMx4NAUBvXvPlz4VheZMYgHMNwMunoRQuQ3jkQT4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRndsKOszgg3gfz28to9jUHk1vCEBPXGi4yr9rM1Nn0=;
 b=QkyTlj16f78SbAQZD8jvukGyDiPCbnMiy3F5y0Ejl7K3eBXJNtg1108xt+n84ktbrqsQ8USmOZ3pDEseHw0bpxVLAuNHa2pqET6bTSssBOwslOis3njUxbJ3jaUVhVDRMpS5n1c6L2bnA/cvnmdoMF0hBBanvVtSyy1NJrYyb5H2VCn5iM6cdqEI/3WsCnOXx09eMLXcs49tgcYkfsAbi9NjDSQgfW6+e93XeqXIZotUXR4tXQ/Rb2r8O8RzrnTdAHWb1NoGJnqX5FF15x/vb+Ez+evnSzfD7/6ZIDJ6zY9ldwp4wE4AQbchlwtxbJgfEtFGu4ApxAuAObJRIFeDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRndsKOszgg3gfz28to9jUHk1vCEBPXGi4yr9rM1Nn0=;
 b=Rv0Skoody0qMotm/JXPRYlbHgg9u+CuUC3U6VkV9T1kwaOVrKCCT9OXjPo4xey+0WmPaoPuUTx8g7OouFwNYR4nfZsjzLm5ubjoALuly77L6GBFfV7DBn74nuk06tKxBq79QovbghX6N2MF7mNhRV2d2Kve0W6gcu2fDmcSDiAqiHtnyzljKuGDE5eYLsOPfqqMlzsfzMQbW6LUlLwCumG3Hfa6QcYnpqdTZzxK/AcH3+l9JKxmKmF7HjZD0+Zlj13IO0ESk3H4PN4Tt2boYTwkK3J4RtEbjlhTYjste948AqILHP3N2yVQ3LgC/4nwMK33ydRnMn7bRYFk3kec5eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22)
 by BL0PR12MB4883.namprd12.prod.outlook.com (2603:10b6:208:1c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Sun, 28 Jan
 2024 14:18:19 +0000
Received: from CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::c749:5640:e441:dd91]) by CY5PR12MB6179.namprd12.prod.outlook.com
 ([fe80::c749:5640:e441:dd91%6]) with mapi id 15.20.7228.029; Sun, 28 Jan 2024
 14:18:19 +0000
Date: Sun, 28 Jan 2024 16:18:13 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Petr Machata <petrm@nvidia.com>, David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	vadimp@nvidia.com
Subject: Re: [PATCH net-next] mlxsw: remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
Message-ID: <ZbZiJU49cDWId4s5@shredder>
References: <77b5ab8e-20f2-4310-bd89-57db99e2f53b@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b5ab8e-20f2-4310-bd89-57db99e2f53b@gmail.com>
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To CY5PR12MB6179.namprd12.prod.outlook.com
 (2603:10b6:930:24::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6179:EE_|BL0PR12MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: 1638fa8e-41e4-4266-ac60-08dc200bf9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+v9AxHzAnv91FqCf/Qh7S4FV4iNw6ZSb7ojbW3yHLVisZRgwUAGQ0dEM+x9Lq316Ty+0Ci6aXLEJzoNgcAKz+qm+X0KSyqfvf9SIge7MtvSxfJocvxzXyMX2J+oSmen9qIR6bvx7EXknDje6meKO4O4vP8upcuy0xa4QC/ZKOMFyCC83i4oIiNw/d1Le+CuFfvQjVXKhKIeaReQnwJrhaubZjUzLjnoho1xDUUL8jF3jKFRC3+Pe0cKH3+0b4zyuMEPUpC9eE3v66LkzycFcOov8Cv1LqINZFmNPxkLyzLihKR7UPNvZvVABLzNn/PR6p/EHbaGvpK/FkrO4scgbi/a4scJu1rf5LwfB/ErFOD0J3koWYMNTlFSmKn70Du8gvHkNPi7Dsckbk8LmgnKglbWvtMqp4FPx2ZAkyWu1Rk3rOoAUbnAwQJbrkpWnnJVddWit9VmCmXWP5CHC/r231Y+9VgBxXjQbGiOgf0aD9HnNAZt8mo494lFeP2uZ0kYKZeBsTpJaoY3uC7NQwkixHRVq+NIHoO6+kU71YAadz2hCFTGEQt9aLJ7UtZKE3wz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(376002)(366004)(396003)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6916009)(316002)(83380400001)(54906003)(86362001)(66556008)(66476007)(66946007)(6486002)(478600001)(6506007)(6666004)(38100700002)(107886003)(6512007)(9686003)(26005)(8676002)(8936002)(4326008)(5660300002)(4744005)(2906002)(41300700001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGWM7ZcLuyazTd9/TpuAPQ7Sc9+7IW8Y51CVMRqatpdzLr/hhgaG16RSbK+N?=
 =?us-ascii?Q?pSMJtG3gUAWZ+h/b58T0SubQSQjEgH0/98jZU+ihzm0keFv74hgb8Fx3JR3V?=
 =?us-ascii?Q?9QCxZ6GT2Axwkk6nidtX82+gxUxfRejS+ilO1causF5EtYFoTskrNRb7RiVy?=
 =?us-ascii?Q?e5teuhIDAGwauRX157EXFI95IGh+VT117nl0hiyXjTm73LGrb1eu5EzjLnbm?=
 =?us-ascii?Q?z1pYOgYdXU/uM/bDl1XRvE7jCWKO+9JYesAF+6yWdVBLDScsXQcBtQlKcRt2?=
 =?us-ascii?Q?Huk+ze4MncMBPCA8Fmi4vPpEN+rP2QIjS/RpGYhTzk/tPF7c9hSEw1q5Au0g?=
 =?us-ascii?Q?efDeH4SzYpscFMZ67wAVayt2B8v2O+wKgA4pEZjZvaMc4QILLeYaqFx3IVC5?=
 =?us-ascii?Q?9giHp7g97GcO7ow4t6d16FKPYEmsJ5tnX4zdUPjfqxiCDXECa5oPRlwxepfu?=
 =?us-ascii?Q?/E4yNQJRndsn+uK5IxTj55ExZq51aYc/PtUhZ9Gb57+VqcmG2X0/7ioyxRk7?=
 =?us-ascii?Q?erN3JA46JSMRTjdo2sRvAFyiQUE3yOfNcF4+X6G0D6nVwo6F5pvdRtvNFPSi?=
 =?us-ascii?Q?s0jkjX41IwXl4xdhXfRdq76AXkyuKKGQONTAdwvpOwgT5myq6IwMoj0S0kO9?=
 =?us-ascii?Q?fQ9aOywYOMIB4hxCGwKClSQquFoXGQH1r5C5/hTG9Sh0Ow/kKBuiN8bWn3ot?=
 =?us-ascii?Q?95ipRNOBTGi/vFb0ccIB7GF7uZkAhBaXDhLlHGUuHhyuWzI6/ju3+bXm9wGs?=
 =?us-ascii?Q?++IH4gX7xRM02SHe1RWcNX9W2Tzh6EOZDfew2VYOojx4wOJmpU+kUyzD6pm3?=
 =?us-ascii?Q?R8bUJowTYJNIhTLpQoTDuqm1YjVENtoOZ8VQHUxI9TGYjnYy2560o/Y5tDxc?=
 =?us-ascii?Q?4Zd9v6ij2zynoMH0AnCCugUibM9WStD+tyM8Ejv66atsHWAz6pv1woWc9j05?=
 =?us-ascii?Q?bq6TlmbLcikI6KbvQSfckT/3JDgkblk3MptfIT34JvVYo8VBcdeJQDUetaNX?=
 =?us-ascii?Q?lEBoqsGEs0RDSCb1PsPRU+zOJuxkHWtHHuER4agA4XBq1hTQ7/xtU1CIjI7n?=
 =?us-ascii?Q?DvD8D4V3kT8eHsw7jlIyihrj9FEkmJsELmwi2Q3774CpwvhVLp7hQ8gx4lL6?=
 =?us-ascii?Q?WihEaGQuGDFaH5KSAkbgt6+UeObPDwfpqdVPmbFB82AQHb0XchwxlsUG+flz?=
 =?us-ascii?Q?qp7S2tN4gK8ZvXHO5W7BKkasJgNrgAgAYS+kg+4tXrMSkz3wpMn2VHslDvpI?=
 =?us-ascii?Q?ycr+UGJgpgDR2sAUnK5fOjFTwu8l8np4AMQd8XOBwu0VWDIcuN1XFyQKxBjx?=
 =?us-ascii?Q?UaGXOvVpa02e83n+Clz+JIR1C9GZSIHPQnA81kp1f25kJj3Q9HE8C67/Hbtm?=
 =?us-ascii?Q?luXStIsY/lLAS+Ge4OwLP+CEa7LnlHLjYi2A0bH5ARrymNTbiJqVYvt28VlB?=
 =?us-ascii?Q?KwlpTlB6Dv2j2wruIJMYGrmLK1IZ9j8Lf+dJUcu+NFhoughXu9doDV5r7nnF?=
 =?us-ascii?Q?Cs/4bLoc4oFOlYTytB5xf8KVRYGqeSzMvMpYfoQ1TxdfRYFl5IfUOR6kdqeJ?=
 =?us-ascii?Q?fiXDWBYGV7gdjzs1+Fud9Oi1jGdBj7uW0qDn9Yvl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1638fa8e-41e4-4266-ac60-08dc200bf9fc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2024 14:18:19.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIWUXzHN4N9Y5B8Z5i8K44Bo7XzLT54yYbQR2M6Nn8QjwwfRCXpMPfpjKEMX7SiLpap5C2ACuxNAqKVr9zxNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4883

On Sat, Jan 27, 2024 at 04:08:18PM +0100, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

> ---
>  drivers/net/ethernet/mellanox/mlxsw/minimal.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/minimal.c b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
> index 6b98c3287..f0ceb196a 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/minimal.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
> @@ -708,7 +708,6 @@ static const struct i2c_device_id mlxsw_m_i2c_id[] = {
>  
>  static struct i2c_driver mlxsw_m_i2c_driver = {
>  	.driver.name = "mlxsw_minimal",
> -	.class = I2C_CLASS_HWMON,
>  	.id_table = mlxsw_m_i2c_id,
>  };
>  
> -- 
> 2.43.0
> 

