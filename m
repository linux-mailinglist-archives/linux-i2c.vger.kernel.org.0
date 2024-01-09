Return-Path: <linux-i2c+bounces-1225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D693F8283BB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 11:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D9B1C23768
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 10:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E16436083;
	Tue,  9 Jan 2024 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNn1MWZy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6635EE5;
	Tue,  9 Jan 2024 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704795114; x=1736331114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PIz0832IToUShwNOmJbHvHbLY4ejciHsh8Or9Lx0aYU=;
  b=UNn1MWZyUnXAgjZTOxdTj4qdfWtyaimhKBKBTI6LaleBiqDPXgnPA1hm
   NHrq3GujtxZ5gP0GsvvY6OQHjHXACx4853ut63pl2bQVCew6R/1ZvBhVH
   c1Ka4vFKhf/YUcTHbvfSOm1TmwOsIavZQbuPKR9Ixa5YkOmOawdz69XE4
   bVqwYFyhByUUie9AdKDTYdA8x3SNKXIIz8j+a5vF7tSiWwFwb1bKKxagt
   QbhAf5xcWe1yZVN4GVDZFStGfbvbp21MlKYG+7Q19/3AToSJxaDm+jIWD
   xaS1ahOVuepcRq/EpJ25CWbu4JvbTSPxbONnygNggGT1MTjOXv57ziYlq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4901973"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4901973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 02:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900706395"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="900706395"
Received: from display-adlp-laptop.fi.intel.com (HELO [10.237.72.166]) ([10.237.72.166])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2024 02:11:46 -0800
Message-ID: <e059928c-6fab-4ca2-9615-4401ee16fb82@linux.intel.com>
Date: Tue, 9 Jan 2024 12:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
To: "V, Narasimhan" <Narasimhan.V@amd.com>, Borislav Petkov <bp@alien8.de>,
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
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <DM4PR12MB508652E9A422CF639C2FEEC0896A2@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 1/9/24 09:56, V, Narasimhan wrote:
>   * Looks like the issue is with this below commit:
>   * i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
> 
Hmm... This makes me even more confused since your device AMDI0010 
should not even use the access semaphore.

So linux-next works if you run a commit before it or revert these three 
patches? (commit 2f571a725434 ("i2c: designware: Fix lock probe call 
order in dw_i2c_plat_probe()") doesn't revert without reverting two 
other related commits after it)

git show f9b51f600217b38f46ea39d6aa445e594bf3eb30 |patch -p1 -R
git show b8034c7d28a988be82efbf4d65faa847334811f7 |patch -p1 -R
git show 2f571a72543463ef07dc3ac61e7b703b9ad997f9 |patch -p1 -R

