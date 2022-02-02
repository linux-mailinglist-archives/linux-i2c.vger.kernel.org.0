Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB5B4A7B4B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 23:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347870AbiBBWtq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 17:49:46 -0500
Received: from mail-dm6nam08on2075.outbound.protection.outlook.com ([40.107.102.75]:43840
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231298AbiBBWtp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 17:49:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAQM1WuHLg0bhcgLb90sDJBnwff4RPCfh1ERfembL5U/X3ibzKlVYHl3pjOnj8u3V7O7/ffMgUSqM2lFQfH1DpmLkgpIXCjZpvMBEJpjeybJN8WDVXylav3XKpf7rJ/i7n5XNv+oax97kiELeDpzp0I1MFWcXYZ/8fnwwoAIQB77Us3/8YaKltrVzWyl5GFnY0i3B6hU5FAuOiJu+jZL+ePsWTnw4HMKxlXuZoIjh75pGN9F5mxVnEn/vO6H4KeXEHr+EiFB/4ieVHTx0V1ZxPHvrrQ51dJF13Yez0lzcZc22rIYoprz7PFK4IZFPdiJkvOGDJT0eKJsE02Oibojsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CndCLKxsj7RYNltwYKcT3DkZM2OgA7b+tXPlr3rpkI=;
 b=I9KV4EADcsLCCek6ZxLZnsuYJuLpPY2KTQJ88uQMbYZvaBuuV9h7fQaSb5/f/NHa2jtC0OXwrVb8Ie7GxJD+i3VhuhD28CZY183ha0bI6NFfqX9kkXlzULzWGhwF3/usEfL29dSUcmxtJzqOWhMXIAGmevakYjkiA80wl81TQfctilRjwWeYv2LVsxcpJK2mfePsoEY1GZg5kX/h0ttNlYipXKfRLv3hZJ6VawI4bRkkeIX9aA3VwJiEa4Xf6Qf0pD+UPyGASVjeAzSDHfhvSIwu06b2ah/8qBYqx5P/U1OAUjA+as557dmpjNYK3cj/LGYxWbwj0dPDn3gPS8oFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CndCLKxsj7RYNltwYKcT3DkZM2OgA7b+tXPlr3rpkI=;
 b=mS86SuPwAqB6X1V05efJWp7g5FQtLLmENDKmxwNd5HVmOhM9m2gFv3jRiMi/Zinn/8mQ9IpcbQh0ci5jOgbvGFaoa5oc1Q6Y5qs9SISwoH/uY8y+fVn73LFUHNSPJMz/z2UMNmZbkhrSDdMTLRHEc/9gAucTbQgF1c17vQn/3ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM5PR1201MB0251.namprd12.prod.outlook.com (2603:10b6:4:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 22:49:43 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 22:49:43 +0000
Message-ID: <724bbaef-8ee5-0904-d871-750643b4ff89@amd.com>
Date:   Wed, 2 Feb 2022 16:49:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220202144302.1438303-2-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:2d::14) To BL1PR12MB5157.namprd12.prod.outlook.com
 (2603:10b6:208:308::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97e9db4c-3850-4bfc-2d69-08d9e69e4d8b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0251:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0251DF08AD2288F04FD013FDE2279@DM5PR1201MB0251.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyHBIBChlQoVDV53jSyDWaXZxU4klRsJwCXYT/94Co43TqaJdwQtIFqxvr5isEiBYNjkqFxhunoYFKs/nX8rbmanIoZrIqQ4CWgJqls1lo+0b4+JtFJklj2/66/vmL3IzCPOEXXY3mY5408GTV9Bi33bOvHCbbrHGv4PhiiJyA2JxBb5Q37rdWujHke+6JzEWDElkYWtkIqXnOd+lqr0iO6r4GroHIcP8VDLBse2tiJ+wo3a3Kb15BJM6VYaEujuQQ/u5756L3kvA5Zm6BEwmOWkSnzUACey23g5VOKdCujdeAueHFDKm2/rCQWtkUR8g6aN365kkBRu26q+i0idpZSrluWf9aNNcbq9zUBlilmL9IxwbryVAFEHaQTc6XLnkEv2ghK3ChZBiTZRQ8Nc/oaaEVLy3x7AJ2uLkGJOuASJVxJoXvS5hc0ZKjAiBBrhZdMMgZ8blZBSXkMBq9ZFqO4yvkZyu505T1HUzDdxqbIjUcCWzUPcnA5Aq0VLm+Kg3zhrc5qzK2DbxmNPaIooYIByWFmW0p6bo60rj0xGOuQkD1qlPDow1WYdRenfLAoPd3OW48rRQkdo5E29dwtZHk6KD2LZKgVenrD94c93DmDNaXkbMZBs/cUaIxvAL5pHm03JQ9wv7M+asZz6hzZBGZFaEWkpHdMDYvs7BxicLgtMAW/UtFjt01xTeULwwYafwubdK4c52S5qYDH35YFqVz8KoPXMAaH6xZLWuWaE1yJB7FvnZpJBUYurnBEhNsJb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(30864003)(38100700002)(66946007)(66476007)(31696002)(316002)(8676002)(36756003)(66556008)(31686004)(86362001)(4326008)(6486002)(508600001)(6506007)(53546011)(186003)(26005)(5660300002)(7416002)(83380400001)(6512007)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZJb0ZuYnJON01Qem9nTUFKeWh0aExseGw5WFlXT0U4RHBabDFSSFhHMFpi?=
 =?utf-8?B?eXA0VUFiK2xiSlR2T2dLSk9qSTJZT2VYUjY2UFR6a0hpcHR4SnFtMDV5aXNi?=
 =?utf-8?B?ZnBIWlBNeUN3MkpxUXg5b1NmVS9EQlhYT0xkcVF1Y1hLWDVxQk0reUVEWFUr?=
 =?utf-8?B?ekw0a2Fob2wxakRCSUtPbTV0QllJVXFoTWlaUk5WL2JqRDlJYStiU3RKVTlI?=
 =?utf-8?B?UTRHbFRBTlJYa1hKTld3WTlYYlpTbklUR25XWEhTMUFjb0tjMXBpaXJ1Z05u?=
 =?utf-8?B?cVJ5QWJlSG9mTWwrRVNIYlFibFcvNGhlVnkrT0plWEtEaEo0OG5TelpnMFBz?=
 =?utf-8?B?cXo4MkZxZVBvU0xRdVRiUkdVOXlFQVJRZXJCZnRNbFVwYUtrUjVZNHJPR2to?=
 =?utf-8?B?MjJlMUd6M3ZaRml1b1dvZUhQdGNXWHNiU0s2VnRQTjBqZkdlZVRWVkhwVytZ?=
 =?utf-8?B?RklJcUN2Ky9UTDl4d3lWSDgwT1RiZDVvWjhBbGxSMWNFbDQ2Ty9HV0UrbndQ?=
 =?utf-8?B?Zi9rWFpZZDJsVjBuVk1FSVBhbS9yaGV2SGx0YkxjSjZ2cVhuMGRoSXZJL2Vy?=
 =?utf-8?B?eHl0WjkwYnl1ZGxGb2dQeGw3NW9BL3FwZlFxUUVkRWJHa0VpbTdKeldjWE9k?=
 =?utf-8?B?L3JLVHlGV0VGNENHYVplL21KUjE4OVZxR3ZxN0o3RDBjMTIxa0hrZS9Id25U?=
 =?utf-8?B?NUpGNGJmU0FqaTBLemJXNmRzN3JPeE80MHJSZEhKZFN3RFUxdnViK3h0bVpH?=
 =?utf-8?B?eWM0b1k5WVAyVWI5QlhOeG1zQ05PN2xqRENjNnNZU1lZeHBwT3U3c2xRdkJr?=
 =?utf-8?B?TEIvUGpZWVlxREpmZGZxa1EzelZFeWI5ZGZVOWQzZFNnQThGeFBkUm5jQkF5?=
 =?utf-8?B?VnJIWmhwa3R4TDhlM3RkUmVCZDhEaDkzS2hPRW96aTN0Sjh2R3VTWlFjYzc3?=
 =?utf-8?B?UXY1ZTdLTlZXZXhHMHFVemtIRWxFUkNuTjE2Ym9uZU5lOUQ3QVBqT2Vxc2h0?=
 =?utf-8?B?dEFwNWtscCt6a3hLRGFaVlltTWtGOHZMY3JORmRBMEdlZDQ5ek9FNWR1WTQ5?=
 =?utf-8?B?emsyV0tqZFJPbVN3M0YrakppNTBDVXpndFpVcG10Q3NDaHBpVVFGVkNxMDMy?=
 =?utf-8?B?MC8zaHRtZ3pVVktuejBsWTBISThGbWhIMXRxM2pFc1ZVcHdWdTIwZ2ZZSUhy?=
 =?utf-8?B?TjV6YTVmWkc4WWJoTkY0cUU3am96SERWR3Z1UFh2UTFZcTM5U21DdkFmRm44?=
 =?utf-8?B?WXAxdjBpa3VPc3hkTEN0RjYvcmxySTNzTDBGNTZ5b1ExWlV5YVdRNER1L3ha?=
 =?utf-8?B?SE5UR0FEdEl0TDJTRzRHV3dPUEJzOFZPcUV0ZmhuNFl1cGsxNEJqRWlpbTRh?=
 =?utf-8?B?Wjd3WEtrZ1NyQWJhZlBBNmdQTGhXVmNjK3ZkRkttZzFGN05LVHp4OE0vcjdY?=
 =?utf-8?B?M2IyTXUwb1ZtZUtubUY1ZVliZlUzTUZwWCtLcTlXSE9sQk9ZVytsTUpmM0hE?=
 =?utf-8?B?aGpMbjdiUytBTFJ6QXU4bjNvcXdXQ0NTMk9MZms2NFBtQndCVFhlNWtBaklt?=
 =?utf-8?B?ZlJURnhKRndlVk9xMVh5STBoWkV0UkxqV0N1NXBkT0REWWsrakxoOVAzb0Zn?=
 =?utf-8?B?WTFmTVRkcFlrNUxKK3FPTEFZeG15K2ExRmwyUll6UlNqaW1TUEFPSmJwZDVy?=
 =?utf-8?B?TUwxZ3pDODZVNWhnLy9PdUtodVRqUi9NQXZnVHBtUUs2bUhiOWJ3WTQxWnRB?=
 =?utf-8?B?UXV2S2hKUC9RWTAxYWZTcEgvZVQ0eVczaTFkVitPMVd6dG5ZeVhZNnJWSlBM?=
 =?utf-8?B?d0pZejV6SGd1Sm5lYjQ5LzNRSzNTb3BaL3gySUhvWmlYekN3dXJLbVNKSDRQ?=
 =?utf-8?B?aTh0MVFOTVBib2lrQ0owOFNnMzFxOStxaUd6WFpFTEp1TUJ5ZTY4c0t0VHZX?=
 =?utf-8?B?WTFXNlhUaVU3M0lUeWhSb1dkS2NiS3kzRlJoM3JnS3NLWnJoaDFnbVB5QkQz?=
 =?utf-8?B?RHY2ZHlMZEZGT1I1VFZudWNJZmlVNkF0aVg2R3lrN2FlckpYTytCTm5qOEZS?=
 =?utf-8?B?a3VEdnM1d2prQmlvMW5waTk5ZFhNdVFiYzRseXRVK3VHOTUvajRCZ1BNWHZ3?=
 =?utf-8?B?cTZBWXZDYkZzZmhxY3BUQm11MFdvV3lEbWxZUlVYWllEQ0tKR3c5VHo4ME9U?=
 =?utf-8?Q?UkC66nZH/Be7rvfa89Lmywg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e9db4c-3850-4bfc-2d69-08d9e69e4d8b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 22:49:43.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNy1q5aZNHKJyImIeUVeb8q6VSXjSdqlW0CP2nbcvhhYbcrrqJk29G8oa8zniE/U+muDSM/b6VatJGft+9H0ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0251
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/2/2022 08:43, Jan Dabros wrote:
> Implement an I2C controller sharing mechanism between the host (kernel)
> and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> 
> On these platforms we need to implement "software" i2c arbitration.
> Default arbitration owner is PSP and kernel asks for acquire as well
> as inform about release of the i2c bus via mailbox mechanism.
> 
>              +---------+
>   <- ACQUIRE |         |
>    +---------|   CPU   |\
>    |         |         | \      +----------+  SDA
>    |         +---------+  \     |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>    |         +---------+        |          |-------
>    |         |         |        +----------+
>    +---------|   PSP   |
>     <- ACK   |         |
>              +---------+
> 
>              +---------+
>   <- RELEASE |         |
>    +---------|   CPU   |
>    |         |         |        +----------+  SDA
>    |         +---------+        |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>    |         +---------+  /     |          |-------
>    |         |         | /      +----------+
>    +---------|   PSP   |/
>     <- ACK   |         |
>              +---------+
> 
> The solution is similar to i2c-designware-baytrail.c implementation, where
> we are using a generic i2c-designware-* driver with a small "wrapper".
> 
> In contrary to baytrail semaphore implementation, beside internal
> acquire_lock() and release_lock() methods we are also applying quirks to
> lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus
> is shared with another entity.
> 
> Modify i2c_dw_probe_lock_support() to select correct semaphore
> implementation at runtime, since now we have more than one available.
> 
> Configure new matching ACPI ID "AMDI0019" and register
> ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> arbitration.
> 
> Add myself as a reviewer for I2C DesignWare in order to help with reviewing
> and testing possible changes touching new i2c-designware-amdpsp.c module.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   MAINTAINERS                                  |   1 +
>   drivers/acpi/acpi_apd.c                      |   7 +-
>   drivers/i2c/busses/Kconfig                   |  11 +
>   drivers/i2c/busses/Makefile                  |   1 +
>   drivers/i2c/busses/i2c-designware-amdpsp.c   | 389 +++++++++++++++++++
>   drivers/i2c/busses/i2c-designware-baytrail.c |  12 +-
>   drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>   drivers/i2c/busses/i2c-designware-platdrv.c  |  60 +++
>   8 files changed, 487 insertions(+), 12 deletions(-)
>   create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f41088418aae..e0a7e05c5a41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18666,6 +18666,7 @@ SYNOPSYS DESIGNWARE I2C DRIVER
>   M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
>   R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>   R:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +R:	Jan Dabros <jsd@semihalf.com>
>   L:	linux-i2c@vger.kernel.org
>   S:	Maintained
>   F:	drivers/i2c/busses/i2c-designware-*
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index e7934ba79b02..ad245bbd965e 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -232,12 +232,13 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
>   	/* Generic apd devices */
>   #ifdef CONFIG_X86_AMD_PLATFORM_DEVICE
>   	{ "AMD0010", APD_ADDR(cz_i2c_desc) },
> -	{ "AMDI0010", APD_ADDR(wt_i2c_desc) },
>   	{ "AMD0020", APD_ADDR(cz_uart_desc) },
> -	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
> -	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
>   	{ "AMD0030", },
>   	{ "AMD0040", APD_ADDR(fch_misc_desc)},
> +	{ "AMDI0010", APD_ADDR(wt_i2c_desc) },
> +	{ "AMDI0019", APD_ADDR(wt_i2c_desc) },

Did you already check with anyone in AMD about reserving this ID?

Considering this design is specific to arbitration used for Chromebooks 
I wonder if it is better to be GOOG ID?

I can see it both ways, but if you didn't already talk to anyone and the 
consensus is for it to be AMDI****, I will ask around internally about 
reserving it / making sure there are no future or existing conflicts.

> +	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
> +	{ "AMDI0022", APD_ADDR(cz_uart_desc) },
>   	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
>   #endif
>   #ifdef CONFIG_ARM64
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..5ea26a7aa1d5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -553,6 +553,17 @@ config I2C_DESIGNWARE_PLATFORM
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-designware-platform.
>   
> +config I2C_DESIGNWARE_AMDPSP
> +	bool "AMD PSP I2C semaphore support"
> +	depends on X86_MSR
> +	depends on ACPI
> +	depends on I2C_DESIGNWARE_PLATFORM
> +	help
> +	  This driver enables managed host access to the selected I2C bus shared
> +	  between AMD CPU and AMD PSP.
> +
> +	  You should say Y if running on an AMD system equipped with the PSP.
> +
>   config I2C_DESIGNWARE_BAYTRAIL
>   	bool "Intel Baytrail I2C semaphore support"
>   	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..752f47be3fc1 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -54,6 +54,7 @@ i2c-designware-core-y					+= i2c-designware-master.o
>   i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
>   obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>   i2c-designware-platform-y 				:= i2c-designware-platdrv.o
> +i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>   i2c-designware-pci-y					:= i2c-designware-pcidrv.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> new file mode 100644
> index 000000000000..a45e4faeb2c1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -0,0 +1,389 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/psp-sev.h>
> +#include <linux/types.h>
> +
> +#include <asm/msr.h>
> +
> +#include "i2c-designware-core.h"
> +
> +#define MSR_AMD_PSP_ADDR	0xc00110a2
> +#define PSP_MBOX_OFFSET		0x10570
> +#define PSP_CMD_TIMEOUT_MS	500
> +
> +#define PSP_I2C_REQ_BUS_CMD		0x64
> +#define PSP_I2C_REQ_RETRY_CNT		10
> +#define PSP_I2C_REQ_RETRY_DELAY_USEC	(50 * 1000)
> +#define PSP_I2C_REQ_STS_OK		0x0
> +#define PSP_I2C_REQ_STS_BUS_BUSY	0x1
> +#define PSP_I2C_REQ_STS_INV_PARAM	0x3
> +
> +#define PSP_MBOX_FIELDS_STS		GENMASK(15, 0)
> +#define PSP_MBOX_FIELDS_CMD		GENMASK(23, 16)
> +#define PSP_MBOX_FIELDS_RESERVED	GENMASK(29, 24)
> +#define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
> +#define PSP_MBOX_FIELDS_READY		BIT(31)
> +
> +struct psp_req_buffer_hdr {
> +	u32 total_size;
> +	u32 status;
> +};
> +
> +enum psp_i2c_req_type {
> +	PSP_I2C_REQ_ACQUIRE,
> +	PSP_I2C_REQ_RELEASE,
> +	PSP_I2C_REQ_MAX
> +};
> +
> +struct psp_i2c_req {
> +	struct psp_req_buffer_hdr hdr;
> +	enum psp_i2c_req_type type;
> +} __aligned(32);
> +
> +struct psp_mbox {
> +	u32 cmd_fields;
> +	u64 i2c_req_addr;
> +} __packed;
> +
> +static DEFINE_MUTEX(psp_i2c_access_mutex);
> +static unsigned long psp_i2c_sem_acquired;
> +static void __iomem *mbox_iomem;
> +static u32 psp_i2c_access_count;
> +static bool psp_i2c_mbox_fail;
> +static struct device *psp_i2c_dev;
> +
> +/*
> + * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD Cezanne
> + * family of SoCs.
> + */
> +
> +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> +{
> +	unsigned long long psp_mmio;
> +
> +	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> +		return -EIO;
> +
> +	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int psp_mbox_probe(void)
> +{
> +	unsigned long mbox_addr;
> +	int ret;
> +
> +	ret = psp_get_mbox_addr(&mbox_addr);
> +	if (ret)
> +		return ret;
> +
> +	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> +	if (!mbox_iomem)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +
> +/* Recovery field should be equal 0 to start sending commands */
> +static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(&mbox->cmd_fields);
> +
> +	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
> +}
> +
> +static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> +{
> +	u32 tmp, expected;
> +
> +	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
> +	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> +
> +	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
> +				  0, 1000 * PSP_CMD_TIMEOUT_MS);
> +}
> +
> +/* Status equal to 0 means that PSP succeed processing command */
> +static int psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
> +{
> +	u32 cmd_reg;
> +
> +	cmd_reg = readl(&mbox->cmd_fields);
> +
> +	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
> +}
> +
> +static int psp_send_cmd(struct psp_i2c_req *req)
> +{
> +	struct psp_mbox __iomem *mbox = mbox_iomem;
> +	phys_addr_t req_addr;
> +	u32 cmd_reg;
> +
> +	if (psp_check_mbox_recovery(mbox))
> +		return -EIO;
> +
> +	if (psp_wait_cmd(mbox))
> +		return -EBUSY;
> +
> +	/*
> +	 * Fill mailbox with address of command-response buffer, which will be
> +	 * used for sending i2c requests as well as reading status returned by
> +	 * PSP. Use physical address of buffer, since PSP will map this region.
> +	 */
> +	req_addr = __psp_pa((void *)req);
> +	writeq(req_addr, &mbox->i2c_req_addr);
> +
> +	/* Write command register to trigger processing */
> +	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
> +	writel(cmd_reg, &mbox->cmd_fields);
> +
> +	if (psp_wait_cmd(mbox))
> +		return -ETIMEDOUT;
> +
> +	if (psp_check_mbox_sts(mbox))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/* Helper to verify status returned by PSP */
> +static int check_i2c_req_sts(struct psp_i2c_req *req)
> +{
> +	int status;
> +
> +	status = readl(&req->hdr.status);
> +
> +	switch (status) {
> +	case PSP_I2C_REQ_STS_OK:
> +		return 0;
> +	case PSP_I2C_REQ_STS_BUS_BUSY:
> +		return -EBUSY;
> +	case PSP_I2C_REQ_STS_INV_PARAM:
> +	default:
> +		return -EIO;
> +	};
> +}
> +
> +static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> +{
> +	/*
> +	 * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
> +	 * 1. mailbox communication - PSP is not operational or some IO errors
> +	 * with basic communication had happened;
> +	 * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too
> +	 * long.
> +	 * In order to distinguish between these two in error handling code, all
> +	 * errors on the first level (returned by psp_send_cmd) are shadowed by
> +	 * -EIO.
> +	 */
> +	if (psp_send_cmd(req))
> +		return -EIO;
> +
> +	return check_i2c_req_sts(req);
> +}
> +
> +static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> +{
> +	struct psp_i2c_req *req;
> +	unsigned long start;
> +	int status, ret;
> +
> +	/* Allocate command-response buffer */
> +	req = kzalloc(sizeof(*req), GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	req->hdr.total_size = sizeof(*req);
> +	req->type = i2c_req_type;
> +
> +	start = jiffies;
> +	ret = read_poll_timeout(psp_send_check_i2c_req, status,
> +				(status != -EBUSY),
> +				PSP_I2C_REQ_RETRY_DELAY_USEC,
> +				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_USEC,
> +				0, req);
> +	if (ret)
> +		goto cleanup;
> +
> +	if (status) {
> +		ret = status;
> +		goto cleanup;
> +	}
> +
> +	dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
> +		jiffies_to_msecs(jiffies - start));
> +
> +cleanup:
> +	kfree(req);
> +	return ret;
> +}
> +
> +static int psp_acquire_i2c_bus(void)
> +{
> +	int status;
> +
> +	mutex_lock(&psp_i2c_access_mutex);
> +
> +	/* Return early if mailbox malfunctioned */
> +	if (psp_i2c_mbox_fail)
> +		goto cleanup;
> +
> +	/*
> +	 * Simply increment usage counter and return if PSP semaphore was
> +	 * already taken by kernel.
> +	 */
> +	if (psp_i2c_access_count > 0) {
> +		psp_i2c_access_count++;
> +		goto cleanup;
> +	};
> +
> +	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> +	if (status) {
> +		if (status == -ETIMEDOUT)
> +			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
> +		else
> +			dev_err(psp_i2c_dev, "PSP communication error\n");
> +
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +		goto cleanup;
> +	}
> +
> +	psp_i2c_sem_acquired = jiffies;
> +	psp_i2c_access_count++;
> +
> +	/*
> +	 * In case of errors with PSP arbitrator psp_i2c_mbox_fail variable is
> +	 * set above. As a consequence consecutive calls to acquire will bypass
> +	 * communication with PSP. At any case i2c bus is granted to the caller,
> +	 * thus always return success.
> +	 */
> +cleanup:
> +	mutex_unlock(&psp_i2c_access_mutex);
> +	return 0;
> +}
> +
> +static void psp_release_i2c_bus(void)
> +{
> +	int status;
> +
> +	mutex_lock(&psp_i2c_access_mutex);
> +
> +	/* Return early if mailbox was malfunctional */
> +	if (psp_i2c_mbox_fail)
> +		goto cleanup;
> +
> +	/*
> +	 * If we are last owner of PSP semaphore, need to release aribtration
> +	 * via mailbox.
> +	 */
> +	psp_i2c_access_count--;
> +	if (psp_i2c_access_count > 0)
> +		goto cleanup;
> +
> +	/* Send a release command to PSP */
> +	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> +	if (status) {
> +		if (status == -ETIMEDOUT)
> +			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
> +		else
> +			dev_err(psp_i2c_dev, "PSP communication error\n");
> +
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +		goto cleanup;
> +	}
> +
> +	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
> +		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
> +
> +cleanup:
> +	mutex_unlock(&psp_i2c_access_mutex);
> +}
> +
> +/*
> + * Locking methods are based on the default implementation from
> + * drivers/i2c/i2c-core-base.c, but with psp acquire and release operations
> + * added. With this in place we can ensure that i2c clients on the bus shared
> + * with psp are able to lock HW access to the bus for arbitrary number of
> + * operations - that is e.g. write-wait-read.
> + */
> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> +					unsigned int flags)
> +{
> +	psp_acquire_i2c_bus();
> +	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
> +}
> +
> +static int i2c_adapter_dw_psp_trylock_bus(struct i2c_adapter *adapter,
> +					  unsigned int flags)
> +{
> +	int ret;
> +
> +	ret = rt_mutex_trylock(&adapter->bus_lock);
> +	if (ret)
> +		return ret;
> +
> +	psp_acquire_i2c_bus();
> +
> +	return ret;
> +}
> +
> +static void i2c_adapter_dw_psp_unlock_bus(struct i2c_adapter *adapter,
> +					  unsigned int flags)
> +{
> +	psp_release_i2c_bus();
> +	rt_mutex_unlock(&adapter->bus_lock);
> +}
> +
> +static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
> +	.lock_bus = i2c_adapter_dw_psp_lock_bus,
> +	.trylock_bus = i2c_adapter_dw_psp_trylock_bus,
> +	.unlock_bus = i2c_adapter_dw_psp_unlock_bus,
> +};
> +
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +	int ret;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	if (!(dev->flags & ARBITRATION_SEMAPHORE))
> +		return -ENODEV;
> +
> +	/* Allow to bind only one instance of a driver */
> +	if (psp_i2c_dev)
> +		return -EEXIST;
> +
> +	psp_i2c_dev = dev->dev;
> +
> +	ret = psp_mbox_probe();
> +	if (ret)
> +		return ret;
> +
> +	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
> +
> +	/*
> +	 * Install global locking callbacks for adapter as well as internal i2c
> +	 * controller locks.
> +	 */
> +	dev->adapter.lock_ops = &i2c_dw_psp_lock_ops;
> +	dev->acquire_lock = psp_acquire_i2c_bus;
> +	dev->release_lock = psp_release_i2c_bus;
> +
> +	return 0;
> +}
> +
> +/* Unmap area used as a mailbox with PSP */
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +	iounmap(mbox_iomem);
> +}
> diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
> index c6a7a00e1d52..45774aa47c28 100644
> --- a/drivers/i2c/busses/i2c-designware-baytrail.c
> +++ b/drivers/i2c/busses/i2c-designware-baytrail.c
> @@ -12,25 +12,25 @@
>   
>   #include "i2c-designware-core.h"
>   
> -int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
>   {
>   	acpi_status status;
>   	unsigned long long shared_host = 0;
>   	acpi_handle handle;
>   
> -	if (!dev || !dev->dev)
> -		return 0;
> +	if (!dev)
> +		return -ENODEV;
>   
>   	handle = ACPI_HANDLE(dev->dev);
>   	if (!handle)
> -		return 0;
> +		return -ENODEV;
>   
>   	status = acpi_evaluate_integer(handle, "_SEM", NULL, &shared_host);
>   	if (ACPI_FAILURE(status))
> -		return 0;
> +		return -ENODEV;
>   
>   	if (!shared_host)
> -		return 0;
> +		return -ENODEV;
>   
>   	if (!iosf_mbi_available())
>   		return -EPROBE_DEFER;
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 4b26cba40139..1d65212fddbd 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -227,6 +227,8 @@ struct reset_control;
>    * @hs_lcnt: high speed LCNT value
>    * @acquire_lock: function to acquire a hardware lock on the bus
>    * @release_lock: function to release a hardware lock on the bus
> + * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
> + *	-1 if there is no semaphore.
>    * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
>    * @disable: function to disable the controller
>    * @disable_int: function to disable all interrupts
> @@ -285,6 +287,7 @@ struct dw_i2c_dev {
>   	u16			hs_lcnt;
>   	int			(*acquire_lock)(void);
>   	void			(*release_lock)(void);
> +	int			semaphore_idx;
>   	bool			shared_with_punit;
>   	void			(*disable)(struct dw_i2c_dev *dev);
>   	void			(*disable_int)(struct dw_i2c_dev *dev);
> @@ -297,6 +300,7 @@ struct dw_i2c_dev {
>   
>   #define ACCESS_INTR_MASK	BIT(0)
>   #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
> +#define ARBITRATION_SEMAPHORE	BIT(2)
>   
>   #define MODEL_MSCC_OCELOT	BIT(8)
>   #define MODEL_BAIKAL_BT1	BIT(9)
> @@ -310,6 +314,11 @@ struct dw_i2c_dev {
>   #define AMD_UCSI_INTR_REG	0x474
>   #define AMD_UCSI_INTR_EN	0xd
>   
> +struct i2c_dw_semaphore_callbacks {
> +	int	(*probe)(struct dw_i2c_dev *dev);
> +	void	(*remove)(struct dw_i2c_dev *dev);
> +};
> +
>   int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>   u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>   u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> @@ -370,9 +379,12 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
>   }
>   
>   #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
> -extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
> -#else
> -static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
> +#endif
> +
> +#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>   #endif
>   
>   int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2bd81abc86f6..9973ac894a51 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -50,6 +50,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>   	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
>   	{ "AMD0010", ACCESS_INTR_MASK },
>   	{ "AMDI0010", ACCESS_INTR_MASK },
> +	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>   	{ "AMDI0510", 0 },
>   	{ "APMC0D0F", 0 },
>   	{ "HISI02A1", 0 },
> @@ -204,6 +205,63 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
>   	{ } /* terminate list */
>   };
>   
> +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
> +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> +	{
> +		.probe = i2c_dw_baytrail_probe_lock_support,
> +	},
> +#endif
> +#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
> +	{
> +		.probe = i2c_dw_amdpsp_probe_lock_support,
> +		.remove = i2c_dw_amdpsp_remove_lock_support,
> +	},
> +#endif
> +	{}
> +};
> +
> +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +	const struct i2c_dw_semaphore_callbacks *ptr;
> +	int i = 0;
> +	int ret;
> +
> +	ptr = i2c_dw_semaphore_cb_table;
> +
> +	dev->semaphore_idx = -1;
> +
> +	while (ptr->probe) {
> +		ret = ptr->probe(dev);
> +		if (ret) {
> +			/*
> +			 * If there is no semaphore device attached to this
> +			 * controller, we shouldn't abort general i2c_controller
> +			 * probe.
> +			 */
> +			if (ret != -ENODEV)
> +				return ret;
> +
> +			i++;
> +			ptr++;
> +			continue;
> +		}
> +
> +		dev->semaphore_idx = i;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +	if (dev->semaphore_idx < 0)
> +		return;
> +
> +	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
> +		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
> +}
> +
>   static int dw_i2c_plat_probe(struct platform_device *pdev)
>   {
>   	struct i2c_adapter *adap;
> @@ -334,6 +392,8 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
>   	pm_runtime_put_sync(&pdev->dev);
>   	dw_i2c_plat_pm_cleanup(dev);
>   
> +	i2c_dw_remove_lock_support(dev);
> +
>   	reset_control_assert(dev->rst);
>   
>   	return 0;

