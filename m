Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C0E49B77E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 16:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344409AbiAYPVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 10:21:24 -0500
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com ([40.107.92.52]:65504
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1581902AbiAYPTG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jan 2022 10:19:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/eB6y8VBe2vGC+Bn44fA3AHksdX7g8Q6GBfbNlT7+RSZ2mTkNKTsA0a6QiBrjk5Dm9vqBjwGzGT59RgmfefhTAVHa/KL0uqTLqeUHCjPCV45VxIdDZRYUXnJoYhKziyvGvXNBxWXAKxEJ3fBqeV4/8O2mbD69O2bXq328tqZP4WqZ4echY4+J9syrGlNkfV0U5zHQ6GguNNtQpQzfMRxs6/6NEXp+IpZTKSP9C6fjpUSVuT8sUDaKrqw7Y2pJYc4QyLDTjqvqiOd5rfNnIqX0FRe7bahwUNQO8g8bA1pu0P8E7kQBhdnXdjscfcq9YkkJLzrjbSvYTzhbWLfCodlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+MpUBNSQTcq2bYLU1++VSwvs3Ih82NBBbfOzomnbrQ=;
 b=Bnc3WA7X10tV9sEJ9zQy5tY24qSVTE7duG8zXyqauBtkkc/r+/PTPOAIRaaJ9DGPA3PF7Vt+x6RYosuyA5RcEV2k7+83JXwI4+cF6wnaxm8sPreZry4yYbRgn1bgfQ4ReWyBhTHJ9QawO0W+Gq8RgDvcq7gV9I7qh0PhQQAPL5+UL1eo8wdPaQMqqGFr06XCLKLMxNkOzBK+ZCSNYw+OT4/J31DIw92D5Y6ozHpABVoI6GrxwUdZca8dCu/xUke5I5jUn7804s9+qvS0vnDrRj9dvp2DQ19zZDWjH4jQcy9600LW48oMaOp/cIRk8kiKfgRBpiKS393t6nNY/86g8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+MpUBNSQTcq2bYLU1++VSwvs3Ih82NBBbfOzomnbrQ=;
 b=lbqFVCSfin11YQW5xlttKmprUNLnTlQLeMy560m+hRtVS1JoOeuBRjGZMd761r+b6k1TrVz6HkIMnMdzi4wgNaReFemMZSNRuocS2m6qMI5Vd7EQTZfwJ7abDdlmYywAS7iBjPvojIhRGSeAKqwIkXXfKTy8Fct5bON7okl/CMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MW3PR12MB4507.namprd12.prod.outlook.com (2603:10b6:303:2c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 15:19:02 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 15:19:02 +0000
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-3-terry.bowman@amd.com>
 <20220125144520.17a220bc@endymion>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <a55ca093-d8d1-6821-1cb9-18343c6f1fd0@amd.com>
Date:   Tue, 25 Jan 2022 09:18:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220125144520.17a220bc@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:208:23b::34) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae0f5be6-ef0d-4025-671f-08d9e016047a
X-MS-TrafficTypeDiagnostic: MW3PR12MB4507:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB450731A45812A1C26C76BBD3835F9@MW3PR12MB4507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DC83DiGhv99D7B6zIvnA/qmC9t+BVAUl5Kvz9B5CrPYHyoQogrkPAjlyVl/snThTQCIps1am+GoeF/ikOvYzT7+3RAHV16Ni9B1HJtdmWLZbBO0rZKHwlLpEg6IfcUgQFJ+Q0gCMm/jFUvkMES1l1t8RKPA187QtI+EmNUgSu5kT2VVo7bGGgB3/bef6JfTsbPHUiaNwqzKm2laJFdejdxrVs5Fqmm9oF3VUA21h2hIcUG4Si7TpnlP6tq1tyVeVc9zwTi8atTPxUJ3qtG7qF4aLWcYUSeC4SzCRmRIkJNv/Unfw1lg6Z+JHCRUb3K3skCsDGCx8hQLONivPqPSl0uAhgONmf+jKFjT57eqdTtqvyvnoGuL0GsrZWAn7DaORbDefDoyRg7034jVspit7Dvv4QRaQsLJI5OZdoI/jGKqcpfZ9ieecSRd6oxhAD3aU1O8D/HTJlTqMm9SviPWAGJgrUbMx/byQPM81mlUFDLAr7W2kQjAhN97hOUnn6oFXuKc+nvJAt7sszC/ku+fjas0Yee32fDxiEC8Yj8LJKsfhfVSBS0+F2VNqOI8zQQgQW26WDmrPIA4WYDUowjBwoiEs6cuaONVmvTCo9cfJT2TkbHelZFyY08ng3g/hbi355UzUglCe0A6/N1Wuzw0m7buJYsvPNVqKZ3jcYLACg2vxRmfcg4gDmROeMt/VeL3DDyTjthr2SxLL3MtymIfzzEvCDRlEOv9d+OcXVIJC3N4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(66556008)(2906002)(186003)(8936002)(26005)(8676002)(6666004)(38100700002)(6916009)(66946007)(508600001)(5660300002)(36756003)(6486002)(6512007)(53546011)(316002)(6506007)(2616005)(31686004)(31696002)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDRLWVA1TFppT3dNaTJEUlhubGNHUG8yUmdob05iazNibkhSQnhTK1dPVTR4?=
 =?utf-8?B?YlFnMnpsSis4dlBnWmNOdWtNYUZXdmZpa1E0bVpQaGgvSXRsdWw0U1dvNG52?=
 =?utf-8?B?L3JsM0p1TDc1dW5XUGZoajRDTDVJZDVGMnpwdksrT09HMXV0R05Qc0dGRHFK?=
 =?utf-8?B?TlAvVEptSXB2Q2w5amZnbHlXQ3g5U1V0VzFOTnFvckN3ellKTjdiTHZrVU1W?=
 =?utf-8?B?TDJWcUFzZkJSOWJjd2VMUlkwNzZaTWw3Y3A3Z1lqbUc2N1Q3VkU5Umdua013?=
 =?utf-8?B?RGV5TFJFV3RQdHErelVmeFhYOXV1V2MxSExwQi9QUnlrWGwxRjR1NTdDZTY1?=
 =?utf-8?B?cmREV05JYUJUS0RIWGVzU1V1YWlXWlBjaFM4d3ZPOXJ3TUpkRGdPNWxoUk5s?=
 =?utf-8?B?RnI3TXZ2NUZUZGl2c0lKdjYrK0VIc1l5Ykp5N1hBT0hBZjJURDNHM25MbUZt?=
 =?utf-8?B?cjRUMDY1TjFFcUZiZkhqdm5MUDBFcU56ZVkzRUQweER0c3Nxb05od1crL1Fr?=
 =?utf-8?B?ajAyaVRKMTFVRHZMalR6Wm1ldVFMZU5VSjBEWGk5aldHTkc5MklML01WSFZV?=
 =?utf-8?B?SU0vWjBxVVdGdmdrbWpxcC9HM0FjTWFIOGhEdlFma2RtUG1ZaVh3RWp3VjNC?=
 =?utf-8?B?TzVEYzFPZjllV2VNWUFjeUtYVXVXUzR6WWk0dGptdjBBaDA0Vkw2bWkybllV?=
 =?utf-8?B?cm9uY3VZWE9uRnp5U2NpZFVZZXcvaGl2Ulo4RWpXZ3JkczE1TzkzSC9qaERS?=
 =?utf-8?B?SmFRdjdvTXhZVkdCdHZJVjRLanVtUXVpbFArckkvSEx1UXFUdFFJTTkybVZ0?=
 =?utf-8?B?bkRaSG1lUFl4RVJIc3Y1OVhBSDBtVUJMTkdPVkt4clBhUGhhZEFXdW12Q3V2?=
 =?utf-8?B?NTFycm1IdFdpV0hKUjJQZzI3OXluQ0M0b3JJR2NUNlQxT2k4b2dLUWxhTHla?=
 =?utf-8?B?NDhrRG9pbklWdy9HemZXeUVoK1UzckFabkhjdEI2a2hHQTNJMzdOcjdvMmFI?=
 =?utf-8?B?S1pqQUtTU3BpUVhpb2NPYk0yRVhPV095NVlVamJZK0ZqZWJ4eTBQeHRUNWJi?=
 =?utf-8?B?SDlheHI0Z1lrYU5GNnc1OGpZclFrUHQ1bktyajhScWg4eGlGemM4VkR4ZTRI?=
 =?utf-8?B?UUVrYlhyRnlhM1RxaFAvMFRxVzU1K2x4d1NhbGdjWElQdjAvT2k5VHJtQks4?=
 =?utf-8?B?WGtnUWtFRFhlcStQMVdIQVgwN1U3Q0ZOc2t6Y1FjZkpLY0xZT3JpTVQzM25l?=
 =?utf-8?B?ampqSFZGMDljbkRydkJrWDFnSkdNNHAwWVZINWRGNGtlSWdhSDBFb2FYOG90?=
 =?utf-8?B?aURiUkExNElBL3ZTNm1jM0J5a3dXR1AvTjRmL3pxeVpKek43Wlh0Q2ZHYzd2?=
 =?utf-8?B?dnErVFBhVTB6aFJWTERQZ1o3QWdlT2tGYWFEdS9pbC9pMjdLdkJZSlZuajR2?=
 =?utf-8?B?a0pXdHgyTXpOZjdkS3dYZEdTTUc0WWNPSllJSUxCQU01dWlPREpRZlM2ZkF4?=
 =?utf-8?B?SmI5ekRKNGF2djhENjZZN3pUelJNZm5Uem15SXN5TGZxLzNCZmhXNFduQWY3?=
 =?utf-8?B?bGlUN3NjOEQyemJ4a3VMaHQ3MG52c2Ftdll5N2dDaFM0amlLUmpTODhiL29F?=
 =?utf-8?B?cWFGOVJqbUVZSnlTcExiL3YvV1d3LzdTeFdDWHBHODZBRm91cWY4L0pIcnRq?=
 =?utf-8?B?ZmN4Nld1TnFTWkltTTRYOFgzZXpZbk11ZDhYVzBWNG82TWZPU3F1ZWNvUGxv?=
 =?utf-8?B?K3pCVyt4Y0h0VkIyTUlsdzdoS1J4SXpDK21HMTUzbXh2NnM2ZDJHVVBKeXAx?=
 =?utf-8?B?bWFIaUpVejAwaG1OME5IOTc0bUd0d3cwYmo4MU1WUVI0ZkF2TXNnbWtuQllD?=
 =?utf-8?B?TTkrZFVwdlBOT0tGU1dJbjVTYlpWZkM0SXREaFB1Wm5PaDkvQmZ1SVVqSEpQ?=
 =?utf-8?B?aFNIcGJGekNFVGxsSkJER3UwN05scFdTWmcxc1l3UUsxQmR4c0REV2FzbWRk?=
 =?utf-8?B?MHdBdXAyT2Vka0N0QjVMZWlWWGlHRC9jSjMzTVZUeWNLZE1NUWV0UmtsOGh0?=
 =?utf-8?B?RXNXK2JkNk9oS2d1RkhtV01hYitOVmVBaW5oWU5vdHBHakE0KzNFa3ZvTmtz?=
 =?utf-8?B?NlNOQm5vRk92UWNlWGVESUxsS3pSWU52SVZhN2hkZmIrSFV1R1RkUnNBQXdT?=
 =?utf-8?Q?4Py9oZ678J7ghSIi2q+eJpk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0f5be6-ef0d-4025-671f-08d9e016047a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:19:02.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQaXdWFRMUBqTpoXwUJUYYR5Cp6WUkcFYHJxvL7yW52hIPgqJxt/ZW/7GjxM9GxmKLZ23xpylguUZ1kdZH7T9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/25/22 7:45 AM, Jean Delvare wrote:
> Hi Terry,
> 
> Sorry for the late review, I hope you did not send an updated series
> already.
> 

Hi Jean,

No problem. I have not sent another revision yet. I'll add your requested 
changes in the next revision.

> On Tue, 18 Jan 2022 14:22:32 -0600, Terry Bowman wrote:
>> Combine MMIO base address and alternate base address detection. Combine
>> based on layout type. This will simplify the function by eliminating
>> a switch case.
>>
>> Move existing request/release code into functions. This currently only
>> supports port I/O request/release. The move into a separate function
>> will make it ready for adding MMIO region support.
>>
>> (...)
>> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
>> +				     u32 mmio_addr,
>> +				     const char *dev_name)
>> +{
>> +	struct device *dev = tco->wdd.parent;
>> +	int ret = 0;
>> +
>> +	if (!mmio_addr)
>> +		return -ENOMEM;
> 
> Can this actually happen? If it does, is -ENOMEM really the best error
> value?
> 

This can happen if mmio_addr is not assigned in sp5100_tco_setupdevice_mmio() 
before calling sp5100_tco_prepare_base() and __sp5100_tco_prepare_base().

I can move the NULL check out of __sp5100_tco_prepare_base() and into
sp5100_tco_prepare_base() before calling __sp5100_tco_prepare_base().
As you describe below.

The ENOMEM return value should be interpreted as the mmio_addr is not 
available. EBUSY does not describe the failure correctly because EBUSY 
implies the resource is present and normally available but not available 
at this time. Do you have a return value preference ?

> And if it can happen, I think I would prefer if you would simply not
> call this function, knowing it can only fail. In other words, I'd go
> for something like the following in the function below:
> 
> 	/* Check MMIO address conflict */
> 	if (mmio_addr)
> 		ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
> 
> The intention is clearer and execution is faster too.
> 
Ok

>> +
>> +	if (!devm_request_mem_region(dev, mmio_addr,
>> +				    SP5100_WDT_MEM_MAP_SIZE,
>> +				    dev_name)) {
>> +		dev_dbg(dev, "MMIO address 0x%08x already in use\n",
>> +			mmio_addr);
>> +		return -EBUSY;
>> +	}
>> +
>> +	tco->tcobase = devm_ioremap(dev, mmio_addr,
>> +				    SP5100_WDT_MEM_MAP_SIZE);
>> +	if (!tco->tcobase) {
>> +		dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
>> +			mmio_addr);
> 
> Remove trailing dot for consistency with the other messages.
> 

Ok.

>> +		devm_release_mem_region(dev, mmio_addr,
>> +					SP5100_WDT_MEM_MAP_SIZE);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
>> +		 mmio_addr);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sp5100_tco_prepare_base(struct sp5100_tco *tco,
>> +				   u32 mmio_addr,
>> +				   u32 alt_mmio_addr,
>> +				   const char *dev_name)
>> +{
>> +	struct device *dev = tco->wdd.parent;
>> +	int ret = 0;
>> +
>> +	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
>> +		mmio_addr);
>> +
>> +	/* Check MMIO address conflict */
>> +	ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
>> +
>> +	/* Check alternate MMIO address conflict */
>> +	if (ret)
>> +		ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
>> +						dev_name);
>> +
>> +	if (ret)
>> +		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
>> +			mmio_addr, alt_mmio_addr, ret);
> 
> Format for the addresses is inconsistent with the other messages above,
> please use 0x%08x for consistency. As for the return value (which
> should be preceded by a comma rather than a dot), it should be printed
> as a decimal, not hexadecimal, value.
> 

Ok, I'll correct the address format to use '0x', change the period to a comma,
and display the the return code as decimal.

> (And nitpicking: I'd split after "dev," so as to not make the line
> longer than needed.
> 

I'll move the line break at 'dev,'.

>> +
>> +	return ret;
>> +}
>> +
>>  static int sp5100_tco_timer_init(struct sp5100_tco *tco)
>>  {
>>  	struct watchdog_device *wdd = &tco->wdd;
>> @@ -264,6 +324,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>  	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
>>  	const char *dev_name;
>>  	u32 mmio_addr = 0, val;
>> +	u32 alt_mmio_addr = 0;
>>  	int ret;
>>  
>>  	/* Request the IO ports used by this driver */
>> @@ -282,11 +343,35 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>  		dev_name = SP5100_DEVNAME;
>>  		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
>>  								0xfffffff8;
>> +
>> +		/*
>> +		 * Secondly, Find the watchdog timer MMIO address
>> +		 * from SBResource_MMIO register.
>> +		 */
>> +		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
>> +		pci_read_config_dword(sp5100_tco_pci,
>> +				      SP5100_SB_RESOURCE_MMIO_BASE,
>> +				      &alt_mmio_addr);
>> +		if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
>> +				      SB800_ACPI_MMIO_SEL) !=
>> +				     SB800_ACPI_MMIO_DECODE_EN)) {
>> +			alt_mmio_addr &= ~0xFFF;
>> +			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>> +		}
>>  		break;
>>  	case sb800:
>>  		dev_name = SB800_DEVNAME;
>>  		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
>>  								0xfffffff8;
>> +		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
>> +		alt_mmio_addr =
>> +			sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
>> +		if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
>> +				       SB800_ACPI_MMIO_SEL)) !=
>> +		      SB800_ACPI_MMIO_DECODE_EN))) {
> 
> The condition is the opposite of the sp5100 case above, which looks
> quite suspicious. As far as I can see, that wasn't the case in the
> original code. Please double check. In any case, please avoid double
> negations, they are too easy to get wrong.
> 

Yes, I found this earlier. I have fix for this in the next revision.

>> +			alt_mmio_addr &= ~0xFFF;
>> +			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>> +		}
>>  		break;
>>  	case efch:
>>  		dev_name = SB800_DEVNAME;
>> @@ -305,87 +390,24 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>  		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>>  		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
>>  			mmio_addr = EFCH_PM_WDT_ADDR;
>> +
>> +		val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
>> +		if (val & EFCH_PM_ISACONTROL_MMIOEN)
>> +			alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
>> +				EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>>  		break;
>>  	default:
>>  		return -ENODEV;
>>  	}
>> (...)
> 
> Rest looks OK to me.
> 
