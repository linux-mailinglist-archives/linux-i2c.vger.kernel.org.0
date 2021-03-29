Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F4734C368
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 07:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhC2F4g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 01:56:36 -0400
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com ([40.107.223.49]:10752
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230243AbhC2F4L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 01:56:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGpIim3VSPWfU1lhsi+uqR+yS+46odgMddqTrUAh3SGHmA+PJZACCp/PWi/trCm1rWAbcw9PRDBOnqZZs3gganbzslntDDK8f9Va3v1AEO1cl2sOOeE65YLVxK3SuwKA0G7OoDv6BoD6tBWHbQYQCE8C+Yb+/5NDAJK9C0FTK4OhxHGPYfX5f3LgjAffElDHuZNlwcWaQGAymEMBXwNKiMarr2bozHBDEqwYREAIcCsh5P3OW63IOe8h0Ua28NE7OB4XclqyUiC6IHqzL6mb8MMCyj0KiX/wbnhbSSqIRhcbRkKn2PhXSvb2FTlRVeKcOItj6+KsOeD0mqI+l4o8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW2x/Kvrla03X4xkbwvYwSofSayev3a3VlsjkHesv/w=;
 b=Rn8gsS07AbLdKbKcaB+XOtbyezhoC3iutXSFvqkvxbGhL5koTFKgP7pR3zTB4rNzN1Mba2QBuyBgq4L0N8mz//zew6JAWyXyNOzbt9mstCdoaWgFMNixx6l/7Nldeusm2QpExMNfK7usHMrOSIP5pt8l0h2D2Ul895RlAgx1cVCvIKbAwFKHAeiVGMXkh1Zx7Us7+BPKuSUdacESU0/0QI2bHrbHz8Z2+0V/2b+pcW6+HLVWjr8YC7hvu40/1RmrhDO65y0s4AWPLEbX6vs0reGFmndbWE6e9xNOgEyuWXst1hvP07MKiigqZHeNKX4NmvXKEc8Mfj3o+VK6yBZ7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW2x/Kvrla03X4xkbwvYwSofSayev3a3VlsjkHesv/w=;
 b=VzfxHv4/WoCOlA4PeDQY2GCxfSfuAVR0Kzrr7GsDiVBKux6vNg6Nt9D/1HYuI7u0C2RDECaRkKqW6CNndiw1j7nqXGF4eOUwwQ0igREh3a/82gJ3cy1gvIaoUAyiGt8eVPrQM+Gz/boSo+/AMi5vUXA9g+4UBjVY5ZovDyx25kw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB2503.namprd12.prod.outlook.com (2603:10b6:4:b2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 05:56:10 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.032; Mon, 29 Mar
 2021 05:56:09 +0000
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
 <617d0164-1290-250f-ae34-828c6b4b390a@amd.com>
 <YF26F8IFmbo80rMq@smile.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <0ec22c6a-ec19-774d-bcc7-04a7f69c841c@amd.com>
Date:   Mon, 29 Mar 2021 11:25:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YF26F8IFmbo80rMq@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MA1PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::18) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.34.232] (165.204.157.251) by MA1PR01CA0124.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 05:56:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c601e6a2-cc35-4d0e-6bc7-08d8f27759c8
X-MS-TrafficTypeDiagnostic: DM5PR12MB2503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB25035A91F4232213BCE62B399C7E9@DM5PR12MB2503.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwHYkD9nLmnCs379eVwDS4YPp49U7GIoexneUY+X2VuWkRqSRWVKD4mt6Z+MysnNCFQ9QWy4uGGPbXR75jj9rJbeqcpRv8g/KJ0VZEgNPZ2EMhX5Tl9128v+AYt+RkwnErGph9eA8vCMddzGbJDo8EdfN/Nw9wYMy1yC2U1cH0vZsqD0sOJZnPEowXIXR9dgkJ+NtXBoltfFvmWyr5cwLiJXqOEU5RY22BjXUw+JF/KOKyNN4Z3CvAGewh+ofBHV604uTyzZRKqLOeaVXv8jLC89n1VJn9lVHYIBunKJghp3ciQnsv/YRfe+XGX9wG9/kZnfdC1VmGJYdhnMILMe/QxiPBznWceiJP08XfpgELr+JaPBiMXpGb+3lDyZYD1p4zY4YNkFTql7tqqxhMjtFQBVKHw5UOrMRGPd3n0WKmjWaBaa9TLMfQLL82+jVUXXhqIBpaWB7C93+ipPm865AuIz6LJHpQi1QnP74umk4CoDVPfuKF2J4XGGjnbWLyYHjHONCCntKLwXs5kdL6/EOL+bAKbcH9lDDWheczLyw807hcmNW/UdNC6hyINBhzw6TXVjduo0Uy7KmdQGcD3vGkmfA5AEkisSALG3NvbtMZoKX7A6aoLptOtlkmoG7qBd0dGRi3RjhVrjCJ8npPUsrINXdSYpIMf7OzEuWKWzPiKCxXEANmFdB8f3rpdIOAhZKC9VONDiFWXvs0nq2RE1bQ9weccovk6U9+6Ky4GIADY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(5660300002)(316002)(16576012)(54906003)(52116002)(478600001)(31696002)(6486002)(4326008)(31686004)(86362001)(8676002)(36756003)(8936002)(186003)(956004)(2616005)(26005)(38100700001)(6916009)(2906002)(66946007)(83380400001)(53546011)(66476007)(6666004)(16526019)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ujc3OWRrbUE2b2wzZ0RvM3ZqWjNaWHErR09OZmdpb2xRZXJJTnhhRlRpaVNW?=
 =?utf-8?B?eEpNMnFDdUpNM3J3eW1uOGoyUG1tRzA1TGZ0WVBoQ25oVGZzTFZEa3NrUHVO?=
 =?utf-8?B?blBnTGwrc2JQbnpVWE1Lc29wbjZDNS82Ky9vS2RWbU12QkNWenA1NDg2Zksy?=
 =?utf-8?B?WHdBelZWYS9PR2ltV1pNa2lpSHJBOGZtaVRzS1V6VTRyL2RyQjRWcVc5Rmdj?=
 =?utf-8?B?UWpNSXRzSUdkZi9PemFFcEhwN3JocFZFVmpwaTlaZXNwN05aTnRLL2doMi95?=
 =?utf-8?B?NFgzd3hSclVkeE1TWHdEdmt6b2VRU0h2SU1udGkybUduT1Z4U0ZDcGNIQ01t?=
 =?utf-8?B?b21Ka2k4WlFxRXU0c0pnQ1J6WDBBU3EweW4wZEQ0RklaN1JFL3dtZ09lY0FQ?=
 =?utf-8?B?QllHVGNTRTNkM05lWHR6U1A1R3BQSFNsWlBYeXJkQTV6V3hlVFJOOGd5ak5k?=
 =?utf-8?B?ZlRoTFlsMjBOQTE0SGU3blFyOVV0a2U2TG1nK3hDWVliY2RGSGhnVkhDM2cv?=
 =?utf-8?B?ckVkdVZPd2xsSks4YmVRTUpUNUtQZ0lNZDk3aDZkSktRTm5TdDEyWFplcytm?=
 =?utf-8?B?UEVnZ0RWcEVEMFhIUzZqZEhnV1IzNzAwLzN1SWttZlJTeXVucGJBMlJNNm1h?=
 =?utf-8?B?RDVseEJzOVpaN0hpbjh6RkhXRHFWQktvQ3dVUmJXT0tXcFZMb2lRYXpBMW9j?=
 =?utf-8?B?alBOZFBHTVZwY1ZJNDFtWUtobmFWR2xrZ0hFNnFqd2ZESWlzcDVOK2IyT01U?=
 =?utf-8?B?NFZ1bXdBekpNNUNtazl1WVcxZEJGLzNvbGxRZEhXQ3hYTWdDdlVNUER0NGp2?=
 =?utf-8?B?dHRpWGZObWY4UHdkL0twamlDd1JuMkd3bFNWK3lpc1pUYUNDK3U5YmJSa3I5?=
 =?utf-8?B?NGtHTkNBazJlS2R0ZjFjbzdkMFBPOFlBc2JVMDZ1N3JNTkVZaFNWMXY0VU9C?=
 =?utf-8?B?cVBRZ3o0WDIxdVl5eUtZNUEweFJmekNRa2l5ZU9tRWJmVHBvVzFYUnVON3o5?=
 =?utf-8?B?c2JrRGh3R0dZV2RBbXlvSUJFSS94MFNoclpsV2RYTXIwLzdLdkRBVnVOYmoy?=
 =?utf-8?B?ZDJjVFZtZUdkUnVNcDhjVmlOT0xCSmY4VWFwNk5TaWVRQUF0SWJCNnBiTWpI?=
 =?utf-8?B?cHBXblJOOXFSVjc5OUhHalVRSzJiSitMQzBxR1M3QVd4Tm12cGd5OHhUZVNW?=
 =?utf-8?B?OHpIek0xM0xFZ0ZnMEJ2cUFHK1RTZjEzSWJQN0J4WlorQU5Sd2wvODgyS2g0?=
 =?utf-8?B?eVBhdTF3U1hoSkgzMGRmSzh0bDEvZnNnYmdMdGdIcWZRQXM2clR2UE9FNlhI?=
 =?utf-8?B?K1o1SWxrNUZTTnFrUUZPOG5rRDhheDR1UDQ5b1ladGJVeG5WaXl6WTU3a3Y5?=
 =?utf-8?B?cmd4Wm1BQVlTUWRkZGc2eUYyU0ViUEppVUdtVWpxN1FkQ1FQSW91blZ3U1lv?=
 =?utf-8?B?dDNUcGdKQVR1bUtwYVJ4QzEwdWs4a1JXdGFiZWlVNHBWekhiRGNkcFZvUkcw?=
 =?utf-8?B?cENSdnoxS2xZdUY2dGxFck02bitWRkh5ZmxzUVNJOGF6WElFaHFzMG5NdUU1?=
 =?utf-8?B?cWx5UmpCRGpxeU1GS1ZPL2VNc0hqaTJ1elc2Vmk3UlpJYjcwZ1dIR24vVUdw?=
 =?utf-8?B?Y1BEdk1aTXNqUWMrcC83REhLREJaYnNQU1FBeTBBOHIzZFpUckorTWJXZjlI?=
 =?utf-8?B?RkduY2FjMUluUENXOXNiaS9SZ2dCYnJiTXdYQ3lpWEc2UTNvdXU3a1FyMVJM?=
 =?utf-8?Q?vmLsNPU7HCqI8R9kX6kzY1VssDSAQmNNfrnKI0a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c601e6a2-cc35-4d0e-6bc7-08d8f27759c8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 05:56:09.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxDlrHOJQ+oX3hdoogfumUa+U9ob1dF0h8fX2ilMgxnLRY8GA73sBp7gPRQHZ0XTcAOoszYIq1dTi698lLFR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2503
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for the review.

On 26-Mar-21 16:10, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Fri, Mar 26, 2021 at 03:53:34PM +0530, Goswami, Sanket wrote:
>> On 25-Mar-21 22:35, Andy Shevchenko wrote:
>>> On Mon, Mar 22, 2021 at 10:26:55PM +0530, Goswami, Sanket wrote:
>>>> On 09-Mar-21 19:56, Andy Shevchenko wrote:
>>>>> On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:
> 
> ...
> 
>>> And I think I already have told you that I prefer to see rather MODEL_ quirk.
>>
>> I did not find MODEL_ quirk reference in the PCI device tree, It is actually
>> used in platform device tree which is completely different from our PCI
>> based configuration, can you please provide some reference of MODEL_ quirk
>> which will be part of the PCI device tree?
> 
> I meant the name of new definition for quirk.

Can you please elaborate this? i am not able to comprehend.

> ...
> 
>>>>> Also why (1) and this can't be instantiated from ACPI / DT?
>>>> It is in line with the existing PCIe-based DesignWare driver,
>>>> A similar approach is used by the various vendors.
>>>
>>> Here is no answer to the question. What prevents you to fix your ACPI tables or
>>> DT?
>>>
>>> We already got rid of FIFO hard coded values, timings are harder to achieve,
>>> but we expect that new firmwares will provide values in the ACPI tables.
>>
>> AMD NAVI GPU card is the PCI initiated driver, not ACPI initiated,
> 
> Which doesn't prevent to have an ACPI companion (via description in the
> tables).
> 
>> and also
>> It does not contain a corresponding ACPI match table.
> 
> Yes, that's what should be done in the firmware.
> At least for the new version of firmware consider to add proper data into the
> tables.
> 
>> Moreover, AMD  NAVI GPU
>> based products are already in the commercial market hence going by this
>> approach will break the functionalities for the same.
> 
> This is quite bad and unfortunate. So, you have to elaborate this in the commit
> message.

Sure, will take care of this as part of commit message of v3.
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
Thanks,
Sanket
