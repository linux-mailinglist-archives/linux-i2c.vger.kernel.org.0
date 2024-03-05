Return-Path: <linux-i2c+bounces-2196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26717871C08
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 11:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7759DB23634
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 10:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520975BAD9;
	Tue,  5 Mar 2024 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qR5WPS+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6759B7F;
	Tue,  5 Mar 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635353; cv=fail; b=YC87lJh8FOt4ZO32jHFLFYACa3APJ53G8tVRvPoeKg+TmrtEeM55BgViKZvdQsqy3uZF4XiVLV72aa4k5i1R1U7t4uccIZNZTjWcEQxNcYBiTIeAtPGIAkF08aCgPRxODfka1bJQcdJ1ZVD7XDnRrixK9u7gfPza52Qqy91fkho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635353; c=relaxed/simple;
	bh=evElfAEj9gR25VJSpkv+4CyosnQNOsaFyPSC5H5zm4k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6bCXFTLkrIzwa6Xn27iXa7RizHoZBdJ0YCRhN9tnZVZrdQj/5fM4b1V07mPtLkInEJa3bZv/DaTipftMGJUT1MJkryxinocpnZ1GMnJnmHvX3UzEXKfow5fMFp8h/KbkJ1YhgpKNVw/pbg6r+8i9Vhn9NorK5wb3Z1YtlDaPEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qR5WPS+T; arc=fail smtp.client-ip=40.107.22.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2P/oHJUYcOVWA16mR32vEojjEI809KRohKRMbJumCoE3F5nch3CitmtgJShU6B05PKQPCFp1/xxynPssfFsA4nivLIVVNOonrhgALND5ILFOODCZUjnnVsmhG82Qq17z7Rg+BZewMH1Hl5McJycag5AKgleOF3tVM5R8PoZZN1DVXJd9XYQfBH2JqVFJFu+ZrTxWgi+g0sjMDgWrGs6bdNva4NFPw77rF+J6UqEncJnoYqCPN8IhlCjbKBXNoPIiTYXU5chVyY/LCrz2jZOTzkkzmxdLRHlCzdvawbfCyIqhRmwK3oPaAASF9nxZ0GvDZWyfQ7k6yqTQ6vdfs/3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKSfWfopwpRmf3e7aWi9+Gru+dJlvk+BfCPeG4Iqi6g=;
 b=XrZ5DJMR1k4B5uZw07sB0O1T4kSr7S4BWmh6pCplGcNVteksMhZqI9tlLD2HGbQSFmVK/5vtrAn3ZQI7lmzwmBhLpTkNo7s4YgskNDciepfXSClgZ/3TsznlTVrD107mZxwe3yPhh+8BK9ep1anwgmgrJPQGEwgb6+WnZUQnxQAhVWoi/GMcQfSL05KDF7aS/PE6ogYsLxywHqB0QuEMJs0qF5FSg7a7kRlmbYEVpCsp025o/LGnHixgs0x5d6jG5HTUzUj34WziSescyd1GYdDoLRJwWbAwzQeiq8Qz8iNJN4ISFHoele3XQrV0LZxznWoWp1bF7X3UK+4bjCj/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKSfWfopwpRmf3e7aWi9+Gru+dJlvk+BfCPeG4Iqi6g=;
 b=qR5WPS+ToOzycI3mOO7SJgw1YZGjxInwBjVyFdIpqARfswUeyYkFsR3hiR7rmvy87jfioghHJ2hUL183aO8iDIBGyg50ifb7WxhtFWig1zRCBmSrNJwURwMMa2A+PjdyF/8Qeg8Pv0PGka1hPt88QmFGd5cjBUp490dn5s0alZY=
Received: from AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33)
 by AM7PR02MB6084.eurprd02.prod.outlook.com (2603:10a6:20b:1aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 10:42:27 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::a0) by AM4PR0302CA0020.outlook.office365.com
 (2603:10a6:205:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 10:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 10:42:26 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 5 Mar
 2024 11:42:26 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 5 Mar
 2024 11:42:26 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 5 Mar 2024 11:42:26 +0100
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2403515AB7;
	Tue,  5 Mar 2024 11:42:26 +0100 (CET)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 2A0E7629C1; Tue,  5 Mar 2024 11:42:26 +0100 (CET)
Date: Tue, 5 Mar 2024 11:42:26 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Naveen Krishna Ch <ch.naveen@samsung.com>, <linux-i2c@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: Re: [PATCH v2] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <20240305104226.GW30969@axis.com>
References: <20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com>
 <vk5s2p43v7lmmuwh3mzvgqetu4luwodmkejf4va6xyxwgdn5eq@ej2mjdii3rle>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vk5s2p43v7lmmuwh3mzvgqetu4luwodmkejf4va6xyxwgdn5eq@ej2mjdii3rle>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000193:EE_|AM7PR02MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: c83f665b-3e80-4765-b98d-08dc3d00f31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/QE/AYggXJh/qgzq6Vb+yMZRBlQP12JkKl8vGqHnr6A4XTDlSHWfdZ+gXDQJ+ewfACll3L3QBS2FukG+w6KFEPjE+7FQBGFVAIEYbukJl2elSqFmHDdcTRTWYt5pk68fxXoJD7s2MD/yrM5kX5bXLmVlaFDn7NyRYarFSZb8KD8xopZrhpj/TRwc1fo1OO+2tUd9XhBighR5VmZ6yyzNgRK1PQYdz/wQVH5eLGySNqoJQtGOlp5qBIfH7uoK3ydi4yLXWYLjWBFlm0i+jc/6/cs7NcBv3irAVz7Qb8IyZJWP6YbsWxLOhD4kLnNqZVpjYD/PcadkGDIV/P+gM3TRuaUWl8eNaaU/YWWaN4rSSj8sNxXi1B9SUo9gNxL9Od/VZDEoQ6OjGxiz+SjHxUtMRMUgU3jJtx/FTzVBckDocdIp0evaUUag579CCMObvr8k2umVC5NArKayKMSwu8qBoLv5Iqol7y/aNbs630g7xvwV1bwFPBBTdn9K3JrDHIzKsCjZr+X76rdPsDrgAyJ5p6+EO7IXSEVXIIlhvgnk4lfs1K5Cu4pZNMIHcRjcaK/cvQ7Sc/mHBLftYQuyaGUINmxk4+ShGtfUw89P8uTqZL2vHJV/2KxaEDGs8na4ksWLxG/s3WeBJBW34jAUTSjhkUfiqBwRQKllu3DfXgDaEhz+oTcQlb0fN7+mCEobeNAYvVQ46uqAHNuOUeiWp8LxKeeieWlDauTmMLRpCRziRxHI49FFHP/R1D5EIKN68fLy
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 10:42:26.7692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c83f665b-3e80-4765-b98d-08dc3d00f31f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6084

On Tue, Mar 05, 2024 at 10:53:13AM +0100, Andi Shyti wrote:
> Hi Jesper,

Hi Andi,

> I have taken your patch in my testing branch, but...
> 
> > +	/* Clear pending interrupts from u-boot or misc causes */
> > +	exynos5_i2c_clr_pend_irq(i2c);
> > +
> > +	i2c->irq = ret = platform_get_irq(pdev, 0);
> 
> ... I get this checkpatch note:
> 
>   CHECK: multiple assignments should be avoided
>   #60: FILE: drivers/i2c/busses/i2c-exynos5.c:932:
>   +       i2c->irq = ret = platform_get_irq(pdev, 0);

Hm, that's weird, I did run checkpatch and got no notices about that.
Ah, it looks like you're running with --strict to checkpatch.

> You are still in time to fix it, or you can fix it later or you
> can leave it as for me it's not a big deal.

No problem, v3 coming soon.

> But, please, next time, make sure to run checkpatch before
> sending a patch.

Yup. I'll run with --strict also in the future.

> Thanks,
> Andi

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

