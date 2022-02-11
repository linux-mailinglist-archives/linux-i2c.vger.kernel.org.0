Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA974B289F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 16:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344555AbiBKPA0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 10:00:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbiBKPAZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 10:00:25 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FAD94;
        Fri, 11 Feb 2022 07:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSzKvm8G0gxRtobHSgQeoPl7ScWgVwy7tsyFnI/irXIPmDJ/wv367aVRGj04dh3f2sbELItmcZ4dHzriDrEPVyLw6s8PtaLHnfLsQIaztoGytRthzG+VRdXl3d/MPHgdaRV+biTfwRFYe4Bjnut2BMSVNYUZMzAIVp6i71FugakkKyWTekoVEC5RNgRYkmtKRMkWFy8I2eRA1ucsLCznI32YCGX9+7h33ZsFKbScQgN50HbJgLIJN1ecDfn06rAl3/nnEWLGUBgmFRTTJZhrYyVKEBXywv5m0c4arkSIEcMO6J+2rqaQ1HdnzPIzMOg/vJ64OjWN/oW4ZTEAf8KXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P0cfn7j5xXeYGIlnSi/IeRwvYpXzm18dAFyx0kzlUk=;
 b=oW4LD2SSqCzhMEcD6Jw3XecQ0x8LeUb054cH/CmxWXMDB4Td9uXMpNgRUyB6Zf6pcRplWTgzw8Blj1K15UhW0vVipRsLDJ52uNk1qIy23x6jSlQrF4H8jZ/R2eZfsLOb32YqeI9t+SeHuZgXviUI+slAQXRGCfAXrkzz8Y04+p4u3S+nFD4zgKeWKRMfoUliAhh7ZKPzCGHV+6CVIPqRk25N/r7aq4Uvlei8GrhP1k9uPsdwQQwVrssh7Ap7wztPkf1taR0lTrYhxsqG4AqwYLGvt/6GxmTKOzr8xexQLJZrqq0Lg6zVZVh6GeWoPuR76wqLoRz5RZCtIptG9lSzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P0cfn7j5xXeYGIlnSi/IeRwvYpXzm18dAFyx0kzlUk=;
 b=nZSdRZZScKTSM0FaAAo9YnoWEXU3csLC7a6WpnvZQv7RMuIV2mapicoXGK8J1cMSR+Z6nqG9JuHnU2q5uWOqLyLgIGGKs921BPxqBuxdRjvSj5K2jZCJs3q0yGyGTWXqR8kvl0AZS9XX7JTaI82vT21gQmVrHeeIQl34D+Vq1x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by DM4PR12MB5358.namprd12.prod.outlook.com (2603:10b6:5:39c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 15:00:23 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 15:00:23 +0000
Message-ID: <c60c9fe4-cfb1-9df2-eb57-66b41149d7db@amd.com>
Date:   Fri, 11 Feb 2022 09:00:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: Terry.Bowman@amd.com
Subject: Re: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Content-Language: en-US
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
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <YgZ12hCMUlqtLKD3@kunai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3111d7d0-b28c-4246-e982-08d9ed6f3a42
X-MS-TrafficTypeDiagnostic: DM4PR12MB5358:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53583C0D20A0841F61524EE483309@DM4PR12MB5358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67lmPes/SYq4jzhIOkLFDwJy/IOUfEgeh+Uzj1+q7O/SmFkJSr/lGBu13rORYIJ9AqxvWgjAt/Rc21npwkpEHrSLgnTg09okYQzE7hCIRKcoxp4thLaLwapvVV+dy+ccSTsGZ5agx+O4Rawiw33suIVpzmOJ0yKHuYRG27wVgPRMN7wdnX/PwLbUOiZmAVyKEzRujCLz+nUYeC9wCmiE6rk0A6ZsNEXUjMBoYToFxKK43hTJJaaArXU1uROui9HJN3tzv4qQt3jPwQdQWoAd2Y7DQ+XYnWCu3bM8XgQomTXzHDaw5OD9X6D68tpyMdyy1uAxvAe3cRqNrpOA2Fg7J4D66lMyqoLZ9BOzkg5ZQQH2siK5VRBm2AU6XWh+08tkLCTqcZMxJdM1uoPwz26D7jrhQ2cFGwtKPo9HI7FU7lLAAew7rdkx6GGAv3ZOuBBTsp0/BwuiuinXgAy/mIPWnkLidGl76uJopVUXlixosDMupa8+MXDbtM1BpNWvVSYAIyotZGZiipHZ4GRsgiQwvWoxdvG+XvVOI1HO6duNcqEJ55bLJio/lZ8J37GopZx78kDrZ0T1AHY8FimuNPm+MBZ3rHNoaR9/8MTvRMCCJFJ/kzZpAL8j0LK1tqynioownCxrJE7Awj9SJfEZ4xZa/AqGJ0QF3E8epIg3bCw2Y0YicQnQ4KnXZfubNfQQJkETnK+mVssn2e7YCHxvBOg3PVjI18iN5MMTHSm6w9RFlqpTF87gJa7lmHXKiBup7Hkv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(508600001)(38100700002)(2906002)(36756003)(3450700001)(921005)(6636002)(6666004)(6486002)(186003)(4744005)(5660300002)(6512007)(110136005)(31696002)(86362001)(8936002)(66946007)(66476007)(2616005)(6506007)(316002)(53546011)(26005)(66556008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG1yRFk1aXN6TkNYa2twYzlLV1BMelRuOVE5RkZkQWF2RmowNm1QWGNsZ3I5?=
 =?utf-8?B?cS9MenZLOHB3NnlVVFRxaUhmUEV5ZERVRjlMVStKOHY5bURIbmNJNzMwWkR3?=
 =?utf-8?B?YXlqNUpXV2lBQUxIL1NhL3czdWx5NE41QnJaMEVtUmxqVEhjbGxSaWIxSjVn?=
 =?utf-8?B?UWhLMzMwMHNvTVZpSFVqZ3pJaXZyL3MrcDR2bXBNb3kySmlVc0dqOUZRenJO?=
 =?utf-8?B?RVFKMXNiUHFKQUNnazVQZDNiWGtic04zbGJUdFIwV0NHb3pXYjV6bFFEdnR2?=
 =?utf-8?B?LzhuTVBNWjFCTXFCd1FVQ0ZHd2tGM3RYV3hhMThqZDhwT2JsTzJtY25Eb0to?=
 =?utf-8?B?RlVqMEg2bUxOOFhDL3lnbkI4amFTK2tCUWVsc0ZGWXB3TE9ZL0VvMk01M2da?=
 =?utf-8?B?dFNYM2pQQ3NZc0U4L0piL3Z5aDlYVnF3c2RQQ0ZqaWNQNzA1dW44QnB0RlVw?=
 =?utf-8?B?WVRCSko5M2M0NFRseldwbUtrSUkvZFQxZ1ZubXhCQVlVcW9IQzVRZG5SOXJN?=
 =?utf-8?B?NmdsNVNYbHRuNDZUSFMyYXhkTlE5WG5na0dia0xaWGtGSWVCcjg0azg5T1B6?=
 =?utf-8?B?T3llTE4zQmJLMzd3MHhvanM1SjNFNlRRVFVXM09NTVJXUFhvc0FYQnhKaHd6?=
 =?utf-8?B?S2JTQmVGWjQzTWw4Vjk2a1ZGSWo2aUptWVVZWWtMMHpFTlNNVTFadHVqVmc5?=
 =?utf-8?B?V1JQdjh0K2VidTl2bU8rdGVtQWhzMVNqaUpOYS9TL1pVZVFGMUxZdDZTVlRI?=
 =?utf-8?B?UHNJSW8xb1lwQzFnUENPUEhiYVIzQjJORTJjMHM3TVNPQmFPUmFBaG5BWEJZ?=
 =?utf-8?B?elRKcGRZTUgxdkxCZWM5TWdicDZkT1VSdHEzWHhuT2ErVGQweGJzY0dOem9K?=
 =?utf-8?B?aDVDNGwyL2djSHo4cFdMN0NKYzI5ZTlEdU04YW1nb1l5ZkdoMEI3QVBmam0w?=
 =?utf-8?B?OFphbmJKUzFCRDNTdEM0bUF3QkgyZFE5Z0lkNjRzN0tscXVLTkhjcWlDdDZS?=
 =?utf-8?B?bThDRlBmeFhQMUJWS3NsYVRSMVhtQU95OTdhN0Q5WXBvcDBPMjE2RTUxVGdQ?=
 =?utf-8?B?eGRsamdNNHpORmU5OXJXLzNJK1NCOWUzV2R4bGlyZVkxcDZJQVN2bEt0UlVZ?=
 =?utf-8?B?YWE5SHN1ampaQlFHS2lrVnhEVk91L054Nys1djRQbFBxeHNPWVNZaEk1V0sv?=
 =?utf-8?B?RnV2TEtBcytlQ2U5VXJGKzNLUWlxRjFlbkMzMllUYkoxTWMrRTBxWGlrUEov?=
 =?utf-8?B?OG45Q3VQd0tPUktBUHZiU29MQWNObFJJUTN2MklEcTNDN2pmN0M5cGo0UGxK?=
 =?utf-8?B?bmpFbFpyNGhHUnI0di9xb1B1Ykd4cDFQcUtQaVJacXRGQWFhc0dyNFpFOThr?=
 =?utf-8?B?czNWbTkrTFdZM3JnVFdHOXpCUFBVcXBJYnU3L0ROV0M3WFJnNzFzSCtPd0xL?=
 =?utf-8?B?RGhsR2hUM2V4UElBS2hCMTVmU1dTWVhtbC9KRzhrRVVJUXV6K2d1SStIcjFp?=
 =?utf-8?B?T1FFQnUwVlFrYXoydHNLMkQ3WnNEb3BUaFJxanMvOGxCSEtWOWJ3SmtmQXBs?=
 =?utf-8?B?ZXJTQ2tteGtwODdPZWc3TXp5YUZlTVlWck9Nb0psc2FUa3BmNUl1Z0tMdnAz?=
 =?utf-8?B?cnR1MWh0N1V5VXNpOXdMVmM0RldTZGVoYmJiSkpRUXZEaEpuT1dNWWNnVFd0?=
 =?utf-8?B?VnVEN01reUwxakk3MEUzUytZak55aWlnOW5EVXNUNDBXZmVBME9FWE1HR2VB?=
 =?utf-8?B?aU5oUHEvdU9pT2RMa21QRlZRRTdjV3l5blBHUk9mVHo3Q3Z4TXdmcFhhMEpE?=
 =?utf-8?B?WEFRV1QyUHIvTG4xWmI3VCs3RFdFNlovUmIxd0ZxZUV2cnk3RVVYUW1OOWhu?=
 =?utf-8?B?ZW40MFFrUlBUSGdDdXEyeXBtQ21KTmJmS0cwd0Q5dUtLNktJbEZSUk44dmUx?=
 =?utf-8?B?dUlXdmJLNHVsWXdqbklwTXpIaVZscjNQdWcrWWZOSFNscWxYVUU4VG13Z2FM?=
 =?utf-8?B?WGJ1Q3RDc1RCQVBwcXlOM0xMczlveWFIT3Y3eXNyR20yMVZtZ2lpSVlUT0o1?=
 =?utf-8?B?M0VkMy9JV05qaExZbFpkQ3hRWUlJZXlVbmtDMU1rWURNd0cwWkF4bk9YbnRw?=
 =?utf-8?B?K1haeVE3eGRnNGlwdTFGdWFWNWt3bmh5Y2ZuTWZ2QWZtMkY0ODRIeU4zbStu?=
 =?utf-8?Q?XNbmkjn0p90sIEUT4Da5ITE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3111d7d0-b28c-4246-e982-08d9ed6f3a42
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 15:00:22.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZ+nbcIUZu4VpkndB4WnZLkzgixmnw2XJ9wulrAeIP4+jHp46iumgS6Gc9dCYhWVWWecnm3hDQ1svfPZtZnc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram and Jean,

On 2/11/22 08:42, Wolfram Sang wrote:
>>> +		if (retval)
>>
>> Missing curly brace here, breaks the build.
> 
> Bummer, need to check why this wasn't found by my build-testing.
> 
> I fixed it up and also rebased patch 6 to my change. Terry, please have
> a look that I did everything correctly once I push out later today.
> 
> Thanks everyone!
> 
I need to look at how I sent that out. I will look for the fix in 
i2c/for-next. Thanks for the help and review. 
