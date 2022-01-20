Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED343494F97
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240084AbiATNxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:53:43 -0500
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com ([40.107.244.41]:42856
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230115AbiATNxl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:53:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8qGDYqQm8RMZ3FGpuECWPoCweWdZiMBOxfEy0k6DLYvmJBHOD0hcXFMD/zByBWG9xP+2pZDjTEssKFsCrU1+oUDTFzbGpJoYPRhUCaychE125LnUTMQgGapKSCpnHcKqz3Of4kj8G/NgT/zzzQs0HXKDkwlu6l0zT9Lw8LLzyHmEJw8dLlB3fcC0PP/lqK22dwafhYXGCWiP9B1X+NbXBEz8g+s+c974rmB40eRcqhDJ7ynqhHKrUdvSkm/iW56nnhIT5YPx8RppOKDV8gJgxbec+kh1tZn10TIJh8TdD4c1B8Fo+iWnEb+apLBKZo5/RsQ2e7N9ewnm4GtZPjnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9It/+aQDLDDqEoy3J/c+4X9BvEXpcCGoeNiJjtWmXc=;
 b=X8ENsXYmSsKJ2Etd7M/XpLOHvPAntzfymO0hTtSZPt+2I1gaf0TdtaqzHh3ZveUB2rwzxavyvRofWYyM6nTtzlUIYrVaBjsMn4W/57gKMLCRYhDbNuPdRcUxp6tVJpMlZMcdg3wTEVf+UEhDJ5GS0wrPf+N8ggyRRtSMYEaa7sarCanDM6w8VtIxl3+KaanY3xIuOWfW8NXr1bDuKGYr8vbVHcLluiwN+otkzs09zO0KclfGwvEXvmOXq58PFjBXZXwgglJymGJoSuw48R8bMiRYfDGH0Yb63H0GzrToMndSv58V9mdW6uUsC+cFf3vLUvk7A+pGUBaaTb7v76io/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9It/+aQDLDDqEoy3J/c+4X9BvEXpcCGoeNiJjtWmXc=;
 b=Vol8jWCzaqeNr7N+NkdGthEnhlKVn+uq5Brg17r7v8q6/AH3djavCpIotsKyw6u0pRsenT4iBUKyZvTbaz/SysXIcNseuGrZRRqSa43kGrdah7Ooi1SUmV6e5LAahTV57VToso/DXXPqqyhZ4YUby7ARifYXfCffKGvRH4ki0Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 20 Jan
 2022 13:53:37 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 13:53:36 +0000
Subject: Re: [PATCH v3 1/9] kernel/resource: Introduce
 request_muxed_mem_region()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-2-terry.bowman@amd.com>
 <CAHp75VcA56fe2Q=LGbmNDknbsupkKnxGqLBvm3ADPBJRAy6rsw@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <00ef380e-cf39-6fb8-bb64-795d3dc5d14f@amd.com>
Date:   Thu, 20 Jan 2022 07:53:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75VcA56fe2Q=LGbmNDknbsupkKnxGqLBvm3ADPBJRAy6rsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:208:329::17) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0ca66d-6e6f-4c20-7b3c-08d9dc1c4173
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2578F171DD34AC2DCA0775D2835A9@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kDj6YUsQfEB2usjMq0GYsB36LEJgrxA340AN9I1W2o/oZA9wH5yJaylXxPDcorDEfnMuHL0CZi1BMCelrMSM4UvLRJtUF5m930+WvcEvr4S7aMFvLAOrbIlF1RJHuSyhGymICej2w8LRexlRZGYgo7ojRYnYTgSDpnu9SiYsk1xLHsB47kqLbtpukxHpxoCXcg/U1Xgn1Uu9/V7FSQ6DSsp4uP6L9VFh0Z47SUR3xGjCWJgVg+T/p37zV7oC1Dove2GL57pNTUNzC/nOdH8WlRaLyUplhpc/Jr2fDuhylyv1DlHa7dxkF+YNhg7441jOO0E/NG6pd0QNxaVGV2dtIVNpz2ypPpLdX3zjF6W+9tW7Y8m30okJG2Gi7IIqFfh2bgZxQnnFnSUTwEUBAHVSsn3L1E3A4rJY+VLJb4ebXq2xmsRSLBRq4j0zKCmQNmjAzbou2PTZqtmLSrFhqBebYMQ1sNbcZJqNiHDXaPz2UBRfvCpa2/vgRqPCyGHxLBZtczvKENEO0odbSoc8frdDy6xUsIlCK9tvy989VsFXKYM0fSvuIctu/gDl+5LWe/hLwXo8TjL5JYwYa+t4aVT427uGhiN8z1ZBCBbATz7C3WjbiOscnCnRebM8L8rN8XK1r6HpSIEtAqiZrM69PJ5vDx45RDtZDIdGgzmQseq1A4B8Y4XzsW57Xc9nRaY4uJIYL+A2bPhq1VqeZu4s1SkIDi0fVwjq+j8tqY3d3ADl0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6666004)(5660300002)(66946007)(36756003)(8936002)(86362001)(66556008)(6916009)(53546011)(186003)(66476007)(31686004)(6506007)(8676002)(6512007)(31696002)(316002)(6486002)(54906003)(4326008)(2906002)(83380400001)(508600001)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hpV1o4eXJ6ZVZySHh3QkhLdnFLY0ticEEvQnRLSU1seEFaRGZJMzN1WDlD?=
 =?utf-8?B?K05OU3NLd2d2NDB1eWNGdDlmb0xhM3dMTlM0Q2xYdUtHNmpGSFdTNHdyZGkw?=
 =?utf-8?B?VEZKbkhmUWxSZGhQOVJkN2lOeWIwZ1I0VXN4djJ1Y0xkSFFHWVRtdmsyc2Q5?=
 =?utf-8?B?YnpsWHg3WlhhZHVJQW9uUGp1M1h3WlI4V05wZkRONXNqejZRS2JCQWM3M2ox?=
 =?utf-8?B?K21RZlE4Wm9ac0Y3akRscW41bmV1cEpsYzNZS3VBalA4cThsTmFPd291QWN6?=
 =?utf-8?B?UmdzY21iaTRwbEJuMU9GM0ZFSXNzMUg0YllPdjJPckVLWExCTDNROGcyM3dD?=
 =?utf-8?B?ZEh4a2xnQ3lWWmZRTVBHa1FUYUhSeGNsZDZPNzdmUFdMZmUwMXZnWmNrOTk1?=
 =?utf-8?B?bDBrcGIvaDVWTXJPaG4wbEVac2dBK05MQUxqZ3JnNDJpRDYxMUFPelNlNHgr?=
 =?utf-8?B?SVI4S1EwYytQZHIzNTlrZWtvblpaWFZQSE5nTlEzVE1iMGtOL1hhNFdMSUwv?=
 =?utf-8?B?bzhnWHZSdm0xVGZGbzR3TlhiNFk3KzlBWHdDM09uZHFKSFZIYXdnN0ZBTThJ?=
 =?utf-8?B?WlZNdnYwc1RrcmR1RkVucFJpM0l3WUxDdWdYTzl3WWpjNDlyLzNDZ09lTndR?=
 =?utf-8?B?ZStscVBjWjRUVjd6b3M2QkJ0NmJOR052SG5mMEtnRHVNdEZoRFFyUDVHeElq?=
 =?utf-8?B?NHg0emd1TFQxb0ZBdlVsbDZGMG9wRHZ5NWJuL0tuc2FvYmZ5QUROcnJnVHFH?=
 =?utf-8?B?YndieG0yc3JDNzY2bVo5WExvWnF0N0c1c1NoeklJQUV0Ym1tVXU3bkVBdit2?=
 =?utf-8?B?TmRVdFZpQ24wMENTS1hnRC9RUllhYkxYb0JCZUw0eVB5blZGTUM2Smh3RU5W?=
 =?utf-8?B?cWNOSWdBK3N3b3MyRjI4Z3IySE5SdzVpTW1ZSWNwZWFkb1JWVklyRzMxZFFP?=
 =?utf-8?B?WjFDanhiTEcvMnlmYWJsanIyQUhrK242Y3VCWjFSR1V4d1dLUDBsTStTUEk5?=
 =?utf-8?B?VStrSC9LcW9EN2pFVXlqa3dsZEg3M0pVVnV4OEhDUW15UzFxNElJbVJPUHNJ?=
 =?utf-8?B?UTgwaTVCTWlLZUZoSWhHVkFIU05XR0dvZFAwQWZyOTBLQ1BrSkdrSll4S2th?=
 =?utf-8?B?d1Bhd1I0WkhVbXVZc0gyNXRzRGFtSjFBT0xMQk52RCtWS3lGRWxyN0dJSWtC?=
 =?utf-8?B?UVFuMXZIL082bWIydnFpNUdsVGUvd2d0M09tUHZXdERDd0tCc01LU2puR1NG?=
 =?utf-8?B?WUtqTmFVbWtNaEYvc3FlSjBXMWxEYXczYVBOSS9xQ0hINFJ1M0FnbkdVTnlB?=
 =?utf-8?B?b0lBaDl1M3c2ZlFEaWhzQ1pUUy9qcStyOEl2RDY4RnpOTzJ1K1U2Q1pRQXZP?=
 =?utf-8?B?cnRXYlhnUkVLREMvMkpIKzVMVkRYNUdRc3BqamFRbVdxNDVmZE1KRVF0eWQw?=
 =?utf-8?B?NFhvYXovblNZakhsVU9mNG1tM3RPRTlYZE1pOEdsc0x3Y2d3MUtZZDJYMzFM?=
 =?utf-8?B?WlpGYWdkYXlDcVdwZDRKS1pONVJGcm5HR2dQYzFnZGhmaDRuWi9WUzJVMElH?=
 =?utf-8?B?U3pMTDJYekpMa2N0M2ZwRXZZbWhPOGlENmdtbDRYNDRGUVFtSFl2RkJiRURp?=
 =?utf-8?B?anA1QVNlSFl0Z1ZBOUt2aEFvUTRVWUFXemFSbjl5M091RGtSV1NCRVlqMkQ1?=
 =?utf-8?B?V3FMaHhEd0JZR2g3UHRpNXhEVFJwZFhiU1lJc1pkVWFienA4RmVNNmtTemRt?=
 =?utf-8?B?MjBHSWM4V3ZLU2tDdjRHOWp3WkxVV2xOTWxPN1NFdWtpNnlNaEEvSUU0VTh1?=
 =?utf-8?B?Zkh6QnVXMjZ6eFBJdFZkbWpuQmZlTXliMGJMTFpiTWJNRUtOMGt2Q0ZRSkVl?=
 =?utf-8?B?N21KcjVzWTREb1RTMmdDK3VSME1aNnBjUlpiTTlzRFptQVRvK0hNVUxOa2Fl?=
 =?utf-8?B?ZHJtcVNPMkdaeVJ5eTljRk10NFY1bXJxb1BqcjM2L0pnRUFXdytNWFdFaVc5?=
 =?utf-8?B?MVM0Z05WSkxUb2J3TXVVazBtUHpxay84cGNyek84RGo0MC9jbG1oblFqRnpP?=
 =?utf-8?B?WWtZVGM1L1hPR1JFaExQVkE4TElPaGZpTHRwQ2c5VzBkZGNlL2thd3FMa0pD?=
 =?utf-8?B?SUplNjlIZUpJQ0VrQ0xYcjB4SlM5K2VxZFh6aGY2eTkvZXR6WlBrMXlGeHRo?=
 =?utf-8?Q?nLhZAxxrEgSyn0+L3go51io=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0ca66d-6e6f-4c20-7b3c-08d9dc1c4173
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:53:36.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHDG1WqES8LfipEKdZNQuVoik85bNfKGtK6aewxhq/zCFpi8H8YefIh0N43xJ8g3o5o3LbkZ6m3Vs2B1JgVb7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/20/22 5:16 AM, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 1:06 AM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> Support for requesting muxed memory region is implemented but not
>> currently callable as a macro. Add the request muxed memory
>> region macro.
>>
>> MMIO memory accesses can be synchronized using request_mem_region() which
>> is already available. This call will return failure if the resource is
>> busy. The 'muxed' version of this macro will handle a busy resource by
>> using a wait queue to retry until the resource is available.
> 
> ...
> 
>> @@ -262,6 +262,8 @@ resource_union(struct resource *r1, struct resource *r2, struct resource *r)
>>  #define request_muxed_region(start,n,name)     __request_region(&ioport_resource, (start), (n), (name), IORESOURCE_MUXED)
>>  #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
>>  #define request_mem_region(start,n,name) __request_region(&iomem_resource, (start), (n), (name), 0)
> 
>> +#define request_muxed_mem_region(start, n, name) \
>> +       __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
> 
> Looking around tells me that this name is inconsistent, I would expect it to be
> 
> request_mem_region_muxed()
> 
>>  #define request_mem_region_exclusive(start,n,name) \
>>         __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_EXCLUSIVE)
> 
> If you are fine with this, take my
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
                                                                      
I'm fine with the rename. I'll update as you requested in the next series
revision and add your "reviewed-by" to this patch.

Regards,
Terry
