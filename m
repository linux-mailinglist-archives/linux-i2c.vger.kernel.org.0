Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176B75E546D
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiIUUTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiIUUTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:19:36 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BE45FD7;
        Wed, 21 Sep 2022 13:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnvpfLJ40Mczd4Dg9oecmnXVK3J0DccCkBxpS77Uq7ON82q/ig5VDQ778Y6vhi55Q3QVYlU1X+6ow4pxaTnI81dVaE3pTsGQyFbCc6tFwaGqkV/RqjLqO5xSLP+HgpQnMO82JgTqEZsB9Ogy0mnDKHmbV+GT5ogtjmxzZJ9zR1uffareGauFImSpaE+NbNuh7QKvu0CbjkF+wj6fTfw8MwTPKTA97WS22szPw939E9BUzCpoX/0PCKhHbkp6bfc/XVOgTRJ4hHNVC3V5TMmmLxaF2TljaeXfl7euJNQUXMtX/mJ8yJKZ9IaGuUJU/w3NHRi3J4AABohfkL3LfghU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLCMQgbus+SXHkeE/3dI5JU5qURLuhKGQo9rbs74lT0=;
 b=Bh40Man5U9set4cG8lN9EraT+uph3C0eBDp/W85rBTfOnAy7Eb1d233k0U3Q5QqT9eEEMGUVwMRbIdTM9x92l61VKgzZOrjh9MJT4Dms07oN1v6eOyW/8oqOqIEGfZWDgEebsbnwklQDaTPuDX0q5v9QiOJDdz+aoRc8mBOV68ZerojQTkCebPK14aSwem6XtbwCvNIHwOLZukKATItF8ARej6kKgkeNf4/RdeGxvawlJEo9LA0jkfIRC1YbazdG5OQElRPWT0Y1wL1RYu46R4r365J5BLE4MKiM58+uUaqBjRleFIAIs+k6r4zgM1wRwBVfIUnEiqg281sCOy4IQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLCMQgbus+SXHkeE/3dI5JU5qURLuhKGQo9rbs74lT0=;
 b=u0cr/Kk2TkbTHPPB1F7I3xHPI9dPhl3bFlWSUhNZ6vlQdLgg2swOy+um11K9M0oh9AAy9DkbhzTpSE4Iseb8It4/f9iOh7uSFm2qZZ6aFh3TZY3/JG+IRKTWC9cu6qfr+t/jxl9Sb8Vq2jdV8iJuD/napxkbPNRJAayZouodHNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 20:19:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%7]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 20:19:28 +0000
Message-ID: <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
Date:   Wed, 21 Sep 2022 15:19:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Content-Language: en-US
To:     Borislav Petkov <bp@suse.de>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YytwNvSyhq380YNT@zn.tnic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610::27)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CO6PR12MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a689ba4-a0b5-4916-67f7-08da9c0e95b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ih995Mi+/tmpzkuQxMUPzpX+3ptpWDY77Xvm2T/emkHZ7us3RsmqmF+UuIUPy/RQ6jFUod7Vt7aSzfKluSc2vVGjfP82oi7tl6R7+56HqRTlJyxFv/unRxWOpuQ1jD3FB/eB8dM7DUQxCjSl45xEz1vGEinxed/lVmTauMn4m0PNsKpQs4vPAw/9H8Xv5m5JukVNh8rOcyiaSiX23Yu2U5OTZe8umoWCPhlyj96FiV7+ljLNufZLnN/uSMp36zy478IheUqlKlh/nJy3uas5xHxhsRHxX8av1tkdMYFgU8+jkBcIXyfNqijHVUWpNatQv7QC6MDolEAre9jXv6O7eQ8x2mPcDFVk3uNbN3EBp83NcSjEyzTahp1PL/ZrV7Ct2OPslMAquPv+hNTucphZU0MXek/2gGzduDIl1XLD5iDPJJaKpe973kvsm/7HxRWJ6jlSTr7Xx/lhlMBEFvCqRohBs+JbuawYksv2w1DClio1lXu9q5mSxHRpfjp03PnZnXJg5rgIxU1mOu0tkzD/a+lhI63dmz6PaIhBQkslWucZkLfHXwcOZOfOlbnDSkH2UlpaOE1DYopY2+w8ToS7LDp9eIMFA5SqgQXbhOEaB6Yuj4AawcQO4EO5JmbC0eMAVspKMzaOGKo/jDrH5i9w/XOGoD0JU3efk4W32N/zvWT+ng31+WV+ELvLDBn0LIWjICmxlOy7C1mu06PGdF4xmA0MRw4yEyHTLum1GR1wN/FDJ3BY6+6VsqUDTBWCan40wFD6UsLbOBaZZfI+U2Vh1ir/M8hQikKzACN/5M5/lE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(4744005)(31686004)(478600001)(66556008)(6486002)(54906003)(66946007)(110136005)(8676002)(41300700001)(36756003)(6506007)(66476007)(86362001)(4326008)(53546011)(186003)(31696002)(26005)(8936002)(316002)(38100700002)(5660300002)(6512007)(2616005)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDcxS2tVUDZQeVpuWndSVmU4UjBDS2Rub0k2WUtSeVFZQVJXWkFWNSttQlVr?=
 =?utf-8?B?bUJnUVRGdVRzamIvOE91ekJEbHFPTzh6eTBhZkphMWVndEg0QjNvTGM4aEFv?=
 =?utf-8?B?RnVWQklmT2k4ZEx0T0xnZUU3dEY1OTluVEtSVmljcWNzZVpYZmJ1c2tTVkdm?=
 =?utf-8?B?RHR3OVo0RkNkTGNsZmJHeCtBKzFtY2ZWMVd5Mk5wWlNjVXZBblJRT0dscTdw?=
 =?utf-8?B?TExxYzgxK3R1SStKVENIdXA2aGI4OVlidzJZeUsvUzcrNmhHVitoKzhYTHdT?=
 =?utf-8?B?clRPZDBNMVhSSy9wTW42QzFVT1Nsbk5oRnUzVzFOUU5RcDZEWmpOY1BxOVE1?=
 =?utf-8?B?SWhmQ1VWbStlOWpPQURCOVJZUm5Cd3Y1SjEzU1R6QTNHZjMxakNyclEra3Uy?=
 =?utf-8?B?UGR2TS9PYUNlSG5xdFhFVXFuVTA5L2xMaXZjaDlWaXVnMUc5ZXRsU1FPbjNX?=
 =?utf-8?B?ditjUU1aZUZ1QmR2bWhaRWEvdlJ3K1NYeThTUkVjN0tjeGs5ODF1bDZIOVg3?=
 =?utf-8?B?TU8zbk5YRGVCOS96VXFVNUd5aFdXTmY4aUFLUVpjY3ZpLzcxbTBjcHc1VFJ2?=
 =?utf-8?B?a1lzZU84TG01cGZGY0dhcUs1MXMzMnFNM2xCeUo0eFk3R1BOdWVlMndtRkNj?=
 =?utf-8?B?bE9FamM2NGtmMTUxYks0YWh5SGYyOEtndWZuTUdQMjBNN3EyVng5aStBYWk2?=
 =?utf-8?B?VlByU1hRR1ZFelZJbEdwYmp1N2IybHIxNkNVV0RrSXJjS2tIcDUwT1dXVnpi?=
 =?utf-8?B?bUZ2UGFnR1dSek9wTERzd2NSVFNaOG43MmdwOHZhTE5yZ2FvdmRqNmhKcjZ5?=
 =?utf-8?B?cWxxVElCOCsvY3JVZkprSG10NllHa29tZ21jRWpKR2lpVlN5MXh4WW9VblJP?=
 =?utf-8?B?d0VPTDNtaTVRdDR6UXBLcWdQN3F5aXpZajBMYTZDN3g1QTNndjhhSUtWNXZD?=
 =?utf-8?B?VGdodXMzV29oWERYTkVsR1hZQ09hcmtKRU5zV0dtK2JJeEpjNGhGVm5SV0tU?=
 =?utf-8?B?OEhJS1BJYjE3UVo4aGtVL21JVWc0SkhuTWJxQlVES0FyeGVGaHNOMExPcy9L?=
 =?utf-8?B?czlzZmlNcC8rZWFuYzAxOFdUL1g2a3BNTHViNFpsZnJGdHF1dzluQVQxK2J3?=
 =?utf-8?B?UjZ1enYwWEJQdFdSazFPaVFvdjZNQjNxbFFscTFqNjE3NGkzdVo4NG56eVA5?=
 =?utf-8?B?QTZsZXZWeWxjVFdqVjA3cEtybGZiZjVIbEdCSENqVFpndUtoR3BUeUQwODEy?=
 =?utf-8?B?NTJXQmNVTjZiSDErMDNIbjlrUWVLTUNSa1hOYlZObkRaN1NabUVDbGRTU1Jz?=
 =?utf-8?B?K0MvajF6U3lTVUgwRTRRYVZoSExaYy9iRm9vMkVJTFEwWFVuWGx0K3liZG94?=
 =?utf-8?B?U0JScHBlY081VmtoU0JEMUc2N2hQZDkzdi83QytBOUh6eXltMENuS1QxNFI0?=
 =?utf-8?B?azdFaWtmQzJCbG15c21vbWorMTVkUzFORGplZDRvaUEwT2I5Q21wU0dlNkw5?=
 =?utf-8?B?MGFSZ29hTzJBdmRZZXI5alcvRlZmOVpJL3VSN2R2RDNVMmJvT2ZTdVdmbW9E?=
 =?utf-8?B?ZVJZZExlUkJkcDM3WHF3Q0J2a2Y4YWdmYjhKYTVNcTcyVm42WWJ3V3BvYm4x?=
 =?utf-8?B?bVAyQVFrT3oycERhU2w0ZlErajBiM2kvWmh0UEZ4YmZYNzRJL0dVZmRrMkRm?=
 =?utf-8?B?VG1mdjRVek01c0VzR2hxTlgzakthbC9Nckt3ZUxDcmdiQjdodlNZMC9HVEhU?=
 =?utf-8?B?U203MTVaMUpMOG5iTENCZ0hJRm9FNUxTZTUrc2RuczdEclFJTTNkV1lOdTA1?=
 =?utf-8?B?elNyOG1JUlFDRkNER3JlanpoQ044bThLWVZKVUZSS1ZFSWhpMzF3OVptQnA5?=
 =?utf-8?B?Zm5ZU1JVZFp0V2Y2QW9JRWRBZWczYm1rRU04c1p3d0kyRy9yU3JHQ0d1UTk5?=
 =?utf-8?B?MUd0V3A4RVVEQXdyTVBVY1MzZVlCdndhL1dPdHd6WlhPK1hFbGtYT20vQUo0?=
 =?utf-8?B?Q3RsNm5GVXgvemlYZ3VHM0RDeDQxZVNtV3pJTU0va2ZRK3o2alRUQTlBZlJX?=
 =?utf-8?B?RXF6S21EUHdWd3VpREY4MDNJS1dXWW1kdThrUGhEVUNXMFdRcHVVa2VqQ29I?=
 =?utf-8?Q?awB2MXOoL11kJsj2UbBn89diA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a689ba4-a0b5-4916-67f7-08da9c0e95b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 20:19:28.2790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KX5TpCeC5aa4+HnkqkUphF3Exit9VZJ9M/wpEX1dut0s1ISBisSVGj/PnA7iqXq/WS6PfvkwuTrC4j6xRXG4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/21/2022 15:12, Borislav Petkov wrote:
> On Tue, Sep 20, 2022 at 06:24:39PM +0200, Jan Dąbroś wrote:
>>>> +EXPORT_SYMBOL_GPL(amd_cache_northbridges);
> 
> Why is this being exported again?
> 
> It is called unconditionally as a fs_initcall()...
> 

Jan mentioned this in the commit message:

 > The function which registers i2c-designware-platdrv is a
 > subsys_initcall that is executed before fs_initcall (when enumeration 
 > of NB descriptors occurs).

So if it's not exported again, then it means that we somehow
need to get i2c-designware-platdrv to register earlier too.

