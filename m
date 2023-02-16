Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4645E699EFD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 22:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjBPV1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 16:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBPV1o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 16:27:44 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC794BE88;
        Thu, 16 Feb 2023 13:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLWJM4LAPKsotxwFkoTgVc14uRnzOKDvFY40qN8kMJR91RaFAcX+C5cMB0Zbtw9aSdE135ooXf8+YmAr48/xCj92zajvTkQoYso0P/7mtsnsZnZ2L3R81+L3hGjjCp59CSxOeKtJdMYtkt1qJjZplrTsQa6fLhSvpKec++foyOXIoBrJlf7PdFiGXsdNLql0OjMOSVaUeR6JehzUnVAmyaXnHcrW/d633PcWWJMBKROqvjBxxiuBnKwR13MdVg4rokcZUzZSejEdxqceDpje+jXn2SNs7eSoTMqlhelDjH103mTUjckTdIhOBpW3p0m1PRxn9VlBJH67Lxd8Asa1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJAtOx/+sygPcEDij9tvdRt/iEDEqg3zavLYdd1nZoY=;
 b=PA3XByaLsRUbwIIk8kET+sC3/LwcpJjGozoBJG8DiRZdUfYtB4OLnefZUfWUeBvZ03aHtgh/r9BzNrAN4S1PI4zuQ6DgWt26jc31t5qzdcF85NVMbC19QTsIYYOFKuK319HbVSO4PszVXxqtCjb6NNLCXm7rquuZOu6EqZqgw6Y2Ddes3hY0ge10jiZS6lDqPFBoHzU1CDK4NclUq3beaqT0mxjcZF+mRUQ1kr8+Uut8by/Goga9rTstmFuDeHjIp30IRDpQ8HDIRlHbna6qYQwyM86MLeWiaxQKJ/M8/cK2HhmaHb0C+ISF9oHptz8LGCApg8H0c9Kj7W1uCECymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJAtOx/+sygPcEDij9tvdRt/iEDEqg3zavLYdd1nZoY=;
 b=YQUUmBujhywRX02dQD7uUGQCtjZvIRCHgGGmt9jEEUzEWNxECK/ib3xow1DPXcxRlfV1hpWejBkbwcXqtNdt1J36Bu0iWu9LvEyzfIcu63ZT0AMyRIa+Rc/l0SwEY5/IaUxLyyGCooD27Ft17oqv5ZunVHx3wefvr6mcA6Fz4iU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 21:27:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 21:27:38 +0000
Message-ID: <ba2ce999-5cc2-be73-6212-a5db903b294f@amd.com>
Date:   Thu, 16 Feb 2023 15:27:35 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
 <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
 <ca9c0f77-c191-d88a-22a1-315ca97f17e8@amd.com>
 <Y+5EI3XGBzuwwVBV@smile.fi.intel.com>
 <9523a6ce-0220-e939-392d-2b48b2a4dc48@amd.com>
 <Y+6ZMEoQ2UoH7SxD@smile.fi.intel.com>
 <d8a11223-36d1-a3bd-bfa2-a1c67b9ef250@amd.com>
 <Y+6dFYd/0tSKriaj@smile.fi.intel.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <Y+6dFYd/0tSKriaj@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: c3aa623b-4a28-4d2e-dedd-08db1064a0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fd8t/cfSoLZ+pnHJYAxCsYEn6ZKz9wZNy6xaNUAqE/DxX8gSg/1YSaaUzIrEEcGWi+QNtFd6G4uXiVX7f7IqmvTnNY8/32ag0ApCYVVC0hax7pESPq/74XPFfeftJ3dd0L7sMi4GjuB/fIUoXOej5wxsoshKBzE7TzV+GVvobF7LHTyju6u+dbycplBXO1MWbRf1dUJm+kgByOU/Uc7TM70i1DQrGLd11X6dQw0aFsZ2/Fxpg6AXgu5dLH1rqWVa/vmUU0LCclbp+11JWlzhNtmZepKjaB2uoT+0oi1i51PGR4X1JMaVkxpkNxROHHPTaxNVOctythNGF/zSgRuVWQllMr71VQaQF3J9TVhhB/LfNSo1stY72+9fM3BUoltV6kjY+MuA4UiNs/h1qllV9uVCZvRn+GJrPR5w+n/K0zpc1mzdRuPb8MN8TNcEAhT7EMDMj9l0OblCAdj1Al71ThzjkuJi7bdzA2PFbzP3rXEFjoBuHunlZ/uZWKuQI/B4+69ZH1L+oGLgt03m44bcCZkFncTPKRcJrZQEkr9IP5kjH38RT51uQIOwLJ0/Npr5LbqjBQUGcDKjem/Swo6Tq+t4c08+tfNBNBpB/e58Dv0blTQTPc8b0URZT1aKwnFWp/lhQ80GqOlIbU9tOw/d2Y2l7TTn1/kxKO5MsJRiLhUgtapjN0JLtVgc9tJnbQcM0spWqqGnSnr/8LdY1x7CzuhsvNeD4nvu8fyWhd4/Feg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(31686004)(966005)(31696002)(2616005)(83380400001)(86362001)(2906002)(36756003)(478600001)(6486002)(6666004)(6506007)(6512007)(53546011)(186003)(26005)(38100700002)(8936002)(41300700001)(4326008)(5660300002)(6916009)(8676002)(66476007)(66556008)(66946007)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNUTWw2cVQ1aDRGVXc0UE1WTGZCQWJISXpCcWIrdTZxL2FPMFBMRFZWWUR4?=
 =?utf-8?B?WGVUMTVZVHNJZklIemprRGFKRTFVUWNVMWlQNW5JM2VNcWJMVXhQOXJ6MXRy?=
 =?utf-8?B?TUFKYVNOSm5yeE9CU0JJYUlUNW5oYlpqOG91cnlLOVVQNFhUZE8vMlpPQ0tL?=
 =?utf-8?B?Vzkxcm5nNjAwdlJZL2FlVTZHVXVJKy9wL1pRN1FJZm1SYXd6VXVuNjE4cWln?=
 =?utf-8?B?Rkg4NzZjZlVyQUdNdVpNVnpGdTJKRk1ubXdoREJ0dkgvcGFudzA4RFRObmV3?=
 =?utf-8?B?N3FRcmFoUGNNLzE0R3crY0xWWDBiNHdqU0Nza0ttdW1KWjRVNHFCZG44czI0?=
 =?utf-8?B?SnBXUzRoRUhMQXR4VnE2WE51L2ZRZW9UYzJJTktVVDJQVlJmRVF4Q2FhZHNi?=
 =?utf-8?B?elhJRkNwVDE1Vm11enZwV3B1SkpYYzc4VkdHcnc0d2V0QWw4SDNidzhGZE1L?=
 =?utf-8?B?RGVJSDdpVGlTQThVd2g5Z0NKUmJ6N2pzTnhSVENmclVuWStDMGtaQ2hna0FS?=
 =?utf-8?B?ajVka2N0UCs4ZUtNR3g4cm5RRURYSFBPUC9SNlp4ZHVQUENLNVRIemFMREky?=
 =?utf-8?B?ZW5wa1J4My9KamV1Mksza0NrQTY1NFhGSGZKQVZFcHNXcisyN2JFdWcrVUVG?=
 =?utf-8?B?UHpCWGFFNlZoLzhxdG8rY21HeTgxZUdKeFZ3UXRpUTF4TFZXa2F1Y0toTHRw?=
 =?utf-8?B?MDBHMHg0Q1dJU2ppMlZyeXdrbWhKY3BPSEJ3ZG5na2JjT1lBNEd2RVowaGFj?=
 =?utf-8?B?SENWU1BTNkNQSG9uMGFpcXk3KzdUOVBsckw0c091OGIyZmttY3FGRUYyZy9z?=
 =?utf-8?B?aGdJYmFVL3ByWWdjNjlYaHZEMmVNSWhLa0RDMVNzNE9EZi9xUkxsZVZ3cEpK?=
 =?utf-8?B?RWxxeGRZdE9JMW5pSGNFN2pmMlVIamRVZXowZWNSWG02U2V5K2tSbGdnQlhG?=
 =?utf-8?B?bjJkQXQ5SDJEYmdNREpWVStpcko3UkNNN1RTeG0rSG5CVlp3QXpReTlWamRG?=
 =?utf-8?B?ZUZodFBHQVR1aGZDb05Ib3JxZ0xiWnkxNDhUbVpYeHpwWmFSL2dBOFZDeHEy?=
 =?utf-8?B?OWgyRmZxY1pEcEVJUTFTR0tMdi8yQWpCWjlCVFdIaUhKb0RIUTMya05EWlo4?=
 =?utf-8?B?bHFueGZmZ3Q3OW5ia0JUdVNPV1gvbndkUWRhcis1N3BxVlo0YzF6a1RCc1V4?=
 =?utf-8?B?NERubTJnNDZXUi9JQ2xXa1lQdG5uZmtGSFJsMFpud25hR2hLWDFFRkVQck1K?=
 =?utf-8?B?WU9ndGpSWVRZaEs2T1RybTEzVDVzRTFaREVHT0VBTTZiM2ovWWx4NTM4QW11?=
 =?utf-8?B?bWlPdnJCT3hSbUV3QXNHSFhrTU1pN3pFREpCQ1NidGZPUU44UTJJU21ITUFh?=
 =?utf-8?B?M010SUNnZnJvbG1YajJEYzB6c1ZzVGZBaldEaENDK2c2WjY2WXpkTEc0MHZK?=
 =?utf-8?B?eUtIL0JzQ3luZlJucG9Iejd0OG9TUmJFMEhxaUFRYUY3S01uWjg1VTh5dUo3?=
 =?utf-8?B?VUtLSU43LzRSbWdmaFF0MENOUnBrSlFJRzZ2N1JsVno0MVR3bnYrSFFrTmlN?=
 =?utf-8?B?K2QyN3pZWFlONFdEYVJmU000T1EyNkJjTlplNjBvbklLbFRNZ0hHMVQwQlZU?=
 =?utf-8?B?cUVYQU1HTllBMGkrTnJWZDlRSzYrczVSRVdPMlVLeG5BcGRYakF5TktxcFJi?=
 =?utf-8?B?OUZMaEdvekJ5amRtODBkQUJWTTR1OTRtUmNxVWg3MmNzNzVHSnVrcVZWYll6?=
 =?utf-8?B?RnRjSlhKaEdwSnZQdXNYd0NKSWRBWEhqR2V2WFFsNnRXeHU2OUhHQmZRNHNv?=
 =?utf-8?B?WkZLYjhGSWk5MVdyNU5nZnBxV3BRSWNkNUd6K3U5VHhxeGxpUmJqdW9RYXdM?=
 =?utf-8?B?enhpb1VveXdLaEJIZFhxVDErS2Q0bVNGK1RZRXVlMjZYT0NZTEJaR3FobFBS?=
 =?utf-8?B?a2haeVBQWEFhVjRYUllFSTJWMnIxQTdoS2xXbllTMXdhdDRPZy9VYk0yQzhh?=
 =?utf-8?B?VXY1c2grdnlzSU5DZVNDVGxSYjREa1JDbUthQmc5K2xIMWNLRkJTcUJ1MXZJ?=
 =?utf-8?B?Q3g5NHBsRzhqbHRPZGt6bnppdVYyM2Q4dU11YnFYZXg2RUFZcjFEejRweE9Z?=
 =?utf-8?Q?E4y71yJAfQrsXvCT6zKEws0mf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aa623b-4a28-4d2e-dedd-08db1064a0eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 21:27:38.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6FtbfY5Pp8+4O7AVYZ3lKJ0erUN2y96dPXHEQev6WYCdk0KXF+K58oCIAx0osFgcePp2fchHssI18GIDQ2d1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/16/2023 15:16, Andy Shevchenko wrote:
> On Thu, Feb 16, 2023 at 03:01:35PM -0600, Limonciello, Mario wrote:
>> On 2/16/2023 14:59, Andy Shevchenko wrote:
>>> On Thu, Feb 16, 2023 at 02:55:07PM -0600, Limonciello, Mario wrote:
>>>> On 2/16/2023 08:56, Andy Shevchenko wrote:
>>>>> On Thu, Feb 16, 2023 at 07:29:53AM -0600, Mario Limonciello wrote:
>>>>>> On 2/16/23 07:27, Jarkko Nikula wrote:
>>>>>>> On 2/10/23 00:38, Mario Limonciello wrote:
> 
> ...
> 
>>>>>>>>        config I2C_DESIGNWARE_AMDPSP
>>>>>>>>          bool "AMD PSP I2C semaphore support"
>>>>>>>> -    depends on X86_MSR
>>>>>>>>          depends on ACPI
>>>>>>>>          depends on I2C_DESIGNWARE_PLATFORM
>>>>>>>> +    depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y &&
>>>>>>>> CRYPTO_DEV_CCP_DD=m)
>>>>>>>>          help
>>>>>>>
>>>>>>> Would this look better if split? I.e.
>>>>>>>
>>>>>>>        depends on CRYPTO_DEV_SP_PSP
>>>>>>>        depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
>>>>>> Yes, thanks I'll change that for next version.
>>>>>
>>>>> I'm wondering if this is homegrown implementation of 'imply' keyword?
>>>>
>>>> Like this?
>>>>
>>>> config I2C_DESIGNWARE_AMDPSP
>>>>      depends on CRYPTO_DEV_SP_PSP
>>>>      depends on CRYPTO_DEV_CCP_DD
>>>>
>>>> config CRYPTO_DEV_CCP_DD
>>>>      imply I2C_DESIGNWARE_PLATFORM
>>>
>>> Looks okay, but I'm not familiar with this code. The documentation about
>>> 'imply' can be found here:
>>>
>>> https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-attributes
>>
>> Yeah I found that, but this was my first time using imply, so I was hoping
>> someone who has used it could validate I interpreted it correctly.
>>
>> Following the example CRYPTO_DEV_CCP_DD would be FOO and
>> I2C_DESIGNWARE_PLATFORM would be BAZ so I thought so.
> 
> 'imply' == weak 'select', it means that the target option may or may not be
> selected. I.o.w. "optional" dependency.
> 
> Does CRYPTO_DEV_CCP_DD use I2C DesignWare code?
> 
> If I understand correctly the "depends on !(I2C_DESIGNWARE_PLATFORM=y &&
> CRYPTO_DEV_CCP_DD=m)" you want to have IS_REACHABLE() in your code and actually
> "imply CRYPTO_DEV_CCP_DD" in the I2C_DESIGNWARE_AMDPSP.
> 
> 

Allowing that combination and using IS_REACHABLE means that it's going 
to actually load earlier that expected, so I suppose it needs to be 
something like this then in the probe code for i2c-designware-amdpsp.c:

if (!IS_REACHABLE()
	return -EPROBE_DEFER;

Right?
