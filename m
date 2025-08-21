Return-Path: <linux-i2c+bounces-12366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A3B2F8E9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 14:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1795B3B9498
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Aug 2025 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF9D327791;
	Thu, 21 Aug 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU/yT1ub"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC6321F53;
	Thu, 21 Aug 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780349; cv=none; b=SWzxo7ZxsbA/4Ufrl1i8Xvekq6G2XqsXeOMjvXFyzs86uz2k7SikRMVAF2c4BgzyH8hSF6OwkHgaFk5x0mjxcTObizjJ9NyopEtUf9oZnFI73toz/A/ZC2h60ngDSCn385e9RRacLIF8f+niOSzs2YInsKiykBCPtnvsDmC1cpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780349; c=relaxed/simple;
	bh=7ft+E496A/veAqJoBKSUqOrgUmpIro4+MsMCXnzju8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eicem2xJ6viNk6SUY0hACW++kuoddLxWqKt8nLI/IALiy00Ne8z5QYXTCZ2qXmVtPJPvNp/TN7v/OHkMz2Wsg/1E6Hxqqsl0/EPdTsQ96Y6o1C/tR99kKqvx3qMWWg8QxBvYiKQZWX0nxUSVgjHk86zyf+HvKlxYop4VChyCaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU/yT1ub; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755780348; x=1787316348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7ft+E496A/veAqJoBKSUqOrgUmpIro4+MsMCXnzju8c=;
  b=hU/yT1ubkGO04TNahg+yGxGKgLj8rlrUXhlHAEBHkXF8bhG0mWHeB2Z2
   rLEn8ijlVznP9Ga/yA9Rnwnty92BWhrVVkUlTtb5NiqgVMvx4tKBC6wkJ
   tB5tpGdBsKcqoE860kgAfhWdR0nfP3IaQ5gehbdXvDqtUtK6fyEpudPq5
   75KW4Z4N78DKEkboXxGIOmVWz5qc0tD8Dcyn35ldm+lQ4i0eJ+2fBTCSm
   arN33PPVzCgZTiJSCrq9YnXi+rz1w0a8SWQstJcZwQfZVrRw9swM8uyvI
   mkTbMW1GsljTiJ0QMi0GL5KbrV5tWo9vLSIXO8lbdpiFhNNJONIDTos03
   w==;
X-CSE-ConnectionGUID: AFoXna+uTqC4ZMdOS5Zl3Q==
X-CSE-MsgGUID: uuZ7YuvVRIyk236TKrIVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75518612"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75518612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:45:47 -0700
X-CSE-ConnectionGUID: yriHNaxcRaOix0BmtKBA0A==
X-CSE-MsgGUID: LlhTI8CXSzGloTQSHERMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168761875"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2025 05:45:44 -0700
Message-ID: <7198221a-1f12-49cf-9d35-7498ae7389cd@linux.intel.com>
Date: Thu, 21 Aug 2025 15:45:43 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in PM
 callbacks
To: Jisheng Zhang <jszhang@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com> <aKX4xEYE29JC_g14@xhacker>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aKX4xEYE29JC_g14@xhacker>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 7:33 PM, Jisheng Zhang wrote:
> On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
>> On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
>>> This is unsafe, as the runtime PM callbacks are called from the PM
>>> workqueue, so this may deadlock when handling an i2c attached clock,
>>> which may already hold the clk_prepare mutex from another context.
>>
>> Can you be more specific? What is the actual issue in practice?
>> Do you have traces and lockdep warnings?
> 
> Assume we use i2c designware to control any i2c based clks, e.g the
> clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
> mutex, then we call i2c adapter to operate the regs, to runtime resume
> the i2c adapter, we call clk_prepare_enable() which will try to get
> the prepare_lock mutex again.
> 
I'd also like to see the issue here. I'm blind to see what's the 
relation between the clocks managed by the clk-si5351.c and clocks to 
the i2c-designware IP.

