Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFFC499F57
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 00:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1841037AbiAXW5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 17:57:24 -0500
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com ([40.107.93.82]:30483
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1835484AbiAXWgj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 17:36:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTf4tsxyuputmfGXELkdy4GtQtvLtOVbX1v9AmhtCg9u42H/pvGUpi3f7FIRM3NN1DO4b7IJoJ5KDNX6Oh8Uzxxpl+pHyfMXlhaP07Pz91B/hDf7/Aw23LipGsRG7jkS8q7k3MmqK5ajo43bpJs0mFEKu/r2bHtYQhUnLJI5okmaO/ps0ob9tmnvc+TLD+GPr/M/6cvQ/iE6FKkpo0HMf1zzCmDY2zZ52J1pcHRocghOUaOGrmdJ7dLoJ1d7ZYwcl5wPweQKMwWbDd5KxUFCuImDxGfUqSyFLoguhFkQfRuX5hEiaWhqtKzzUWuXQE5EBFnsjYcdTsYvYSCeNunEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4YyT85HSu0uD6uiBPnqcT+3lHPXeqIILXqLKcUE9lI=;
 b=MIPi1Hs9NqFoS5KJ+yweZsMs/GdrfQccdf3EoOFh2Uuo3InUHI/3Euqd/Lx2mF5pnir4GeUe2O3O2S2mqM2XteWeT5iRb9ZCfM6Rh/YCkNonpou89vD/LD9rE7NRW2Yy8GsuAhSxamjKvH35uUFXkxE0/ssuBG4eeOkRPyQQZ5K0vwN/t9K16XuLNKLrr6kC+CBfybTn6y289RJ8U91qGoNcS729X+LXMhlWiffMZG/FcwHX9/rTyz7iFE/Rfi8Q6TDquapUtpC7Riwg0wFtOc38/uyPJc5hlp65SjmxjuPqwmvqg2d/ShZ0WTYU020S2ccAbie9SpBxtAaMUAoyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4YyT85HSu0uD6uiBPnqcT+3lHPXeqIILXqLKcUE9lI=;
 b=S6LycuDq1baJw3jokgM+uXf4VHciNIHNwFJZOcFT9idfio7XNaOxBe0/N0dGKSqwG84lBf9ICs7YKgkVL2j9GZfIScoZXaoyzcYNi4JMsoHvqromo2XNoECp13TyIGb4swm4nCTK3nKNgs3RN8TNi4UPvJ5jH5vf2othyeJ8934=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 22:36:36 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 22:36:36 +0000
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
Message-ID: <2b6c9dbb-08c9-e28e-a18c-89f215567c7b@amd.com>
Date:   Mon, 24 Jan 2022 16:36:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220124183651.62d5a97d@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0442.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::27) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7136d397-df59-4417-de8b-08d9df89fa95
X-MS-TrafficTypeDiagnostic: MW3PR12MB4443:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB444374780C53A11EDA873D7B835E9@MW3PR12MB4443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJyHWHjbrbeon6YUlciWnEd+4lBcHGIcjusyOfI3OB7a00H5LyfpSymyPQbueXbs7JqdtPD5O5HAVuX3syF5lvU0vr6NBvp/MFHgLmO/kV5XR3PsFOQyl2XDgXMvAQexV+4XK176VWyvA1h7cYvFe9XMMKlJQB/gNNHPSdzKlxQLvCx+5RyX34HVMsLd1yzsR9zyppfgWX9RHKmfmGf09pBckz7hlOPeb3VhI4ga+nfUCGOLAsE43FmDJXMJyaGv/PsGkROGfvTPS+8g1wz+A6+AauLV1FlunVK7AnY3r6VPFXauAFPQEdz8Y63k7jbD4i8hDsjDfymRlapSaD6EE7RzGHxvFb9mCqd26uiDYXln3x1rV8KsxuZmV7cRLbEvvW7GgnoVitJCGlMIebOfkIo8RhHbF+ybw5HOPHbA9YhWp8ww/DHpUrV+x5i+VQTe69nPzmpbVa8n0MHqnXyb6H0qkKOY4lzrwcDbBveEH8IgP2tAzgmQ1buQF3bxUH0gu/7jU5FISI5mPNgB6BdbnVRZeeUi5vTMyRSbNrvnePp4W0U4q0ysKqrcEoVAGPG6Ufobh02AiIaXE5rOBkLxMeM8hpsWi6lVW18dVcJyRHFP8izNzM/KNdJ5U/Q6lpbRMMNWRfeKMkxJ/6cOnquoX2flEO1QHKXuxUagQJvATBaNJYcWs68jX1opX5yZd65fJVbtOJnhcGzJ0wOLIOlgAy1HlGRpWe9g3mj7fj30KvKi2n9LB8+cUG0oJ4VGTbYL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(36756003)(6916009)(6486002)(66946007)(5660300002)(6506007)(2906002)(66476007)(53546011)(26005)(316002)(4326008)(66556008)(8936002)(2616005)(8676002)(31696002)(38100700002)(31686004)(86362001)(6512007)(83380400001)(186003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdqSXh1Y2xCcVFiNk5BVmszd2VIMFFFdWNPL09oNE5Kd2VKL21Ibm1jczh1?=
 =?utf-8?B?M1hCNDZ1UmFaNjN1WnFWdE4vbGJGTnRHdDdtTjIxQm4rZmRTZDJuQmZic3Jq?=
 =?utf-8?B?OUZEcXA2QXJMZmoyVk93aXF5NGpXVXZPMTF4a0kzaHhhem52MmV3QkFTWk84?=
 =?utf-8?B?VC94bXpoVlBGMUpkejhvTmdZYm9pVll5WHFhN2hqeWN0VXhIM2htUHFOb2Ey?=
 =?utf-8?B?aDdnSFNIang4YWM5RExDZ0JQMmJZZXV2cGkrS1hsUXpnNVZjdkM2ZUgxbk1B?=
 =?utf-8?B?TGxCNUoxWC9UZ1NyYTQ2Nng3STExcWxWYXdIS0tGTTlpZW9aeU9VUEdlcFI2?=
 =?utf-8?B?ZzQ1Mk9KNGFTZzRiN28wOWVqOHowMmZjcngrRzlxVjhvTlV5TlZobElGbkh3?=
 =?utf-8?B?YmZMVy9zeGJUVm9NMEhNMWZOVGNXcjcxR09mVkJRclVlVXlmVzZ6MHlZcENj?=
 =?utf-8?B?STQxZTFFQ05kZDVoWU1MbStMa3p6NWxyYjN0MFBZaXB6RVlORDlCMGlSR0tC?=
 =?utf-8?B?bjJYZXNwN1AvY0tCRFlNL3lCbFpVWU9lYjc2MTNTWWZjZERNSEhPR3FSRlU3?=
 =?utf-8?B?OGQrSGF0TGdsQVgrSW4wTmhKV2Y3dHNYYjV0NytvWjJTZGtlVnMxUERpNjN0?=
 =?utf-8?B?WXFLc1RWcmc1TTBkVHlhU3JISHFoNk92Q0xRNE16TmtuNXpLTEFhUGo1ZUVL?=
 =?utf-8?B?OFU1MGxSYUh3Q3hneGpRSXhCOXlWaytOc0k4V1ZVaVJoUXRyU3FyMWREQkZK?=
 =?utf-8?B?eVNlU0I4MkxnQS9wQ2FCNXFwQjNaZkJveDJLYWt1ZzNoMVc3ekxnSmFEZVhU?=
 =?utf-8?B?Y01TUWprem9PQjVKRXhnYXlWSnN0bTVXdGRtZlZFR3BMeW40QTBMaTQ3K2Jx?=
 =?utf-8?B?ZUVWSnU2Q3hvckxJdWxLaHlBbEtZQ2R5QTl6V21JeldXQVdoM0dtRHdrTkFB?=
 =?utf-8?B?MDlGdkxQekoxZjhJelVlU3pPNk54cFlubnhxMnFNR2p5c3VkKzFiMGZtajZj?=
 =?utf-8?B?c0doai9EUnAxb0Q0QSthYXZBdVRrTTRUN1VQUlV5NU5zT2FLYVdwTTA5SWtk?=
 =?utf-8?B?T2FTYjBRUDR3enpuVlpoQnhCVGFUSEIyR0h4TXcrUkdHVno5Snc3d2V4bURE?=
 =?utf-8?B?b09iNFRoZUdYanJoc0NKcThFMTdTTmpwaVlzbHJrTHlTYmhrV29BMis2Nlht?=
 =?utf-8?B?ZEJKakJJd2srVjFiUGNVMTVnV21DeTFkOCtGQkxNWG1QVnVlV2ZER2lSVnZN?=
 =?utf-8?B?aDFwUWxvSndPTTdLYVNCL0F6R1lLSzk0WE1Kd1U0QzVVd2Y4TW03Zisvck5H?=
 =?utf-8?B?MlhmSTE5TU5HV0MvVDZ5MS82ZzZTM0lsZ1F5YWtNV0xKMzM3Vmx1endMbzVu?=
 =?utf-8?B?VEFNYjM4aGxFZHNQZkp4Qm9GRDFPMkVpN3VvYWkyWTA1dDNtZ3FDc1F6bFJK?=
 =?utf-8?B?UzcxOFFaaDRRbFFFK2pPT3hmYzk4aUJxc29MQ1BFSUwxN0h4b3EzTkh2WG5j?=
 =?utf-8?B?SUI0WUZrLzFPS2paNUJ6N25uQkdRZDl3VEhHcjErRHEwZVNQVisyMXlSUmJl?=
 =?utf-8?B?TmlpRUdMeHpXTHE2dW5HbFdic2kxR1I1SWUvR21Pam94RWJzci8zaFlwTDY1?=
 =?utf-8?B?cUwzTnBFcHJhMzZwUjBzem92OEdKajZWS0dNS245STN3SkdDWDJGSXkzeUZY?=
 =?utf-8?B?VHBDb2lZK3ZBMitOVHdjUlFPSFR0T1UzblJTN0JzWU1EOUpQQ1NFZmVTQjZ2?=
 =?utf-8?B?alE5V1BsK3ZHMmZwTkJvM1FJSFhJWllDYi94cEhuVzRQTk54aUxwcGNLYWFk?=
 =?utf-8?B?UlozSzNvUkNtV290QkJpZTlIV3ZUZ3FiK0gxbGdlM0lwNWRqMWtBL213NU03?=
 =?utf-8?B?TEIwTWxtdThLREdLYmQwVkEraHZwYmE4amJTdDViRGJic0VKZ3k3TEtxWU5s?=
 =?utf-8?B?VXcva0JrOUpPQ3JZSGIyVkpzOGV1Z2FMN1hJN0xocEJwNlY2UWVlTDJrSGFo?=
 =?utf-8?B?ZkYrL1pETlVHVk9hZ3ZrM25aWVp6RSs5Y2l5UWFidFhaUjRaYWxrN0tYR3Jq?=
 =?utf-8?B?cUFjNGs1VWJ4M25PcDYwa3UrNEVkeUZHWTFVbmJWQkVDa2h4Zjd3ZE9xeGdu?=
 =?utf-8?B?bWVTWFRCbkxXWTJrK2VkbEhpbDUzVEZueUlqMnZDaGZXMjFFNjVLUE9ZWlJV?=
 =?utf-8?Q?ylaludY/J3jKdIlrI7BUU2Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7136d397-df59-4417-de8b-08d9df89fa95
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 22:36:35.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3/k3LjhGUmQFZ4QwH4MujDy1w8dC7/sltMDr8AWuanxMKtlL9mS/OGLMxIqi+G0zDa9WfurU4zrhOQYQ348tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/24/22 11:36 AM, Jean Delvare wrote:
> Hi Terry,
> 
> On Tue, 18 Jan 2022 14:22:33 -0600, Terry Bowman wrote:
>> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read
>> accesses to disabled cd6h/cd7h port I/O will return F's and written
>> data is dropped. It is recommended to replace the cd6h/cd7h
>> port I/O with MMIO.
>>
>> Co-developed-by: Robert Richter <rrichter@amd.com>
>> Signed-off-by: Robert Richter <rrichter@amd.com>
>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>> To: Guenter Roeck <linux@roeck-us.net>
>> To: linux-watchdog@vger.kernel.org
>> To: Jean Delvare <jdelvare@suse.com>
>> To: linux-i2c@vger.kernel.org
>> To: Wolfram Sang <wsa@kernel.org>
>> To: Andy Shevchenko <andy.shevchenko@gmail.com>
>> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Robert Richter <rrichter@amd.com>
>> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
>> ---
>>  drivers/watchdog/sp5100_tco.c | 88 ++++++++++++++++++++++++++++++++++-
>>  drivers/watchdog/sp5100_tco.h |  5 ++
>>  2 files changed, 92 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>> index 64ecebd93403..36519a992ca1 100644
>> --- a/drivers/watchdog/sp5100_tco.c
>> +++ b/drivers/watchdog/sp5100_tco.c
>> @@ -49,7 +49,7 @@
>>  /* internal variables */
>>  
>>  enum tco_reg_layout {
>> -	sp5100, sb800, efch
>> +	sp5100, sb800, efch, efch_mmio
>>  };
>>  
>>  struct sp5100_tco {
>> @@ -209,6 +209,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>>  					  ~EFCH_PM_WATCHDOG_DISABLE,
>>  					  EFCH_PM_DECODEEN_SECOND_RES);
>>  		break;
>> +	default:
>> +		break;
>>  	}
>>  }
>>  
>> @@ -318,6 +320,87 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
>>  	return 0;
>>  }
>>  
>> +static u8 efch_read_pm_reg8(void __iomem *addr, u8 index)
>> +{
>> +	return readb(addr + index);
>> +}
>> +
>> +static void efch_update_pm_reg8(void __iomem *addr, u8 index, u8 reset, u8 set)
>> +{
>> +	u8 val;
>> +
>> +	val = readb(addr + index);
>> +	val &= reset;
>> +	val |= set;
>> +	writeb(val, addr + index);
>> +}
>> +
>> +static void tco_timer_enable_mmio(void __iomem *addr)
>> +{
>> +	efch_update_pm_reg8(addr, EFCH_PM_DECODEEN3,
>> +			    ~EFCH_PM_WATCHDOG_DISABLE,
>> +			    EFCH_PM_DECODEEN_SECOND_RES);
>> +}
>> +
>> +static int sp5100_tco_setupdevice_mmio(struct device *dev,
>> +				       struct watchdog_device *wdd)
>> +{
>> +	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
>> +	const char *dev_name = SB800_DEVNAME;
>> +	u32 mmio_addr = 0, alt_mmio_addr = 0;
>> +	struct resource *res;
>> +	void __iomem *addr;
>> +	int ret;
>> +
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
>> +		return -ENOMEM;
>> +	}
>> +
> 
> A short comment saying what the next command is doing would be
> appreciated.
> 
>> +	if (!(efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
>> +	      EFCH_PM_DECODEEN_WDT_TMREN)) {
> 
> I find such splits hard to read. If checkpatch complains when you don't
> split it (but I think it no longer does, right?) then just introduce a
> local variable to store the register value. Same for the 2 occurrences
> below.
> 
>> +		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN,
>> +				    0xff,
>> +				    EFCH_PM_DECODEEN_WDT_TMREN);
> 
> Easily fits in one fewer line.
> 
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

Hi Jean,

Is your "Tested-by" for patch 3/4 or the sp5100_tco series?

Regards,
Terry
