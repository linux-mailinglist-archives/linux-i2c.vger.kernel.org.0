Return-Path: <linux-i2c+bounces-1261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B082A459
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 23:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B1E1C2219C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 22:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AE74F8B9;
	Wed, 10 Jan 2024 22:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2KD2+XTj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111E4F88F;
	Wed, 10 Jan 2024 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu9l0r7cBmuqtrNtSmWnBB65FDHKrxRVLR4X/HeQLsGot7Rkjz0sHiJiwxB/zIMOUJhAsrf7UOM46s3yXaNM99lrayYJYAdUhZZ/nZB7WgXV4SaYznm8Wmg1LwVVf2t9OGpBrx3vP9QKFA9UlVnIM27c1xJo+MFnfWVH/Qbc/kIYFk8WRQ8Fntuc0VmjmiIBU1iMraRX0H7TMe06dRB73awhgetzBJPXQsVBjYY31WS5VeHJZ3LFoO1dQFBnaeXX3M9K7fm4L2D5i/0yatsWlaQd2ogMOOaeQN+2zV2N8QPCP6myQTA65+kE12+0ZLQXPKp1zrT6QMA1Zr6d+yFJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNgln3DY7WlozI6XFeneuQj4f/QnjBhtq0tzFZ8ACis=;
 b=BcSJDWZr0TLzPHrOmBGq+nPSkq/YqSZF1bJpbW8htYeLnbKEl1U157ZbzsswymOEJB37X7eTap3QI3Zt4fqmBh3n3Ts7ta1d9Wefjp9Bd2q9AriRWXN4e72b1OKxCYDsXNH/w2abuoLbzjRsqEsXbaHrB0gn0kBGkmAu97md7+5sh6L8GRxAZRsbnH0qE4m7SvqCsLtmE55rel9c/vd4GdSY5UM30RiYujaQskqyLTUA8H/HxORCtBfvp5PnmXJok+mkO2p8mQIZDrlPisjO7p2UFE+fexyRukPzuNPxE+KkDxBj7BQDu9PNv9feLQvY5lECKoJKfdRh8SznHFdDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNgln3DY7WlozI6XFeneuQj4f/QnjBhtq0tzFZ8ACis=;
 b=2KD2+XTjQsyB2aukj4scjyEJZrwkEhGdGk8edmRSe7IwI2igZPXkQkFjlku/4vLPOzg0vw8uYOQi4zHYJhBC3uOnNgwKqFLgxQ9KJQzTr1SdUruLgZ3Cmm2ZrdR64T2C8Nzv49TQmN/6uu4PHwjiYUqN4OF459k87686Q4jG7gw=
Received: from CH0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:610:e6::21)
 by BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 22:56:21 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::9d) by CH0PR03CA0286.outlook.office365.com
 (2603:10b6:610:e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18 via Frontend
 Transport; Wed, 10 Jan 2024 22:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 22:56:21 +0000
Received: from [10.236.30.70] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 16:56:20 -0600
Message-ID: <27cf56b5-d21b-4906-823f-a9e567fc26e2@amd.com>
Date: Wed, 10 Jan 2024 16:56:19 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, "V, Narasimhan"
	<Narasimhan.V@amd.com>, Borislav Petkov <bp@alien8.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: lkml <linux-kernel@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
 <8169d773-f9ec-4092-b036-9e4fd59966c3@linux.intel.com>
 <DM4PR12MB508654DF49FE079D6C283D658961A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <888da30a-c1ed-4fb0-af81-787fd868ce20@linux.intel.com>
 <DM4PR12MB5086DE2882C7C5044697B1C38967A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <adf6c24a-d94b-40e5-b645-0c6b23b2d513@linux.intel.com>
 <DM4PR12MB508652E9A422CF639C2FEEC0896A2@DM4PR12MB5086.namprd12.prod.outlook.com>
 <e059928c-6fab-4ca2-9615-4401ee16fb82@linux.intel.com>
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
In-Reply-To: <e059928c-6fab-4ca2-9615-4401ee16fb82@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BL1PR12MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb93c3d-a7d5-49e4-4e21-08dc122f5d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HkDEDhF0Z0x5wTYQ/wkPHffn0Rn1G4eFRIjAydrG9UmZePT7FovCdjpU42CRNP0gfzSJ3BbHMjoB4TwQKzOknwZSB3knmMGsh/aQ1FdywZb6iaEsx6K5tUAA12+bxuEVEOXRaEEboiXP06afN5ZGOnlK52iBW7zwAWyHKNFTb0oYd9tOda5newZUsev6Q12XAN7J97aPJx0/CS+81fQ3c4LrXr/23FDUxjtjc59BVoNnH521uRtKUdt13AR3kho1mUUrG6Tdmc3MQsRm5OFw+w8UVHPs/4GlImrdmxF8sfkacUXjeFrEaxQg7DEFXWEFrNxP4lnoJ7qvF0q//UeMOcF/G1hvWMWl2JqxcIO9yf9r1GUSpl11NYkvP8xyaeEpITRarbdLRmgU6Yuft8G4AVSCmp4jH/jjLKzz2q+R75D/9b/sishx/49aaDb53y6U9YYYU/lWUyN0SoCjH8pmdL+2eiOEDCPyhiZT7dUJaUa/GMWDwi2+ZHaxL/scs13rCGCf+dgrMVj4SpGTSEyNlmMQEo8C8tx8s1mb/dHSSXv/tLCAS9C5uX327w317AKIA/ANv78sxgzE7vfS6ndnrqieXZB+53qBIFEl/NotuNYTy8cy9PIFVgPNpO9RtpYW49ADLOa3Z8j+84b2A3MmnmHsGy2EXHIrcUbRnHPXixZFGEZ5OcxbVQ44HHq2mWxBpVG9NdX5xg09Chny0gJZ5s9H5qv6oBvO/w6XkTtETuzgYxZSX8ee90LfrZ8C2JkhqWEe7U/xEy0UXZRJTbmFXjn5NC1RnO5L7Z/3Ku+UIMWl00e3ZZdn9Azj17nr13El
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(53546011)(478600001)(16576012)(8936002)(4326008)(8676002)(70586007)(70206006)(316002)(54906003)(2616005)(110136005)(47076005)(36860700001)(26005)(83380400001)(426003)(16526019)(336012)(5660300002)(44832011)(2906002)(41300700001)(36756003)(82740400003)(81166007)(356005)(31696002)(86362001)(40480700001)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 22:56:21.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb93c3d-a7d5-49e4-4e21-08dc122f5d23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5317

Hi,

On 1/9/24 4:11 AM, Jarkko Nikula wrote> On 1/9/24 09:56, V, Narasimhan wrote:
>>   * Looks like the issue is with this below commit:
>>   * i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
>>
> Hmm... This makes me even more confused since your device AMDI0010 should not even use the access semaphore.
> 
> So linux-next works if you run a commit before it or revert these three patches? (commit 2f571a725434 ("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()") doesn't revert without reverting two other related commits after it)
> 
> git show f9b51f600217b38f46ea39d6aa445e594bf3eb30 |patch -p1 -R
> git show b8034c7d28a988be82efbf4d65faa847334811f7 |patch -p1 -R
> git show 2f571a72543463ef07dc3ac61e7b703b9ad997f9 |patch -p1 -R

Narasimhan is right, if I check out, build and boot this commit:

       2f571a725434 i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()

I get the same stacktrace on the serial console.

If I try the previous commit (174a0c565cea "efi/loongarch: Directly position the loaded image file"),
the system boots fine.

The same thing happens with the three reversions above:
next-20240110 gets the stacktrace, but with the three
reversions, it doesn't.

Is your parallel post probe runtime suspending time window
theory no longer applicable?  These AMD EPYC systems have a
lot more cores than their client equivalents, and AMD power
management code has had a lot of improvements lately.

Thanks,

Kim

