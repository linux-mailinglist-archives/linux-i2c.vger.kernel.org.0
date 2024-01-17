Return-Path: <linux-i2c+bounces-1361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAFE830E10
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 21:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1DD2823CC
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 20:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B5B25562;
	Wed, 17 Jan 2024 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ETD62udH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09132555D;
	Wed, 17 Jan 2024 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523757; cv=fail; b=d2RwogL4YUB1manyMi+FbanXkksxPMXWOoTyDmOHuzl3zFng5D1L8bCI7IHdx6sxLloKp0jV7dyY/0nnkWFD8D779pstpzUvCn9//yOwQDgsq/hiUHHsmhEkpvAkn6nk8YbHQKVM3s2pol3U0BSwdQASFg4i/dcBzDngsOmKls8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523757; c=relaxed/simple;
	bh=bOCWt2xkcoe6t4pXLVbwHboZsFmdp+4IxrItzXLzIws=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:References:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=eVJ57DRT2XmjjbAUFK3vChGcw+qNWc4aPjNJ5jL26WoHK170uzXCdcROjcEGngXbHlKsaUn9vbfuBcq1svSXlWHDim84aS3bY/dKfipJ1fliD6kWsFtD4weuaQTyIDZrxK3MevCDeLAtSMJlpFVrbaqb2oNTpysSJ31VKcRBglE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ETD62udH; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE4io8L3uTawC3FUPk324zZtvBbeRLDrIz62HSK4qMHYHQyKzpZ4A+enD2G9vGFtvrmiqj2SMZo+YSBY1d2a+yXpaQHG+pwZ19OYPAhaXRlbuoBvAMtGzRAiXwPugUA8e3lPNSSbNHApOFL7cpt78aSr+vnRXDYIXzEffTSt4xxD2ZKR807r2X5UGSsuYEaWWgx8YW2LS/ahk31pE/+2C35+QK/Je6cIp2Kd7obGCdOqbUz0oxo9vGizdVKeRnfFbiiWTsGkDnhgtsvfqr/mx5Srs7NzE8ilX3FFHiuEbi47rRxB3VtT+Blf9q1pdXX5f4RsG1uWT6nLySO0eXKcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwG+imgNQPUhdZul+IXoKcRe+qVPD+YESjND++2vfhA=;
 b=BwEWzlED+gXl3Pmy0JV06MrmDiHtb2fa31avNNc9yPes9vt4Wnlh12pVkep23sxbUMFLYwglqdhf/fKxYg1PFMBgapHvluHjP5avICavXqvBwkOJ9hWwaB7OnUg0pxWSKzz++fetBIHizr9i9Qw0Tk68sZdD+zYizrHok5KzCtCUOH0DYoVn7EH3MxIEQ0X01h2Au0om3qLpq98eO1a803qhnYXfHQFVzrln0Lu70a96sFv8YTQUCMaZ396imxAiUCJ3FMSHSY7JhfWV/YE6KCy1ccBwN+6LNPNYivBpBImyG8h7TEDJJzQejb+hheUqXMjRJvAshXWjaLvbuG32ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwG+imgNQPUhdZul+IXoKcRe+qVPD+YESjND++2vfhA=;
 b=ETD62udHgcm6F0SLmJK7ABpQVuY7lKlEcGHv7gkJvTBuJJ2Jf7nt1mbKa0nD+2zZApnQn2MvptnWlmECf7puO6fqy8S5qJkqGUwkHKVyxCTml8GapRWrmhVx8X7DVMhVCpwLjkl/jNx+kIAzHXgOfrVeY3NmOmeIWX4Ey195dpM=
Received: from MN2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:208:a8::17)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 20:35:53 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::39) by MN2PR12CA0004.outlook.office365.com
 (2603:10b6:208:a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29 via Frontend
 Transport; Wed, 17 Jan 2024 20:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 20:35:53 +0000
Received: from [10.236.30.70] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 14:35:53 -0600
Message-ID: <30730c8f-d8f9-4352-ac90-ccec153c32f8@amd.com>
Date: Wed, 17 Jan 2024 14:35:47 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
References: <Zaa2l48Yx1AeCOLs@shikoro>
From: Kim Phillips <kim.phillips@amd.com>
Autocrypt: addr=kim.phillips@amd.com; keydata=
 xsBNBFh3uA4BCACmMh2JZ9f6vavU7XWTg45pl64x61cugDKZ34jiRLohU280rECk+kyXrKGB
 GdtV5+8tZWhMCyn151/C/OEYIi3CP5DY6wyrjbFkhI8ohqR4VqyC9gWAqD25coTQpOHyt7pd
 8EvSBDAuL031gqw5w6JNeqEbMplZeToy5Rgdr1i35MZOzyIaO01H+F2/sOL7qk6pY21y5Flj
 ojjFT/uWg7eodnOu/BJ1Uem6FaO6ovYSAMOaCs/GpguznsS76ORsH6Jnyp6+e3KlZe/F2M7H
 5HWCVsS5np2rf1luDsfHKV7HCd2+4iFRhxjbbulSBRMn7zx16PEGh8ccNwJm9/nwof6jABEB
 AAHNI0tpbSBQaGlsbGlwcyA8a2ltLnBoaWxsaXBzQGFtZC5jb20+wsCOBBMBCgA4FiEEaBZs
 4ROWXWKVJWj8Z9viHdU8iO8FAmHm/zMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ
 Z9viHdU8iO8aXQgAnByD4TUD+xGXXDAkIopwqip2Vfy3qzNhmfzdvLxKxsb6I6Tf1l2pMPGP
 EHxDPfuQhheyh+iRWrba6flwBGaNriJTFuVpQUGoRcjV11F2cpEbToqv2LGPaXIpc7IxEoRt
 lg9VKr70XcRePKq4iH5e7wrmzACP9UlvaKlRJl97FTckZIguQQMZe9kqLga1yRDqcQVN5Kj6
 IP6V8WzRz0qGpVE1GE/vjYH13o2qHrvp9d/zlPBTZFwhNpLBn4JHohyxQ63t7eZ1L4U66Caq
 jZ0lhdN/psHJWab0SeIIRAG5+WLMcRbx3+LPjzIyrXJSonsm4t5lU3RmGmWwJSunxGDu1s7A
 TQRYd7gOAQgAp2VJv7J5eaWVdHvazWijdobOXSa13GnV8DXENQLQSSQlxGkLkYa3nDHr6Xjk
 z2NPFn4cf8GgMd7Bd4p3MR6DbwA4qKE+8ZW2x4XdH///HGDDEI69sDZEzLPXgl/9dv49dxym
 Q/nuco2KtF4xaMS/mjRsv7Eu5oGH+2+vPKe7L8ykXUh7SJmr0tI2/y9A6MVOPckdenywmKQ+
 6R0gw6aL2OeUyWZLS/e/3+0zFmQxeTyHpoJb8cNk/XqUGsBXsTO6y+7fdykpXNCfeJL/bSGE
 SXgwRROHCnQeKwVbbvEU/e5GZlNnKXoD7u2jyJxt4NTG2c0Jze+W3MPwh1wxzNg6BQARAQAB
 wsBfBBgBCAAJBQJYd7gOAhsMAAoJEGfb4h3VPIjv33EIAIRVHWqFbAYPZZtYKdwugwzL0FKa
 X0VbkUvKNG8SQAcdvkKmnSITWrIbecHPQaSqrtl/W8qKD6YFNOC9JNCHEfyLPTxo33WonQpo
 utm5nbRS1p45Mk65Uu76qhuHMjPnOgbMqmRHgWjIRiNfKm1QD5/3bml08HnJ1PuucuxI4HkK
 SWR00RE4Jyhxi1ISB3UEQ98iZtobAkTYa3aZ6xCZzd+v+o4CkLDKtS8vrBXpppi/HAeRlL7m
 waGKsjcegLX8cEHSblIct+9KKjUrE8uZyokt67sTYDlPapVCkhTtKn5O88jXkqA2PgAU6XqP
 KeUe7zYeAD22yc9K+Ovi7bZ9I5o=
In-Reply-To: <Zaa2l48Yx1AeCOLs@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf31e85-6371-410f-5995-08dc179be6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RWhdeEOcDYX5yWTwboSnX3Tr/AZlKnKIBewpc7VXUeGRwcyyIZN4ewDJ6ivVB/Urd6OSKjGGYlUdEPlZHbmZ0aiEPQZ3YD1n51SK7K3nBrFb8OtOoPyuykPhHGmxoALHOlsizrucj9NmWKJAm7xn8tmVmQt82KmDKhAxx8h/jYIfdg7qYjh/Os9PRKNQ0+tyAHvJ/n9jg1mPYDkodmZf5kKyffNaArWd1vz/OeCl5GTTDisZxb2r/AM9+sGYN5yas5iTTvz4ec05EsKzrhcFF/NmYS4ZNt85crkiYzS51tC1gIluYCBbTHiBrPXn9k3irQRkh4GE0V6yOmzY/NAP5/SPCVjFcl64VY+hGqUmVjRHkKWdcl/3hfgXkBTkvJy2jyaQlpv3sLlPg1oETfLixTgbkY0nL2tSeirFkdyEGBWwY2a4MxqqSC/n09GRNbPbV8wJmYNtzoYfj1YBdkdt6t6CJoBGm0qdjp2HZPz0eoBAa78D/ST/RLe3lVTVimyHtKr+R7ldxxMeIkwudVkO8Qgrim97wG+x+8ZmI+EJEZAyqKmAPruXYhotSP/lOavKgtjadlm+78JY+WowVmRNizl0erOq9DyeLQ/fvHiYPi6+D6b6yhVXa2PE3h27n8KQ3dhmqB/R63HdHv20hKb2rlIaE21B5r/L6aqWYFP0Zvka9EvrulzCerOkIj/ngZcHaS6IUhJINy/d5mVV7Tb4CRZZp563IrtjbNcwjT7r5j/igdI2WdsXzpzLmQ0kOPD4zy/HsriIYozlHPyErtdKkxytU/KuPXl4AwDR3Hb2QM+qHy/0SNDCzeoYc+40a3BC+oijaLZzgT+Hr24IXJpBkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(4001150100001)(44832011)(8676002)(2906002)(70206006)(53546011)(6666004)(16576012)(316002)(70586007)(110136005)(966005)(478600001)(41300700001)(81166007)(36860700001)(40460700003)(40480700001)(356005)(82740400003)(31696002)(86362001)(31686004)(16526019)(426003)(2616005)(336012)(26005)(36756003)(47076005)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 20:35:53.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf31e85-6371-410f-5995-08dc179be6b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317

Hi,

On 1/16/24 11:02 AM, Wolfram Sang wrote:
> The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> 
>    Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1
> 
> for you to fetch changes up to f4b49e824f0b38e6b5003be97f27c63b96454388:
> 
>    Revert "i2c: designware: Fix reset call order in dw_i2c_plat_probe()" (2024-01-14 09:02:34 +0100)
> 
> ----------------------------------------------------------------
...
> quite some driver updates. Standing out are patches for the wmt-driver
> which is refactored to support more variants. And a big series for the
> designware-driver needed to be reverted because issues have been
> reported late in the cycle and no incremental fix has been found yet.

If you're talking about this original report:

https://lore.kernel.org/lkml/20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local/

then my AMD system still fails to boot this pull request's 'i2c-for-6.8-rc1' tag,
and in the same way of the above stack trace.

It looks like a lot of designware commits did indeed get reverted, except the
very first one:

    bd466a892612 ( "i2c: designware: Fix PM calls order in dw_i2c_plat_probe()")

If I revert it from 'i2c-for-6.8-rc1', the system boots fine again.

That commit was previously found responsible, here:

https://lore.kernel.org/all/f4b3cc62-8620-4810-97f7-bcc39220b12e@linux.intel.com/

Can that commit also be reverted in this pull request?

Thanks,

Kim

