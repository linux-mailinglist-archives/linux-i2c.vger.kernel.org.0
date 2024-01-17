Return-Path: <linux-i2c+bounces-1365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90593830F8C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 23:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B94B28C864
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 22:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3447F288D7;
	Wed, 17 Jan 2024 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ADxZOxb5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A4288CE;
	Wed, 17 Jan 2024 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705532011; cv=fail; b=ZlM1NE9eXXemq/pqS0KVupPKl9vE9CEunL6+2IFtj8W/1Oe3lawSVK+Uys9oVrUDhcVBj9is64IZiraibYso6FiHgYRrb1W0axvD4QbfYk1WqWOMBepj5XHNDM8psTN8fCQQElJX82aypjCDelTpF8H0x+stj32HpU6Hx6SJdRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705532011; c=relaxed/simple;
	bh=CYZUU5p3igAnrxbBrTGSK44bpCkfK/BZ3HGCRH1PQVU=;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=jvCQ2H9p9m52jjN/fEgnjZlYhxFPSsDAi/V2R2Qwc0PYKm6QvRED3tCOeJz+IlYxufrGekakTeZekA5sO+u21lHHhjvgoiFlpObzlW1C2ppoPhnoujtfKFq9lerEOMR2puFJqUN/kCJVfmOq84j2/2RuaaKc9Vq08MOrW3CCedE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ADxZOxb5; arc=fail smtp.client-ip=40.107.95.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaBgZyfMei/DocvLJ1TELj1MHDKeUiT/djN4pBM22PePF0BafgXf3m/jIe0mgSfqGf+wQCrlsv1BJJasV68YqdB3KgFzCNeZhmnvYHhD4NcI/Sdk2ncNTvuMKX2PesWeUh1RS1azxC4W3kJCetcxgMA3mMy+kqvb2ZaDKVRUfSxcpU17fYFf2CklQg6jN1GrAzP1j2KVP2Vnwyr15OfoZ8ORh9JHrZO9e2aZUsyQ4zJtplhufxvSoHaQzzghIX97CfdE3JiKdN+gJHk13hGzB/So/Dn6QX0K8WoGoaYv2FHrhLSL6kMyXjENJFj4GcrESSyAL06fC5y97jxRMHueqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv6QiE986RitkQ7fCY1trenhlqhC7jBwdyFczALjah4=;
 b=G1PQ+BMlmhGep2NWXNcireY4Zn1ITSOD/b1zGz2yRPiB+AMvHv7WSOQ2pTNdRUrB74/kE3SQ9zWLWwmDWAUSeL+2joY7i4/oPniz6605TQWbNIPau0tUYQaxa/+mq1vHdsR+aAfCEBomrZRZIu+FjiKheS0B7VdqAeZct/hcMfWwSdsswTyxsOZ1UrpZXaQPXRgd/5R/QN5vtbr/ikiTKs0/dGtlo3Iv6IB14g9PbpR/vsu9+0/nFOebSgRrnYOQL9UZWvuBhakLRNYuJMW/aKEMykVGLmV8d2AHCclUXRSvK+m7FaN3oMc3LWJrj5H7t2KutG/gFJ9k44gZ8Jr/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv6QiE986RitkQ7fCY1trenhlqhC7jBwdyFczALjah4=;
 b=ADxZOxb5p9dvlTxEIFOulk6dH6mTON2tAe9V+FcOf1GaVtDIi5BSQIVx4/zYDTBNh3r6LFQyelaaaId5FQkWxMWlffIXzpqMZvPf9pjiKH+jjZ33yjUwAfThZMgMEwjrzorO7d4W42ovZlAOmADWvJm0kguAOP0HKP5PxMbYlNE=
Received: from SJ0PR13CA0099.namprd13.prod.outlook.com (2603:10b6:a03:2c5::14)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Wed, 17 Jan
 2024 22:53:27 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5f) by SJ0PR13CA0099.outlook.office365.com
 (2603:10b6:a03:2c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.8 via Frontend
 Transport; Wed, 17 Jan 2024 22:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 22:53:26 +0000
Received: from [10.236.30.70] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 16:53:25 -0600
Message-ID: <d2b6dbf3-fe06-4dd7-a893-75da12e8c136@amd.com>
Date: Wed, 17 Jan 2024 16:53:25 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc1-fixed
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
References: <ZahG7xgHJ4Tf8mHI@shikoro>
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
In-Reply-To: <ZahG7xgHJ4Tf8mHI@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c436584-3738-4362-b775-08dc17af1ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPNbFIb1sca/QZXAtQ8awXY1jrJ5Occm+wcKRwsZlm8GdUaRWDj9C/HNMznNeiZm+XygSgUloP9otyZ52OfaLpXrL4ri1zjtPg79jq5GAEAOsGcj+cn/fyHinjBZe0gLBCRaBL2w2sNjMLd7maMH9I+RxULkVfaEwN1YXfEDmDBL99Q4pD7mPuOFJaIZ5loMnGAlDA8zOXZUthvvFSzaB3Izu4mCa7RblEvnoyOZuQfsn2KxMKX4ujpF6Jo3fslAKEtr5D5CEXL/83Wxdf99aoSvPisySJS4pFoUebArdERrTJsZcV9dwTJOwZPuG86TwfqaQnpINHiEmXOpM/9tPnRz7Jsteuz0tNqRkPhLqoptu0DnrDPjbL6rNzT/Plvy01eD6AXEkaj7a7wiOW6FqXNVGMadzXNh77tkASQs7yIbr1v0JST5UZPIU+TW1qIR7mdPB+ldEbVdvR6AAL851HP4F2kSy/0RZ9KQTYvDcBuLYQ8cvQ9ufPSQ1+YB7rDg1sgzaAmF7IglkAt5RAosw45n3lLfvw/Pp4f5+NATSZ1emzufoWXhUJ4Gl/OJqz1vaJ5+yb3+bAlppKxQ6jbiuwQEXx6cDEoeQWf+3Mpo4NXqde8oSz6Z8+ef4Xg+/y1K5haEeO65B3x5tfPBkA+ddajdYfsL4aYk8FLy0B8EeiH6Ow6M42wgSjmIJ+K8ayrEWXhyr808iKb3T2JSVtI7xWLOrwNSHAWrtn335rGFYfHiSzPaEAArEpJCKTmAEsUz3ocdJ1/lnebFyYR2LPMtrvNbutUQtrVv707fxswSGsKzUNsL0BGCz3EvMEMryafp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(82310400011)(64100799003)(1800799012)(186009)(451199024)(36840700001)(40470700004)(46966006)(53546011)(2616005)(426003)(36756003)(478600001)(31696002)(47076005)(36860700001)(26005)(16526019)(336012)(41300700001)(40480700001)(40460700003)(5660300002)(110136005)(2906002)(70586007)(70206006)(44832011)(8936002)(4744005)(356005)(31686004)(16576012)(8676002)(316002)(81166007)(82740400003)(86362001)(4001150100001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 22:53:26.6590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c436584-3738-4362-b775-08dc17af1ddf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418

On 1/17/24 3:30 PM, Wolfram Sang wrote:
> The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> 
>    Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc1-fixed

i2c-for-6.8-rc1-fixed boots fine.

Thanks!

Kim

