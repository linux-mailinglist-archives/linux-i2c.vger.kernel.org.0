Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8D370AE28
	for <lists+linux-i2c@lfdr.de>; Sun, 21 May 2023 15:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjEUNBJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 May 2023 09:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjEUNBF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 May 2023 09:01:05 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1AEC5;
        Sun, 21 May 2023 05:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UigJIVGZ21yBX9IpKGJzbPYoICwg9Fu8T9lglgrO638jSbFdJ30Jt9AYdm/J6m1/dOYSqD4GX6+cO2QpyoiUsDpWUSvgyh/ZBJ44L0P1GosmzdPKAtq2mDnAzmNRC/1K52en20eOeFU2OrPswYnTVBISFbPrjHRAgYYo0iukvYV0Xz5HIpk9dYYqzJVXbvC4Rt+Bnn9DXW82J3QV5Yh0NbdttiEyhBLAlLEm4YW25l2OaN7bs8iNyxw42Eo9xGAGPgRPLWm4XZcBx8gcB1CsbzRPz1WClXYDmbE8xUhoUlacJDr14Ro2snN72MUcJiLG3zJhK0d+b83NGeTNOLszYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcwWrMifP6sBQTHLBCd8qCJoYZg0w1M8Rd7ZUcnPMWQ=;
 b=DjXdJ/cHa+p3abEYFfbFavA+klBSHRfD9ef+Af8G7fnat2neyWbIEjJC+ENX8rGAWVxzh7br2ZhC8kqMxa5OClTul5/b9buyRAJvN31fJ2f8uGb/KAfnmDdNQUqbZDHA3ux9lXixv9TV805JkjvmAf0trMXuLaFmBHMN0wiMJSAn3/ZPXWBAhVFHejquKTq574YuaAPYLLZL+15SNVnVheTJPd8hewkuvucRL0Ibjf/HTd4Us+pcBKjCIYfDdp01ONqFy8ni39+fThHiYoKE+65+COxajhO6qTf/4FzLVESp8n+KAvmHSNTjF67zpW+eCZ/PFK9LIkADiZWqPJe9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcwWrMifP6sBQTHLBCd8qCJoYZg0w1M8Rd7ZUcnPMWQ=;
 b=Ywncw7FDRl+ZL+yd/L9fYlGydqbCnF+2JTGxH31tc7u1CfO1LvjjazJFrqW6v/2GFU0CJsMflLELMdSNBoxQuW42I7emWNrAGkAWzdvXoTDIN0yDt7/061BM+gPKyIZfAy84ZoBg+Oix/AiZK61M/n8wavkNnEF4tQ4p+SABihU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BN9PR12MB5211.namprd12.prod.outlook.com (2603:10b6:408:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Sun, 21 May
 2023 12:59:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6411.027; Sun, 21 May 2023
 12:59:47 +0000
Message-ID: <85845b5e-4c9d-4a2d-9d81-c49c82380177@amd.com>
Date:   Sun, 21 May 2023 07:59:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
To:     Gregor Riepl <onitake@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com
References: <20230518161150.92959-1-mario.limonciello@amd.com>
 <6f1e866b-a96a-3134-c735-c941681b0638@gmail.com>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6f1e866b-a96a-3134-c735-c941681b0638@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0086.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BN9PR12MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c92e039-798f-49c3-5647-08db59fb418d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFP4jUT23Zu/m6uJZ+PLBkMuWZ8Wu9X7XC0svshekio/ohOIX/foYnaI0FCpbl0F8BhwYgCsYQQPDy1r8Me6MPAnhzZ9xaO8RphDi71lVL0LCQS9XOG0Fr3clEL5zUfVLO65LSpzz5xTd/b+jsN0Z+H5vmwk4PHc/11vvZc5rMfeyazZWeqKK9NjOa3he0NqRISxC7bmEK4ixg+X57kOJxVfcDI1i8J/Q2LjCbDWnRKPbTu2v4s+RKbv64BFB08CKY0xSkGNZw5u1J6yw2DUwnHvz379LhIudlyNizai3tf7zCosRefc2AFBxew1fmIl+uhF0XmFpuVcgdTfF2EqGig74p4dkQeJEALzGgIlKFSzCrdQe85si0Ww0nue+VB2avECWkrioJautqdoerrd9oJjqnszCCaPh1yWnqn1wyb7VeNpf6yue7Xe1SqyTIuNz1mL4yGH10NneOXPmhaIppxBtpaS1kjPBW+E3zsvXCiO6zi4b3NeB28X8SpmEyYvfuwicY41ZedFY/6ETxQnsziBqyOU1QD5IUr/E91lhUV5s6Oki39G+0ahYU8S6MhjDTzZ18CxTxxqNeiqopZeylM8vbZMKRahFs/CILsQ8q/bnLQ/0iMQJG7kU2mvn+wsQQmcOKJPk5CDqwEVRZ1hSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(8936002)(5660300002)(8676002)(83380400001)(2906002)(186003)(2616005)(36756003)(38100700002)(31696002)(86362001)(44832011)(6512007)(6506007)(53546011)(316002)(66476007)(4326008)(6916009)(66556008)(478600001)(31686004)(66946007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZ1NnJFdUtsSld4V3JRMGgrZFFHVTBkMmNQZ3BJTnRqY3JwcUpIQlZub0dL?=
 =?utf-8?B?VHVaaWJ1Zk9HV2F6allvWmRobmk2UmpjdjQwdUJSUU9KZTdrRGpTYWhjQS9E?=
 =?utf-8?B?d1J1ZTU0S3ZENjdlaFNPbGFhdmtXOEtiNWJRb1FBUFR6NkprNmxoNnhlRGZZ?=
 =?utf-8?B?bUZCUjljSlpFQ3NEWFVkQ1lXSS9lYnlmZmExc2tZWVN2RzJPQlFXcnZQZ1Bw?=
 =?utf-8?B?VzlGNXZVNmF4VlBoY3RIY2QrOGpkbmNEQzlOc3UyU2pxRHc0UEpGbjh2bjZF?=
 =?utf-8?B?cjhKY09kNnVDUHhnb0prNGRpaHJJZGFmbTVpa1VnelZJb3hyWW1YWkpoSVo3?=
 =?utf-8?B?UnlvKytjd0VCRXNIQ3JKSStabkQxL2cvM1ZEeXZqRHYrVW9jcHRodmdOQzdD?=
 =?utf-8?B?Ynh4TTlBSDRlTzVUYmlKMEN1NWVGQzVxbjZsM0dEUDltUklVZTNlK1REUTJ5?=
 =?utf-8?B?NEVUK1Q4YXgvbGxoVGY4STEwQnU3L1dpL1NoQWpQdmtSWHFmYnlsaEZTSTdX?=
 =?utf-8?B?d2x2YkVaaWJ3VTJXdEY3SnV0aStHQlVCSE5SclQybWM1NFBYdFpxNldsUFBR?=
 =?utf-8?B?Tk81YlFsdlQrQTh0MzNvM0M0VGhNdEZRNkhyVjU4cm1ucitpZEVSZDNVTnd3?=
 =?utf-8?B?UVVCa29xVURMMlhoZnloZG1aRlFLd05lRmxieGJxNVJNTjRZbFV3eWNCZWR2?=
 =?utf-8?B?Y2RJTFdkcHBnRFM0TmJudUJoYTdyOEFqZndTeUZCMWYyd1JKd0k1ZWxSYVZM?=
 =?utf-8?B?YXJzaHRPNEErRDMxMVdwVkwvcWUzUThXRmlBcU9MVHFaU1dZK01kUEdxK0Uy?=
 =?utf-8?B?M3Z6aVh0bFlmSERMQzVpbFRPaGxRUTQ1T0VyT2dTNE45aDRHZlcwVlBIVGZF?=
 =?utf-8?B?Vm9QSkg1L3haYnZmUkdWQXhEOWVLcnp1SWltQzRIdk41YTdQaFZKOWgwUGVR?=
 =?utf-8?B?MnZVN3ZQVEcwWU9ETEloQ2daSHZ3NlpveXZHM09IYnBLUG9oMlhqaTJqMzg1?=
 =?utf-8?B?ZlZxTmtDRXJyM1Z4RFFSMkdtdWVUY2dHRmYyc1hPcmZ4NGNpODVxSHZ4N1Q2?=
 =?utf-8?B?UC9xVTRxb25TN2dobUZSTFI3ekcyN3c1NHFMU0lBWmJjQWEveFBsYW54SWNJ?=
 =?utf-8?B?dnZDOG50WjlMWVJLVjhBNklnRW9wTkFLYmJ6d1pVNFNxeXg4cllwYm5jS1Bu?=
 =?utf-8?B?Vk4zNjNIUk9JQmQyVkxwNWEvdmdkZUk4dzR4QXhZVnRXbmdudUhBdXlKNVVH?=
 =?utf-8?B?bklKTGs5SDVLTUxOQWNlOU9aSDB2YWFyazVUU29palBUd0Q4ZjZaaFpPMmsr?=
 =?utf-8?B?RE1vL0hKSjNRQWhNSUMwNVJvOWZpQnd0NXBoNmhSbnVoZXgzM01CcTcwSmE1?=
 =?utf-8?B?djREeEJoV0MyMk5hdjlzQ2R6Q0Q3NTIxYmVyd0VWcmUyNzdWSUI5UyszVmw1?=
 =?utf-8?B?bDF3Y1N0NU9YeWxiQ3BHSk12cldUbmpnSFFKdytRdis5ZWUzWWVLR1I0NCts?=
 =?utf-8?B?RVRtMXVqNnM5TDVQeStpM0tGRTdZMXdwOHZZQ2picGNFSklYMmRHeHFWTGxT?=
 =?utf-8?B?NFV6Y291bzRNNnZCdmlXNUJoZDJyTzJMSmwrcnBhS2Rua0crdmszdlpmWmVx?=
 =?utf-8?B?cWtVVGVGWTJlMFB2eW55MFNLWnlNeDlwRnBtOVQ3QWp5cVNhdStWZWpjemNr?=
 =?utf-8?B?SHFpQ1VmMWYxcUU2NkEzQ2lKSjhGNFRENTM3NnQ2YXVrd0I4dWk2QkNMamta?=
 =?utf-8?B?RjNUUmtLRlQ1clllMXpNeDIwNmlZZzJRWTNVdFA0UmdJZTNEeE9pd1U2VThK?=
 =?utf-8?B?REtKK0NBYVZpODVZZVdFbkFtK0wzYjk4UkFPR0ZJbWNlbkNTYSsrSitCVWN1?=
 =?utf-8?B?MDNxNVFtYnp1RWRJaUUvUG9uTnJORzh2K0wzUlhkSkFsMW1CeVV2RlMvOWlK?=
 =?utf-8?B?MUJmV2VOUGlGS0RmbFV0eWs4bElyRjZqYWs3Y3I4dFRDM3d4RWc1a2FZZno2?=
 =?utf-8?B?T2VGZ1c1V0hWZEZ2WE1NRnJkNCtwNDBaZkdsbUVQUmJMbXVoeWk2bERGWnVC?=
 =?utf-8?B?WHg2S0J0V1hOc3d3QUFUam9DSGtLemNiNFlpaklPUWFHd2p3TzhKSXIzNnFx?=
 =?utf-8?B?azB5NkExMjdxT3N0cjZIcDkrWHRlSlcxUWt5Y0JpZGdBRzNSeENUMmFCSDJl?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c92e039-798f-49c3-5647-08db59fb418d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2023 12:59:47.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOM4RwxVBbCmx4iUvwWAXreUVMpBeWDdNMjPNqAby+RJFwrT8mO2PQtTDC23d/Z171kUwsdqSfH5AjhhMBbGYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5211
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/21/23 04:23, Gregor Riepl wrote:
>> As the power supply for a dGPU is only for powering devices connected
>> to dGPU, create a device property to indicate that the UCSI endpoint
>> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
> 
> Is this a given fact?

At least for today's eGPU enclosures; yes.

> 
> I could imagine that a dGPU device would be capable of feeding power 
> back into the system, for example when an external docking station or 
> display device has a power supply connected to it.
> 
> Although I don't think it's possible (or safe) with a desktop system, 
> maybe a portable computer with a discrete GPU would be able to do this?

If such a hardware design was created you should actually have two USCI 
power supplies.

The PD controller or TCPC for the portable computer should provide one 
to represent the connection to the eGPU and the dGPU should provide one
to represent the connection to the dGPU.

The one from the portable computer will be marked 'system' and the dGPU 
would be 'device.'
