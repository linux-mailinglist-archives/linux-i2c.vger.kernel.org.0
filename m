Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB7049BAED
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 19:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387484AbiAYSEM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 13:04:12 -0500
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com ([40.107.236.85]:44601
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1387447AbiAYSCx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jan 2022 13:02:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3Pd+JuT87XxYMlm5rjIsVg/9Qs2MMBs8knT/31ZXTL7WYWwuXsZnYEDV+/llMiBacF+R5Q/+NfWdgMQRXdsi8jwDoOp5RkLVZLzkGVbpSN3Pj8AZSaZkq2P13Ra6CrcHsghO7yfeLntena0uWSiTpx0q9sKpudPC9ywBqhpilf/sxXaQXL39oO2frm+0/Juaw6T5Klnyu/W/C9wOeDxW8sx6iy98zgYtr7DivOwsKSw2lxwKOsK3mX5mK09OReB1fs7P0emFbmhswOXkmsrF5SlI45AygUYx87pyognZpk0I/onrCE39IdJ9IJoekZZ+WZDgWhGyscxTc/djb27qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkm0ihWnqSF+mV1EIwcrWVHPLslLzvMa2covK24Xvdg=;
 b=kCCFwE08Wovab+Rn1m2j18qGsfva2yzUzb5ASyHMAqH+LauOcpA+jFCGCPEjTYHC5dQg2AYUm6W5F6EPSUYmtcmnl/WgktfZ9IKy7nlAu5fgtzsbgKNxqoqMzgynSrcEWILR+8PI+mUpTNOG1lNA2IIo6cNewuIIS1km6zX+GSusitBw03pwXOpLgGt+MDBbMc0KR/UMoUr23euyvcU/SR4uyzC3OoMKOZCUHuh5bXJiZDcyB/EndiGVS/GUcLE4DRiMLWbZMVJpVET8jKvwEGcB5ylmXOlWfuFCu3NdRJq5zNVM+zGMdFjJgRnHnWiypkQkcmL3ysZKGGpQwjPS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkm0ihWnqSF+mV1EIwcrWVHPLslLzvMa2covK24Xvdg=;
 b=cI4r+tvCd09Q6xt8Ek2t5CgYhLC1Dm3r8tSt8B9HEOHRDMiDkSOj8kM9b6v6IGW/fui1IylaP8sBKsoppABHU62zSsVag7HiliEBxjBYtNLXkWQU1QvIaG1pQl0im31GufTIM6POWxZCCKSoa1dj/gjdXBzf/ktdK+8vLliRLL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 18:02:48 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 18:02:48 +0000
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-3-terry.bowman@amd.com>
 <20220125144520.17a220bc@endymion>
 <a55ca093-d8d1-6821-1cb9-18343c6f1fd0@amd.com>
 <20220125173857.1c85fddc@endymion>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <717b02cc-ba0c-ddd4-d15d-cc0828fbb3fd@amd.com>
Date:   Tue, 25 Jan 2022 12:02:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220125173857.1c85fddc@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:207:3c::31) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69afbd2-94e9-461c-d483-08d9e02ce55a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4059D564E5AD11CAE72ACE05835F9@DM6PR12MB4059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjaKrLFPUS5ziXRCx2APb3Kkjp9lTVBwgLSLCXp5WObwN2+HSuHCzQy4Tye3O8Vewrp7qJ354oDA74xMV0jT8m8Me7U/y6wKlgR6KjLd5W8M/wa0uNRKIjxl0jOEOBTlXF/Phj6sjFuCkypSKab8CmBAvrYTyzXax4Cgf34rim6Jm80GXOXyhHLWlJ7FvuYTtXGzbH2PjqVDVCvLs7+GCyMT3Fx2mmwoa88oaMhBhX4nKBOxiTgky30VIrBdCm6h1DDr5TzIzk6//tF1OaV8WQyr1EBlyksVIBub2recSpKYVekcBJWb4UDWNcs2Y/hYybji9ZTSK++tpkB9eA57QVjbLEJXEn6NC9UwKiM2Ao9WGNAUXYxgeGGS2KNshGj1ufG3a/HnF2elRskOKrqmkWQpopGJKNMUSEckqOSYiZ7TP2UcELOSuFv/u5NQF773rUNf8m05sEu/TB2CRS5KQzapoE7vtx+pSWFPJU1n5eHKUhx3CPbEKnhSEBv9F8zUkm8VV0y1/Lt6FUN47K11hoEtD5PpyYJsjTfcx59WvlJkMBhAJfNnFidsxiL/nhUAjBOzY0WbdZxJqBZY5FKYceN3zavacxWZnMC/bYlKlM2vE/ISQaCzm/RjTGGzXQf4gK7R69tPQEhXtXeIju7xTQJF5OrIMapLfL7mUnQAblMvVhU3nQCRui0pTsuvjeHmajO4AdJgFY/7F18TOUpbSzJksNFD4JI9k2WkToi3dY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6916009)(8936002)(26005)(38100700002)(5660300002)(53546011)(6506007)(31696002)(186003)(6666004)(36756003)(2616005)(86362001)(6486002)(8676002)(31686004)(508600001)(66556008)(66476007)(83380400001)(2906002)(6512007)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVONTFrdFdhR0NyOGZ0WGR1Z05WV1RwWGFoTmJTR0QyQVdJbldzNUY1K2Qw?=
 =?utf-8?B?MzlxR3dFQTZ6WEZoR0xpTHJNU0tlUGlWQ1FmY0dQWUo4YzdId3prOXNBVkQ2?=
 =?utf-8?B?TXVleVQ4V0FJZnRIOVZkTXF1bmpDbzBKNUxRdDB2REE2ZjBqa2dma0ZtWDJZ?=
 =?utf-8?B?dGhPMDBMM0xTckppVDIrNWx2dU9DVEdUMlAwSG9xNE5YSUlMMkZZY3FvNlFl?=
 =?utf-8?B?Z241bTh0ekxkUlNhWGRJUklkVmx6SThBU1JiY2Vxb1I0a2RqL1JCSWJ1Y1FY?=
 =?utf-8?B?dWtIdDFTSGova3c0L3dLT2hTR2pXTmczeXppOW9ub2NHd3lLckRjQTRDT3Nq?=
 =?utf-8?B?bkR4VTVNa3gzZXVweGxIN0xaanNYcHFqYlhqbXRWMklTZG1yczVWeEpDRFNh?=
 =?utf-8?B?eDFqTWRDY2RDVDJaZWVFQ01iQWFzNjIxVW5Wdzl2SFpXeCttLzN1YndjRE1m?=
 =?utf-8?B?b1pSejhnOEd3NzlOaXNCbmx3bC9sUWUvdjdNTXRaUlBMdFI5bzZTRWVXMk1t?=
 =?utf-8?B?S2hFczNRM1ZyZ3piOFJwSllpRkw0WmFabjV3WWwyeTVmM1dXR3ljdkxld2pa?=
 =?utf-8?B?cnBieW05TVppWUNBZG1sc0czeDVwVTdVc2VpUGppby90b21TREQ0NVIzK2tQ?=
 =?utf-8?B?TzlxQ1JuU2wzZUQ5WFR5RkNHUkR2STJpRExUZEtKTnQxbzhSVTZMRkN0eVVa?=
 =?utf-8?B?Ky9vZ2Z4QkV5YXVnV0xBcUQ4M0Z2UDhBOThqUHJ1MUR1NmkwRFVVRHBxa1py?=
 =?utf-8?B?TC80NGtKN1N2dU1QZ3dHNmZ6YTMrZ3NlOUpOaHZkR2RlMHVkRDBROVlLdDYw?=
 =?utf-8?B?ZVpVWUNYV0ZXT1JMdEZkc0p6MUEwckFJaG9zT0gzK1FDRWNYUHhLUzZ3NUJT?=
 =?utf-8?B?dEVrS2kvbXVNMTlQV0xNU25OMVpFZ09SUHd4dHlPOXBuUnQzdWtKdXNKMDlq?=
 =?utf-8?B?a1JBN1Y0OWxtQjdVbDVFWFdKTE1xd1MzSUtMNFFocUxHL3kvOERnakVaUWl6?=
 =?utf-8?B?SWxjemVHTTczWFJXZzlXbFAvUS9TdTFGWkd6ejZOOHEvOTRPeXpxTDRwb3o3?=
 =?utf-8?B?aktqNndMRXZteDdtZlhWMTBBVUxtL2l6eGwvSk8rdHB2YmdiOTZKbU5tM2RE?=
 =?utf-8?B?QXJ6eTlNMGNrakxtcXpPZzFaNVNuM25GdE1PODJZTXQ0Skgya1hQYjhTdzhL?=
 =?utf-8?B?bCtRa09LQnZ6WWYycEhyTlNBNDZRTkQyeFRZNngzeCtUZWYvYmptUW8xS2tJ?=
 =?utf-8?B?czlLUHhnbHZaR1M4cThyUVJJWnA1N0JVZzNyc2xYRUpleGJMSXZxMU16aThO?=
 =?utf-8?B?U0srb2VZZHJIdTRxSUZsdTM5aG9NU0RTK3JKN0dJS1UvOHQ0ZGtvUnZjaWhF?=
 =?utf-8?B?QnViS0YrMGt3SkJmK1RmUk1qa2d5RS9uK0ZST2tqcUxCcVlxN014eWVoUzZr?=
 =?utf-8?B?OEdRbWZqaXpBQkY1eFZWZjh5ZWpxc3QyVEQxMXRDTXdwM2JMSzhMUGQxSnFV?=
 =?utf-8?B?SWV4Z0QyOFRkYm1xeXJqMmhYajROL0lkOElnS1NpMU4rdTJsSlA5SEo0dDNY?=
 =?utf-8?B?QkNPSkpIZ3J3RkIxYkY5YmI0WnFoUE5jWTVlSmNuMHZtV21xSjljV3UvVHkv?=
 =?utf-8?B?TnNpQ2NmdVRHNkF6UHkvNGY4QXppcVBaNStPWmFIL09QTC9jcE9yejhIRWZs?=
 =?utf-8?B?UW16VUZHQXBPdDZrbUcrREhBUzVLdEpjSjk5M1VyaUNtbXljVTdUZGk0cWpO?=
 =?utf-8?B?cEd5QnU4S0Fva0tCTUQ3WVBsQkVHUldzTFIwSzN3clBBWk5ybHNJeEsrTWdm?=
 =?utf-8?B?S1Zja2UvUC9kYS9wNWpYK3M4dVExUXJsSTlGVTQrMTRkcnpaUHFuaXlpbTRT?=
 =?utf-8?B?VUNqbWNtcUYvakIxeGt3c0J5KzNUZFQxd09HTHBld1BJcjlIdVh1VkdCSWxz?=
 =?utf-8?B?aG96TFI3dXVRK1FmZEp4d3hGSjgyQnBsTlJ6cHVlRGJzTHRURXQrUXNLTHMx?=
 =?utf-8?B?d0o3ZGtVaWIvSjFtaGlPOTh0ZWdPeWM1YkJPZVQyN2k4VDcvcGVoWERlOWlr?=
 =?utf-8?B?ZVJ3TjhwSVVzKzdKVmN4Nk91aWFENlhSZWZUQkpXWlpJVjFsM3BPN3FpZE9L?=
 =?utf-8?B?VFNlOURlZUNPQnFJNGpNeG1VUzBNMERTNDFBSmhrUDFjSjNiQncyMHZYSDZj?=
 =?utf-8?Q?Hw8IjSsnCWxwr6Vg1RsqYaI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69afbd2-94e9-461c-d483-08d9e02ce55a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 18:02:48.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf3qbLglyndoHhZ2MMkMOjrfnxiMOr8MByOM8rU58Lh5zfSC0+Ylii2ftvAIYpulclB/jCSj25x0hRWcoCL0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/25/22 10:38 AM, Jean Delvare wrote:
> On Tue, 25 Jan 2022 09:18:59 -0600, Terry Bowman wrote:
>> On 1/25/22 7:45 AM, Jean Delvare wrote:
>>> On Tue, 18 Jan 2022 14:22:32 -0600, Terry Bowman wrote:  
>>>> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
>>>> +				     u32 mmio_addr,
>>>> +				     const char *dev_name)
>>>> +{
>>>> +	struct device *dev = tco->wdd.parent;
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!mmio_addr)
>>>> +		return -ENOMEM;  
>>>
>>> Can this actually happen? If it does, is -ENOMEM really the best error
>>> value?
>>
>> This can happen if mmio_addr is not assigned in sp5100_tco_setupdevice_mmio() 
>> before calling sp5100_tco_prepare_base() and __sp5100_tco_prepare_base().
> 
> Ah yes, I can see it now.
> 
>> I can move the NULL check out of __sp5100_tco_prepare_base() and into
>> sp5100_tco_prepare_base() before calling __sp5100_tco_prepare_base().
>> As you describe below.
>>
>> The ENOMEM return value should be interpreted as the mmio_addr is not 
>> available. EBUSY does not describe the failure correctly because EBUSY 
>> implies the resource is present and normally available but not available 
>> at this time. Do you have a return value preference ?
> 
> Well, if one mmio_addr isn't set, you shouldn't call
> __sp5100_tco_prepare_base() for it so there's no error to return. If
> neither mmio_addr is set then the hardware is simply not configured to
> be used, so that would be a -NODEV returned by
> sp5100_tco_prepare_base() I suppose?

I agree, -NODEV communicates the error status better.

> 
> BTW...
>  
>>>> (...)
>>>> +	if (ret)
>>>> +		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
>>>> +			mmio_addr, alt_mmio_addr, ret);  
> 
> ... I think that should be a "or" rather than "and", and singular
> "region", in this error message? I mean, the plan was never to
> reserve-map both of them, if I understand correctly.
> 

This dev_err() is executed when both mmio_addr and alt_mmio_addr addresses failed either 
devm_request_mem_region() or failed devm_ioremap(). I think the following would be most accurate:

dev_err(dev, 
        "Failed to reserve or map the MMIO (0x%X) and alternate MMIO (0x%X) regions, ret=%d",
        mmio_addr, alt_mmio_addr, ret);  

Above is my preference but I don't have a strong opinion. Providing the address and error code 
information in the message is most important. I will make the change as you requested. 

Regards,
Terry



