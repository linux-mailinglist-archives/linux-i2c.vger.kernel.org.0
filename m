Return-Path: <linux-i2c+bounces-10422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC9A904F2
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 15:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F09931695B9
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961C224CECE;
	Wed, 16 Apr 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5p39olG0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470124A06F;
	Wed, 16 Apr 2025 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811103; cv=fail; b=c+/cSBjD7nkUUK3ELz+3yzIyCXikRVFO97FSMbbsvUO1DNrSv5vgxIduL7mzrpQG8zvNhHgnwHyMiQTEQAaO2Fgk6TlGeUj9QK4XRHjovfRyOiUiuqhHpg8O21Rh/AgKtdYYrFEqc9WIkNY4eInOXI65uG7atcfuU7V3zdO1wWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811103; c=relaxed/simple;
	bh=xRueZZ+GzqtIwsLHv/vUGqVXZBqWYiwHeR00N78FBho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nb7TMs4pshhElGMCIeX0gt4GgLlxZHn+TJ7MorfiZLSevpOzqDJonuCXh+fEWMWiMcebfXqXdheHjpYwEthu6OH2U50AsjtB2SgRfaS3bojiHTJW7edQtxh+FLxi8XvV5gOYEbMmo7MzEeBBfgRE8FNA+IfW09vPFs1g04dYWBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5p39olG0; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1mtetx240+g2mKBCpQplq2a18AwIsF0qfRAlpS03WDHoISDaZdIWm5UOyfsc1lH8aqBYWpcb4Rtc841mOypJxQzlNsRvvhxBwW5f//ek2MkMupDY4qlmH0fNsmuuFfLu2T9SlDqugHfHsQo6XANy5oCTauysP/tUzvLigEB7+ubKud2vG2+I1iazw21lf00GiVdNIQZU7ZlempNVfjOZWSsBj+V2ooibxZ6L3uUKzy8cUuLMe92O21R7yyWaLLapue8hfX8fcap2x+EgjZnXnz5+5AOk01XFMTnImLA5DgxkmM55NXXVfxSazk+c7JNosyzfRsEzRqY1Mcer68C7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCdKAh5yTMNwTSbqqR8F20iXc+TNwTfwpgVLp1DsThM=;
 b=pqgdtBVkwdwiPjq9nkMbRGBOaW1odWjQHcIq2k6vB+vi4GimPYGKJgrj1cPCsgrq0npH2xh1xHYnzgijvVcZKQclNZwSfUmOkjlaTtQSJxIjxI1djucqDTNHm1LcY2QBuGx2gqxHITodVT3Vh6WgTLgJtstVK013Wq7qOtLCkrhhKxIpgJ7esbhCqn1RglLgRxTauW6UJyiqNytpPoH1Otje6BjJjO0rFv1Mk31RVdEByO7t4eS75sR2c5QBUshq5vScM3QxAy/G74aFIMQnJLfNbZF1IDy7gXu5qK9vbxkXcb6+RmTKhsT0ALj04tVU/p2ZyhbcqfGQ0oB6m0LZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCdKAh5yTMNwTSbqqR8F20iXc+TNwTfwpgVLp1DsThM=;
 b=5p39olG0LC/eDO8TmPbkWNF+uw3ya+PSDCNtIkD4PztNx8A6WpwLg4jX066F9u/FuRyI5WaAVSuowqoZ4LcXPzrMYex7VEyeUE76wnFT6ERx3NOPBq84w1Moc5zzxdR/vFnPuBtvwzWqG1tYCcKyj9dEYTECo+NdyLCoSqB/NAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 16 Apr 2025 13:44:58 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%7]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 13:44:58 +0000
Date: Wed, 16 Apr 2025 09:44:52 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
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
Message-ID: <20250416134452.GA918127@yaz-khff2.amd.com>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-5-superm1@kernel.org>
 <20250415151326.GA624550@yaz-khff2.amd.com>
 <Z_9jHCpbTciJ8d2_@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9jHCpbTciJ8d2_@gmail.com>
X-ClientProxiedBy: MN2PR14CA0010.namprd14.prod.outlook.com
 (2603:10b6:208:23e::15) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aca8507-341d-4511-40f4-08dd7cece05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gp3bLRu329OoeDk/Hjb6CYdbpEXcfV9cJawWAhPLawvN2S7GLaIRe9JmJJmU?=
 =?us-ascii?Q?wnd+yLPuUNPZM1t3ayZZOMHKnERW92yKLkVRvAdLdwJnjDQwKTl/wTpTVZ5k?=
 =?us-ascii?Q?bmibjjhT9+nGC+Kzk6IidnU5wjxLqN+zTVf3I7IFg85l2a7Mk8kRpRuI64mp?=
 =?us-ascii?Q?btfy6mAQt4mWJUJKpTQEgf4W5c8balZJWaXVnLlIqET2YDte7dg4q1eUhP/R?=
 =?us-ascii?Q?bUfDU3SmLj0X/aq4lcZ9LdJ5q1htzyRoWZy+skgKcZZPRVNHksDJd1l5TAnK?=
 =?us-ascii?Q?CkW80dc3cu2TNjUxELSBJZVFPjSXMzkqWKetutWz5jVZE7u9CxC3uNsv/cTo?=
 =?us-ascii?Q?9GFUAsodMMMiN3JU6M6lZdQNGrETvC7oPoeTcMJDETyVWsU4cG1W0mg3wiK5?=
 =?us-ascii?Q?fSLphD3D+rTdWYV/vxSQrhOM8AA9EB1yWQ2Y+EOPMpuYbn3vhfcJW0njnXQ+?=
 =?us-ascii?Q?gd+YnhpwxvaIPkdi88Q6p99aPoFd/aJTH33ExtgzhZ9Avu/K8rYxZMiRw9pv?=
 =?us-ascii?Q?KBF+OntMHSjlunD80whqElMQyLRVhk4bgdLnRqH+t72S2Oya/jOhdiHNRTff?=
 =?us-ascii?Q?8n8FaNv97AtYzUNB+K9QqDYOEgIpExgAx30EfFwjpUJn9SvJP0EqaX4qrUg0?=
 =?us-ascii?Q?EbKwz2/ky+wa7ZmIsAqjKCHnpxpAQsD4H3d5H930xEZpaaGTBc5+nJEdfhzq?=
 =?us-ascii?Q?1i4RxJO/6HDVFcvnyiFHtck7JgyjKTtyaWKk6WxQkcliQzYIxAuj+Gi/pTZz?=
 =?us-ascii?Q?uW+/OYskBJN4AB83zErEF76BgD8MZODVT2/sNTWCF7rWZCYntCJTYEKcM2pP?=
 =?us-ascii?Q?6ySFZtJ5EqsDrU6/A1V/ye4wgNakszOT7Lxocz4sV8uLn+PZ+O+TW4PfQsIS?=
 =?us-ascii?Q?V86i053McM+JuPD3ZqXYWoNn8wBEzfKeEB3V2t4utXkmWQMLerW+9veUhKy5?=
 =?us-ascii?Q?YzmcrlReqH/x67ifqVM/JROVV6qQPZJ3YeMk9BwwZ6UDJO29kEHm6FY7qzfn?=
 =?us-ascii?Q?WmYCHXcT4t9Q3XrrzMNaHGxMEVSD4/NeRvSZBVhu/Cw3g/ig9l16r6CfgtuK?=
 =?us-ascii?Q?WO9nNQnYIIrQQ3JcW4g9aV1ZwqsFrgsGmb+OZ/wOILquVA3cIzRVuMInRJRb?=
 =?us-ascii?Q?WAFIQYKeCPuJrA199tt3fHeyC2KE/nvqb9cUi9C4R/KLhsgm3bfQxX1hCQGs?=
 =?us-ascii?Q?58RNEd2cdOSudpUNCv98G5THjikxzXFG2clEV445ivKdpByvX2h+sgyQ0MhN?=
 =?us-ascii?Q?cNlyiMgM4hPMWriycHmygwkkbNqIYdANUvAeSdjZapIPU14uHKCsapy0/bnV?=
 =?us-ascii?Q?Iq8FA0croxAVc6sWZfGuxvAPd4Zm5PhkR4FipxfuNjty4gYo1+F+2UKtO6vi?=
 =?us-ascii?Q?FN8Dpq76bJT2x5AHINex2kTXSd4gAinpkLJyjwxiwZ7kLB5LlmZrbr3zxYo1?=
 =?us-ascii?Q?jOQ0FLDbVwA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9MPpKE7Iz6Pfg6XA0Y5xYxMtf6OSOpVm4o/EigJ8OadEIprfuM8J561iBEP?=
 =?us-ascii?Q?/1zmUjHiEcs78deOVsvMpupP/juRoLit+wAG2l5vBQ/waQuFUOuBpOHgFDEi?=
 =?us-ascii?Q?z/QeKzNPNa3oNI6jprq2U7ObPqWHIDB1cgrel5E9nvxOIGlR5YIWB1FaTxKh?=
 =?us-ascii?Q?jEJf84rllBXyIaNEItwNWu+9bR8AMG8OZt72OI2zACHriZ+4xHiKA7FtN5TR?=
 =?us-ascii?Q?m+q0TR/2aLTmomFkv1zgLY1Bkb9wIMKS9KmM1ruARMH4pQrLQuA7RmIZ0HJU?=
 =?us-ascii?Q?PTkod86pnyxyI2AHxtB/dnrSb2opZPXDY/csaFOQOeY38xWwOOhCj9S4Jv+Z?=
 =?us-ascii?Q?5qH8HR6st8/FkUYf0ZY6XNvxcrw0SrgcxGHvUePPpuCkU3gRv9U2DiB1Sb9z?=
 =?us-ascii?Q?sJZUSZcJGNteNN3mLMGHch3qxPpqsSJsU0TeAYiuIWD+l8gDpvgh7blw4gJZ?=
 =?us-ascii?Q?fp/y2EdnnImh7OocsfqrUlXzRKyWOGFYfjwGH4zoFalBJz725VdsSiUeDFnh?=
 =?us-ascii?Q?vAlkasxPhn8T47EE+IYJddOUTBgOdl2229lMp9pNkCDCMSTxamlyXdCaY+Cs?=
 =?us-ascii?Q?dTjZpftNJq49eYedaeesfYLiM5XnIiTAMgAXDbsmkR4OD/Lf39WxFrnT0tEW?=
 =?us-ascii?Q?tc74kgK3t6IJdnEZUzgQOFoe6QINBaUYq0pfF2mnYOAMgzaqj/axGTIQJM3I?=
 =?us-ascii?Q?RvSZB4ZtLQ1k+3JE42MssquiXihm7r6+Q80oDaGBpMbL2M8RdtSyyXXZtCDf?=
 =?us-ascii?Q?rG8m690EZ9Sb7b140nF7qVekiPhhvYFzghiCEb9H131o0VlWtxI8S5y+w3j8?=
 =?us-ascii?Q?YNLoWMOtTBdxQqqMCY4KGP8kbF+hFx8xoPOu+qGxaaARXEmRecU5RKQF7ht5?=
 =?us-ascii?Q?aK0dPFsjSEtynQnzFc0ftVlf3xecTHTMgwBiEfropHjAToiumKmTJ+KftjIi?=
 =?us-ascii?Q?hqLRRMHEsSIfl9WwfH3V+n7eP/MkQ6DLZmUSKWhSs8rbQDmjTgzYIRVStm3v?=
 =?us-ascii?Q?IEoIj95AJXZ+vVNRaPS3AF5vO9VZhp4/rKgBMYXRNnAg+4Pz00Wny8s+ilZW?=
 =?us-ascii?Q?+OhrlheLhlO5IoZpgchnF82GOWJwL9LwOhC1jMpiL9eifbMM9P5qGXggZwBn?=
 =?us-ascii?Q?x1OqRg79YCcN4GisuWySN3Nb/gvJZ6Z2ZzALgPBUbdU8n5mo9fg7DukUKzi5?=
 =?us-ascii?Q?VJzXc8HXWJzUz4/04L0K5LKN0OlAxkN3D7kNYrYibd/eChsgnlQQLlg2u4xJ?=
 =?us-ascii?Q?YFu0Jf1KC3rCtknGLCUx7WLSMUScrkHalWbqdPqzSk8nVD9WeonKxttNmTYT?=
 =?us-ascii?Q?U9HygSLTT094YzdNaSKf7T91PYNtCEKUE2fIOfYQmo9XPBmQjeWDbGqsPw4C?=
 =?us-ascii?Q?3w2DQgCQrJ5ozHxYqos3yY33th+RZIhEblMV7f+0VWuRNvq4n7GViODmNzoZ?=
 =?us-ascii?Q?WtfPCX/tzQyLzUf06lZeN1D76HN+VFmRgkfqG1bPlqNuQTjDQ794N6asO2rM?=
 =?us-ascii?Q?xg+7DPd+ZCjkhTVX0uQpd2tRE3rce7JSWbo1/p2HqyEIBV41/voxvH+G0eiT?=
 =?us-ascii?Q?6Ehjc+r0+ChcW9TO9gZqUi+mZrfN5U2gGoYl+rk2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aca8507-341d-4511-40f4-08dd7cece05f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:44:58.6414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+AbM/WvSBUD7tN1psu6K3KaG4OedkHSSzWzq8DLil32+1brgRy0+oLPRllYg+HvwylLriBCwpNN7sCiW/Go+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744

On Wed, Apr 16, 2025 at 09:58:20AM +0200, Ingo Molnar wrote:
> 
> * Yazen Ghannam <yazen.ghannam@amd.com> wrote:
> 
> > On Mon, Apr 14, 2025 at 07:26:57PM -0500, Mario Limonciello wrote:
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > The s2idle mmio quirk uses a scratch register in the FCH.
> > > Adjust the code to clarify that.
> > > 
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > > v4:
> > >  * Use fch.h instead
> > > ---
> > >  arch/x86/include/asm/amd/fch.h            | 1 +
> > >  drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
> > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
> > > index a5fd91ff92df3..9b32e8a03193e 100644
> > > --- a/arch/x86/include/asm/amd/fch.h
> > > +++ b/arch/x86/include/asm/amd/fch.h
> > > @@ -8,5 +8,6 @@
> > >  /* register offsets from PM base */
> > >  #define FCH_PM_DECODEEN			0x00
> > >  #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
> > > +#define FCH_PM_SCRATCH			0x80
> > >  
> > >  #endif
> > > diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > > index b4f49720c87f6..3c680d2029f62 100644
> > > --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > > +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> > > @@ -8,6 +8,7 @@
> > >   * Author: Mario Limonciello <mario.limonciello@amd.com>
> > >   */
> > >  
> > > +#include <asm/amd/fch.h>
> > 
> > Arch headers should go after linux headers, I think.
> 
> That's true, but it's a mostly stylistic requirement these days.
> 
> > So that arch stuff can override generic stuff.
> 
> Arch headers that override generic stuff are very much supposed to be 
> able to build stand-alone and in pretty much any order with other 
> headers, with very few exceptions. Ordering dependencies are very much 
> frowned upon, because if they don't trigger build failures they can 
> result in subtle breakages.
> 

Ah okay, thanks for clarifying!

-Yazen

