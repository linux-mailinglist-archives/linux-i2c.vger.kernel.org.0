Return-Path: <linux-i2c+bounces-189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC77EDDC9
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 10:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A380B20AA4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C528E06;
	Thu, 16 Nov 2023 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="dk3sd3Ai";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kalrayinc.com header.i=@kalrayinc.com header.b="BA6MvqCV"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 340 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Nov 2023 01:40:04 PST
Received: from smtpout35.security-mail.net (smtpout35.security-mail.net [85.31.212.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8D49C
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 01:40:04 -0800 (PST)
Received: from localhost (fx305.security-mail.net [127.0.0.1])
	by fx305.security-mail.net (Postfix) with ESMTP id BF8383106A4
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 10:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1700127261;
	bh=1q4Y8DLJeNSfFrLv6fci+LlR0U8/rz6YQvt2jcO9zic=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dk3sd3AiZe45lH5P5fK8DlFDckBTDounY0/ruXZ1m+1TU30J3+bh3vCUKPJN2mpwZ
	 B7XVKttH8nuRTmOA6kxwB0m2A+FEeX9A9Z+C0xSvTlTI0EKDfT4ZWbaaEfM/wLJYMn
	 g1vg7rYOAq1i6OS3MQzTkcmK6wf7caZc0nzZZ9qg=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 5C86831067B; Thu, 16 Nov
 2023 10:34:20 +0100 (CET)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0100.outbound.protection.outlook.com [104.47.25.100]) by
 fx305.security-mail.net (Postfix) with ESMTPS id EF83030FF75; Thu, 16 Nov
 2023 10:34:09 +0100 (CET)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR0P264MB2422.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 09:34:08 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4887:e0a:6029:52b9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4887:e0a:6029:52b9%7]) with mapi id 15.20.7025.007; Thu, 16 Nov 2023
 09:34:06 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <13445.6555e211.edc64.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY4P8lrVK+xVH0xw6yMpTaT4A5eDLdYVMopvM7rhQzSwRQpRSB5t0FX1YNAhkA7CrqKoa+lVkL51WyPwoJoJKhyqJnGXK+5+r36U9opTJVal5KhCvxKU8p486AwEYG9BbuwTJTDK3pUcBL/gdqAyjVSvpq/p4xTtExcXjaecNrCjWM+rfmDoEHxfu+VMTLHaldj7FNfDXDUrPMU2Ph3X8+TcuQDITDx+UL+zOEMFbIYeDe0fvqcaM1nMBAixt8O+wobjBvyXd2VCijbo96SnSraFkKwFmxxJ1vMN7h0oIVsKCXsLBCCWL6JLcNBptmkq+N1YB+/ehKz9wD182uI84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEN/pAWQFRCiAdBc0nGmRW060yhfgjbSIf7v15Bd4ak=;
 b=UeGbssAUiEo6RNDirSArFVy1bgp7Ey8/HFkO2ghi5BbgG0z0Fs9vQwptqEKGJizMv5ZAmVflyMO0hxWmTdJjlYB0lz1RTvCof7Of/J4mbHz82aQMODmmUWdN29+DQUmy8JcbWt0GGi5LKPfPDC5J9MZZnP4COdpuCc/pf/NRhydJSapG/ElpHKbnqTJtUIUhKvJkP7NWQBTzfAUVY5Dr2epoEj989ic+Ucc5kqGwu26F8JnxO3SSZ7DaUmYsX2yjpFlpqfsqamCgQYvO42mLlfdmlsl11NUPXFejmB0MhRj2BM8ep5elkLKjMARWpVkrdrUYjrSZhaSZ7FpeL0lwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEN/pAWQFRCiAdBc0nGmRW060yhfgjbSIf7v15Bd4ak=;
 b=BA6MvqCVLMPDte6agrfSFSFQWzb2ava/5W/iB+aR9zF6Pbk1KOaBTBds19xQuRBXhPdCYMmMcnY5jD6qR3RhHC6r/qxZ8xAYNoHHvpZtfDhAjb9Dg6Yfk6SYcr0Tgxvq3a1VkKYHdqeIAgc1NiZszXKWme0RX4hLoFuCpTFE0JygzlrbcgR21BxSOQJMDdVLLFGbRJXgi41Slm76Brui+JVJQ/VwOhxjLtBzwp60w1QxAfhx3xKc+DV/cobZB4h0c38l7FyQW4Fu7JHmOCqrSSHL4kMTDRrgrh3mrMjk+Yj6BBmiP3RhEoxzPbR6SqLSwT6dvhsTHazGFcSOLnvNBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <30a146e4-bcef-71ce-1753-5ca4a017154e@kalrayinc.com>
Date: Thu, 16 Nov 2023 10:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the
 ISR
To: Wolfram Sang <wsa@kernel.org>, Jan Bottorff
 <janb@os.amperecomputing.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
 <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <ZVGB0ul4MYIdLaWX@shikoro>
Content-Language: en-us
From: Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZVGB0ul4MYIdLaWX@shikoro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::10) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR0P264MB2422:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e0978c-803d-47fc-e887-08dbe6872d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T57EJ3zqe+VVAQEtPUIDdgD7HIOzO/iOkQQ27RFHk2BElxESwe2j/6vertKQ3u6lXHpyf/vlx7W+D8GPbWEkNOpkwR97pPLH9piUbPWmPo9HBApeeFW42ZSa5oaDSlYV6CtASyCcgL0mOGtBxVcg2p1bz/MYtgVpdmZJWv0mryDZppVAEsjZKLjGaRVY5R2EJsa4dlmBTsTXHjW8JYbKBoNUwK7K1aScnoo/GHxEnThwfpPh2Q4EQnLRF6HaGND1FdmeV0CxTHF2hycz5lFm01cYRBuN5T693694mmiAJGEWGX3cg7HgLXHinHVWAjTfEfvfG67jeYynKuuqdfSAidjkG1xV6NN4XO5jtTiOKZ33t3iIRwoy2H76bQkwHN9LGXZsQJ2jtulRAn2pbrG8Ajg4P8zMWXPpGcxVVSeKtQcG4NiNTuuR2i6Hhe67C0N0TbL/BlYZ4Hc8qDMUBb4kzOtEmBYXUrDKURljdopm/hflVHp/v1YJGXJtvAt78f4rXoj1gIm4MDZTGWapfeDILufzu8Xmbs7rOBbRNLB40ksAdrZ1fM15o87EJkP8UNgydem7WRamDne4Lw2lEM/nEGY/5z72LnkzO1YD9PM4XTJlHM4C1rVZkpoX/8NV4gu3ZzWBKcNdvBCiWns2erAKVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(31686004)(38100700002)(31696002)(86362001)(5660300002)(41300700001)(8936002)(8676002)(83380400001)(6486002)(2616005)(36756003)(6512007)(66476007)(66556008)(316002)(26005)(66946007)(110136005)(53546011)(6506007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A0zrzqfugOatCYxUW7isz9b5sTGoFGFdJB2DCbk1eG+q4K/eEd31oQWSoqRPtfkeXdq4XFA5kDzMNgVFM5wDcuL8G40vHPJOyLTR8P2h0c7dPLlO1VvYDCYY3lAoIv+tqwoQOJHYhFpwgccy8w/M5qcGHzkzKy3QZlxDzrmixTs3YduI0kRXOI/MJrvUJMeW/22JWZPwmRq1s7kXkcYiGlc5bKijp6ZNQzuViL6gMvRPikykWQoj6E2nAo1mkwctILReX2DHR59a9eNnnWcUAiQlh1vXvqBRSlRc1wKmhffpiSn5zHwvfurw+k7N2FRs0km1J+PsS2Wibc4O4xMXt4FmuwZ7So1YnWhv7diOK48YJuTtUHwuD4bmnKPkmSjkFVnLEzgVSS7QHZ1PZVNirfh7SKa4hn8qKEXM5QKpsYD0GU9H3L291q1tARdmxzDUcXW1bbljoAdnJuaBhLN9vv3u2ldboCYyoGlTwuulfMyu7GDylekvhthP4BxPQsut75cNblYKBgkzi7btUeSr83pm8xxJBLDjJuyrzSqpuplSyWEzxaZExVOsLbyUuDc2MgA9vZITKUfmz39CNC/KyBZdAzub8iF/HKwsnF6/uajbkSHELQ6iuiYxUQSdDnTeTKqa8O/Anr253kcpUmn1xcoDEo3pvr7difGqeWu9FR/YBmbs/Ii67NfwhKIHJxt8mQekn/knr+hHEuqSERqTSCvW9yb42YIOSV7QwM18h9GKX/Cx4tx+OT4ZJDZK1aj0Cr7i5I/BxH6k0ntXjcidICDufrZ07LDOZq/quQuOqJs2y22FkF9M5X4xFT9IeuYh56B3wWag+hkatPZa2mXP8EEMGzJ3fRi/1+Oc4Ch0yhjHhTE3i6bcvixledFky9t3VvsTSkqc7caCxtz3GK96GCP8laNCFntmKh/ls2GjDSfYOPHNO0tp/MSv9NccqX3b
 ndaBU1gB4FX4eRiQ09IwyA+usgj+UTS5PAtLCkNo8+uoql2fFFVc+tgFRE6A7/HfV9gf7JyAJr9vUvp3wQEEFIE3xkZ6MN8ls0p5ReWv4/+2m1+CpttJsoRHNT53FnwTXwmLeocD3Uab/q0puv4euXyRLKAil/z+jh7goW5v+Kf/WBlYwu2I6DH0gjUUzpTT3BLLZlyiwmTiCGn1Z2mKBcx0n+vJzxyF17OTjjuNqftvUErF5/c8mZyUI7iKCO5DSMAE+NLc8QXIduFQDqiO6ltB55dx0osdVPq7X/UNsRGosgr2f/naekec2zijaayneZEy6kJOMJEkR/LNWhCkID/OtIXeJKWZGTKPVZ1/gScNkjTdDOHSthDIh9vMVjmG+3RchBwFJco1X3VTyCboXsUAhKNYavhYVc70pFeqkYZ4BS78/V0JECrsN1K4uLoVUt0AYHfVbhrm08Zvjlw4XIS8+dAeEjG3botzThLhUtSqvBdmWqQa3jtGUOTc0Lvj6apudzZDdXHJ8vx2MeJj+NfA131cnYisAT88FpnqpxSjrRS1QQSpqkSk5lHzG8ndz9nM0GItBWiScT2c8uwnEXpwj4GnJLyvN4xJvEkx0aU6zo0QzmSB6EdbzkCUubaH3eaCnjqVvXiZ5GPOaWAA/w==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e0978c-803d-47fc-e887-08dbe6872d7e
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 09:34:06.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKPoD9858LDEctirPMd/Bbegppr+o3kNzdofw0rEqDjNjY3+ypB52h7Bye/Nnvm+9zFupg2a437b8UkrRHOaEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2422
X-ALTERMIMEV2_out: done


On 11/13/23 02:54, Wolfram Sang wrote:
> On Thu, Nov 09, 2023 at 03:19:27AM +0000, Jan Bottorff wrote:
>> When running on a many core ARM64 server, errors were
>> happening in the ISR that looked like corrupted memory. These
>> corruptions would fix themselves if small delays were inserted
>> in the ISR. Errors reported by the driver included "i2c_designware
>> APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
>> "i2c_designware APMC0D0F:00:controller timed out" during
>> in-band IPMI SSIF stress tests.
>>
>> The problem was determined to be memory writes in the driver were not
>> becoming visible to all cores when execution rapidly shifted between
>> cores, like when a register write immediately triggers an ISR.
>> Processors with weak memory ordering, like ARM64, make no
>> guarantees about the order normal memory writes become globally
>> visible, unless barrier instructions are used to control ordering.
>>
>> To solve this, regmap accessor functions configured by this driver
>> were changed to use non-relaxed forms of the low-level register
>> access functions, which include a barrier on platforms that require
>> it. This assures memory writes before a controller register access are
>> visible to all cores. The community concluded defaulting to correct
>> operation outweighed defaulting to the small performance gains from
>> using relaxed access functions. Being a low speed device added weight to
>> this choice of default register access behavior.
>>
>> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
> Applied to for-current, thanks!
>
A bit late but FYI:

Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>

-- 

Yann






