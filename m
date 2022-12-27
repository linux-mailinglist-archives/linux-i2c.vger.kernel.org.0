Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A66656734
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 05:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbiL0EF1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Dec 2022 23:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiL0EFY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Dec 2022 23:05:24 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7BE6334;
        Mon, 26 Dec 2022 20:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672113923; x=1703649923;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OVBaH16g2j5DxYd9dgrMaVhg/hCauo4zUjEJGZdLnTI=;
  b=NSN4YALSPFOiVybua3RqA1y6mRGKGuLJh2YVBF+uvX4NTmp7xIgKMFQg
   r600rJPw+BjLt4NIrQjw6u/fs//+HG/vt+7iYsjSgphCsvwPxWGUAh2j/
   UvMibi8BQTaVohPv6pDOyWfPB+wfx1uM6Og2JSiqc0LfXp0BasxrG3x81
   mMsC4p/89b/Ub7JiW0jnwoDgHtuh0jmwghUI/LtN92cymR6JujIAEi1+6
   L6AAd/NH0XDWhW8518edqH3Z8chcnjPfKopUEH/2RKzAqpzPFMeGg9oiy
   5J5mvkzi0W7C1Pl67ws6jVAmlMMtwGWNKLQMu4F038WqOz5qVd6Ma5Ath
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="347831439"
X-IronPort-AV: E=Sophos;i="5.96,277,1665471600"; 
   d="scan'208";a="347831439"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 20:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="777043321"
X-IronPort-AV: E=Sophos;i="5.96,277,1665471600"; 
   d="scan'208";a="777043321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 26 Dec 2022 20:05:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 26 Dec 2022 20:05:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 26 Dec 2022 20:05:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 26 Dec 2022 20:05:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 26 Dec 2022 20:05:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9sSs81LGGDYbU+4yvPW9/PyZbbe5wOdQx+Qj7Wk1OvvvDoieoGscucanicujJFLJoAqL1CEpIj+AMBYP0ThnJpezov/RZ3lALXARj+BAriEh30jkso5feC15CAO04IU3XDTMw2twK4ICFfyMnDi2GTd6vkLffd48kdbLzBN3tqJs857M/yQ8g8u9zWfy3BgQnG0plfduUGghaXR6lBwB8Wa5RMcePk+sMJWCO/A8IyU54q1gNMKA/Sju0Asw5hEwQRAd+iEQ3zsL37MBSsR5Kj5QxmKFR0yvyBSlSJHJYyojuj1H2l66nSF3CCxALAnmqiMLJRdbuqsDrYJnDu66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ2KUqZTjD9U4c0CgS1q5flTpU7bFx/xdguyMtuzUSI=;
 b=XhUR0Fs6Rupea7ePouioe9FwPf8z3Ia371yesYb09Hm7U/MqZxCbO67mxWJauSbii9dtgfrLeZJ257CbR1n1/Z5SkuXi2k5eIRJxWE2X1KIYfGkxyGzo7oBrGq++lk+LF8mGNVcV3zmLGkoFJjuPnstDUspk5x7i1Q4XOzCHCuogdkknViJUqkytQgamfM57vmy1irFS9+814OQp9g9H79nRMJLEX2fUEkFYuy96agomAjf+wTCLQ5V0uVlVLd3D49/2VgGWgBRLlSQlarsLX6BS3ZWlfYJ2O1xsZ0ga38nMew9whVfyJ54m14udJvaKDnlusxHj13DRvDbLpG1cTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Tue, 27 Dec
 2022 04:05:19 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b%5]) with mapi id 15.20.5924.016; Tue, 27 Dec 2022
 04:05:19 +0000
Message-ID: <fd9bc91a-8afe-9dac-7d1f-2e57e658d2d7@intel.com>
Date:   Tue, 27 Dec 2022 12:05:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.1
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Content-Language: en-US
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, <asowang@redhat.com>,
        Conghui <conghui.chen@intel.com>, <linux-i2c@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7> <Y5mjcuCRP45ynJis@shikoro>
 <20221214065856-mutt-send-email-mst@kernel.org>
From:   "Chen, Jian Jun" <jian.jun.chen@intel.com>
In-Reply-To: <20221214065856-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: ff964391-13e4-41d4-5809-08dae7bf9140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkBS/Z9RhPL1Sl9bkGHO29cv/6dDgzQGd4/vmp3Gaevb2lxQhb90vsEuBG+8fJpstjRDi19NTZ/7tXqQXs5aE+MKUhFEnnIHm6sX8+s0BaLCJf8qpvAX3Q5C7l9cIru7QN3fZrJcauwybgiQP97Vt/G8lcYk/zYlkrDyGu5Eq7U6lTdCgqKpL5JIUKmC/cfSh8yEJ/IE0w3R70VEVXbpdHuL6PAPidRSpzfzLP6i0NRixOLaX3imuvMGt/zmLgGCQdtdvbUMPnswAN77dw8/csh7vGXEbOcjxN4NzobiMdeUiYnicguD5AX4oyF/veZtwpCIjWXJAmWaHuG9gqHfoOXq9buoJJMuIsRV29Z7d4ji/pxx4B0aUjv3ontc8MLEgTNYkOTskK/DoYofp/1CEwnZ/x92I+3x3cgVlaW1szL0nlVvnpvsRUoFNZIcryCXi64ozRnQaAAt8C2HHNmiBmGxk97TrDhdb9DqNSuHfF4ReA1Re5Zuz5WbwcMEwe8v+T6b5r1EEwmYEiM0V53yn5H4hPFl/Q7oXHf7g1qpyCf2Gd+3z5U7YudrEol0TL0Hk/x3jw2AzU+HvLRWWTpWXezbqTj3ebdtCFhXkfP+C6T5Lka4zRpxfRa1bzq/NX0RId8eXNrm7F8+kcQCWkT9bT3Qyj2dVZy4aFuAyJoxMgK3//n9Zy+ITjfssL2glrCytlcbJz+NLykdOPf9WLG0b+hfMV7PjSuwR0wzGg+itvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6053.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(110136005)(83380400001)(2906002)(316002)(36756003)(6666004)(2616005)(478600001)(6512007)(38100700002)(186003)(82960400001)(26005)(6506007)(53546011)(6486002)(66556008)(86362001)(41300700001)(66946007)(8936002)(66899015)(8676002)(31686004)(66476007)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWxSNWE3WnJ4Wm9Zem1mWGhZbDk2RklmaFQySXhqODUzSHFqZVJNbFFLc0l3?=
 =?utf-8?B?ZnFmVmoydEE2a3BtWDd2dGVacVhLeWNSYWtoYUw4cjQvMXpuTjhvOFZoMkZG?=
 =?utf-8?B?TGh6eXpUS3FOczRyNWxFTU9LdS9iakhFMlRrb2hTZzRORXVsQTRYaFJVSGNh?=
 =?utf-8?B?SkQ4akVHY0VqZFozRmNRczlRaUZGTlRuUEJXSm1ZRVBqTGI5dVJrdG4zRURW?=
 =?utf-8?B?UkhDR3FNQ3pNUTYyMnhoeGZvbGZkVE1jTmFCckx5Mkthb25GVndUb1J5cW5z?=
 =?utf-8?B?eGhyYzdqMkJwTGtndU5TaGU4bDc1alN6cC9ERHhYUDF4ZkxVcmlPQWtQZm1j?=
 =?utf-8?B?NEM3REZsQWFRNzF0YWtKZWZXdkhTOVcwdEx2K0RXUkRqYWI5TFZocXR3WXdT?=
 =?utf-8?B?bHlCdU5NdWJpWW9uTVZTZTJKanBEZ1d4aE10T0xMRTNoMlBBOUVuYVVJRXhn?=
 =?utf-8?B?L2tkU2d6Z3VuUHljYnB3aTlmblg1bzJtZlRCOVhjaDI4eFl1VGlHaG56M1Vt?=
 =?utf-8?B?SnpRN3R2NnRMVzhZMlgxY3I5Z3dsZzNpNGFXaEsyOERDMFh2MnZXYjN1ZWVE?=
 =?utf-8?B?RitKMlkwMkJmR0RxL0UwKzVSYnhxUWg5QzdsNHRZaU03YTFHemdCWjJOVHJN?=
 =?utf-8?B?a2RHL2FUVldIdXlOM2dYZHBRSDRqRU1tRG10ZDd5TkowVk5qR0hKYXlVa2V6?=
 =?utf-8?B?T1MzRVp0eUJGb3ZDZWttamxoNWo3R3BCK2FuYm1ZUTV1MUNqb21helFHeWVB?=
 =?utf-8?B?WFc5RkV6dmx5VTJTeDVZdzVtNWJXL0FZdU1YNlc4aFpRZGE1bXVpa25ONG5D?=
 =?utf-8?B?SHFXV3hTemprUndSYWZxN1AwZVp1ZkZ0UXYvZ0hCNTJ1Z3hDQVA4YjFFT3RK?=
 =?utf-8?B?YU95Ty9Uem10ak1DWktjYjlMV3BCQXFCdXRkL29qa2ZEVFQzY0w1Szl4Szh4?=
 =?utf-8?B?L0xFNUJ1VzE5QWQ0VE1rV2VHRHJtTDVmVzVGSkZqemNDZHFhekI3L1lMWTBk?=
 =?utf-8?B?dnp0bVhqd21xNDBsQUpyVi9yNjI4L0VXTVU2eDIyM1RhUDV1enRGVENVeDYw?=
 =?utf-8?B?SXNIZ0VKR2d5WDd6RSsza0Z1aWZhVk5nK1V1cXRoek44ZVZHUjVqUmk0SXQz?=
 =?utf-8?B?alBaWThmZVFrenpYbVE5elNMRGlzbGQzMEdtRGlpa25aajl4N0NyWGU5NTA0?=
 =?utf-8?B?Y0d2Mm51WEJNNVhDK0Nid3JaMVBZeEhCRyttdGZwMlJLT2RGZ2ZWTHRuRlNC?=
 =?utf-8?B?ZitpU0ZNZ2NicjhIUnU2Q25XVUxMV0Q2NGxPTmhVL29VOXBBWXltM0FrQUNj?=
 =?utf-8?B?MDdhaFRSNkNHVnVseVFMUHQ2cnlRbXhUQTRsajllMExZVnBxeTNRUkZxN2VS?=
 =?utf-8?B?V0xvTGNHWWJ5Z0NSZmZ3bzBQSWdmbmpmQk1GNUJEbWIyNE0wNUVFZGxBV3Nz?=
 =?utf-8?B?Y2dHaHZEWXdURFVYTVVZc3VGamg5RnplTmhmaWJhL253UXFaVXVEZzlCUTJO?=
 =?utf-8?B?Q1RzMGJmZ1NXdlpkS0M0MDFFK2hNWnFaSXBjNVJjNkRrZHVGZnk3b1V3Z21T?=
 =?utf-8?B?NG83aHh1T0t4SlZkWUpENFdzMHc3RW1aZGozNW9vMll4MFN3SDUwdVZpWjJr?=
 =?utf-8?B?RGViTnk2OVVwTGRVcE0rSUdvMkFTZGl3ZzRqdktQT3lWcnNBTkFlM3Excjlj?=
 =?utf-8?B?ZVVpb3JQcktCMlJyV3lIck5WZkIrQ3JkaHBKMmhKcmVkdlpjS0l1OW9BeVhC?=
 =?utf-8?B?a0pDdFdhL1VBVVlkWEh2Y25SazBCNUVUTC9EbHJWT2Z3RUg2U29NUkoxZUtF?=
 =?utf-8?B?RmNPYW9iZVQxL3Z0Mjc4VlJRMEJjdEpDQ1Y1eEhsUExUVzdHRXNtdDV3NDkr?=
 =?utf-8?B?SG15Rk42QXlYTGxEeUxhaGozWkhIWHpLWEYwOElCMUhJQ2hiZDlrMVRrSFhi?=
 =?utf-8?B?RmlWNHJPakZWTzhyR1FKZFVDYzltQVAwQUJLR1RGUm5qNmt1L1FCclpqQ1JC?=
 =?utf-8?B?d0l3UkRHVlRkL2ZUOUVPVzVWRG5FVVJYNFJkcXdlcDBQTTZOenFDYnREK1I3?=
 =?utf-8?B?SEtjRHBmR1hremFodVVVSDh3cGxZdnJ1MWVHTHpnZnBpVkNSUGpRUzltVG5o?=
 =?utf-8?B?dzVzRjNJTVc5UThDUjROMklrNXZob2NpUjl0WFU5SFFwTit0V2dCTEFCWWhh?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff964391-13e4-41d4-5809-08dae7bf9140
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 04:05:19.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKEftas6Cx4q7RHaGkrZT7F8gkehpjSih7jhptGoRNLLXOINBTFPg7fNklIo4lOPsFzc7Hp0EdF7kBm6XxQcmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 12/14/2022 20:00, Michael S. Tsirkin wrote:
> On Wed, Dec 14, 2022 at 11:20:34AM +0100, Wolfram Sang wrote:
>> Hi Viresh,
>>
>>> I understand that it is okay to pass the maintainership, within the
>>> company, for platform specific parts from one person to another, since
>>> they have the best knowledge of the code and are the only one
>>> interested in maintaining it too.
>>>
>>> But what is the rule for generic drivers like this one ?
>> Dunno if this is really a rule, but if a maintainer steps out and makes
>> sure there is someone to pick up the work, this is more than welcome.
>> Way better than a stale entry in the MAINTAINERS file.
>>
>> I mean, it does not limit the chance to have further maintainers, for
>> example. I believe in meritocracy here. Those who do and collaborate,
>> shall get responsibility.
> Exactly. I'd like to see Jian Jun Chen do and collaborate first.

Hi Michael,

Sure, I will start to collaborate first.

>> If not, then not. We can fix this, too, if
>> needed.
>>
>> What is the reason for your question?
>>
>> All the best,
>>
>>     Wolfram
>>
>
