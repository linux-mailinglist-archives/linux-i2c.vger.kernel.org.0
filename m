Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E302D49A68D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 03:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357600AbiAYCSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 21:18:33 -0500
Received: from mail-dm6nam11on2064.outbound.protection.outlook.com ([40.107.223.64]:11994
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349385AbiAXTUk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 14:20:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhfKl7y3ABOSQBuhwVj5NinzagpxaudvqDgkDIsGUwoM05Gbc2/PWZ54pjoYTYaGIV69E+ORdrSL75+SvodHC0A0aKy8NK7PMIbXVB+kdkcDSw7OFzsIN5EexiiThJCVmTWGQThbggbD8lj8MvVomaOlvEBfTKUvbal9qzhjYmsPibsbmfPlRg2ni5x3ih4g91Q9KWirAqBsVBJadYm2bkpLxg9BpccCISgEfRpwnTmQCfyunjbWPkYyvSRC30GoHY1OVXoFkcW6t5Zy/HQVTJQ/s3q1IWjOARQHVz3025sP35TXsEYlWlLiU8lKArNkNhNm/t+ZLGLsh+Fsn/HYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Gs+66FdsHzyEr3gEyeUGRcQabztA8znqfaLsCr8nAM=;
 b=A6h9YtrGl7+T3gzfxeQX1fuyS0RloNOz2mHPPtxuJNFn1hDCr0Duc6Y/hRENpbpHqdk+p6afRU61Ti+M1m2BXaOdoN+cNXaY11q6Kb4Zto7ng+YobuIkjkVnFnE5xHK7/yWk4bNfTVhFU44AvovBsRLbjt3CPZ+dVrGFwJVaujiPZJrUiBVBioFOEcry0DJUtpCb+EdoPXH8c9iTlb27PVlBeU1ztTlPK/01zfc5VqgFkE369pi4zNCZ3/6lotiAgfNASvA87JOVOScUw3fJ3eHhzHEb6N96hRo1JIbRYw+KqrxCdpt3qya7kpvCURRKZV0cfHU6uASAD38vkaaHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Gs+66FdsHzyEr3gEyeUGRcQabztA8znqfaLsCr8nAM=;
 b=PqdLYaXSiefjgB2f7Gwn7HOW1DA7Rw4vd+4EeKkfUOIDmIlemcNOr0w7eptpfPsv/sPpkIX4/AYqH4Ffhy8PiTp6wcR8oB2rh/40+B0yv8vlU6O6FlgwB595g2vlNISTCXfVqixWfkNrtX/tysWRltfdRhKz0DTBdYxxzpVh+zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BN6PR12MB1794.namprd12.prod.outlook.com (2603:10b6:404:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 19:20:37 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 19:20:37 +0000
Subject: Re: [PATCH v3 3/4] Watchdog: sp5100_tco: Add initialization using
 EFCH MMIO
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-4-terry.bowman@amd.com>
 <20220124183651.62d5a97d@endymion>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <4c0f5659-d65a-c5fa-2086-e10c4b8e714f@amd.com>
Date:   Mon, 24 Jan 2022 13:20:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220124183651.62d5a97d@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:208:256::8) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3857eee-fce5-4fa5-79a4-08d9df6e99e5
X-MS-TrafficTypeDiagnostic: BN6PR12MB1794:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1794E0BFF8B5EABD61FFDB2F835E9@BN6PR12MB1794.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gk+Bu9MeoB/8nFMXN6+ZDQtGNgTCrJkwIUxn/XA7ZsmklLCG67BqO9BvcrgEtkdsZL9+lFuGaNHT5Jl3NAXvOsh2DWDJrwBievRy0JpKSS6QEXa4qlxiMhNQqTEYiK67joFwWm0YrvayR4ZUDPCnS1KztmWC5y09und5CzA+8YdXS/5tEcBOiHRzymH8q4/0mqP1CWmXJDHds+ep4/2aJp4w1V7xk3x8juFB4dDrvd68dfQWYAyncFbWpYq+qDPNrxFaL6Hgjw8F+5awVjU1RrfF4CrRfaTUr1p5ufKZOe5+r/3YdlstW/MIZ22gAbWUnND5eRm8gGArZLuvVUJwzYAbsWwbRs0VErlmaf1fEc2ZFqsrYbb5afirSrnUpxVbZSYizJS6myb7APfcoHDjUaPVkHhYBOqiqO3NMp8sEKI7SpfY+PUkwq4kR66KhFTE5o10WmbXy8ASVBT/+i2USXJN+brfqP7NUPIKZI2tM/mN7QQgOXtAnSHlI41W3FWlKl+7Gq/XamM44i2GnCKqO52jyqcW+6Q3CaXNmKuUA0iZMgP/q/haxa1rzmios12nneZbrJKulM6fTNrVHkte6H6cCiByG3YJkVP35w/a4xZhe+UJ8ALoVVVmpSyzor4tA8KQx4v2RA2VSbryeMSD84KAsoNwRZm+uN/e3z4Q5HOXRb961iFP2KaG7kXW2k70h+R3xdrWoR8+3seUlI0Wz+q3q8bKVUdf9K8BQYANsaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66556008)(8936002)(6512007)(86362001)(2906002)(66946007)(4326008)(6916009)(31696002)(26005)(6486002)(508600001)(6666004)(66476007)(83380400001)(5660300002)(8676002)(2616005)(186003)(31686004)(6506007)(36756003)(53546011)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blhEelhkWEFoRFY2V21iWDhaYW9TUjNobWdSQ2xRYmpGR29mNHF4a2lLWUFS?=
 =?utf-8?B?c0FzMU55SzhUVWJUWWYvbjVIUC9wbEkzR2psby9SQnZzTzBURittRERaY3FV?=
 =?utf-8?B?NEx6U3NDcjlaSTY1NnM2aUtGZ0hZRkNydDlRdXpGemNwenBzOGJQMzd3MHdr?=
 =?utf-8?B?RHZYOWlFa0V3aExkcng3b0FMUWJTU0c0MEZBWStEaDAzWnB6TzJPOFRBZnZi?=
 =?utf-8?B?bUNodzRZeWJ5aWg0ZUcrektYL1ZJYi91SGpQMW41NG5tSE0vL2c4ampIdHBt?=
 =?utf-8?B?TkQ1a0pXVFNLSjB2bG0xSS9tMWdDamRmNldrUHRaNVJLWUxTRERoWlkycTlx?=
 =?utf-8?B?UW5sZFJGM2VCQWVOZTREWmxNTVYrQ0RvTFRhSzdmNitVbHlyd25xZmNleUVS?=
 =?utf-8?B?azhoQ1NoVFdKbEw0MGRJbnIxcWQ4UkZEbjIxOGd5ZzRTMXFpd1A0ZkZHSUlN?=
 =?utf-8?B?QlgzYzlDMVpJSnB1OUlCTnBxdDBUT2tMNEtYN1YreGpCVm5CRlpySUEveXZR?=
 =?utf-8?B?cGlHMUYvREZ0bWNlWkFRYXFFdDN0SHpkaGNwdzdPLytreEtXVVBKaGhnRTZp?=
 =?utf-8?B?N3ZMM1ZIUDBERmtxMnZnYnBFejBuRWszUm5GSUgrSDAveVBqc0FtdzRDZ2Zp?=
 =?utf-8?B?YUhpVUlpdUZjS1ZhRTkxK0oxb0NZcWdSQjdINnZ6bnNGc2k4WmlzeEVnNTNn?=
 =?utf-8?B?RmFhUzJNaFRYNWRncnptVUtnZ1pHTlo3ZVBray9KMEZXZDB5bnltZ2hhM2hr?=
 =?utf-8?B?WkRrcytldytvK0FpQWF6ZjhlTzcrbCtnczdheHkxZ0lQdXZZK3YrSEs3c3N4?=
 =?utf-8?B?N2p3SmdoL2pjWlVXQ2psMW1obGlheDgyVVRNRUd0QnNIRGNnZndBa3dEQlBM?=
 =?utf-8?B?VDMxby9MUDZKNkd6cnB1Q0MxdVBYWWw1cUdyMEhHYUxVSFpLUFd5ZWJEZjFo?=
 =?utf-8?B?UlhLd1l3V2lzYm11aGErdS9aaEhxbTVnTndkbThCOUxTK0E4Ti9UM1Z3bUgr?=
 =?utf-8?B?MHZJRnE1dkhXZWIzckNxbE5XYXJrNXh4UnpMc2k1WnVmUVNxUmNJUkMwSmVD?=
 =?utf-8?B?b2VIYXhkOXB0TC9DNGx0ZXdXRG9ZdE4xcithVGl0QVJRbUNqcXkvejNZZGJn?=
 =?utf-8?B?OE5hdUM5cTRoY0tVWC8vaE5aT1NqZ1l3ZDAxenVYOTR4d1J4UVhna05nMllF?=
 =?utf-8?B?b0FQcWQxZFRaNUpPZ2hQU0ZXTWlaeW9EdTFJSnJZWmNLTGwrNjBvbGpkRk1R?=
 =?utf-8?B?dXFrcTZEL1lzTnM4akwydTVqYjdMQnRENXV1bnhDSHErSTJqYktwRzlBSk1Q?=
 =?utf-8?B?c0RBSjNRVjNBWjNGL0hONUZOeGR4SWR2UWx4Z0ZjZG5PTEd2bThMZXJ3ZTk4?=
 =?utf-8?B?OGhDcWVNR21UMGJKRXVCSkRxQWFjbGZYN1Z2VThENU1reDFNWWlFOVN1a3JK?=
 =?utf-8?B?MHZvRGlMRllYWkhJVjFJc255L3BxUEI5NEUrSGh0TUI5akRPS0xVbGlVaURN?=
 =?utf-8?B?dTRZWEdac0N5UnZpamgwM3RwY1dBUnN5R3RFcUU5aEpYSXBpSlRjckgxZEFn?=
 =?utf-8?B?aXVBWDl0TW5vdVBSNUpVVi9CMFpaM25wRTFBcVpNK09LVnJtOXBKaDEvWEVK?=
 =?utf-8?B?aGRwYmZpakNnd01sZEZTOHdRNkdwUTdaT21nK2N1ZGlTVDVSbU9US1FQaVNN?=
 =?utf-8?B?ZkVnYnMxdmd2WFdqYUIza25ITURzeTNZakZESFdycktPQ3k4QmN4cUFRNzdH?=
 =?utf-8?B?R3hQTlNzQXF6SkVtdUlKbjVLc0c1elIwZEN0RnpyQStuOHNsL2J1NE1aWllk?=
 =?utf-8?B?NTFsSStKd2NpN29lU2k4ZE8wTm8zZTZocTFlaERvU1dtT3BoOGQ4eFliM2Fu?=
 =?utf-8?B?ZXIyS2ZtU05iS2E1QTIxYjBTYWZLNTMrQUtIaVBNWkc2RzJ1YUNsdzJieTQ1?=
 =?utf-8?B?eVY1TEk3bXY4bi9raGdZNHpWN1g5MWtscUlSMGZwWDlGWWYvWStVQmVNMm9I?=
 =?utf-8?B?U0dyRlk1MlRQbEpieDZMRnJIOFNBdU8wWjg4N251STdPZlhpNHdHVkpFRG1F?=
 =?utf-8?B?VDhEK0pVUGt6S3VWTDV6ZWdGYkNudjRqS20yRUZpQXUvLzhqQjhVMDVabWx2?=
 =?utf-8?B?Q1NmYXN4ZlFCdG1UQnBUZGFvM2tFNFY2QkZLS05FcUlYQ1I2N1ZLaFhWRU1J?=
 =?utf-8?Q?yT1kBwyhlXQuIrrBSX0UM3E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3857eee-fce5-4fa5-79a4-08d9df6e99e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 19:20:37.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQYXcZjrEd99CTXYWXYsQSnNf+L9pxrATSWlWc1eH9ht7fDxXwpGB4CmTAO1mNjVm3ZLOQpCrPjr2C52HnuNuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1794
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/24/22 11:36 AM, Jean Delvare wrote:
...
>> +	res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
>> +				 EFCH_PM_ACPI_MMIO_PM_SIZE,
>> +				 "sp5100_tco");
>> +
>> +	if (!res) {
>> +		dev_err(dev,
>> +			"SMB base address memory region 0x%x already in use.\n",
> 
> SMB -> SMBus
> 

Yes, I will update.

>> +			EFCH_PM_ACPI_MMIO_PM_ADDR);
>> +		return -EBUSY;
>> +	}
>> +
>> +	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
>> +		       EFCH_PM_ACPI_MMIO_PM_SIZE);
>> +	if (!addr) {
>> +		release_resource(res);
>> +		dev_err(dev, "SMB base address mapping failed.\n");
> 
> SMB -> SMBus
> 

Yes, I will update.

>> +		return -ENOMEM;
>> +	}
>> +
> 
> A short comment saying what the next command is doing would be
> appreciated.
> 

I will add a brief comment explaining.

>> +	if (!(efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
>> +	      EFCH_PM_DECODEEN_WDT_TMREN)) {
> 
> I find such splits hard to read. If checkpatch complains when you don't
> split it (but I think it no longer does, right?) then just introduce a
> local variable to store the register value. Same for the 2 occurrences
> below.
> 

I will update for readability.

>> +		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN,
>> +				    0xff,
>> +				    EFCH_PM_DECODEEN_WDT_TMREN);
> 
> Easily fits in one fewer line.
> 

I will change to 2 lines.

>> +	}
>> +
>> +	/* Determine MMIO base address */
>> +	if (efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
>> +	    EFCH_PM_DECODEEN_WDT_TMREN)
>> +		mmio_addr = EFCH_PM_WDT_ADDR;
>> +
>> +	/* Determine alternate MMIO base address */
>> +	if (efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL) &
>> +	    EFCH_PM_ISACONTROL_MMIOEN)
>> +		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
>> +			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>> +
>> +	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
>> +	if (!ret) {
>> +		tco_timer_enable_mmio(addr);
>> +		ret = sp5100_tco_timer_init(tco);
>> +	}
>> +
>> +	iounmap(addr);
>> +	release_resource(res);
>> +
>> +	return ret;
>> +}
>> +
>>  static int sp5100_tco_setupdevice(struct device *dev,
>>  				  struct watchdog_device *wdd)
>>  {
>> @@ -327,6 +410,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>  	u32 alt_mmio_addr = 0;
>>  	int ret;
>>  
>> +	if (tco->tco_reg_layout == efch_mmio)
>> +		return sp5100_tco_setupdevice_mmio(dev, wdd);
>> +
>>  	/* Request the IO ports used by this driver */
>>  	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
>>  				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
>> diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
>> index adf015aa4126..2df8f8b2c55b 100644
>> --- a/drivers/watchdog/sp5100_tco.h
>> +++ b/drivers/watchdog/sp5100_tco.h
>> @@ -83,3 +83,8 @@
>>  
>>  #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
>>  #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
>> +#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
>> +
>> +#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
>> +					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
>> +#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
> 
> Other than these minor details, patch looks good to me, thanks.
> 
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 

I'm finishing up revisions for this and the i2c patch. I expect to send both tomorrow.

Regards,
Teryr
