Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23E134A56B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Mar 2021 11:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhCZKYQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Mar 2021 06:24:16 -0400
Received: from mail-eopbgr770044.outbound.protection.outlook.com ([40.107.77.44]:65255
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhCZKX5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Mar 2021 06:23:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFXzNZSiOm579oltGGOV/coGuoRLEETrbhanFT7bsnhJkvvhmE/yzLQJYHzoleWeeYGR+dibsDfVrwbS3dAB44uJQcxHnePfj5sKUOqA6NfqbhJ957a6PMhMeGaH8kFFY7xqTW/pNtPUnKrkAjCYMqvXwNB/0StBaTPwHsfClRfa0vuqgHp5sbY/+TEJuL0YsqQzoaVSj3t9n2T+HSQ+uqI3CmvrG97jELFTW0UNL7upEDFCC1+tgXfzKFTz9ZD+o7lUSl779U2vuT7TNfOBrARxqDSqQQMowdIUOe2CO4tFp1R0s6Z3qt0XJ1Z2wh/s5j7djOsYMHDbghsM+cKvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHFDUX1V5BQa0UHGawKW7knw5ocvk6b1G2gtjAjaQBs=;
 b=oGvs2PKxITtRyRe7xJEcKIcqvi5+82AOWIxJHwzCkfrHsgFUtKog12gESX3IhdeHeUEl1INNid5tPEgHBBXiwmzMJVsXuFC82HPwlseftsxo03ADovhdtEvLAY6gPMehnQfxn/BxUJ08eoG/4MhjnqOcvvnWW2hrvNvx/xD0lzPUq0Dqqvc53F9PLRD8fTJ6s5BOsrtwN/PpB/WtAlBslY+PI28CdcMHfXeWhV+0BuGhu/xOoGmiG+CVtnSv5W8SLDxJ6JpGbxVLWwa1swCfvcZi6Hh/IApvblVgHaFCUeUtN3RMdHZvl2Ale4GPH9W4xGJwfnNvUsqXjFzifgCdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHFDUX1V5BQa0UHGawKW7knw5ocvk6b1G2gtjAjaQBs=;
 b=2L4ulDgmMG8+jz9YjXwDjOAj0naXpRB8h8uklSjxmXSmtr/DLpzn8tznXscAtprXe5cVyvJwSHKF9LxkO/7eoayve0rgY3VgYQyctsTjiiVcPH1dPaU5sPWiqaeC8oi7B7MnMLRSQ8u3NcIsri/MuA1gUEymifAXu5A3j/DdsE4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB1259.namprd12.prod.outlook.com (2603:10b6:3:75::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 26 Mar 2021 10:23:55 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.024; Fri, 26 Mar
 2021 10:23:53 +0000
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
 <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
 <fa1a59fb-a7fa-44bb-1629-5e726f164b94@amd.com>
 <YFzC19IiGZdmLCOR@smile.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <617d0164-1290-250f-ae34-828c6b4b390a@amd.com>
Date:   Fri, 26 Mar 2021 15:53:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YFzC19IiGZdmLCOR@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.34.232] (165.204.157.251) by MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Fri, 26 Mar 2021 10:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70d5186e-d1a4-49a9-fe20-08d8f041402c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB12595FAA29340FE02AAC27949C619@DM5PR12MB1259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tR+kSLChog6YQIj3L1/rvLY9cnMvs8Dm1tUECj1YfdeyYq7rIWH0hbDse7A4GnbIg0gzrVn7n7ow+hmn2aIXHpj3kQq8kuvy2nnyYrOQ1jDxjcSgvcquHrhqPxwpP7Qiv+3TnuXpz175XhUagZ4KY/OnedoNgAQWAzz+zuBDQQZUJ/fF4WXrbfhrx6C5A0KsTXNN2V6is4UAzFn3xMqX+RGcwqyPE9qHboaMakJ80suO1GGRl5B9OUJ8XjFT+57yHogFBELHU5S3Hw9KT6xKumpgm/mvnVPKXnDYnvpUHXmk5f9ZrRGlkF+KIZ7T+RZGbSPfmhgtSo5MX5/MZwrVhxrz4KBHldCoNQbrYUySsCvXg2INrzn4TNNuTZUO6I8VaPN6lKN/UvBMEmUYIfL95+Jn2RdCc9meXgyGY6uJpOyR8gWN+Yc9OyP2MtkW3dCGpNAAVJkFvWLucR+Ge1OYv6kQ+C4LPk+ON/Vd3fDhy/mEOyJPl58r0oNEyJXm0gui2+2FqnZHRvizpN42+Eh0+DH/Ya/csor6QGIhSp9wJhrImfNDW7QWUA14i8+rTl1foBiez1/n1q/v4xvNHymIngPes9I6TTO5Ab1tKToMSU/f7739wEzEoTL+Wd3lqq/SYQbMyG0EJl/yqNN/i4Xl12b5yKBiaJKXyb0Re0GIr4Ss3n04mJ2vnJcIpnFuwizOouDehEisWoaoOn2mPaFyBs1NCAbWwnhavQmd2OXEs28=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(316002)(6666004)(16576012)(52116002)(31686004)(86362001)(38100700001)(6916009)(26005)(2616005)(53546011)(956004)(66946007)(8676002)(83380400001)(16526019)(54906003)(186003)(66556008)(478600001)(66476007)(31696002)(4326008)(2906002)(8936002)(6486002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTZzYnhPbWdwbXNqcDlCUnc4R1VtcEdjMUphcTRYd3NtYUg3NW9QenREUUtm?=
 =?utf-8?B?ZW5kM25vR21qN0ZiczVZWVRpRWxpYmhCYmV2ZHZja1N4ZnNqcDlwSjdZOUo4?=
 =?utf-8?B?YUkzTUcxS0hvaXNib0VPL0pDWERGL1dWQnpXSHJ0bjN3NUcxV1drS0pRaE1L?=
 =?utf-8?B?RzdrRFF4OEFEVGNqeUQraFJMSzY5OVpyTDBkQjhKTHE5SlFhcVhQN3hTWE9T?=
 =?utf-8?B?NFNjVVEwZmdrdXhtQXozUzJoQTV1NnJUMlB1ZnBGM3FJSm81NFVENFZKTHJN?=
 =?utf-8?B?WEYvREdOdGlXODkyNWVNTlBvN0g3Qno0bGtyYjJDUG5CSzgxNDJ1S3Q2SGhx?=
 =?utf-8?B?WllENmZKSDhObExLaHl5dko1ZERPd1FRditBbXUxOExBM1crMHFKc3FwY0V4?=
 =?utf-8?B?M3JrZ3l0UFRnL1pOQTdSTGJmN241YzBYSzJINnJnMEZERWtENkE4V3EzYVUy?=
 =?utf-8?B?K3J6VWhyblUwMDFQY3NnSVZPcmFQZFZoaW1BMHozTDMycTVsdER0MnNMQmpC?=
 =?utf-8?B?MDhpU3lrZGQ3RWM3ZEI0NTRJQWZkMERjd1RoL1RQaVJjdjkyMnVFZDZZSC9K?=
 =?utf-8?B?MitsSnRYZnptNjJsY05xU0pWSkhBdG5BbGlxVUpxSzFyeWdxRzVEWnR4YkUw?=
 =?utf-8?B?eGFyKzFxaUIzYStmT1UrRDdscTFPZSsvWVhNcC9zK2xYcVVTQXVnSUd1UUZC?=
 =?utf-8?B?ZmptRlBwdVVEVVNmUnlNL00rNDI2d2JHbGFLZ3dBbWhCZmY0WW5CM1NIWjU1?=
 =?utf-8?B?Y3A2WUxSYWNmWDM5UGJtNld0MXc5Q200ZWovWVZXZnhOTzN5TXRUeFpjeHFV?=
 =?utf-8?B?NG9nK0RsSXdnVWZZK1JUSkpqNS9pR1hxWklGVTFjOUcwaXprK25Ld2Q0TmRP?=
 =?utf-8?B?MTdINHU2b3liUnpTNUxrU0dzY0FRbHlkcjRyNDY2b2dRRmVWek1sRGorU0VF?=
 =?utf-8?B?cXlrQml4TU83SGdLZmQrZTVFRVY4eUpENzk3K1FNeHdDelZtbk5nR0JBaTlo?=
 =?utf-8?B?bzhkc2pDYTVNbXVUV05TRjlxM2M3UUM5aDl6MkxCN1NHTnBJZHhvRVhueWIz?=
 =?utf-8?B?QVlQMzQ5WXVJZ3Q3QzliUlJ2cDczNXdtbG9TQUd6SU0zZVhLV0xTRHVWcTVC?=
 =?utf-8?B?VnZtWjg4ZDU4bFRyaDZEOFpZb1JUS3VKSG4xdUVxY0lXdGdqQlpRWlVLWHFH?=
 =?utf-8?B?eWFsUE5BaWdFb2F2a1dlVWYyWnorMDhON1Q2M2VIZ0pnSFZJMXMxaWVtOTFE?=
 =?utf-8?B?elJiTXcvL2ZrWm1mQm9CQUt3SmwrTWpoOHVINXQxanR1TTh4d1ArcGg2MWxI?=
 =?utf-8?B?MENGY2ZHazFaMnlHQS9tclRRTmFiZmV4NGltcUZaS015aktOakoyZnRkSm91?=
 =?utf-8?B?S1RCMjArL0lkNVFxTzh4RkV0T0lnNldVNE01cVd4Z3JJay9iZ3A5dXZWS1Nv?=
 =?utf-8?B?V3llUlFqSFZlTHl1dkJqMU5GR2xSQVVEYVhWU3NXM1FUTXlNZU9KTE9zekNI?=
 =?utf-8?B?dDlRL3ovVG9KU01lbU9MUFpualI2TkZPdEJWYmJrdVlibUtQeEJsOEdJRmw4?=
 =?utf-8?B?SE5DU01iNmZnN3BzcVhSek1sbHJoNU1MSVdxSW03VVRDbk5UbEtGOXpWdzNx?=
 =?utf-8?B?bVNGQWRkSUZIaUpOVmtBT0ZVMmhaaHVRaDZpb09vcUZYS1dVNi9EQjE0NDVs?=
 =?utf-8?B?UW5tSGhRZHMrbHFkY1hWbVBkTkFqSHhPbkVLQ1JtVXR1d2pOYmtGZDFSTE1L?=
 =?utf-8?Q?4C/jFKIQ/uOqMFSnLtTA+u95Xxgzps85n3/MwMr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d5186e-d1a4-49a9-fe20-08d8f041402c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 10:23:53.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WD+n+7QCPimjWiHHXk5j980LHMHy/GAwHIaG6/ctpD4goh9geWicoOJr1utCH+mylC7vsvBTlx1aakqz4wBLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 25-Mar-21 22:35, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Mon, Mar 22, 2021 at 10:26:55PM +0530, Goswami, Sanket wrote:
>> On 09-Mar-21 19:56, Andy Shevchenko wrote:
>>> On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:
> 
> ...
> 
>>>> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
>>>
>>> Why do you need a custom function for that? Can it be generic and not AMD
>>> specific?
>> This function takes care of AMD Specific bus configuration for the transfer and
>> also addresses the IP issue of i2c transactions hence it is kept as custom.
> 
> Can you a bit elaborate this? IT would be nice to have a comment in the code
> explaining what is the difference with a generic approach.

This will be addressed in v3.
> 
> ...
> 
>>>> +     /* Enable ucsi interrupt */
>>>> +     if (dev->flags & AMD_NON_INTR_MODE)
>>>> +             regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
>>>
>>> This is looks like a hack. Why is it here?
>> In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
>> it is mandatory to set the right value in specific register
>> (offset:0x474) as per the hardware IP specification.
> 
> Why it can not be done outside of this function?


This will be addressed in v3.
> 
> ...
> 
>>>> +     if (dev->flags & AMD_NON_INTR_MODE)
>>>> +             return amd_i2c_dw_master_xfer(adap, msgs, num);
>>>
>>> Ditto.
>> Initiate I2C message transfer when AMD NAVI GPU card is enabled,
>> As it is polling based transfer mechanism, which does not support
>> interrupt based functionalities of existing DesignWare driver.
> 
> Ditto.
> 
> And I think I already have told you that I prefer to see rather MODEL_ quirk.

I did not find MODEL_ quirk reference in the PCI device tree, It is actually
used in platform device tree which is completely different from our PCI
based configuration, can you please provide some reference of MODEL_ quirk
which will be part of the PCI device tree?
> 
> ...
> 
>>> Also why (1) and this can't be instantiated from ACPI / DT?
>> It is in line with the existing PCIe-based DesignWare driver,
>> A similar approach is used by the various vendors.
> 
> Here is no answer to the question. What prevents you to fix your ACPI tables or
> DT?
> 
> We already got rid of FIFO hard coded values, timings are harder to achieve,
> but we expect that new firmwares will provide values in the ACPI tables.

AMD NAVI GPU card is the PCI initiated driver, not ACPI initiated, and also
It does not contain a corresponding ACPI match table. Moreover, AMD  NAVI GPU
based products are already in the commercial market hence going by this
approach will break the functionalities for the same.
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
Thanks,
Sanket
