Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7F268D48C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 11:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjBGKkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 05:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjBGKkB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 05:40:01 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2A338645;
        Tue,  7 Feb 2023 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675766367; x=1707302367;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6mhj2Rj8k0Fx/w431ln3dFq3ifOiLFuw021CgwvYSio=;
  b=lE1O4vr21Jzy6/5sKUJuOvxP4VvTEeU7JmPOCH2xlespJyXYixDSkYI1
   SDzYC24YfSzjT6fgy/4DqkaoAV6P94Dzss4T0SsVZkesH4nrOWXfL7jWP
   K75Bp75YONCbnxg1BPFTA6vpO9wW6bV4ZaY4BdnmpBUHaVZUa9kSYiKJV
   0J5W/Ix9OiIwILMwv69TjuH8bMMR2giDd9Wf+xithkuO+DFUP0kX/7ZRl
   gA5g0repDhSTdlr3pXWSEPjQSB947d2k8zkv7LXKHOrz/0hAtMe2UFFSK
   1gemu0t+ompaU7GMjLl+gNXxJ7DBbl9U60lXL06dkW5XCPnOkm9LLbriN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="329491982"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="329491982"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644408184"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="644408184"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2023 02:39:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 02:38:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 02:38:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 02:38:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 02:38:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqVXHvBwCvJxKljexFnYEit8pfvIVvA4lHZn3JoPJam5zZygVt502rDu6OrZyEorzXUBLX6iVX+IJQ42ub/ov530NFfBbSQ1T1ogRkAEQvDZ+Jc88t7hqoVmu21iH09RkMiZ0oLotiAfyBQ85m7ye2h51GOw8xTfuKcgHgBntF4POgwkHcxWZcqDL+Bxf/a/uthKHl1JekuJxLc7ji/Vnu0mLlzgqCeHtm7nSdFw1G/6nldO9PvZNhfh7pmyu49QCUbqeSBfb3uCX+JGLNdkKJFeZGRVJZw11uZTYcE7Nj7CdQBIdfZDdo1qU/9b+Oo4GJSC/Tm1lZCGM+UkQqB46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OBgDwMt20jfC3DVrLSjufjs29CSgk4rXtfKc/AWChk=;
 b=XvepXYqJWxhm3akKYKkEys1NogyDzv0SOqf3fRgmysjBOiIOK9I9QmWo40H33ShSw6OJxJG1UzM/rswY5SkoPlo5D1qSTt9jXSVkkCOe1lBkGhvMDjyn6akV+C2BYdZWbJF+CGeyojwv2+y2/H4NrDWS6zq1Y9Xe38vrxmRGr1zNaxhpvx16lKm4H+cSD+gFUvmFDe1xuoIRaO1TozPBey7Lnn/xm73ns8SWuHJ7AJJEHV9e+88822RQqK0O3WU+3HeivSrr2YwFzw+Vh8WCeBKv6M15J8KaEvoil3S9HJPbGaAPT5MCvhP78DQhRusBx70sRyInm+llJMuPJJg6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.35; Tue, 7 Feb 2023 10:38:57 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 10:38:57 +0000
Message-ID: <14a75a6e-74a5-62de-93d2-e898c181de42@intel.com>
Date:   Tue, 7 Feb 2023 11:38:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <Y+IpEwNSEtNk19D8@smile.fi.intel.com>
From:   Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Y+IpEwNSEtNk19D8@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3195b9-d06a-47d4-6b90-08db08f7844d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DAmxOa4oFHAq1FVCiljYuC2KAhO13HR/XkTvTxga4lma2hyEYbVq+LlQjlcIxCQbfrasjdn9p1ct3fyaScoeecfTOM+jAEKoI/lXLXd5xIWZl3TOVuIP6v9+muLJ6hshZ83XheBvqtp5SEPlzoUwcVtcNa236+JY/8G6YwCeF78+xXScC7tYm6RzU3t+qHMtfIKL29g0STPRvYpNslsJJrRlMlKflj16aRZ49wVT6xfL/yOYYutsYtB/qapuXKqpcfNIjvqUCGjFTuWiKRDkbeBK49LTGoiSNkKiwR7P2J9fzOv5dx5BVJRnApz2/nd6VA1dGzY1RciUZvA8QztvlQQPY9JzEH+IQOTxVyrNBXQFU19aDnNTFMzzyMuhMa9GLDzVSJippZyRKd9fyQmsLjk7aB5MCCPbFJqr+20FMU/ZTqdYa88kivImzNNIF0XOfnCH9X31RP7jWLPMs2kxwVd6nsK6N8C/nZHNQcTKqxNMs40Qfz+gJN3uJKxwQNKeUCztTT6sPQzNsiDc+Ec3ONKf2tQ/neAzxyPQqMhaRtTfWKe2oLpRQbeRlj65dup0bw5bjpyu7vwfKI/T1CIRtfFQbO2IFOQjy0/st3Q/83L0XdNakdZDrM28b2PjM0zie+gBXWBNfNnvSmP4GOUrMouNlPmXLkhConu/t6TEU+Onx7rZV1Quj7aqDvYStmlWU4WLTe+ATo6hVp5Gq3E9/Vw4kkAjIBZpxQcuYmvoXv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199018)(86362001)(31696002)(82960400001)(66556008)(38100700002)(44832011)(36756003)(41300700001)(66476007)(5660300002)(26005)(8936002)(4326008)(66946007)(54906003)(110136005)(316002)(8676002)(6486002)(478600001)(2906002)(83380400001)(2616005)(186003)(6512007)(6666004)(53546011)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9WVzFKWjRzdXBXMld4ZXh5UUFVeHY3VG1pY3YrdVF1R1g2b0c3bDRVU2lK?=
 =?utf-8?B?ZHlDUTdCNnF2b1lDK3dBbitJT1dValNCNTFwMlYzeDhlcWtHR0huVjA2VGlM?=
 =?utf-8?B?VEQ2ODkrc1BBU2VqTXZGRW0xQjl0MEFUUktEdTQ4ZC81K3NaS09zVTRBT1M3?=
 =?utf-8?B?R1l0aGZPSjk1QnE0SllYM2d5ZVdEMlFUQWJZbUMrUDVnMFVTcjJqbjlGTlpz?=
 =?utf-8?B?NWdrNWlRaTRyTlFMWEhkQ0o4dUZXTEVqYWZwZnFqcmlGQWM2aDZvSjNNbm5B?=
 =?utf-8?B?VVF3bHh4cmY4WDNESmlpQTdWQ0xZbmZoTU12VEFFL3p4ZDNiMkcxWUhBa3Vk?=
 =?utf-8?B?ZUNzKzBreVVoNlNBUjhLNTQ5QkF6UjVycTY2R1ljUEozUVExS3hnWVVRUmhE?=
 =?utf-8?B?S3ZmWEovdlhXSkg1cTArN2dJM3pTNjJYaGpCdTFzK1ZMNVhadWhwL0hwaDho?=
 =?utf-8?B?akEvNDExaEswR1BmeW1WSUsxcEMyemt4blhBN1lUM3BDZHdhZ0ZNMmFXaGdt?=
 =?utf-8?B?T2hoNzQ5VWNiUlF4RVMzM1A3QmxQMEF0c1MxdEtYS2Q2Z1hUUHpxUlk5Q0l2?=
 =?utf-8?B?VjJLUi92V1A2eTg0QmFaVXNKbEhUbU5yZW91aTdzTGVoeTZkNEFEWldueE9P?=
 =?utf-8?B?ckJjSjVxV0lTMXNnSVFnS3MyRDBzdExBOFJiaXV5SEZycStqbnduTEt3NGlq?=
 =?utf-8?B?dHVoR0VvRzFmd1ErWm1kck5Fem1iVWs1N3ZvOENhcE5yWDE1MzNRbGdXSDNH?=
 =?utf-8?B?MnRlOElzYS84L2RWNzZFUWdSNnliU2E2bTBvMjFUVTdJWEcxTldsM2tIMHU5?=
 =?utf-8?B?eFhnZ3dkZExWelN2QjlNb1F2UXVPK1ZtZVJyd3FGUGZ6UnBhT0J4cVp1UzlS?=
 =?utf-8?B?bExDc3R1b3pRZEtuL0x2eVhmVlJGUEJZQi94bTJVSVZCSTlZK2UwMjlLWVpU?=
 =?utf-8?B?RFpSNHF5Mm5oZ2R3SnFLMy9aTk1ER0RWc2tzeFVmdHM3MVFGUjNpSXpaOG5T?=
 =?utf-8?B?SVA4RHVnR1ZXY3JEVkh4V3poSXJWbVdqV3FOVHk2OWNBb1VIZG5YVVFUT2Iw?=
 =?utf-8?B?SVduT2swcXExbGpuVUtDSTNyNERCTkxyKzIreTE0WExhcy9WSHdPaUtVOEFG?=
 =?utf-8?B?SFMzS0FIUC9RMmYzN3A3SkVxNFNXSkg4dnJRbUU2WmhTOVp3ZHRNQVhVclNv?=
 =?utf-8?B?NXJKVkU0NGlDZXZlUEIrSjZBMUFYM3p1aEV1SGxhY05iaUlCTExTUmdRazRh?=
 =?utf-8?B?RlB1SDNSSlZKb1BPcUlqb2lMUkRUd05OVzU5cFIxNXIvdmpjeldEdnkycWJT?=
 =?utf-8?B?Ry9nb0E2ekRyeUVKc29DZXVXVGJwZnZ2ZHNpK1hRdnZxMFNDY0Qrb1lsZmJX?=
 =?utf-8?B?NXNLb2FManpqK2ZZK2J6aXd3RVYraW1tRXg0aWFGL3RjQ1NyUnMvUFdRVHRB?=
 =?utf-8?B?M0FVL2drQ3JXQnpLWHpqb2JiZ1NkVFU0UmJoQW9hMWNSSGxpWElrQUdJSXVP?=
 =?utf-8?B?eEJqWXpCSlB2cTc1Wmxud1grd3lvbU1tVDZNU2FiYkJZeXZyZEdJdHNybFUw?=
 =?utf-8?B?ZHZpa0VEZGhrV2FmaUs5R3A0amE3ZTl4emFXOHJMbjlZQUpiWjY3NEI5YVAz?=
 =?utf-8?B?TDZSQzJ2akRKYldueXkyR1Jia2pjY290WEZxd2w4SUdXQXlaemN3SjZEcGJD?=
 =?utf-8?B?c1FrS281ODYyS21rY1VOeVd5bjZQb1B4OVd4dVBFWVhrZ1hQVU53clJ2OGp1?=
 =?utf-8?B?L3IwWXdwWC82VHo0S1d0NnFrM0RYSkphaStmODFvWTl1bTExVkZhTU1Yby81?=
 =?utf-8?B?K1MvRmpQY21tY252YmxRWkx4Y0lKMTZBMDVyY0hJaGt5OUs2SUk4aFQ2RWV6?=
 =?utf-8?B?V1oyMGgxb24vaGwweVAwRFgxSWJlYUlMcFdXZW5udFhrTk8yODF3a3crQ1lR?=
 =?utf-8?B?M1hSUFNnOW9ta1pGRnZIcFg0amwzY0lyTk54dTN6bENtd0JXaTRIVTUzbE9D?=
 =?utf-8?B?TUVBUmNxSWFMY0hOQ2VWUDlWN1Z6TmQ4Nkc2aG5vS2hSZ3BZZDdsUVdTbHFF?=
 =?utf-8?B?anVGTmpUM2d1VENEaTNpTU5iS0M0WWs5SHBxRDh0ek1NaXowR0p2UCtFdGxj?=
 =?utf-8?B?emFnVlZjRTdpOHNhb0dnTkVmd0lrcFlXQlpBNEJZRlR0NHhyc0N4SVplMFdp?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3195b9-d06a-47d4-6b90-08db08f7844d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 10:38:57.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaYMzSGnaUkF7TZi+7ojNibpHGnWbO+PYeNf0b6TRZLjHkvBghl6Cd2tM5jvmoIJuI9/GHyLglAoA3TC87O18n1ivDgd0u9CYrKTK6JGS0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2023-02-07 11:33 AM, Andy Shevchenko wrote:
> On Tue, Feb 07, 2023 at 09:25:40AM +0200, Mika Westerberg wrote:
>> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
>> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
>> devices if they announce to be wake capable in their device description.
>> However, on certain systems where audio codec has been connected through
>> I2C this causes system suspend to wake up immediately because power to
>> the codec is turned off which pulls the interrupt line "low" triggering
>> wake up.
>>
>> Possible reason why the interrupt is marked as wake capable is that some
>> codecs apparently support "Wake on Voice" or similar functionality.
>>
>> In any case, I don't think we should be enabling wakeup by default on
>> all I2C devices that are wake capable. According to device_init_wakeup()
>> documentation most devices should leave it disabled, with exceptions on
>> devices such as keyboards, power buttons etc. Userspace can enable
>> wakeup as needed by writing to device "power/wakeup" attribute.
> 
> I agree on the reasoning.
> 
> Should we have a Fixes tag?
> 
> Otherwise
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> In any case it would be nice if the initial contributors may have a chance
> to test this and see how their setup is supposed to work.


Hello,

Thanks for the patch Mika and your input Andy. While neither I nor 
Amadeusz contributed to the initial change, we will be testing this one 
too - reverting the revert of the offending change that we had 
internally and applying this patch instead. Tests should be concluded by 
Thursday/Friday this week.


Regards,
Czarek
