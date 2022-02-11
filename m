Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4605D4B2CEE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 19:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbiBKSZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 13:25:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiBKSZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 13:25:24 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D998BC;
        Fri, 11 Feb 2022 10:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXSHZvLjcqoEUHkNOwjTDo1OwQEClZ7edI5X7Luz7caUD5kg+5vcrd5ksZWf3e8QDa7rC2UBwMghbcvH4ni9LVQQKAy3ySxx6Fi6/V4IFCO2PMXdz0hftfegtC6w8R/YM7bN7OLQ6CtpVNcIx/CUF3i/kZvoIzF825dQYmMKZE9+5VKJRPNwnxoEIXLRkHQe9E268e1AS53ZTKyfXe8nzfmDeb/Qwnuk92XmQ/vGJiQuztxw6b4lvJwTkJ+McU7zdd3VP7G9+1FFVp+aOcSF+aE4hJQEl1d9ixwb6QL33rU7de3fVwBhm4Nk4DE6tAfvjAJE2VrR7QVliPebxaDJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHNo0mu6WN3OKqEQRXX8g0byVWVKTBLxk0ZHQelbkxI=;
 b=ieHZEPmPXRaLVSpTKIH+cqUcMz5kPw7eSEF3FH1LamUKCvY1rDJ/kwXiyog/jYb9pkOSXMKAaH84ccbNplp0XG4XAduhxW4iwHpT3UFZjShcGXk1a9aXqdaL9cW0Yx6PM2FNUfbmi01Yx18YDAAeIgfGnK0EGJDxPReyJ/GPHs5EePDV21F9gQkhHXGbLQmTmtiuylf/J+/hSsuAYQUtT8buDQ4i19oCYRcr5YAa9hrlAKrngzWdEDz+EODN8G/DsZh1tmfl93CeerzR6Yj0idpw9Hv1Hwu7m8KVn0kuoHhZMnFSM1Y8Abclcy0gEnp+6n1BrVbiMPvRGF71+vGeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHNo0mu6WN3OKqEQRXX8g0byVWVKTBLxk0ZHQelbkxI=;
 b=4SCjWgvvgvYnSqIMYIl2wkXA6Q15pNPQRODsFo0jQCiIKRrJdQFaaJ4USUUtb+i7E83kpm7DQGM6LeqUBXRxl8LLnFyfseu/3Ae6gnaj6Ukpwv5HXnZLXKR4+zlg880dCBaK7k5QXy0DhNZEOt/rMXxHQyUFMskaEBb6dglSdiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BN6PR12MB1652.namprd12.prod.outlook.com (2603:10b6:405:6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 18:25:20 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 18:25:20 +0000
Message-ID: <46f9dc71-9640-71cf-e8b6-d0e4133766f3@amd.com>
Date:   Fri, 11 Feb 2022 12:25:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: Terry.Bowman@amd.com
Subject: Re: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Content-Language: en-US
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        sudheesh.mavila@amd.com, Nehal-bakulchandra.Shah@amd.com,
        Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
        Mario.Limonciello@amd.com
References: <20220209172717.178813-1-terry.bowman@amd.com>
 <20220209172717.178813-4-terry.bowman@amd.com>
 <20220211105322.180ad89d@endymion.delvare> <YgZ12hCMUlqtLKD3@kunai>
 <c60c9fe4-cfb1-9df2-eb57-66b41149d7db@amd.com>
In-Reply-To: <c60c9fe4-cfb1-9df2-eb57-66b41149d7db@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:6e::6) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c318a4a-c8f1-49a0-c469-08d9ed8bdc4e
X-MS-TrafficTypeDiagnostic: BN6PR12MB1652:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB165228AD9635A530FE0F9A8983309@BN6PR12MB1652.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hi7JdrH8yBKItSNgyYCPqg1nu1aOq58zJ/bXNcMKou+JPL6giaaM0nT4lBX/qbzgqBTNuZTJVhY76fUAhcBTeNL06/C9prKMCaWThTLdquuPkgE1kUak375urZlDaEdFbiJC9SDeb4p3OocAFze57SHfKfi/kLGVkWvxMeq0XwlBd3S9kc5TGS3Vgnl3HodtBDedH0DCJGKm7xOHHe7hMloIahU81iRA9xxhFWRMZGue0cXj3SLHlEnvpHktwUfjjLfkg0TZi+lVCb2c+/2rfwPaY2cojbSoevqJsRMF/TO6/Ga0xcjpi5J8gt9vekvJvxx5DuSHAudtabBK3pUdIsrGcOWN0wmonjK/NdU798+CgT7pLhvPF+DCGyjz6xqitW/M7JHc7kqodwDB4tgJzTQojbJldYfN0E0M9ctE7jVifu1sxPopoHXayZZ09InzgGshyItLg5CvYV4U8FZtmPAXpkQXx8DArKnbOSAmamNuzGD+FB+bWN7e077eRomX3+wnxaDkgxOqyWrQpcXFaPnuGdg5R/wTIKGWyXmpg+x/2NQ+gxwCtPtJIQOy8vUShD2+7RUJqx/P6Lbj/uGbI8uK+SqGL1gvn63WvfmmoQHBtHnKk6wyniOcW8K4zoSG1MLLiDJO7U0tHpg0dXz72wt4/Xmm3M9sO4TKLfNqBIaPYL+e/AA/RlQrCFTkzYgA5UMhJvTkyYSMU6obp1z6k4Dvss5YwPn948q/04iaH9bhd0R074LGTbMGYZTXmgb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(31696002)(186003)(38100700002)(8936002)(6666004)(6512007)(2616005)(6486002)(53546011)(508600001)(316002)(86362001)(6636002)(83380400001)(66556008)(66476007)(8676002)(3450700001)(921005)(31686004)(5660300002)(36756003)(6506007)(2906002)(110136005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1FHakEyRnNMeWIzQUJXYWpmaDl1V2U2TmJHMGk3MWQ3WCtHSy81VHFPOUJ0?=
 =?utf-8?B?QUFVOHR5dE9HRHZzRTRwQ1FzYjgxTXJ4VkpBQnhHemVNVGNxVmtPMVVWYlVX?=
 =?utf-8?B?cnkwYlVFSWRTMkRJdmJFaWo4enowdldLNDY3UTVzUkVEZjRtdnRoL1kxM1Nh?=
 =?utf-8?B?dlZlb0RSYVNmNEJHdDVtYnZnbHFEeE94OW1YRlNxNE4wT3hRbG9OVlVsWjFH?=
 =?utf-8?B?VmFpOWFuLzlkWmQ2aDB5aXYyQXIrQXVOSjcwczYyMDZhampHMmdQdFdZQS9R?=
 =?utf-8?B?d2d5RlZ6VnNNM3hzSWRYTzlQUGJUcDlsRUdFTStDT3p5STJGTHFpakZKUVMy?=
 =?utf-8?B?YjZMenRUNFp5UGFGdVVJelFYSC9GY3pRVnhKWnI3OTE2TUlrQnVGaVplZjkv?=
 =?utf-8?B?ZGlzSjNvWWpsZUdNWk5tU1kwQjhSdGFKZDRkanRKaHFqcUxjZnZ5THZ3aWRl?=
 =?utf-8?B?ckRWcFFZV0VCbmQ1YlF1cnBQZ0pGd2UzUG5aK1F0ZVFQMzFBVFdxL3M3U0lB?=
 =?utf-8?B?VjlLYjNkZlpxMHE3QTNjNWlCb2ZxRlJaV2ZPNDJHdzI2NDFGb1pYZUpsOHdF?=
 =?utf-8?B?TmtqZWVaekRBSEY3ckRDcDJVUUUwdlczZDBFWTkzZGV3YjBUNndOZ1RtbWJh?=
 =?utf-8?B?cGRhRVFULzFvVk1qWS9XdVF1V2xncWlEZXBHNDhqVEphajlURjdVME1TTUtX?=
 =?utf-8?B?T1VjcVBhNW5DVGsveUtFcUxuSUgvdVZuYjFKOUwyczVSNTAvbkxPUWJFUFV1?=
 =?utf-8?B?L1VtcE1YRlZHUjZPK3Jld0FNT1lJdHR0WnNTVTdram9KaGNqOG1IVW93THND?=
 =?utf-8?B?QjYzZUplak9EWlhWNHU0THFDVG5JSmN1allISDkxdGx6RlprS3RXSGVNS1o4?=
 =?utf-8?B?Q2hiVFVqcnBlbzNtUWlvUXFLbnErSU5HR3lJa0lMbGV1Tm1ucUxrNVVLS2Z6?=
 =?utf-8?B?U1J4OUpWVDFvVnd5Yjd0bHpUOGZxSnNSVTdlbXYwNzV1bm1UbDZtVnh2eVdS?=
 =?utf-8?B?ckQ2U1FCRCticVRvMEFTMXJlek5PSTNrZGJuVzhuWGN0Zkp2NjMvSm9FeG1r?=
 =?utf-8?B?V0ROSUpWRkZmMjBadGpzc2ZFV3RwZmh1bDdIMVhhYzMvZ1MyMVFyTjNGRW1w?=
 =?utf-8?B?VFVPYmZraHVoeHdnRW9FczZEUGQzcXpoSjdxbi96VUFsc0llUm9RWDJHeG5o?=
 =?utf-8?B?aEFleUcvR1N0d2JYN3JmRHRTcmNoTE9HeFA0b0N0MXpxL3FiWEpjekpQTnNW?=
 =?utf-8?B?ZThvbHY5Q0dzeEh6SGNycktEZFQ3dzRwdkxETHZrcEZMdGhXR1I1YXQ4bm1D?=
 =?utf-8?B?aFBoalJsTDVoYkFPTDgwbHF6UGRXR3hyU3JIdThlZ3NRWUd2R0RhTlBHWitK?=
 =?utf-8?B?Y3hLSWo4U1hlTE5KUk5pRnk4MVZSY2pEUE9wZ0JYVWVoMCtCa1BmbkNTTEU0?=
 =?utf-8?B?b0ZoYkhFSytPTWFRSWlHWGozbUxDUFVJUTR4a3pDODI2Vk1ZWElRWjdYVG9J?=
 =?utf-8?B?dDhiUVJFeUZ4YnpOYm43WnhhSDJyd3pNOUdtczFkQVU2TUJNZGdNMlRYa3FQ?=
 =?utf-8?B?a3hFNURBakhwdHUvaFBNYUkzM3Vzc1VEN3FBQXVXZytoWTQwTnpyZlRRdklj?=
 =?utf-8?B?dGZHc3RlZlBXeEhIZGRSRWs5Q055YkZxWEJFR2p3TC9XZUg0VWhkSHY3by9o?=
 =?utf-8?B?WVBqYWdUYTd1UHRxbmJyR0tiNnVXTkhvR0liZ1RzekQzdGxhejh2N3c4cGUx?=
 =?utf-8?B?UlJtUnZRT1crekN6OHdIVXVhckNsUHFVamt6enNvYTE0L2xIaTY3Nm5UWXFi?=
 =?utf-8?B?TUpnS0N2Nzh5NzREbXZheUxYOXM2K2UzQnRITFRHYzFQVDZVUlFtTGFlODVj?=
 =?utf-8?B?Tk1kTmx6K24yMGErdkM1d0lOdEtlSmhqQ0gyWVZYT2ZndnpwUzNiZzZLN1Zn?=
 =?utf-8?B?a08yeFJpUFNTK1ZsUElxR093VDBTbDBMZkNMemFYaGJyNXp2TUc4VGg2TE1o?=
 =?utf-8?B?MGpGNGZ4NmxEVzErRnNBVHl0TDFadHhvMTB1UkxvUVFsQk9xVm9TWkFWS2d3?=
 =?utf-8?B?UXJWR1FyWEdQZ3pBeFlUT3VXWVYvUXN3WU42MTg0dUtpYm1pbDRRQkR6VGp6?=
 =?utf-8?B?eTYyYXppQm5xYzUyd0laeUFrM2NXbXErVVUxM1lqQnlsQlBSNG04ZVhmNHZs?=
 =?utf-8?Q?/U+v0DyjtuQcoWxA2JwqCMI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c318a4a-c8f1-49a0-c469-08d9ed8bdc4e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 18:25:20.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqzSEBvdfTvWizqApEAphSpPTZTc7baFjwpx/kswfwHkIjB0npH4AopPzmcJ+rVPFVyrnbgfhc0i7T7xqElecw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1652
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram an Jean,

On 2/11/22 09:00, Terry Bowman wrote:
> Hi Wolfram and Jean,
> 
> On 2/11/22 08:42, Wolfram Sang wrote:
>>>> +		if (retval)
>>>
>>> Missing curly brace here, breaks the build.
>>
>> Bummer, need to check why this wasn't found by my build-testing.
>>
>> I fixed it up and also rebased patch 6 to my change. Terry, please have
>> a look that I did everything correctly once I push out later today.
>>
>> Thanks everyone!
>>
> I need to look at how I sent that out. I will look for the fix in 
> i2c/for-next. Thanks for the help and review. 

I verified the fix looks good. From commit a3325d225b00 on i2c/for-next:

@@ -373,11 +388,10 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
 		}
 	} else {
-		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
-					  SB800_PIIX4_SMB_MAP_SIZE,
-					  "sb800_piix4_smb")) {
+		retval = piix4_sb800_region_request(&PIIX4_dev->dev);
+		if (retval) {
 			release_region(piix4_smba, SMBIOSIZE);
-			return -EBUSY;
+			return retval;
 		}
