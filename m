Return-Path: <linux-i2c+bounces-7210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4B98F04D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 15:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 353C7B234C4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 13:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AA219C548;
	Thu,  3 Oct 2024 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHRfYWIZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6B1E495;
	Thu,  3 Oct 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961929; cv=none; b=VtF2VLlNmH6ixCi5fD0e3M+SkpUOFQdy7w+d2cRBG8LJAqPZpHETkgS4e2vd4Yuc74N/tA1zxkC9BxyERoRMj67iTiAh6XpFQgFWwMsOm6F8f3hLkY0Is8TCLIuHQY95jq0Kn1GXpZO3SYchB+jRVFHqLuVOTjQWP0cO3IQYHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961929; c=relaxed/simple;
	bh=Oa56rIUaeLjFq1VHjsI+dp6b+Tvj2zTap1OM5Pz6ptg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKit/H64dUKGegLorEpPaGert+r6kwIJ+9364BMc4pd6yHsy4noRtrK1Z7c4o/1t5u35/LMd9pPlf1jPRzohjMdE7xkpNBbYYOfgQ2P+Jd55Wq5q1tMISTd5zCxzjJzvrNMMyrfzQI66/adMiH7LngJPoxtfcCE5QadOhZZC3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHRfYWIZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727961928; x=1759497928;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oa56rIUaeLjFq1VHjsI+dp6b+Tvj2zTap1OM5Pz6ptg=;
  b=EHRfYWIZm0OR4bPAA6BZRl/W3t+kSvFHwT4BItMSEs9H0QG2aM6cKv5W
   PtCBtCgkEC62xX6ZGe8MhtsS2Fp4I+4sPUptOpDPpa4a0Bb+3Or2ziAj9
   PUT6UtyvAfa7T94nk7j9o0aY0j8BYLssR1Iad3fYZ2qkLwgE7lQ2DyIzn
   8BV82+BXUXYFDapWarIuYVphYATXZj42c/sYnzv9rMs7u9Tcj9Nr4ougQ
   Pggb1PlhSYTC0GyWxp0mO3ZqRf9v+Us3QrhFURrgKnduA2xiDEFPs666r
   XfYnrVrRao5aV669LYhQ1i/PPV0G1bU5k8rWxfL9JDRGXPR2S8AZJAIy9
   A==;
X-CSE-ConnectionGUID: sVc3AmXAR4mobrETS79WoA==
X-CSE-MsgGUID: B3yz+5isSy6GPQnHUSLEJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38536535"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="38536535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:25:27 -0700
X-CSE-ConnectionGUID: uk7ldAy2SbezZ/HjINkDzA==
X-CSE-MsgGUID: Dz4kaYXhTW2KnGnMI8wWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="105177990"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2024 06:25:24 -0700
Message-ID: <727b4614-5010-4ae5-8890-11b12c362048@linux.intel.com>
Date: Thu, 3 Oct 2024 16:25:23 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] i2c: dwsignware: determine HS tHIGH and tLOW based
 on HW parameters
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
References: <20241003111525.779410-1-michael.wu@kneron.us>
 <20241003111525.779410-3-michael.wu@kneron.us>
 <Zv6C8Zj4NabZf_PM@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Zv6C8Zj4NabZf_PM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/24 2:41 PM, Andy Shevchenko wrote:
> On Thu, Oct 03, 2024 at 07:15:24PM +0800, Michael Wu wrote:
>> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
>> for High Speed Mode") the SCL high period count and low period count for
>> high speed mode are calculated based on fixed tHIGH = 160 and tLOW = 120.
>> However, the set of two fixed values is only applicable to the combination
>> of hardware parameters IC_CAP_LOADING is 400 and IC_CLK_FREQ_OPTIMIZATION
>> is true. Outside of this combination, the SCL frequency may not reach
>> 3.4 MHz because the fixed tHIGH and tLOW are not small enough.
>>
>> If IC_CAP_LOADING is 400, it means the bus capacitance is 400pF;
>> Otherwise, 100 pF. If IC_CLK_FREQ_OPTIMIZATION is true, it means that the
>> hardware reduces its internal clock frequency by reducing the internal
>> latency required to generate the high period and low period of the SCL line.
>>
>> Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
>> IC_CLK_FREQ_OPTIMIZATION = 0,
>>
>>      MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
>> 		     = 120 ns for 3.4 Mbps, bus loading = 400pF
>>      MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
>> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
>>
>> and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION = 1,
>>
>>      MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
>> 		     = 160 ns for 3.4 Mbps, bus loading = 400pF
>>      MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
>> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
>>
>> In order to calculate more accurate SCL high period count and low period
>> count for high speed mode, two hardware parameters IC_CAP_LOADING and
>> IC_CLK_FREQ_OPTIMIZATION must be considered together. Since there're no
>> registers controlliing these these two hardware parameters, users can
>> declare them in the device tree so that the driver can obtain them.
> 
> As long as DT schema (new properties) is accepted, this LGTM now,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

