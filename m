Return-Path: <linux-i2c+bounces-13149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF083B9E9BF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88F3D420DF8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893B02EA141;
	Thu, 25 Sep 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6j/vgPT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4228DE55A;
	Thu, 25 Sep 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795772; cv=none; b=cNWzv8KcUa1jwSlQIPH+akMqEmDDGA7lUm88YNMbwKBfFXi8ndCnkgbbX1qluwFMeVUt3Wc4mABNle71yGHtBWARYRRO8oowShfwxClqFh6zpWsuUV6MyulwV/aAL3hN9gRgKSmauv15F7R9K0O4m0kPlik+Jy1HQK5g9hK/5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795772; c=relaxed/simple;
	bh=SEUh4k4y5Eoq/jVMAp2EehB9wRjT/gAd9YBjKPLh/Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bc8F5zPeQA1xWEDSa19uvU5ZT9DVl+AiAUPZpncchhEBzGxpuHQS6rF0ejkpN8XXosv/xdzOec9zCZZk6gk/qO7oXJfbqkRGqcPJMYvok2zM0AVcj/lC6Mo8J0+9N3ZmOF83iq2mSN4BGkPczHiTAeydpP/C38Ra1iCEOS/Mkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6j/vgPT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758795770; x=1790331770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SEUh4k4y5Eoq/jVMAp2EehB9wRjT/gAd9YBjKPLh/Os=;
  b=l6j/vgPTvycBZPtZBzZO9hNFQz2DYX54LD9RcPNEVnpSHn3zGcXv2jTQ
   BUr5SYpDOmsiIO5WnZAPBPhCBnCRYTuEObc6OfNWlN5Clfmiqh5jJXWjQ
   GIK9UndCIDdQs4uWhzqmEvm8HyirL4/GR2NXgbx1dEdvHnWPvhRTHj8EO
   NkD6J457dk1k4k+6EJqFWc2gWHlWRmf7TSfZVk2oOTpM6P3fDQffjYYi6
   +Jj64l8xo2Fx+f7zSR6tMSau3h62eGi2ZeE6SWRYRV98Wqft17iXhrYLc
   K9CQJtvbfAJLLGFLu7fV5TAIwudcNF99k3MeQF4GKCIKv3UessJNZRDbn
   w==;
X-CSE-ConnectionGUID: WFM7HofdSqaVX1NWO/uHbA==
X-CSE-MsgGUID: E4lWKKbCSLetW0e+RWKwOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60999428"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="60999428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 03:22:50 -0700
X-CSE-ConnectionGUID: P/3726SrQF6WYz5Cr7EHnA==
X-CSE-MsgGUID: OotJVGdHQSWcc2tsTTXzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="177355216"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2025 03:22:48 -0700
Message-ID: <49f7409f-c8be-46a2-9a77-6eee4a3dda44@linux.intel.com>
Date: Thu, 25 Sep 2025 13:22:46 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove myself as Synopsys DesignWare I2C
 maintainer
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>
 <aNLw2qMlHYJXQhk0@shikoro> <20250925092800.GF2912318@black.igk.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250925092800.GF2912318@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 12:28 PM, Mika Westerberg wrote:
> On Tue, Sep 23, 2025 at 09:11:22PM +0200, Wolfram Sang wrote:
>> On Tue, Sep 23, 2025 at 04:26:03PM +0300, Jarkko Nikula wrote:
>>> My address is going to bounce soon and I won't have access to the
>>> Synopsys datasheets so I'm going step down being a maintainer for this
>>> driver.
>>
>> Oh, noes! Hope to see you still around hacking the kernel. Thank you for
>> all the work on this driver and I2C in general!
> 
> Thanks for all the good work Jarkko!
> 
>>>   SYNOPSYS DESIGNWARE I2C DRIVER
>>> -M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>>   R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>   R:	Mika Westerberg <mika.westerberg@linux.intel.com>
>>>   R:	Jan Dabros <jsd@semihalf.com>
>>
>> Maybe one of the reviewers wants to step up?
> 
> I can volunteer if that's okay with others?

Sure! Sorry, my bad I didn't ask you. I thought myself you have enough 
work. And I tend to say people "ask, don't assume" :-)

