Return-Path: <linux-i2c+bounces-1881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0085C8FB
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 22:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BEE4284919
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 21:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00E4152E01;
	Tue, 20 Feb 2024 21:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foh2iJxX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A28152DF6;
	Tue, 20 Feb 2024 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708464473; cv=fail; b=fx5iHSmPG+SE7KDVTAIndC1bRXLzh8zWDMsq8hp/be7+3FlUTNK2ftgDVChGHJikH1mYtuPPMxbxVaPIEglRJoZ4/wP3aavpb/mYcjrDvm2ppCRC269ZQHU5qiqqpbpdihrXtopkNuIXYyCyMub1DMl9X+1Ei1VcvPRHEwOjc8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708464473; c=relaxed/simple;
	bh=DQ5EguW9PM3R4FgWCGIQRmgjD5JiyIO3buMdroXDJXY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rqwohM9WzsMFZVGenJJgN1mxoC4ZOshLeW/SsiAxP9sV9+cXFjPjTpTneV9pwtOT5SSPhswWFvNRzdxGucwr/Y5Jum6mnCghcQUbFOwmdNGvtgSb2y6yRe3bGYyVlu5hSHzgPRa7T1b3rPm2RVUs296cePAawzUlS00Ff9xW7c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foh2iJxX; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708464471; x=1740000471;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DQ5EguW9PM3R4FgWCGIQRmgjD5JiyIO3buMdroXDJXY=;
  b=foh2iJxXju79YJeGM9Vj4vzY+fG56OAtsiaoHJFPg9XP+Rsv9qO8aqL9
   MbZs31wLHOG8vFKuwhDk/vqBfxcLYy19UoUyMa3TekP9LTlCc2MoF+ayA
   j10NujK80QPNJPEH4dfGu8LeirZASzvW9m+/pZjx1U3gzwYAVFQXKljST
   E52HeDAVTtwhocxA50uEMmcHoGkxLVQit5HuFDXxlVvXq7Fyteg7ILVBK
   lyzEHSCx2hcPxTzxZqueff+BiyqonU9j45QHshRA+OZ05OFibHZVfKcub
   o3sgpieoArpvfLgElkeptec71r6uRDe7bEpkvbqNL/oX4MlMDYCjjXvjZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2469626"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2469626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 13:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5197644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 13:27:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 13:27:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 13:27:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 13:27:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 13:27:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Giv6NjY1pHVIR7QI9hQn1I7OGFAL3VZvkkaEv1YNPt8I0YLrmq4J2lc78pzgo+8YatALF+Xw23RiP4fuG0qvjfNT1ASXxtCX+awjyeyooDC7ZKQ5hyoZtTx/DbvJun1eslVrCjEghbtX2VT3vV6a7wfRT9MAsk0NEHdLiziwd6LYekg/kVhOjntYMHLUwNGAEmHHMoVPX09g+C2HVY83wmv1Ztb4FLicMYcx0WbYVlk6Bfn8DHtvsTX4NnIwWRJu8j3D6cSatAt5+nZhFBh85dA9QQKLsBoAgYFu7QN3cmZcEzbLd5du0pw+8R17juGhc/XGoUEwl7uw2Bo1gK5Gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51Ii58wPc+TwRtQSGdJuCJkvEx8WC9Gmkllq2WOu/Ic=;
 b=CP07T4O88UJfYa4JkniUv1oiwYkoJ9FqtmtsyDnDKV+tSpoHttHygD01byPLDR7EBEK3+EVTyj9nHIchei3q9Ho+LmAxHG6YjwTm66axSNndYBPo4eD2Dj9t/s4zqOn5YArOHmoBGD5DVCP4a34fcBmSuXYMFPHwuQsgONBY4ZCilvqggPNS2fKYIatE6sp4aNFz06NFVGJj/M0GfSOZeBIChWoPwPQyvzMXreLwcsQIxn30HBDvzZg5V3Jxalc3UdPjPrqr3ht0hykB5eVh3GJ/IhtkDlTQ//9IUD9Mp4bhUz1qxntOAfQzYv18mb8XLkAB0SQY6xbQTQzCKT69pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 21:27:47 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::d543:1173:aba6:2b77]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::d543:1173:aba6:2b77%3]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 21:27:47 +0000
Message-ID: <787dcf27-c434-42e0-9c80-35e341aa16c4@intel.com>
Date: Tue, 20 Feb 2024 13:27:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] mux: convert mux_chip->mux to flexible array
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jesse Brandeburg
	<jesse.brandeburg@intel.com>
CC: Peter Rosin <peda@axentia.se>, <gustavoars@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20230223014221.1710307-1-jacob.e.keller@intel.com>
 <e8782296-49bc-33a2-47b3-45c204551806@intel.com>
 <202402182100.1D5BBE45@keescook>
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <202402182100.1D5BBE45@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CH3PR11MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 42767070-9186-45d8-255e-08dc325ac86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MU2s22DPB68AQ7aSfzyDMXmApQXocnmK3tlSrroIr128hNX1b/0vT8CD8IPL3meWEaa+l8M1Z1lJBzqk1VWr99h2DRLzeq2rQUxgFbxE8q3kgGrgB0xNCaqYdsXD+Gj/gYzyT91i+FNRdVMgZmXf2i8bERzfE0L816GlfG4jR0Y+ZACIefVb2YAjB03Erv3w/Ic+4/T5ZHkFJbKoqui6fyjAc1QVdkgld+YaaKAm1CzoVbzqW5KcsUnqhkdi4fOjRfXPewCieecBGkvFO2TPf322KBocKPSvkUT1JOyk+RnE2gzk0EQHc3y0k67lHyAVPuGFG1Nwo5qpUb/FLPo2Xc0lUBm71LR1uMxzqqbTbL7LfDFm3yNm1PciXHGvZGCblA00UXkTXYtTWKgRGHevD8r7Gbk4squ9bOJ6K4/KTO/5QgReWrvOH0Gh3I1WNvVPvwzUD3+yi7Gj060U8VYmy5RR9jxwU+D4nCq6ES0g3I6FFWMUdCsQ45D7aJ9d3jBnjXIWxS5vhPmu5GfWbhAzDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZseXBidjdEbEkwRGh2ODluRkdremtSTWFEOU9yMnlXNFZ1bGRNTCsxUFlP?=
 =?utf-8?B?U3ptVmJwMkpJbE1DdjZDWnVKUWp2WndBdXB6bVVxWVhUdDNaS0czNmhPSTRp?=
 =?utf-8?B?aUgzNDJaZkczeEx5K0Y5L0ZNRDJ0R2NYb3p1T1Z2WGR0OXFmQUZHcVFwV0I1?=
 =?utf-8?B?T2syeGtSKzJHVnpJeDZYUEpmNzFiRnFRakgwRFZqei91SktwanVpMmFYMVFm?=
 =?utf-8?B?c0M5Uk8vOVdrREJ0R3V6Vmk1UitZUkVLaEZYazJlRnJsNVVFL1BRRks3Qmlx?=
 =?utf-8?B?TGlpUlVtYmd2eUZLSXVGNld6NTdkM3AvL1A0UUtUWUNxZkZLQ0VueGFLQ1c1?=
 =?utf-8?B?TzJHeFRCcFI5VUdnOEVGRlZEVVdlekx0dVMzZzk0cnRtelJ5OCtnRG94NzlC?=
 =?utf-8?B?RFNPOW5QR3dIZWVpNHkvSlVmemJKT1dFTEdVbjgzeWdPT2psTUJsVTlscmky?=
 =?utf-8?B?cTlGaFREV1huSlhvZ2c1ZDZDQk44QUI5MENsNE9YeFJMVzVEVVpKV0FEL2p0?=
 =?utf-8?B?aG5pZ21FTGFINDVDNFQrNzBYcm4xVk45Q1ZmeXFBWlR5bUhabmpQY25hMlY4?=
 =?utf-8?B?OEVGMjNxUXRQZmgvUzJrZmRrcllQTXNmSkRBRmVKcnRvNFZjVDQ4WkJJWERM?=
 =?utf-8?B?UVpRRG5JenZQdUJmOGc2dEF6b3pzYkVtUnVTcjdVWURvRWRLOUdHN3IrbFMz?=
 =?utf-8?B?WHRCTXExN00vZ1BpbFNLVkJnay8rMDlGVXo0S3BpYXRUTUU1WGNvdGtUTnM4?=
 =?utf-8?B?MmdqdzBmamFZVGlpZk43RStmM0xYQmFiR21pNEJ5cnR0UmhNeVUvNUhDNlli?=
 =?utf-8?B?VFdzREhJemFwMVhTK3hCSmNVNWZjZFQ2UktyWjBZbW00L0wzemRmcUdRcFV1?=
 =?utf-8?B?ZU5EL2VQbGljeE9uLzk5aVlHSmN6QUFIajNzVm51cVZYcW1ndmZhMXNDMXlL?=
 =?utf-8?B?QUJlNzR5TE5nMWlTbVJ3ZEFkQ1lPVTV0ZWRVaE1mMFA0bzZsNEJ1TXZodHcw?=
 =?utf-8?B?L1A4RnJjZWhtak1QWTJ0VHd5akx3MVdDUFRCQ3UwQ09zQVhVWVB2MSttS0lk?=
 =?utf-8?B?SDFJZWdTaXpQREdQQ3VrWnZjanNoMTJxdy9TaEZwN20xTDUyRWU0S3lDVUV4?=
 =?utf-8?B?NGU3dnZFTzZOaEdrcFVJZDVwKy9tc3ZuUTdmdENVSTFtUDNRRURZa3NsRVhX?=
 =?utf-8?B?dm4rakpxMFk1VThJZnNlUjNaelNEL0lYdkpwR3lXZVFDWXlyVm5LOURFZ2VO?=
 =?utf-8?B?bUNYcVJFVnVoU0haRnM0M29wT3ZkQWNTVTRQWkhTVkhoa01Fdk5SWEk5MFgw?=
 =?utf-8?B?ZEpja1I4b2EzeFFseGtLeklPOUpXbGxGcXJaS2VrL1ozRnJmS3dPWlZHUisw?=
 =?utf-8?B?SFovaHFXUkhtKytzV3VIMkFzbWtRUmVZVExqVDhVa2VLekF0RHI1WXVLdm11?=
 =?utf-8?B?MjEvNkQ3U2NTK3o4eG92NktJS1djUGxlQS9aSWZBR05zUzNtSTZVNE1JMVNq?=
 =?utf-8?B?aE1FL2htZWhXQlNTdStRZkZZbUZEZ1hNTGQrZzZqUHNrdFF6NFRHcm4vRmhv?=
 =?utf-8?B?U2NoZFpWK0cvdzhTZUVzakhlNEJ5TTJJUlRGOFo2VW5hYVB6TS81b2wrRm1F?=
 =?utf-8?B?VFRJSklCdm5lYVRoUnNyK2g0ZkFMT1FSbzI5N2tTRUtWb0k5YWF5TmdFdU8y?=
 =?utf-8?B?QUJMOUw2T0dFY0tHUWp5RG5NK0pWZmtHUVRvejRnVElvdVhKaUFBNnF5RE9p?=
 =?utf-8?B?aElLcGc5dnkvRzdvZW5TeUJjNEl1WldJTVE0aEM2bDVEeXg2MkI1U2xYQlRu?=
 =?utf-8?B?UDdIV2pEYWdWQ1FrdVZxNFkvcmJyaDlvYnpwUlVIUm9Rd1ZjL2dzV2JQN2JE?=
 =?utf-8?B?VHhoNW5vVnR4OXVZRStPVENwam1OTEgwcEJuSVp1dnZYQWJHMkl4L0JDck16?=
 =?utf-8?B?UkJRTHpON05OZlFrVG1lU3IrOGp6a3A5WjdHQzFzYVN2bFZ4elVDUm44SERw?=
 =?utf-8?B?VTh2YUtJYzNSbjh6aWFVNUMvQU1BMHFCQTRmODZGSmxpZkdwMGtCUmg0Q0J6?=
 =?utf-8?B?ZTMydHZ6WUg1QllZalhYbnNPWVFkT0YzN0xORVFFdmJCWEIzYXY4M2FZWXhE?=
 =?utf-8?B?SzA2UjR6TkdOaFFPTzlleWdRNk16Slo4TmgrNVpLSnhTK25RTVlRTkpQU3cz?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42767070-9186-45d8-255e-08dc325ac86d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 21:27:47.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRLyPuggU07XXen2NqHfGyLMQ2rUBxqjpxrwv9j3viOonzlM0kf0i/siHkTCP9dwWxLe3eLE+LKJEbi8WOZf58TQggyAXBdXxFoJjsrsTaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
X-OriginatorOrg: intel.com



On 2/18/2024 9:04 PM, Kees Cook wrote:
> On Mon, Feb 27, 2023 at 12:28:43PM -0800, Jesse Brandeburg wrote:
>> On 2/22/2023 5:42 PM, Jacob Keller wrote:
>>> The mux_chip structure size is over allocated to additionally include both
>>> the array of mux controllers as well as a device specific private area.
>>> The controllers array is then pointed to by assigning mux_chip->mux to the
>>> first block of extra memory, while the private area is extracted via
>>> mux_chip_priv() and points to the area just after the controllers.
>>>
>>> The size of the mux_chip allocation uses direct multiplication and addition
>>> rather than the <linux/overflow.h> helpers. In addition, the mux_chip->mux
>>> struct member wastes space by having to store the pointer as part of the
>>> structures.
>>>
>>> Convert struct mux_chip to use a flexible array member for the mux
>>> controller array. Use struct_size() and size_add() to compute the size of
>>> the structure while protecting against overflow.
>>>
>>> After converting the mux pointer, notice that two 4-byte holes remain in
>>> the structure layout due to the alignment requirements for the dev
>>> sub-structure and the ops pointer.
>>>
>>> These can be easily fixed through re-ordering the id field to the 4-byte
>>> hole just after the controllers member.
>>
>> Looks good to me (just a driver dev, not a mux dev!). Also added
>> linux-i2c mailing list and a couple others for more review.
>>
>> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
>>
>> related thread (cocci script) at [1]
>>
>> [1]
>> https://lore.kernel.org/all/20230227202428.3657443-1-jacob.e.keller@intel.com/
> 
> *thread necromancy*
> 
> Can we land this? It's the last struct_size() instance that the above
> Coccinelle script flags.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

I'm happy to send a v2 if we need.

Thanks,
Jake

