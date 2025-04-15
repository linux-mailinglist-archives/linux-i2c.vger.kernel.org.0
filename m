Return-Path: <linux-i2c+bounces-10351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B0A8A282
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9250B188A907
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06311204096;
	Tue, 15 Apr 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v3leBmX7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943F2DFA37;
	Tue, 15 Apr 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730016; cv=fail; b=VBJeoODPr4BJ7a+om90AZo7pp8gDHZK6Ur4XG/pMwEWMtzUwR0c+fA1OMV6LCCRDOED4YWgRKNV4uApX8evQ8t2Y+maQYBclQRxekdaloRmI5FYDQldyWRRrnld73V566/D6eHojQamVzoW5ASLjTMySYdqsQArhSfLhvysuLII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730016; c=relaxed/simple;
	bh=Yhmu5SYZCbiNl2sCzeNl5UCmPj85nzKthYHpQ0f0Bd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hGD6Z/EEMGnKrKbezCyD9ixG+mm84J4xBv42JLpi25OBJEvYlWtQXkjr9qalceAF5/IXrssTnBaWa3EDOC0B1IqmMlIu24dH7sAdb08lyxFTgyMTrqDwL4cNszk/MTic0TaHWZf2KfRCpmJ2uUJciTDHFIV1ctMhHFr8SqAm5gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v3leBmX7; arc=fail smtp.client-ip=40.107.95.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk51aJLCF4CpWAdjGZ4oD17SbXkdd4Kl+n8olHI+GL6DceWskUbBYorxk67fTyqSj6opuGRNHdm3+r7Ns4iV5nn+F+ziVpdn73wjJlV1xPOF8R67ttI1XTfNSTmztpuRmKeMK/poVEcZ13ddROszzPJiNCm6ATC7NzjhIbN43xtk8eeUq2mrYZYVRHBZUdqhFMDbTfu62lQIfihBJ4yiH8T1T47ikcJjvvfYg0PDg7nPVsduEBcj0u150rFrR9kIzAG8cokGjdv8wlBA5fIdzN9nOU57nlf/bXTdlIc+7ZqQ+gFcyxOKFTPg4Ryh6aNpVWI8/z6mGW+YtY4eHi03PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZCyXIBqEBm0JFOba5HRzBjjMT1vgkcKXe+AUSCOdxo=;
 b=NQACvT72sud3RDbH/vm7qDsIuJCNfs1QV9I0DDO5Oo8RyRDk2rZR0fB7j2i98nG3do1WU6wSh6KBLCh7ZrP74Xhai5YVoK7Zabq87cwBk0m/AoXpWQv3vZa7BwZOfVb8W060sJvo2orTEYVaR58opSl3mOxJzR4L2AZgqDupVkfYP4N80T4rMtt29Hw6ZVJAN7nogPwTEe6qI2go+rNEOSJap4c9kMDg2ptLGdrjg3ec+Kbt1xi+z5WQywjUJOcuQ8I0yClZnHM2EQCUzvA6pDBSGZGLtb677ymDC9J5SMIQOrT8ZJ+nH4Q68Q0fpDxOvo35cgq84LStK1iLTkXmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZCyXIBqEBm0JFOba5HRzBjjMT1vgkcKXe+AUSCOdxo=;
 b=v3leBmX7rQjylh8zeBZlU+lqgG+nQkR2pfrpGEU7h6yGFHVNJeb+8dTKYYqQfu4i0j126j9nqPIOyUJwZ+xi2ebL6OlC6e1OlNk+xkWYqzlUbBa37QnSAqH+B4CM6sPgOGDqb79n+EayXkmipNGM9QBkAyxkyblOlSMiIuhgPvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Tue, 15 Apr 2025 15:13:32 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:13:32 +0000
Date: Tue, 15 Apr 2025 11:13:26 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] platform/x86/amd: pmc: use FCH_PM_BASE definition
Message-ID: <20250415151326.GA624550@yaz-khff2.amd.com>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-5-superm1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415002658.1320419-5-superm1@kernel.org>
X-ClientProxiedBy: BN9PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:408:f5::16) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f1c741-0e1f-45fe-50d8-08dd7c3015b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9BM+vaqVPEOP7IFbvvDqsY5m3AKei3AyTs4Tvsrn68W81IkfPYCi5AhyB9q?=
 =?us-ascii?Q?I5C5kHINtVeTPbMhhZA+WKah9MMvjGEUlz54nWYjTnSY6WQ/W+yej+aO3pKR?=
 =?us-ascii?Q?b1zVxnAO/bDyEia8YvuSJvCHsREsl/XP2A/zL43tA5uCrzL4miPK/6wTnaBm?=
 =?us-ascii?Q?tmFn3Jg/TScoo+nmEDoMAJOm5LjWnPT6+15venwdzQ6ZAl92863Uu1ga38Cx?=
 =?us-ascii?Q?AIELx89pF63zqUT7q6yHsnixmxfVRyw85N+WWQDh4lpRWO/BgK6XSU7VONzD?=
 =?us-ascii?Q?ax0JXHh8xE/Qb9LnFu4GtZeuYJ1o4utS15Y4CdL7RhI4HFnPig+QLnQJ9lF8?=
 =?us-ascii?Q?v3Ux843GvsmtCMwKy/uBhw7WH0qoNyYW53jgERwrRmfYwRMdmRB8RTPO+zAd?=
 =?us-ascii?Q?1+wdnmhMjVkU5Iru7E9ZeqoASA5aOmpz4mJE5/RzlT5VOH71IfiWEA2qQIVX?=
 =?us-ascii?Q?d59dcr21UkZTQ+PioSfvTTBv637K1Png2oaAl5LdzjNbT3XJiwe+mxiCltMR?=
 =?us-ascii?Q?D6ncal/4vRYWfHtKW8MFAhX+gatWPgczgN6ay9FdoKQmDXdKyBkViMczSIXx?=
 =?us-ascii?Q?vnq1HmFnBvRKc+J1onGu1Z6CY3jeEMY06C1TpQRsu0+wBm0SQ/Wwetxtsjyl?=
 =?us-ascii?Q?y9n5XNm8nNr6ob3Gje52abIOz0OoXdBfc5RFMwS2HJ0Va+OXKKRoNkIqriKc?=
 =?us-ascii?Q?L9zpw2gt16diGKYywz6I6zaiWuT2ZF5DXql/cHuf7y6qxmjDnlTE+BtaqnDx?=
 =?us-ascii?Q?o4Pw94H0RTCJPBa6lUICgfH2YwCm67zpJ9bBDv2iY77iXKGX8FCfKSFm8qoR?=
 =?us-ascii?Q?moBQRBJBcufxykt11wOeXxvLKccx4GOtuL/HeAXwieQoM8urjgpwWQrFThDa?=
 =?us-ascii?Q?7vnee/q6txgcwXkGXuFjK3zBrTUIXjxySUNu4GlZp/Q7GT4kXp+OenFYEe8C?=
 =?us-ascii?Q?c6+xp8+Dy8rZrccwNQEMdWYAH9t4CC6tZniZA+d8NScuTFHGKHMz97HzYv/O?=
 =?us-ascii?Q?S6dDEeQKbiy1BgBueUCwjmX47PfvfXKeZ0oTzexEwLeb+nj+zHHJaM8/aWrj?=
 =?us-ascii?Q?KdV8szcUjoXget0Yf0NsEPQag19fLfF9DionPldH/Rybdh4ZsreOwKsn7nCt?=
 =?us-ascii?Q?KL7EjXMwm0Sax9W9KQDZKU8n8RgS84ayOVUX09ZcpYgntHvXnWBNIjz2C19S?=
 =?us-ascii?Q?rMj6tTLC7gNcPfWKpX0aZIeWfPDFOyuTX99otDtbTseGD/ItXkVxoMQuvHGj?=
 =?us-ascii?Q?jRNv1CJT2xkEg26J936nnHf5sTIiqALv8Tpr8ZZOclD0REpiX8J60SKKgVqD?=
 =?us-ascii?Q?IvOnC5W4o35H0QCPa83+rJKGeFs9I/hHz0hV2zq+0E6VuL9m5W4ilMuaeh4R?=
 =?us-ascii?Q?qyVp4zfBJba87fQRdRgNIGUlLrK10ZN0Kh1FNDwXUN9iNtAnwg/JpwhhrtVy?=
 =?us-ascii?Q?TiW7w6VgKoM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?auAQNFrswvvJ7J8e6IIgYEMHal/6wTnFmbSBSr17iX+kIg/4RIrc2NuNbTbz?=
 =?us-ascii?Q?PtrwjIzx9Ddz8DCVqZi0EEmFW9jpXq6D/Gy9tfUe9paiN/joiDmw1ZdlMv5c?=
 =?us-ascii?Q?rAaa/RK1PL1HIb/G6ulUta6er7UUF4LNudI/mPgezGpxS2h4eO44/5L5Bkyr?=
 =?us-ascii?Q?j6749Wnkbc2B3wikgCwE1GdwmSju7/nXfX7q6LhD1AUAddezy2B8b0YSbQ1s?=
 =?us-ascii?Q?goqgEvJUHqmZg7qaTln/UczfNLjKbFgdihNOWt0F06Gj6gxytPHl6tThLVeq?=
 =?us-ascii?Q?9WRtHNJJerLygEEHCLUxHAcmxpU7W8mf+vNqi45ONpqmSm7eUmQL2frfWRLY?=
 =?us-ascii?Q?wBCwzsXKY8OQscsiQ+A7uTUIg54g+b6EIRC/TUrHoJNLdLI4zA6kYwoxxC5J?=
 =?us-ascii?Q?X0CAVrhPPru6pmGVtsaKRdoPUHo5tRxhKU4vVNc2Km6KhVJaDKG3uHuBD4HQ?=
 =?us-ascii?Q?Eg4TOx7PUa34BpxYJwS+LyCfBuQS+Z/U2JYtl6rgBUSLsovRumyVEwWX2RQ8?=
 =?us-ascii?Q?H7ID3TAfjCnNLk3pt1GTBLBDUUBMRes41fgTgQnMz2NJbbG2ciFFGi/N9PLT?=
 =?us-ascii?Q?vBha5aKx7a6jVC/AAdNLW+Cv0YYc+tp7wbbxpNpI4RFaUIxHpl2EqDUXkRv3?=
 =?us-ascii?Q?k/mKH3gES8p1jL2+TfFMZImghkXUfBdhMIasPTMF7xf1QIIx5Hc+Ptc0Kxib?=
 =?us-ascii?Q?9y0kbQhD0g4hYE01boNwfgsS8k9p3IDbG5C1oUH5xmgrGBB/Tmk00C9GNaFU?=
 =?us-ascii?Q?SuZmfHV38TJPYh7HoFWlX5TG3OAzO5JTGN7BqactHHAkdA+DpQaDAta4OLZc?=
 =?us-ascii?Q?85p3aKDksUw5BoFO5B/U1Mh3zRncfr0TY0z4tPMOKG7GRneDtasu2ES+wSWX?=
 =?us-ascii?Q?uY5jB6AOGazdsOp5ugRsK34rrJ4Xs1BKFXBui755jTxEOyLjBM6gpu3xEfVZ?=
 =?us-ascii?Q?TItKN5aPpZLhaYX6meoIXTa6w1EJW4UxTwgQr+AsRQ0vltOWuFCi32c7xG6X?=
 =?us-ascii?Q?miqy17lXByOwnHbBdMDlPiNaD1wKYy3QHe6CkU7g7/BJYEuT8232E4jcJs3f?=
 =?us-ascii?Q?mxN8v84OeCDdEFaEQmiSg1gG8Cj7xfxjBDOIDDVkukp5vsZPA7MoNQbUkdcp?=
 =?us-ascii?Q?yAmUCL6jG15ZAMHtu+RRiEQIbHwyR+wNAinEibD+bm0rAxLVvTRCUHRRm5ng?=
 =?us-ascii?Q?O/au582endbolinj/rUWYUJxkXMKoLLW29rnSxDH6MDfQ8nH8kaYKA2gfoOm?=
 =?us-ascii?Q?9irkOM9TLxLtREplgwO/p/Wp+Z7thccmPR6lgP9PhbNAQsexCoUX5afPoCTi?=
 =?us-ascii?Q?xQypzJokbufT6TuWe45/XJaBK4HdTyjAbvgmh2xuEE77+G4NmN3YLUnzqTw/?=
 =?us-ascii?Q?H+F1YcVqIGdGnqTROPMy232aAAyPiwtbGiTdsDsA6pxHUsxxbYm9yTLhqOJD?=
 =?us-ascii?Q?vXtyx5icxmpwbaDgmtmdbogkP7B64TItLO+4IA1SgTCx8eWE1SQxRBZAqoQn?=
 =?us-ascii?Q?91BeQOB4yPhXTTuAWByUwcbAHUtzADDdFa5EcgAtWUMqUPUHPhKVfITdyRTF?=
 =?us-ascii?Q?X6XntAeDtVjPrgmI6unzed0D3vvP6kF0d+96yCYh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f1c741-0e1f-45fe-50d8-08dd7c3015b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:13:32.2665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdX6yu2nlBqtpwhYiFtAMdVKXej92JX0+EShB3neRmkTCuSax4uWfHw10rcVSqedC/MOQo132P+EO/wUiCWOgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

On Mon, Apr 14, 2025 at 07:26:57PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The s2idle mmio quirk uses a scratch register in the FCH.
> Adjust the code to clarify that.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v4:
>  * Use fch.h instead
> ---
>  arch/x86/include/asm/amd/fch.h            | 1 +
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
> index a5fd91ff92df3..9b32e8a03193e 100644
> --- a/arch/x86/include/asm/amd/fch.h
> +++ b/arch/x86/include/asm/amd/fch.h
> @@ -8,5 +8,6 @@
>  /* register offsets from PM base */
>  #define FCH_PM_DECODEEN			0x00
>  #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
> +#define FCH_PM_SCRATCH			0x80
>  
>  #endif
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index b4f49720c87f6..3c680d2029f62 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -8,6 +8,7 @@
>   * Author: Mario Limonciello <mario.limonciello@amd.com>
>   */
>  
> +#include <asm/amd/fch.h>

Arch headers should go after linux headers, I think.

So that arch stuff can override generic stuff.

>  #include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>

Thanks,
Yazen

