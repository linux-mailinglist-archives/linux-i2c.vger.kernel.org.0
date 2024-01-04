Return-Path: <linux-i2c+bounces-1116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB98242C7
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 14:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F676286983
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 13:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F6722334;
	Thu,  4 Jan 2024 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qh1sm27c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832E2231B;
	Thu,  4 Jan 2024 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704375648; x=1735911648;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=izzVXBML3qDVk1WkctSU9+hFRAuWndHA8g3FABv36pI=;
  b=Qh1sm27cTeD0zcmCEpIvZWzr2UUL4kJKbdQ3G7+iDiZLPKiHmUn2SNor
   FOUM3NesgRzHH9d1WXrpQcjqvC0j3VoNrEkdrwnndgFE/sAUtv1OxjvB8
   nWShZagYv/QsFsUtZoAfhxN+4qUGvR2/rgyqG6yfjtxzi2JMg2tZChXgW
   nANcUce8whJVjW62F3Ktyyv1oAU8p+95HkdbB9he7D84moT4ALTUVprvV
   PhXldrOTBKPLoUT4XcbE3x7IzwT1BDdmxAcUdT3UH8+K+67/HTQ1pM5uk
   z090WquNFsUPx2EKM6c2eIBS1xCGY/x4vI1Cev1FttgEKTT9ncRytf2CR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376733127"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="376733127"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 05:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="850797439"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="850797439"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 05:40:44 -0800
Message-ID: <adf6c24a-d94b-40e5-b645-0c6b23b2d513@linux.intel.com>
Date: Thu, 4 Jan 2024 15:40:44 +0200
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
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <DM4PR12MB5086DE2882C7C5044697B1C38967A@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/4/24 08:35, V, Narasimhan wrote:
>> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
> 
> This made me scratching my head since driver probing will fail in this
> case with -ENODEV and I could not trigger runtime PM activity in such
> case but perhaps this is timing specific which happens to happen in your
> case.
> 
> Out of curiosity do you see this same "i2c_designware AMDI0010:00:
> Unknown Synopsys component type: 0xffffffff" error on Vanilla or is it
> also regression in linux-next?
> 
> This does not happen on Vanilla, only on linux-next.
> 
This is even more strange. Controller is in reset but I'm blind to see 
from Andy's patches why. Do you have change to test at these commits?

bd466a892612 ("i2c: designware: Fix PM calls order in dw_i2c_plat_probe()")
c012fde343d2 ("i2c: designware: Fix reset call order in dw_i2c_plat_probe()"

and maybe the last one
4bff054b64e1 ("i2c: designware: Fix spelling and other issues in the 
comments")

I'm trying to narrow does the regression come from first two patches and 
if not, then test the last one.

Andy is out of office and if we can narrow the regression to first two 
patches we perhaps can revert just them and otherwise need to drop the 
whole set.

