Return-Path: <linux-i2c+bounces-1268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEA82AF18
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 14:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007DD1F2251F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 13:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E874B15E8E;
	Thu, 11 Jan 2024 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFEz4Mim"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364E15E88;
	Thu, 11 Jan 2024 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704978113; x=1736514113;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oCzQBcRIeW5uBmcYUKzKBeMO8BTEAhWkUMNU32e2x1E=;
  b=CFEz4MimHtdWl5nzujYyPB/UoIkNLBQuqld89fADvFifx6jzG0S3v1B7
   Q4Vd/VIl4YsYW6HPWweGGucxQoGF9rnQWmpbh4fm3Cm8WQEt6AGzm3PjM
   ujqgRotS4kSakuAkRlKCYaTg/3iUtDpfZ53c+xDNxUh+jE5qD3CMhwZHP
   4TWsXd/KMw0K/tnZ+GDueoBHkl+hrBNbKeAXhPt1jzTR8D21qU2TENNFe
   AP+3QQHILcI0lHsiEFDUOhw5shuBOnQHEtmYGPaUy2CM7Yq+TLtF1rlvn
   wU4tM3HuruyJ6FirpKoMGB4G6UyBiFR01XNBJupbiZ8FqfwArEpp4Hzxh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395982155"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="395982155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 05:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="758758981"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="758758981"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orsmga006.jf.intel.com with ESMTP; 11 Jan 2024 05:01:49 -0800
Message-ID: <ed4db18f-5590-40a6-adbe-53062d0f382b@linux.intel.com>
Date: Thu, 11 Jan 2024 15:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
To: Kim Phillips <kim.phillips@amd.com>, "V, Narasimhan"
 <Narasimhan.V@amd.com>, Borislav Petkov <bp@alien8.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
 <8169d773-f9ec-4092-b036-9e4fd59966c3@linux.intel.com>
 <DM4PR12MB508654DF49FE079D6C283D658961A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <888da30a-c1ed-4fb0-af81-787fd868ce20@linux.intel.com>
 <DM4PR12MB5086DE2882C7C5044697B1C38967A@DM4PR12MB5086.namprd12.prod.outlook.com>
 <adf6c24a-d94b-40e5-b645-0c6b23b2d513@linux.intel.com>
 <DM4PR12MB508652E9A422CF639C2FEEC0896A2@DM4PR12MB5086.namprd12.prod.outlook.com>
 <e059928c-6fab-4ca2-9615-4401ee16fb82@linux.intel.com>
 <27cf56b5-d21b-4906-823f-a9e567fc26e2@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <27cf56b5-d21b-4906-823f-a9e567fc26e2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 1/11/24 00:56, Kim Phillips wrote:
> Hi,
> 
> On 1/9/24 4:11 AM, Jarkko Nikula wrote> On 1/9/24 09:56, V, Narasimhan 
> wrote:
>>>   * Looks like the issue is with this below commit:
>>>   * i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
>>>
>> Hmm... This makes me even more confused since your device AMDI0010 
>> should not even use the access semaphore.
>>
>> So linux-next works if you run a commit before it or revert these 
>> three patches? (commit 2f571a725434 ("i2c: designware: Fix lock probe 
>> call order in dw_i2c_plat_probe()") doesn't revert without reverting 
>> two other related commits after it)
>>
>> git show f9b51f600217b38f46ea39d6aa445e594bf3eb30 |patch -p1 -R
>> git show b8034c7d28a988be82efbf4d65faa847334811f7 |patch -p1 -R
>> git show 2f571a72543463ef07dc3ac61e7b703b9ad997f9 |patch -p1 -R
> 
> Narasimhan is right, if I check out, build and boot this commit:
> 
>        2f571a725434 i2c: designware: Fix lock probe call order in 
> dw_i2c_plat_probe()
> 
> I get the same stacktrace on the serial console.
> 
> If I try the previous commit (174a0c565cea "efi/loongarch: Directly 
> position the loaded image file"),
> the system boots fine.
> 
> The same thing happens with the three reversions above:
> next-20240110 gets the stacktrace, but with the three
> reversions, it doesn't.
> 
Thanks, I just sent a fix reverting those commits.

> Is your parallel post probe runtime suspending time window
> theory no longer applicable?  These AMD EPYC systems have a
> lot more cores than their client equivalents, and AMD power
> management code has had a lot of improvements lately.
> 
It still a mystery to me but I let Andy to figure out it if he wants to 
during next development cycle :-)

