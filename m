Return-Path: <linux-i2c+bounces-8209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736B9D8B5C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 398F8B2DAEE
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 17:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254BC1B4F08;
	Mon, 25 Nov 2024 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GH0ESezo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA23E192D6C;
	Mon, 25 Nov 2024 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555197; cv=fail; b=byX7anm67tP7yWcz0xU9eHVdKgyMSCVG+8bJtgb+YZjdmJULD1XQnezy72yoU1BCED/gAUZ9kTs0MZRhjpksm1uqB8iXQQ4uVcjoSCQrnLCnCrv967PDpDys4IlBC6L4GLycXw0sb5yK0P3VlNDi+idZUA/yC1ANTsqGKuaWnJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555197; c=relaxed/simple;
	bh=P5HuPgJ+9P5skgouYpF2Tdw+EV+Pt+E7QCedPiKlZKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nSOK3oizvYTf28y4Cyo8GsSm2/tCU/e/hfKS0asrjVOEXhpFa7kR5cEX5hNK0ckYx6LhFSM6XgvEYIgWNAeXlPP7YPyg/x/P1hawkZD01EQxp+NctPYbL9r5ZTg3Y6Q5fpd2LIZZWO499ToNztZHQgpHmG2PHSCYjY1D7MAdCZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GH0ESezo; arc=fail smtp.client-ip=40.107.105.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMyuF4J343ZSMnVbvzQp14/1jdBUBrD4IUfvga3vIIZ1qL3PrCkP92dKle/WQ5+Yxu1N6hdzIidJEcrKhh9L8NgUBGsJARVpfXPlDLnP+0Pq7yBM+FjyG0LZW3NGG4ugBrz8NoZX+vcs1Fr6SwxwSgTQzJFnm5v1UPZVhykH128MBQ6YTD0rxlXoBysIYtjjItsvUbd+BEB7OoD7/TZwLulaDLGQ19q6MHltnmcmT4HjN8u0je4QHXTvhWGyCOZ7hlp51gfUD84lC9My9m5D1IZxFIBRKmBb+xrDzWfl5fJKZ4cJ1Al2BOOtAHzIgqbRxUtRn0Nr1q3BzoVDL1Enkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAUlZ890pLVwBSeNhC/kwf4nUad14lStYmxfkdCy6J8=;
 b=yMyy0daD2/YN1lPYnJMGoLTtdx2Hu0QfALqGH8Bz6Q2c+evbaRY0JdvMmLbNxfRBievjNqHyrvVAWXyHtsWpCjBPbB8vqt1TMuCfWOuRcw+oH8VPNrv+6psk3FaSVk7bHMoUahichvBl0Gp00IuKtzytiTmdGQE3ZjyOYRNzdhIU0SQXymRMD57Nv20PINN7zYVfK5YPAgA14EDH2f7TFv8kyKaRxXI1R1/R4zftpShAboLws5pD7Yn+zO34rfWiD+sBQCHXQ2WV9mmBg4L87XvzL+q4O/yNNG7ug4bgFcNN1NU8tH7YYsHEgkpGVyIvdQmdQYRgNG/CsZkt6jhq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAUlZ890pLVwBSeNhC/kwf4nUad14lStYmxfkdCy6J8=;
 b=GH0ESezocui9kSf6KZJcap7Rhx1mOFFwcLf35Z17YB1vrRTWSpFXVxjl2tBzE6x52NFqu2RIwRc8rNNDPA3iEcGUxWA2EFqLFw3hLU3TWEWRyrUxf9wxsAuiNq7fID7hjdiQ8UDWRBX+f1vypXEurIbTJ/kTsb1ardNpBpHcEzp3Xt67X5htk1V6BUKdp7P194y/9rptyfEowhzsR5mEOd7EzCmfNmShiZJJGAWo+ZVoBPzUWA+7K4twlBihpCHZu/ZTfDrPKr3bAAegf/iVy9ywtUnun+Pvt1W2423Hr56Pz1f9/zHFmk+zn6hFg09ycQ+Gt+ksXe02Rg9xQ44Muw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 17:19:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:19:51 +0000
Date: Mon, 25 Nov 2024 12:19:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Message-ID: <Z0SxrAWcbKhVSGdb@lizhi-Precision-Tower-5810>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142108.1613016-1-carlos.song@nxp.com>
X-ClientProxiedBy: ROAP284CA0310.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:f4::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: bb62c7bf-48be-4b55-475a-08dd0d755f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UaIqMdKiXz/htk9GiYunPGXg3rZ8TQlvygJn/CF9o7YIg+C4qN/JpKOlxAOf?=
 =?us-ascii?Q?s/LgJmIAREkgfK8nSFBTyY27hmhG9A8f8nzlAOtz8iVycNNQRA0U5SQ2DeVM?=
 =?us-ascii?Q?8Y6Tjwc9mmrVHFvNMShK5txUuJ3d7P7+RQiYSJknaIy7lOZ+rmI4Oay+nWBL?=
 =?us-ascii?Q?U3ltoDb6c5QRngNhVPSHfD9OUfPjQ4WeJcA6wWTSyzYmtv+Ty5/Blxl/fH/G?=
 =?us-ascii?Q?QUFT99W71cElcP8+V1Ru4EoS/iuRchJhFC0IU8sj3GKvqon4/OGE8NIruVa2?=
 =?us-ascii?Q?DL4iH0O938hJFs5peDeHeJYnkjT3G9vhNgLVjbUHHFdt5gWaca5F+uFXEdaU?=
 =?us-ascii?Q?pUf6soXjEOTDzXoddQk6t8VoqspMobLwlpACSIaXMW/jaTCp2OXG/yRjqqHN?=
 =?us-ascii?Q?Of8/27AVUefdmgmdIHsCpujqRdIk6KoLlvILi1dLc25v+W6xigYzKabSKNTu?=
 =?us-ascii?Q?GzKn46k9bJvHoiKzsQnsjxrzZp9sx+0ivLFcVwSPRtsY7Ozqd8K/DVx8EQvr?=
 =?us-ascii?Q?AueTrS1lqv4S2ji+/yVQWL2ad80MlnpjGDnAnud9fqDWo6DW55vWuHX+ko43?=
 =?us-ascii?Q?1+hdJwj2Y4cG6CiYFnBSNUAEhbCNM1+uh6sB5YnPCIMH8v7TVCXxAGI42wYZ?=
 =?us-ascii?Q?4DbvreUj0j8wZQYftPvRR+C0WjFJRpxjThkV0wIG3UXzVzBEL2hrPWa9aeqW?=
 =?us-ascii?Q?yaVKeMUFRA1koOkPsI3BSlPzHzruyqpZlPYSuFIOeuDbgaK+F6le5154j2S0?=
 =?us-ascii?Q?573j/kuI20Yrf84Eb7wsHuo4JSPxYb6zhRVX/Vk+PVeJzGRIrpO9Hc7EaaH/?=
 =?us-ascii?Q?6pquCHoC8ae6QSElmLQlnoyaf1IoLjI0/M/9R0Ou2aPo+JnoK/POQ14xSyNJ?=
 =?us-ascii?Q?pnuxe47/VRbs8dINiPmUOhQhTDk6J8xQ6O/RhLex6urh+I1zJgV/uys9M3Yf?=
 =?us-ascii?Q?2aj6Sq7Lmbs9mAnoMu8iBMjXFHp7LzziudJlGx4EEwfZFJ3U8uJXERpA9J+l?=
 =?us-ascii?Q?Aihng+SXN0CRhvJTTAbkVkdZO+Nj4Nq5OUF/vHbfmanN4LdUpxUr+nZFUox9?=
 =?us-ascii?Q?Sz6hucDDiKPVIhsjBAsjaK3mxNnnCwMZhewea1G9wiboKG3ypK7Jj2+Kgp/a?=
 =?us-ascii?Q?h12uTcVjiXo30FHM8rx1Z+HUGtkhbi/FrZ1Sh3togPOg59HE7h/W73TzTV2W?=
 =?us-ascii?Q?VSGjcUQKU2ayWiAkP3laY1lDebsI2nw7lwvH0nTbhvoYfYOu0mHIjDDD3bDh?=
 =?us-ascii?Q?Boqo2Xb79JE/c5s3etZHYSyg55geW80waXEVJhxdByQuqvcAHJD/i2hM9up8?=
 =?us-ascii?Q?mbKgtsbNR3+ahnLLP6p9RlApe3F/J4s+ZXpT7VPNU6OeTjMst/VcywhbxL5E?=
 =?us-ascii?Q?qbKPCi4OEotpULchMtBY0yxjnH2et1Tlh+d2rFEcBgErv29S8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PKwlVfP5HEK8DLMzMVAsDxvR7dMGOM6WAgN4n2QP331zdpGeBPf20DqvyNR?=
 =?us-ascii?Q?93zjGHrcQ2WGapdt/aqone5lhEk6RPQnJLsK0gWkxuMxcoOqPdbhKMZLrOyI?=
 =?us-ascii?Q?vDzKhqNYA5/mRbmRqd+nR/ISHJL/jn3EHCfu1EYzk8tY5olBYeL+lcSUVsk/?=
 =?us-ascii?Q?rQtzso6/ZXKZ4cXPY2dgwLa7v4FMmb8tushGF1L8lhOq+eu9BJsuFB6eyDvp?=
 =?us-ascii?Q?NOjrqaKX2N/f/5HpCs+7257i1jVuPKSARCfquy2n3UCl5aJN0ERldmLyzXPc?=
 =?us-ascii?Q?fch5eK7g4DvbwuMjFYY3uROFxbhphzr0S5MOsDpuRQXDnLGwnazgJLBcNO68?=
 =?us-ascii?Q?0OeK9DwcocmDHRfV2/9Wp9FH+akouSYTFd84CzSW0yA2qKn+IQeomaU3V0dI?=
 =?us-ascii?Q?5kSue5XCm1uh5yTEy79Y8kr/wwsw9tBYfQ4DTxtdFFb88gBa13YLvYJp6k5j?=
 =?us-ascii?Q?zGhiZGtbySzou1LvP2D1sdwEfRaDyi2ZfL0fg2RXIzTNGboIZQlmtPydvrvF?=
 =?us-ascii?Q?GsY5/yBfieoY04oRPMGD88g1SKHsQ8iEl/zoPNWzl4wTzNOwLN5Ir2YVzna/?=
 =?us-ascii?Q?Ci4g6QMHDv0wfBfiAWGkd8cOR/jfzTxhYPbvWUnSK/L8QjyHtidQihFb4Zc8?=
 =?us-ascii?Q?D9x+Be2fAm2NyZnJcCNj+B5NSTI8kNralo7AaMRQfhbaCf4h2dT5k0Dytsvi?=
 =?us-ascii?Q?hKF/ZISD/a3ZaRzeOxQGxwAX0w2ydHez9J5LbsciTV1Tty3GUK02qMHjmxh2?=
 =?us-ascii?Q?Gpq0g/LKeADlg233UHgAajzTbqSAznnTM+EJK+DOQDT2yuZxYqIYZG/q5TqP?=
 =?us-ascii?Q?Si//lfzgRluO5CFbSSRbG2o62soy9SDxmFwQ7uvxnorVehgzFkSIo3WFGFme?=
 =?us-ascii?Q?8tvsECRPWm417pHa50ZykjTaV7FudkYi4OtKlLstI12aLlzrCfqKmyyeu32I?=
 =?us-ascii?Q?ExmhRi//LjQLDNbJE0Pc68kIEiSmktOGnr4Eg1vcmYwNTizmIooSrvLmDWUc?=
 =?us-ascii?Q?xZWq2PnuH+un67xTlLRDNt80NcodNZjGkzsX1LiTKWBBWHBp0aEo8LIV4xac?=
 =?us-ascii?Q?MTnvANBhoUwlNB+ldLHHovMIqDab8+bHN6Bd7nVOXEKZ47YYEs3gVvQsqd+n?=
 =?us-ascii?Q?Kh6ZPWUW2k5J/dpetcTPHoNAnU8jRKB2W603IbGhorO7+wf34WFFPMJf2tMd?=
 =?us-ascii?Q?v1JdwlDRDlWDAdZNpsZNNDc6ee8NzRw+iDX5pkVll+fDSInRWPfDBX+GsEnd?=
 =?us-ascii?Q?Z8HaE6clfv4HtR4JfOzGaJ+YDgtiuRxur8rkPYr3ZyPpajcki5wnmVAvUo8u?=
 =?us-ascii?Q?6jofhkrH395OihxakFKDvwlgDhk4aW/KQBfa2f0ieY2au8HaqKbHsu7EypaK?=
 =?us-ascii?Q?+eJpRU56yrl5d+/5CM0D9YaXPEYNUnf4VZz0KcGzGObaiBpMQSPEVKhg3enN?=
 =?us-ascii?Q?FFmhAgZfbGkE/KT/LBSDIFW8LWR3ewA4xt5xNVYAXZqo1uGj4cfjVpI/Gbji?=
 =?us-ascii?Q?GUQ26qjDoU/WgBVI36B+js7P4Q9319vqHNx7xgvPbPO6cA6AYnemCgBL90vx?=
 =?us-ascii?Q?CR/3NmZNa9THNNUsxfs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb62c7bf-48be-4b55-475a-08dd0d755f2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:19:51.6867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlOVeQq2rPco4bgXTfF686bsEtAvcJkXEyIU+5RJndQXq4ONov2/QPET66uuAfz0UGTNHk9c1zbOMjBArnGh7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

On Mon, Nov 25, 2024 at 10:21:08PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Put runtime pm to resume state between suspend() and suspend_noirq(),
> resume_noirq() and resume(), because some I2C devices need controller
> on to do communication during this period.
>
> The controller can't be wakeup once runtime pm is disabled and in
> runtime autosuspended state.
>
> The problem can be easily reproduced on the I.MX8MQ platform:
> PMIC needs to be used to enable regular when the system resumes.
> When PMIC uses I2C controller, I2C runtime pm has not been enabled,
> so in i2c xfer(), pm_runtime_resume_and_get() will return error,
> which causes data transfer failed. Therefore, regulars can not
> be enabled and hang system resumes.
> Here is resume error log:
> [   53.888902] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 529, parent: platform
> [   53.897203] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.902713] imx-pgc imx-pgc-domain.5: failed to enable regulator: -EACCES
> [   53.909518] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 12331 usecs
> [   53.917545] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 529, parent: soc@0
> [   53.925659] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.931157] imx-pgc imx-pgc-domain.6: failed to enable regulator: -EACCES
>
> I.MX8MQ system resume normally after applying the fix. Here is resume log:
> [   71.068807] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 530, parent: platform
> [   71.077103] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.083578] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 6490 usecs
> [   71.091526] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 530, parent: soc@0
> [   71.099638] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.106091] mxc_hantro 38300000.vpu: PM: genpd_resume_noirq returned 0 after 6458 usecs
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i2c/busses/i2c-imx.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ee7070ee9e6e..c35092726465 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1770,7 +1770,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>
>  	/* Request IRQ */
> -	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);
> +	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED | IRQF_NO_SUSPEND,
> +			  pdev->name, i2c_imx);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
>  		goto rpm_disable;
> @@ -1894,7 +1895,36 @@ static int i2c_imx_runtime_resume(struct device *dev)
>  	return ret;
>  }
>
> +static int i2c_imx_suspend(struct device *dev)
> +{
> +	/*
> +	 * Some I2C devices may need I2C controller up during resume_noirq()
> +	 * or suspend_noirq(), if the controller is autosuspended, there is
> +	 * no way to wakeup it once runtime pm is disabled (in suspend_late()).
> +	 * When system resume, I2C controller will be available until runtime pm
> +	 * is enabled(in_resume_early()). But it is too late for some devices.
> +	 * Wakeup the controller in suspend() callback while runtime pm is enabled,
> +	 * I2C controller will be available until suspend_noirq() callback
> +	 * (pm_runtime_force_suspend()) is called. During the resume, I2C controller
> +	 * can be restored by resume_noirq() callback (pm_runtime_force_resume()).
> +	 * Then resume() callback enables autosuspend. It will make I2C controller
> +	 * available until system suspend_noirq() and from resume_noirq().
> +	 */
> +	return pm_runtime_resume_and_get(dev);
> +}
> +
> +static int i2c_imx_resume(struct device *dev)
> +{
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops i2c_imx_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				  pm_runtime_force_resume)
> +	SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend, i2c_imx_resume)
>  	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)
>  };
>
> --
> 2.34.1
>

