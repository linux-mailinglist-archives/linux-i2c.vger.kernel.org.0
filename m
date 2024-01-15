Return-Path: <linux-i2c+bounces-1296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B352B82D454
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 07:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BFCC2814E5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 06:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855E23C15;
	Mon, 15 Jan 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6yM9KO9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153F3C0B
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705301917; x=1736837917;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=GthENmDP5Xl6UBnbPyVkMGnv3vbBOBTnop7jZJN7k4U=;
  b=W6yM9KO9YbuQuRK0lN8z44Oc+vtqgT0iLZ8ilfA1ialAmUn8ZQB5lJ5I
   3ryi8pDW6XUvVZRn2QemT88vQAnqbIHcaCvNEqW+4vC0qtdbChANT66rv
   L2BREHPNP6vRPue4fVPR4cok6Da3H6E1Gl4059w4M4rfGepJBn41OKcmz
   fRzcyLEKk+uo2W7ZNU4xC9vFHQ95anPXujhsVyU3z2mzfGSeZvD4MbQl/
   UzC9Ud0rvCMSTQrYtiYGy5pKGdPLefoW2V+Ba3ETGI2eG0N2dMY1f1iHT
   fqkclxHolEqPoS7TfZVPehXOTSOAYbGVv7ZQ2EL9Lu1GfE/5VxVDqUf6N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="13027020"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="13027020"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 22:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="906973695"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="906973695"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2024 22:58:33 -0800
Message-ID: <5c47fe25-082d-485a-b840-abe6b17834b6@linux.intel.com>
Date: Mon, 15 Jan 2024 08:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, Kim Phillips <kim.phillips@amd.com>,
 linux-i2c@vger.kernel.org, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
 Andi Shyti <andi.shyti@kernel.org>, Borislav Petkov <bp@alien8.de>,
 V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
 <ZaLj5Gg-k2b-TWFK@shikoro> <ZaQUi17I_3s4GjUL@smile.fi.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZaQUi17I_3s4GjUL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/24 19:06, Andy Shevchenko wrote:
> On Sat, Jan 13, 2024 at 08:26:28PM +0100, Wolfram Sang wrote:
>>>> Hold on, I'm testing this on top of next-20240111 and still seeing the
>>>> splat...
>>>>
>>> Btw, does this reproduce always? Can we be mislead if it happens somewhat
>>> randomly? Happens to boot once we revert some commits and then at another
>>> Andy's nearby commit does not and we make the wrong conclusion?
>>
>> Thanks for all the work trying to find the regression so far. As I want
>> to send out my pull request soon, I think it is safest if I revert the
>> whole series and we start with a clean new version.
> 
> Oh, but true. Let's start over later on. I will rearrange patches and Cc to AMD
> in the next version, so we will have unquestionable ones first.
> 
I think everybody also likes sentence below from 
Documentation/process/submitting-patches.rst:

"If you cannot condense your patch set into a smaller set of patches,
then only post say 15 or so at a time and wait for review and integration."

