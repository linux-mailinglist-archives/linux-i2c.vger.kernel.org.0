Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7058B48AF39
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 15:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241258AbiAKONO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 09:13:14 -0500
Received: from mail-mw2nam08on2065.outbound.protection.outlook.com ([40.107.101.65]:6449
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230295AbiAKONM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 09:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMrBECPwaT1RXmPjsGPB24xk2nQ+t1ASngkV6RzXSJ8y5EcCk0hzPyQx0C0OtMl/fRmR6sy30bNomxn+KJdxPpAWAWq4YfHHdfQhIlnp8QODG25X0XraWtgpE5cDdjTIj+83874b3jQAG21Tc+7f38ft/zuyNnUd/r4D43mIuboHB65Zm2uMqomXXWVky3T4XAs33XbOZFvV8hFTY2eUQ9EYRJuC1OFYC1IWEie7VS/Ih3v2ZjAm/h+Tdu6ClMq7EJ2jFE/oxQRAssQTT4yUWc8EholXeXG54uXR82Jo+OkG4c2ro1ruZR17uanVoCJhb0mWjcFfHmfhpf77gG4gWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiJFwEF5uBChaRvHlaNA9tHA39/lDhKy5RI4Xp7m1kM=;
 b=iH8gRTpVEkKiEd0NB0k25Wa5rf4u+MDOdWkBMVfCnBSTNKIfiXeR4/KWMH341ZuTeWFLwpPdXwFhd39XH2MwUVe+UXVyoz2QJ8AQ9x/8OoxBMl3S4Q3Z/D8+zqd+OfGgSpLwC2lYsJytQFzoFKSvqZUEWlgzXd5EU4hZGI5M5vRLsMud7bhEdChi2SPnwWSGHZ7umpGii6BEyVmD1e2eNemdHVWkoxuoyFo3gI/TDH+dE3/WtDhOif78fJU3PJKtOFg9tbQorYSzsLXtKggiQLLViOISAZawyKBaaN+VMfbLkDQU4+BJiJw0Q53TrpeieSGzTwyAD8wUTxUeJAbZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiJFwEF5uBChaRvHlaNA9tHA39/lDhKy5RI4Xp7m1kM=;
 b=valQSFGT2Wj78T8JL5XxKliPt1F5/lC7nPY6cZoGYbnxvR17Cy7o+MQljnrNxeDH1BYa/gxUxvJAduyjYHUkESEGrz/62vzyaznKEbjoKMmQquVQHbarnhi4RiSkq5E6t8LvrOjp9+Z8tGyRtrOFYSUgtsT+jsASrfQtXp4xQjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by CY4PR1201MB0230.namprd12.prod.outlook.com (2603:10b6:910:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 14:13:08 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa%8]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 14:13:08 +0000
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion> <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato>
 <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
Date:   Tue, 11 Jan 2022 08:13:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Yd16cw0AaYcf7eSf@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:610:57::40) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb45e8ff-aa9f-41cb-1d01-08d9d50c7db6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0230:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0230416FA72011F04BED20EF83519@CY4PR1201MB0230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCe6kfGzitxArjV/XuBp3jCkSzWeDUIOhxtrcx3mxKSvLbiK0TuWPHwspiG1O6BZDxeoocv7Jk2ucnWTAmTlo+9vK5XApB4UEKEYGGKahKvuU2Iqrc0fxroqHpRgmVug/GFnFRqMbosk5z48rH2VVXCvOZRNl0nn7u32CyhF+wNDf6K9p4ujACRkzIefRYObW/QDV410iHdIM/uvVTX0m5A2M0Zx07wLmEmbH3sXxGV8OSbkQRpDsfvhWIeJOBIvZMCDaG/ef6G/osVJudprY5YVMKdCwpuF00tVjVkuoNGZPXmn4y0bevm6uHvzAYocB5onC4HB7HD+fhP9BbnwE6yPEihGWn98Q0rVoj+sxCX4ks6uw8OtwcNb2ftvK31c8C4EKl4nAjERqp8aEEqNfZCJzQtD23WY7308F/PjiaeasJuGE01f7GSHSdj/tF47Stxl5uAm24yubg2v2Ufa4v8y4GZFVNRckSdke38mhs46abZJz+PUPuw4NPh5lAKLXuW4ngeva96AaUkcBw+XiHH0BZqOepzz6T9x/Y7/16OvEi+gKYxg5MT2RwJTzpLjm4P9Dm2iwNOdcWuFb/OhfKbf6MmskDx1eP8tjX71YdJdx2l8YMCa4lk8AcuLuf1624L2A1xorOnuhosLAYfrdgkuSJxYvLKcm2WQ1xJ/XHPfNmC2TxZGd/M6hnSBASrl9kQijGMkSdoZv6WGl4DjpnXyoQ/nPORHdudIW20JqzYmXDMljyUe4B89HG2XTkJHaE4Ds/VJza4lsm/yodzp8eUdx+c1ksHGx6b7uIS4ZBpJAbMrfw3ZTuze5Kdszhmc3UHkI39LaxYoMTgdIVqSIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(31686004)(6486002)(8936002)(86362001)(38100700002)(316002)(53546011)(26005)(4744005)(186003)(2906002)(110136005)(66946007)(36756003)(2616005)(83380400001)(66556008)(66476007)(6506007)(966005)(6666004)(31696002)(6636002)(508600001)(6512007)(5660300002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?3REu/jjfXDaHKneViRpGsrqLbL2x2DscWdx3AW6MhaCiycv75RyPRW0K?=
 =?Windows-1252?Q?8gMKqD4M60DW/LiZrl1prgBEc1fxL3dZbseje4p1frbC9GhcOdzIclCB?=
 =?Windows-1252?Q?3vEowFFNX0W1kQJ5B4nZVSrM88ooQH3cHNlhEgpmX7jQatMFYgDUchHb?=
 =?Windows-1252?Q?GpO6Pr4S1jplxmt4GyK2XL040w/GHgg05iD7s2hEuub2pGy0U+oQtkYt?=
 =?Windows-1252?Q?+seCFTaBgm3gs/nLWQtSgZxt9zq1FAScECnTmyP8ZXCTTMWca/xu2VDd?=
 =?Windows-1252?Q?qh/vgfPyq4F9ViHzHEEGSwhSwuek1k4UmBZFbcFl9jVEYYammKErR7D7?=
 =?Windows-1252?Q?u6+YeMgLO7FES9yedpylhoD8ImB3CAeo0CLU+ph/vHD2vrgWlgytVs5e?=
 =?Windows-1252?Q?sK6UxfObrNmPJHzR+I9+ycnvWRMjhE/kSLy2tvY4u9YBcEYbl3sU+ZAl?=
 =?Windows-1252?Q?RprZlQWkHpSGZTRmEi2Af+RuwCd8ag2dxdo3EgxA9IAd4mGJ5ZG966xO?=
 =?Windows-1252?Q?gyFSLzQdKxtpXMnXRM8nLPfCUJDm0/2qctKJgsKo/rfiWA5N1/N8FNs5?=
 =?Windows-1252?Q?QdL9weQ5s0bz+VO2thvrQTma6d40KDUTWR0/TZqu3Ae9NqgSvhiE2ii9?=
 =?Windows-1252?Q?3EFemy/sN7JQMLgyTPCCQPYMsLtVygkd+87v9eOOuk+KFr91o6zTGD1q?=
 =?Windows-1252?Q?5vnqvN+dFVTNdFPUsMjPBnyVJcjBYWLWKD5WbPge4DLQyR02z9OntP9B?=
 =?Windows-1252?Q?Wy66F5k11lSKmQzpJgFfIa/tPnytA5l6l7G5xs2uq9ezvmAhv5Dzd4DH?=
 =?Windows-1252?Q?NleoyMjtQdT5R53L91rkTNoHtvFozM9Xw39tHHy7K7vg2ZksxDUKZxlV?=
 =?Windows-1252?Q?iXAJHjHLhz8h23XSwY3wSR045g3nIrsvZi534+q7wvrLCQiOAvvWlgA6?=
 =?Windows-1252?Q?al2aV4SuEmyskAXt857y7AvHLocFtcJOLgWqx9YQ+svF5v58RY5D8EP7?=
 =?Windows-1252?Q?gNUJI8Tylct8gCkYi4674srRcAFe98vb2vJzAusyIvWl0x0E1Zhd519z?=
 =?Windows-1252?Q?eldoll7SFI5dYbRKxGLvQkGjFt5QJcrbZDCSRIrb3QDP1onsugJT+gMU?=
 =?Windows-1252?Q?R6CNdYpiDKI88j+cQxdo8D6sHywXHMtiaTQNtdeIude4f9EoRceFB/zL?=
 =?Windows-1252?Q?Lz6v+znrUZ47mp0k2B4b9/0CQ0axUe2YDZ5o14WEhIeBhp+sIYl8W4TR?=
 =?Windows-1252?Q?mZ1JMrCaBv/5fxWxhbb4f0HrQk+44PqfkNf1Zp6Upo4+p8AAY1zVFPii?=
 =?Windows-1252?Q?jBeq2fkgNgUwi7c4I96sDGeh/RnsNSh+xXz/qrUeCsa9cNOeYGTvaCAH?=
 =?Windows-1252?Q?fpkqwMOTIbief5ua/5q+jaEQUTAX86ddA2ZbxAO2EGuOIJqyg0QwuxQS?=
 =?Windows-1252?Q?A+qG16jGlIy2XZCxNeVV0Q8i6HG70A87Gd34wu6W0ypFUiIbiTBV4g0d?=
 =?Windows-1252?Q?54YaS9r0+pGJhpvcy+/KdLOinQCWNKolI2iNOcSXw0tUVHNQoYE7PyZ5?=
 =?Windows-1252?Q?0iHk6PiKG6BflDVxELItsfxz404yy3bFBwR9h1mtixJz2fdS90IANnR8?=
 =?Windows-1252?Q?KbugiCASk45frZO9FoDZwqv0V0mDQ4VuZaU0mQ6RPxAI1re+yZk3GVFv?=
 =?Windows-1252?Q?EZ/bkauefbQUrfBw/mSOlnITw9O2ao2UisoztZ+fSSliyOF9mfdE43+V?=
 =?Windows-1252?Q?sVHLjK+lnPK9VbLLYK8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb45e8ff-aa9f-41cb-1d01-08d9d50c7db6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 14:13:07.7841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upKSiNC+tFnFxFCT6GgYrjiMS+P18Vc9uOz/OFQ2LzKRAmml4WPuelgbpCkQwTnG/KBvIkoWT9phaYxpOmPcRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0230
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Robert Richter

Hi Andy,

The cd6h/cd7h port I/O can be disabled on recent AMD processors and these
changes replace the cd6h/cd7h port I/O accesses with with MMIO accesses. 
I can provide more details or answer questions.

Regards,
Terry

On 1/11/22 6:39 AM, Wolfram Sang wrote:
> 
>> I have briefly read the discussion by the link you provided above in
>> this thread. I'm not sure I understand the issue and if Intel hardware
>> is affected. Is there any summary of the problem?
> 
> I guess the original patch description should explain it. You can find
> it here:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/patch/20210715221828.244536-1-Terry.Bowman@amd.com/
> 
> If this is not sufficient, hopefully Terry can provide more information?
> 
