Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D37494022
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 19:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245570AbiASSp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 13:45:57 -0500
Received: from mail-bn1nam07on2045.outbound.protection.outlook.com ([40.107.212.45]:11142
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241670AbiASSp4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 13:45:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX5PXIJzPPAAEKxHb9Bjo5IOzi9UeTcnzDVNpyiqugVrV1FhRRVs4y+TFbcoo9GsfgkxZi6yjcRzmdjrVsSJcOq930M/luD5Ot7NzMK1g0cA+dotHmQBd04eqe5EA9VTi2L/rpwmdhID2yLp69RKutOGXMfZ9tb7jrJMnEQnYrJEfRn0FRrhI4/5RIu9ub2JLwV1pWQwYkN1DtocYKjvYMC/4X3o0tMvTKPDdNFh4FiTAONZ9gknT5gVum3udWlajtw1DN7fezzaziRIZE/Gya7m8WmsWwmrIsT4uQOI0fEgRvZ/Of9nkTr+2fqyUMttGU1aTKAF335bnhr/C7AmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duvyqQs2cMiJDul46ZsU9evOqHeDORYl9uxrxTo8DcA=;
 b=FaPNS4MFxivvhuYmESbXVjxgAOLEi6hvsODplx9TC6x79YFue17cBpN0L/iVVeaM+eIl3VK9oojF7PS8cIw+8C94QWx99EEJwXWCQUqvR8Y/4FAzd+IjKBzFvqTEMtSQKKG+ncE9HJAyQNKGmDfuOPg9FqWaEQg7lGjRh2M0xSWOfh0orF4y7k7v2cq9DXCF2sp/cebNiO1jGeqWkxxBHMxeO1L4mp3H5sq83tPkaFYr6QgmPOixM+q8F6liV1NNotQZccr/bGgLPQJqxPHYLZpz89sVSoSOAY4rqpnAUYfimbsmAV1i/9jdmdRUbYhCbfFr+qjLjo+hmBenSGbGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duvyqQs2cMiJDul46ZsU9evOqHeDORYl9uxrxTo8DcA=;
 b=3fxxSi6U7iljo1KPKtZ5uDUwg9a/Mre1u9NoSXmr7W79jLCIkYgfjxEjT/5cY7TrDnShrw8+U2nQeFbZaow/ZrpToTk8CTVYb+ST93n91tYOgCj1o7HfvKZdfKQI5E66JOMiIXDlI8OqM84ojfM6ViJiOMpXdOWVjERk4I14Wv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MWHPR1201MB0206.namprd12.prod.outlook.com (2603:10b6:301:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 18:45:54 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 18:45:54 +0000
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220119163012.4274665d@endymion>
 <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com> <YehOmuqA008XuBHI@kunai>
 <160d12ca-8493-7536-036c-9dd5af7b4ce0@roeck-us.net>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <efa8606e-7a9d-e970-1367-91dd0332c122@amd.com>
Date:   Wed, 19 Jan 2022 12:45:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <160d12ca-8493-7536-036c-9dd5af7b4ce0@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:610:e4::7) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe738ff9-8325-46aa-6139-08d9db7bec0b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0206:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0206380D56A3E61E238A85FB83599@MWHPR1201MB0206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sm6l0eziz707SSRixmF2kwPXXaDV3Q5tfodXexbLLa9GZo91xenpW6tnNrZz06tyEMljzI6f+aIsYRZGi4orUoUviz9Zz2nD9Of2A9fAm4zbBlLjNTgNZ9efpvc9NCVjJljG+8WIngDiMJzOc/VDUi4UgVWM1FEyEBmemQYXZWIzl8xZNioxzXHfFkulXPZO7QEdomwEENYrLRi8bWOCJE8l+YBGqOqHrtPDI+gUkkXQ6WLkT+QvLbUzbhayZBgN3OJ12P+/LNIX+GTg5Uds9pN8j+Pe7vkLJZfxOqCYp+pLn6TSj3t1MBJNnas2r9ObcCUj0ktcdKcm0xUi1zBST3XhdLeKiHGv/qRGETyrfAUQGPCPSzG8YnZ6nvUk2GOMI+zf3ngGJmpDHJ/QAyjMsmP9KTY/Ey31SLajHKjOQWEazRfMZxCtIrsVQ92KQPb23LEJesRvySaPS8K+uF+GNp+I1nDpYiBF6+4Td9HaEINedWBImJMAp1qqVHsj8ykJYfios+60yHH0Z+1ME6z+P0wMkOHpZtvQLhb6oltDHBur9PSJvA9o3KHo0wiLtAlgoS0Z9yam2ZBo5IxUEwuTHFntOAIhzQznCl0maG/TOfCAhXLgFiaJl5SZfYs01EBf/gvE2uJMi+zQ8I/3cwRqdlyL594YBPyHOh4bXxqCZrtPtwBwW0UOzY/W1EIeXWwJYvOZvX0MDch9QOMxb7Ohs9FeYvfiWCgYoyw2wPzJDB9eR/oJFRvkWnpc4c2TjII/QGWub1wzeecSt18aQ5cHYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(26005)(921005)(66946007)(508600001)(2906002)(53546011)(8676002)(6486002)(7416002)(31696002)(8936002)(6512007)(2616005)(5660300002)(6506007)(83380400001)(31686004)(6666004)(110136005)(316002)(6636002)(38100700002)(186003)(36756003)(86362001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?YD/cR7EEfEjepsMWzjEQ4qCgPVoXQOVJAznM6dUQsvmUHRBvRsjZiBVD?=
 =?Windows-1252?Q?IWzyGxFg6bwnORE9Lb5pJF+0z1yQtA6/FHxnzBeXBkCNQ3Cjw/5DGW5o?=
 =?Windows-1252?Q?1U82zMGbg/iVux+TK9kFJ2vrwIk1az7v+1utO/I+NaDzvxGaafXO1n7f?=
 =?Windows-1252?Q?+2t9lPTW4PYH/JZ5Bdn9HB1kVcDY2+zFW0aqt+Qe/VE6FCpE0fzl4Ots?=
 =?Windows-1252?Q?JvlcxRJwIrnLHTxrE1pl+oJ3BTP1K8wL+ViYks5+hAN+nvRCzAkHZ3HS?=
 =?Windows-1252?Q?smKUofA9lMFWvAZ3Y+Ktrzt6B5ZIpPeWN2FnCpCef7q55Lo0XVuYdGXv?=
 =?Windows-1252?Q?+XUycQUehPju9yhMP6BG5EJ9/4XZ6HhJeBtjTahlAlc3opAlwvBF+Nna?=
 =?Windows-1252?Q?T8wfXjqnHxaunnulzlXos5CQ3eqQVWXI4tSIoTo7jfn7KyMM0puIm+Zg?=
 =?Windows-1252?Q?MvaZoUqF1Idy8SXyzIJ3DS4Lmp3Pg6n0gi67xKHo491tzz0UNeIPd92I?=
 =?Windows-1252?Q?gF77CkNJMp5NxDkHiUxtOSd2Ia3NlstdKBEuSSsGErNX/lZwwaRqAOSB?=
 =?Windows-1252?Q?bKEO1X/l8RsxA+TmfKZW2f4dY6JKW8VeQVnwRovLB1J1d+HbaLUGsKJB?=
 =?Windows-1252?Q?Qy6u+zmWDT9xCLD49W3z5GsO3Qq6By3sSUiqfDE0Dk7K74N8N08RfPSG?=
 =?Windows-1252?Q?EVLPyNC617TtgtlEVXSFVO3qR4i1DrXTnuxwGJD/3dWIdgYyvXf9H7kz?=
 =?Windows-1252?Q?N6Ecs1oJ3Vg7axwy2tB6LoIhmSV8rnjLlt9k7PfydaUtldxb4ZXZIPef?=
 =?Windows-1252?Q?lOPJJloprZhYjVf2f0nwOlVkr7JPsPfdSTADLo8dxfXT2f0zwlRKe0ZW?=
 =?Windows-1252?Q?te0/ICV7t7fDj1060N5gW0SruIWlUlYLUNz4vT6FsZ/QrPKIfNu7cBSv?=
 =?Windows-1252?Q?g0euhYdkg86d8cc3E3FOVxOomjXkCwtEUCR1Xf8xjJflZbcnuekkJ5HA?=
 =?Windows-1252?Q?+p5UxPA7T39P9E1AKXDp2P2BLJOeDXhOGWwxDLT06ogFhKJRMcjaLXYD?=
 =?Windows-1252?Q?/LNmL7fkzibI6byNE+1mNJ+wXz4sNLpVJtUYnyFzfciVI3++B/2bE+59?=
 =?Windows-1252?Q?A1jFRa4HtCgkVEMxXo1Tf0pZTV6uTX07BLAoW+i93LCQjT386MvqrEFp?=
 =?Windows-1252?Q?eMzvXtibKUtWEDRfK9EKAW8cxOLhbMCrcGtnPHwX3T0VcLpXViqLlULK?=
 =?Windows-1252?Q?BcESjwV5Aqo2Z9+ExdERoSxbHDmOv6nQctFVDTQobh5Rs+QiW6xNvlwH?=
 =?Windows-1252?Q?LIizcrI1iyYdtzhRyuNFl+pvaQCj4jfRkI5l0jahuyL3Inl86EiXPif+?=
 =?Windows-1252?Q?urGQIkX92WrtVBhEJwmdV8T0FW2px3WkqOss2A6BxbbpAXDBgXpLlrbF?=
 =?Windows-1252?Q?FCtSllpOKuH5+O7S2ZiudzM0QdtiIs5Q3/L7X+ASUs9AigwLOka/P29k?=
 =?Windows-1252?Q?nz2k228MNgIUvcT5U7VetGfaG3J0DwPr24s+cJcqyxvdqkMRhY3qjAvp?=
 =?Windows-1252?Q?DrV9KmJmy6PkDwWBFk99FZYbJ4MsoIuBlEjuUI1b8hwDgKgLaV3KLrVB?=
 =?Windows-1252?Q?gmVWhij87lck/JIDZZf1DuZ36PQt9w3amhn7xZluTTMQIqkVQ3ptFV30?=
 =?Windows-1252?Q?0OZYW3n01dC/plu3BddHNVlkJeJwekguf1wm1wKdLl+7aV1glyRUw8ax?=
 =?Windows-1252?Q?4ahie5fjpouVY1DGBvE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe738ff9-8325-46aa-6139-08d9db7bec0b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 18:45:53.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye5pMiFAme+09cj6fsVwMmDIWr3Cyg//zbMY+TA/sD5+db1tvX/tW1g1HGMDjFJ2/hDnHNdS/b0g61KdRJBF7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0206
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/19/22 12:39 PM, Guenter Roeck wrote:
> On 1/19/22 9:47 AM, Wolfram Sang wrote:
>>
>>> I considered sending the request_muxed_mem_region() patch series first but
>>> was concerned the patch might not be accepted without a need or usage. I
>>> didn't see an obvious path forward for the order of submissions because of
>>> the dependencies.
>>
>> My suggestion: make the request_muxed_mem_region() patch the new patch 1
>> of the piix4 series. Then, the user will directly come in the following
>> patches. From this series, I will create an immutable branch which can
>> be pulled in by the watchdog tree. It will then have the dependency for
>> your watchdog series. During next merge window, we (the maintainers)
>> will make sure that I2C will hit Linus' tree before the watchdog tree.
>>
>> This works the other way around as well, if needed. Make
>> request_muxed_mem_region() the first patch of the watchdog series and
>> let me pull an immutable branch from watchdog into I2C.
>>
> 
> Creating an immutable branch from i2c is fine. Also, typically Wim sends
> his pull request late in the commit window, so i2c first should be no
> problem either.
> 
> Also, if the immutable branch only includes the patch introducing
> request_muxed_mem_region(), the pull order should not really matter.
> 
> Guenter

Ok, I'll add the request_muxed_mem_region() patch to the i2c v3 series
as the first patch.

Reqards,
Terry
