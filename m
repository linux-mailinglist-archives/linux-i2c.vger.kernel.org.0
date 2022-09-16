Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033515BB1B2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 19:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIPRic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 13:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiIPRib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 13:38:31 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE14B6017;
        Fri, 16 Sep 2022 10:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7nRAiufxKZ3muP3E/RLjsqMzmw+spbWNzncvEnztIL5X5GqkFvtkVFw1B0ckvUmpVnQkhU0e+RYmaOQJnPoWVmVjqoqK3NWDe35VQs1Qz65dY7yHp3+yqL/JqgDg62HIfHXWEPONqpOReBaLuZSZVrQ7Wy6LguTJxkOoyLLAFnWvz2iLqJ8hRrH0O7OyQmDETNq7jOnebPfTLaNZPKr+Xw1J9/s7kDzSvY4Iupohkpi/Rj9bOmKfhQf4TizQzqWt2IAL15+97rWBAihPUWBmU+4Pg0pgCPApsXpct11p86SUbPUZviyQzFTcByLRvc6HiSU3jo09MfFddaLGhf5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FElgN1ADodAc2VRbPLCGPv/jk7EWqyugcOfjVGzayw4=;
 b=Yt0AaR6YjLJPDy8oT3afXbfG3HP655wStIFRvImiKIi53Meq934cD+c+z8pTVPTguwlXGHCpchXabrdNPWZ0A+fyz4Sd24twvtqON58UDXWerrestgP3XdtIsDs81vgiPnFZvi1hVqPF5vhg/p+LXfiOQ21d8u9nKhkB3x8gR+20iglybYHrnictIeFu6pB5rlweD0pXY75vcK80g68OyzP7HvKEDC7ymyXRGLuHrUzLLzPWEXp9RFduLnpLLHXnDH+GlcCNnCALzCiPQ+J5CnbmtWwILasxIo6fdz62v105JVue/fbZVkmpSdEr2ztd6PvwAJUUQLggNcSGSEDoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FElgN1ADodAc2VRbPLCGPv/jk7EWqyugcOfjVGzayw4=;
 b=IpSsWaWuHrZs7Wm/G21QyulK6QREIVQLIqfLQVDE3pT01VKxXdwFHCSULHPJzBqwZ5wUM1OQVGPReST2rYDOnNmmc3/rIkJRZK/5XDFVf2ugTfOx+ZtMkNrcric4rfPJgc5kZ943a+hJsJRc5oY2NYwVn/bLB8dANx8PbxnOg3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6235.namprd12.prod.outlook.com (2603:10b6:208:3e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 17:38:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c%7]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 17:38:27 +0000
Message-ID: <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
Date:   Fri, 16 Sep 2022 12:38:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Borislav Petkov <bp@suse.de>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220916131854.687371-2-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: f53de364-c8ed-4c55-64ee-08da980a4363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbT9LeBbIN2R8mbSdseXWyNZGErlwdmndRi9bvkEtK2L5JeMZkDx2YLCzd6f/QS4ZdzN16Cp3e0/6hiZ1ADjGmc1ea+aZCuwgTPtLpGKk0OkMEpn83umACjRwev2gLKBfa6q1WZSw0CnfgG/M6H+hhsfThlVeNjmff22i9WGoqxvtp/C+L9JjmqExiuUuC15GI1C3HU4Ctwx0QrAaC/o6SbDXl8FHbAN2BGpZeKpMGubN4Q/OqDSw2NGgYFDm4/+q7VacMzNVkrgk3KwaloCxDXKxC4lUJ25tHfYEudvoRat8DFu884BXMY2AVf/p2GfII/k1GWdSdwI+ivie3UqQlmO1s7ifvLIHab95gGqwwN/DmhQ6t7Egbpj2/tMfAUqdpdWnOdaLBcCPJryqoxSKsRuyqLgm9A+1t91xwGwoinHnVTpFA64rgcT193B8UceJZFAdtLeEdShpBTvGhZzeU0bPW9QH5TkhRyPtkiW/Ol3cyyFbnELi4NJmiCMsjy34Q8d3TUTejIvNYymEIFps1SfmufEM87Og1UtLhChW9cPzoXxm5naw7OFtsZeYq+qHigAVd8L4oJyi5ntKpiYRPAivX59fXE6YsIHjddPIdo81ctKuXONh+a+kHBZgwvtO0C6dG/HcvkGVwFrX9Au6DdwO2wx2dn9uC2EmLBOwTJVfVHvE6zHrc7veynLOIy6WV1FRAGQ5N5P7U5zRj1FAFhcml89ZnqSs9ZMh5DJpiNEq2/30OOENHVko6KNEkXIwkJVQmeanBrd/fEZAQBWggV7djVUFfeAcVJN0MVjQSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199015)(316002)(8676002)(4326008)(38100700002)(5660300002)(36756003)(66556008)(30864003)(31696002)(86362001)(2906002)(66476007)(66946007)(8936002)(6512007)(41300700001)(2616005)(54906003)(186003)(478600001)(6506007)(53546011)(26005)(6486002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVydFRPYXQ2KzhsT1pkMDVoL2kxT1B4VHBNaGFldXVMVHFGblR5YmtnTS9J?=
 =?utf-8?B?YVBNMmRSd1pvUHoyeTFtUGEzaE5mVlVud3BKdmwwVUxjc3BkUHMvUEdVSUNa?=
 =?utf-8?B?L1AvQktVSTUxMEJsYkpueGpxYTdEc0pBT3oxdHhibVlzUzlKOFVIbk1qQjZW?=
 =?utf-8?B?cklyOXJYWjJ6eUJadHRVVzFxT001SVBiV1lIaHphcnoxMWpCanBJZy93emhU?=
 =?utf-8?B?WlBCZHFyaG9uQUk4ckE4YkJqM21lRkVaRmxqVVJyYWtRNkZ6bnFuT0JIY0N4?=
 =?utf-8?B?MFN5bDdFZE1VS2o3eGc2bzlsV1NKSVRyUVVrREVRV2QzK1BWUGJjN1NQRFhl?=
 =?utf-8?B?SWRwb2VDNlEzUDVtWGhjYjRDRzMycERhcTBCOUpCSThvZkRYdnlZK2UvL0g1?=
 =?utf-8?B?NDNsaWltaTg4WFo0SmdRWExkUWtmeDRuclVwcG0rZ1hDRHBMVkplV1RESWdt?=
 =?utf-8?B?WHczalRTR0x3UCtvVHNoU2gzNmZMSmo2Z2c2TFlwUys2SkprZmhXSGhYc2N0?=
 =?utf-8?B?aTdkNHF5NFVRNW95bllURlFoYjBsTHV2RGpHTXA2bTBSZ3h1RFZscnp6TUtu?=
 =?utf-8?B?UE42VzlIZXdpZEpLTU5uUlVyWlh3bXN5Nkcvclk5bkE5N0xUN2FmU243aXRD?=
 =?utf-8?B?cGxReW51L2ZxbE5VWmMyNFZUWEg2MU42NGJPOThnSUtLNWo1MjRHdHNOZnA0?=
 =?utf-8?B?ZWZ6Vnl4RmNhUmlZaHNzUXpHY2RnZlRXVC9DMUxvblVjZUtObVlucWpZR08v?=
 =?utf-8?B?L3hKUytaWFZvSTQwMlc1TnhwUzdEc3p1SXBTZndBRFdMVk5QVzVNWmR0UE9q?=
 =?utf-8?B?bDRYcGlsOGxpV3UrR1FhSGViWUphZkhOMXFtVXFOYjE4by96ZGZqclB4M25r?=
 =?utf-8?B?cUo2ZTlIYVdxT084VWs2TnVKaldFV2RPL2ZSY0tmeVIyWFNkd2NkRXZSdEl0?=
 =?utf-8?B?VDAyM3dlU0JPSjBCUVZFY21GSWQvNnV5eWp0RlZRU3pVQzRISGU0amRlUFBP?=
 =?utf-8?B?SEFKZ3g2VUd0UXJrbUE4K2xLeW94Q010S1UyZTF2U2x0d0RCaGUvcmVQMVpR?=
 =?utf-8?B?SU9qTUdRRXZpbkxOOC9BYUFmeDkwQTc2WFg4RHpMTDVBN3BNdFB5VU9TeWcr?=
 =?utf-8?B?SFVrSStHUDUwYUY2Zi8xd044dmtiQUVIMCt2bkxYK0dkVmszNmFib2pxOExy?=
 =?utf-8?B?SEVYMXpmRWV3R1kwZithbFNlVjM0Q2s1MHBHSk05ckZ1eU9FaW9TNS9sRWxK?=
 =?utf-8?B?T0F5aGxJUllJUEcvenFlME94TUVIRVBIVGpqOUdXdlVTSVEyMnNXME42b3NT?=
 =?utf-8?B?bVFPY092UC9BOFAwanVudkhGcXY0R3IwYkIyZWZxWHhrNUh4NnNCYThWRXE5?=
 =?utf-8?B?WW1qWUlha3ZrbUV0ZTc5UU9BaGd0VFBKM3lFS3FhTC96U3Nsa1JUb011UkF6?=
 =?utf-8?B?VWtkczQ1LzlZWEQxaTNldXBwa2tENUZhL2pwMkh5V21XZy9CekkvVGFycURn?=
 =?utf-8?B?QXhOaW1reCthSytWMkk2SEJYQldIQ0x3NDVQb0lxNFh5dmlXN20rL252VVkx?=
 =?utf-8?B?ekFzOTFucDh6RHJiZjNGTkgrU2NzQiszV0pFZmxKTnk4QWhVbkRsQTYrNmF6?=
 =?utf-8?B?dFVneWlES3pCVkxRTGVBM2EyaXI4VTlUWUtYa29qcG9aWHl0L3NtbkdQNVhr?=
 =?utf-8?B?WGF0SmE4b1BncUFacG1kd1p3VkVRRTdjNll3dTF1eVJQZVRzL2VOaGZpTEQr?=
 =?utf-8?B?dTVJQTNJMTUyajJaaGZXNGlaVTJ1bDgwNDBiRGFndVY4VXdMcjU1Tk5Xd2c0?=
 =?utf-8?B?cVNjUC95Y2p3MmtVNVMxZ0MrSHRiL01HaUtBcDRVQ3pEeTZaSkZGUytEeUlT?=
 =?utf-8?B?b1E0YzBCQXVjMHZ4N3hXeXNkbXlkNnk2RXczZVArYjREUG9Pa1dJSDRsUjV5?=
 =?utf-8?B?Y3FlR2NUaEtSazhzUXhTTm1LWis0Zno4bjNPYWRmZGJ4eTBYQTloTFdYZE9D?=
 =?utf-8?B?YWZIUFZkZXN2OXFQTFg4OWNzbWNndGpVRkpKN084eXJOaWdhUnltMkdYMERF?=
 =?utf-8?B?Y3J0R1ZCaC9Eb244VTVpblNOOVpKWTFTMUFNZklYd1o0UEp0WjJKY1g5TDB0?=
 =?utf-8?Q?4tUB/YTL7Jh/BmpbLer4AeMIa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53de364-c8ed-4c55-64ee-08da980a4363
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 17:38:27.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K53EuHsnHBIavwmy46EZJYGtOIHP/tUJaCsaPT09Qy/+fshZ/wF67rOjqaAnU5gVWvHY4fJ6fHSI+RknhRAP5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6235
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ the people who signed off on that original commit that is essentially 
unreverted.

Comments below.

On 9/16/2022 08:18, Jan Dabros wrote:
> Due to a change in silicon compared to Cezanne, in future revisions MSR
> access can't be used to get the base address of the PSP MMIO region that
> contains the PSP mailbox interface.
> 
> Modify driver to use SMN access also for Cezanne platforms (it is
> working there) in order to simplify codebase when adding support for new
> SoC versions.
> 
> Export amd_cache_northbridges() which was unexported by
> 
> e1907d3: "x86/amd_nb: Unexport amd_cache_northbridges()"
> 
> since function which registers i2c-designware-platdrv is a
> subsys_initcall that is executed before fs_initcall (when enumeration of
> NB descriptors occurs). Thus in order to use SMN accesses it's necessary
> to explicitly call amd_cache_northrbidges() from within this driver.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>   arch/x86/include/asm/amd_nb.h               |   1 +
>   arch/x86/kernel/amd_nb.c                    |   3 +-
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 112 +++++++++++---------
>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>   5 files changed, 66 insertions(+), 52 deletions(-)
> 
> diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.h
> index ed0eaf65c437..00d1a400b7a1 100644
> --- a/arch/x86/include/asm/amd_nb.h
> +++ b/arch/x86/include/asm/amd_nb.h
> @@ -16,6 +16,7 @@ extern const struct amd_nb_bus_dev_range amd_nb_bus_dev_ranges[];
>   
>   extern bool early_is_amd_nb(u32 value);
>   extern struct resource *amd_get_mmconfig_range(struct resource *res);
> +extern int amd_cache_northbridges(void);
>   extern void amd_flush_garts(void);
>   extern int amd_numa_init(void);
>   extern int amd_get_subcaches(int);
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 4266b64631a4..2077b6cfa8ad 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -201,7 +201,7 @@ int amd_smn_write(u16 node, u32 address, u32 value)
>   EXPORT_SYMBOL_GPL(amd_smn_write);
>   
>   
> -static int amd_cache_northbridges(void)
> +int amd_cache_northbridges(void)
>   {
>   	const struct pci_device_id *misc_ids = amd_nb_misc_ids;
>   	const struct pci_device_id *link_ids = amd_nb_link_ids;
> @@ -303,6 +303,7 @@ static int amd_cache_northbridges(void)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(amd_cache_northbridges);
>   

I feel changes to amd_nb.c/amd_nb.h should stand on their own patch in 
the series rather than being in this patch.

>   /*
>    * Ignores subdevice/subvendor but as far as I can figure out
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 8f36167bce62..1d467fc83f59 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -8,12 +8,11 @@
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> +#include <asm/amd_nb.h>
>   #include <asm/msr.h>
>   
>   #include "i2c-designware-core.h"
>   
> -#define MSR_AMD_PSP_ADDR	0xc00110a2
> -#define PSP_MBOX_OFFSET		0x10570
>   #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
>   
>   #define PSP_I2C_RESERVATION_TIME_MS 100
> @@ -31,6 +30,10 @@
>   #define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
>   #define PSP_MBOX_FIELDS_READY		BIT(31)
>   
> +#define PSP_MBOX_CMD_OFFSET		0x3810570
> +#define PSP_MBOX_BUFFER_L_OFFSET	0x3810574
> +#define PSP_MBOX_BUFFER_H_OFFSET	0x3810578
> +

Just in case these offsets change for a future program, I think you 
should leave a comment here on the two APU programs they're valid for in 
case you need to special case it later.

Another approach is that you can have a lookup function and match some 
PCI device like the root device or the CPUID and then when another 
program comes along explicitly add it to this list.

This is what is done in drivers/platform/x86/amd/pmc.c for example.

>   struct psp_req_buffer_hdr {
>   	u32 total_size;
>   	u32 status;
> @@ -47,14 +50,8 @@ struct psp_i2c_req {
>   	enum psp_i2c_req_type type;
>   };
>   
> -struct psp_mbox {
> -	u32 cmd_fields;
> -	u64 i2c_req_addr;
> -} __packed;
> -
>   static DEFINE_MUTEX(psp_i2c_access_mutex);
>   static unsigned long psp_i2c_sem_acquired;
> -static void __iomem *mbox_iomem;
>   static u32 psp_i2c_access_count;
>   static bool psp_i2c_mbox_fail;
>   static struct device *psp_i2c_dev;
> @@ -64,47 +61,43 @@ static struct device *psp_i2c_dev;
>    * family of SoCs.
>    */
>   
> -static int psp_get_mbox_addr(unsigned long *mbox_addr)
> +static int psp_mbox_probe(void)
>   {
> -	unsigned long long psp_mmio;
> -
> -	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> -		return -EIO;
> -
> -	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> -
> -	return 0;
> +	/*
> +	 * Explicitly initialize system management network interface here, since
> +	 * usual init happens only after PCI subsystem is ready. This is too late
> +	 * for I2C controller driver which may be executed earlier.
> +	 */
> +	return amd_cache_northbridges();

When a future program is added even if SMN addresses are the same and no 
special casing needed there is an implicit dependency on the PCI IDs 
being in arch/x86/kernel/amd_nb.c now.  In order to make your life 
easier to debug in the future, suggest that you capture the return 
variable and emit a specific error message if amd_cache_northbridges() 
fails.

>   }
>   
> -static int psp_mbox_probe(void)
> +static int psp_smn_write(u32 smn_addr, u32 value)
>   {
> -	unsigned long mbox_addr;
> -	int ret;
> -
> -	ret = psp_get_mbox_addr(&mbox_addr);
> -	if (ret)
> -		return ret;
> -
> -	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> -	if (!mbox_iomem)
> -		return -ENOMEM;
> +	return amd_smn_write(0, smn_addr, value);
> +}
>   
> -	return 0;
> +static int psp_smn_read(u32 smn_addr, u32 *value)
> +{
> +	return amd_smn_read(0, smn_addr, value);
>   }
>   
>   /* Recovery field should be equal 0 to start sending commands */
> -static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
> +static int psp_check_mbox_recovery(void)
>   {
>   	u32 tmp;
> +	int status;
>   
> -	tmp = readl(&mbox->cmd_fields);
> +	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &tmp);
> +	if (status)
> +		return status;
>   
>   	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
>   }
>   
> -static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> +static int psp_wait_cmd(void)
>   {
>   	u32 tmp, expected;
> +	int ret, status;
>   
>   	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
>   	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> @@ -113,30 +106,55 @@ static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
>   	 * Check for readiness of PSP mailbox in a tight loop in order to
>   	 * process further as soon as command was consumed.
>   	 */
> -	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
> -				  0, PSP_CMD_TIMEOUT_US);
> +	ret = read_poll_timeout(psp_smn_read, status,
> +				(status < 0) || (tmp == expected), 0,
> +				PSP_CMD_TIMEOUT_US, 0, PSP_MBOX_CMD_OFFSET,
> +				&tmp);
> +	if (status)
> +		ret = status;
> +
> +	return ret;
>   }
>   
>   /* Status equal to 0 means that PSP succeed processing command */
> -static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
> +static int psp_check_mbox_sts(void)
>   {
>   	u32 cmd_reg;
> +	int status;
>   
> -	cmd_reg = readl(&mbox->cmd_fields);
> +	status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &cmd_reg);
> +	if (status)
> +		return status;
>   
>   	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
>   }
>   
> +static int psp_wr_mbox_buffer(phys_addr_t buf)
> +{
> +	u32 buf_addr_h = upper_32_bits(buf);
> +	u32 buf_addr_l = lower_32_bits(buf);
> +	int status;
> +
> +	status = psp_smn_write(PSP_MBOX_BUFFER_H_OFFSET, buf_addr_h);
> +	if (status)
> +		return status;
> +
> +	status = psp_smn_write(PSP_MBOX_BUFFER_L_OFFSET, buf_addr_l);
> +	if (status)
> +		return status;
> +
> +	return 0;
> +}
> +
>   static int psp_send_cmd(struct psp_i2c_req *req)
>   {
> -	struct psp_mbox __iomem *mbox = mbox_iomem;
>   	phys_addr_t req_addr;
>   	u32 cmd_reg;
>   
> -	if (psp_check_mbox_recovery(mbox))
> +	if (psp_check_mbox_recovery())
>   		return -EIO;
>   
> -	if (psp_wait_cmd(mbox))
> +	if (psp_wait_cmd())
>   		return -EBUSY;
>   
>   	/*
> @@ -145,16 +163,18 @@ static int psp_send_cmd(struct psp_i2c_req *req)
>   	 * PSP. Use physical address of buffer, since PSP will map this region.
>   	 */
>   	req_addr = __psp_pa((void *)req);
> -	writeq(req_addr, &mbox->i2c_req_addr);
> +	if (psp_wr_mbox_buffer(req_addr))
> +		return -EIO;
>   
>   	/* Write command register to trigger processing */
>   	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
> -	writel(cmd_reg, &mbox->cmd_fields);
> +	if (psp_smn_write(PSP_MBOX_CMD_OFFSET, cmd_reg))
> +		return -EIO;
>   
> -	if (psp_wait_cmd(mbox))
> +	if (psp_wait_cmd())
>   		return -ETIMEDOUT;
>   
> -	if (psp_check_mbox_sts(mbox))
> +	if (psp_check_mbox_sts())
>   		return -EIO;
>   
>   	return 0;
> @@ -417,9 +437,3 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>   
>   	return 0;
>   }
> -
> -/* Unmap area used as a mailbox with PSP */
> -void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> -{
> -	iounmap(mbox_iomem);
> -}
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 70b80e710990..80dad6c8f321 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -382,7 +382,6 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
>   
>   #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
>   int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> -void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>   #endif
>   
>   int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ba043b547393..99f54fe583e1 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -214,7 +214,6 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
>   #ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
>   	{
>   		.probe = i2c_dw_amdpsp_probe_lock_support,
> -		.remove = i2c_dw_amdpsp_remove_lock_support,
>   	},
>   #endif
>   	{}

