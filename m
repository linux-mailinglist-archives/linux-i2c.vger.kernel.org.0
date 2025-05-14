Return-Path: <linux-i2c+bounces-10980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C2AB638A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 08:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38A218955DF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 06:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6405E202F60;
	Wed, 14 May 2025 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI4RaqVY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE4B1FA15E;
	Wed, 14 May 2025 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205886; cv=none; b=GbQDdOMeaHOuahoZuOS0BE3dy+PdT9wBB9/H+8SxAqsQ/drTmRyTOzxhEi+6SZ4adxP6mhoCgIeBPYKEacKY6R+VNj32VjDZQwtBsOpTsxvUbyq53/oSOiEqLswNC8boxv8IIFHFllL/VfZJ6TYYKLgjVuXp7QmoG1/bXnkKCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205886; c=relaxed/simple;
	bh=zg++miu9lvZ/ztxQ2OLAIZiUs9L94mXGfd7UwI6SWY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWWqw+ajHWMaD/f87hG1bnaX5UqlgCmRKslF3S7Dfbyqy8yAWbd8Q2N0sA3g1aAQ3pZDbrntS/iCwbV8YZVmGH4Ye4LHbOoa2hG3ZKqTL5SJULGp5TEx7owvRvekwqidhXup/gbaUUiO0euvOn5PMeP9i7G+C8xj5rbzqLm0El0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI4RaqVY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747205885; x=1778741885;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zg++miu9lvZ/ztxQ2OLAIZiUs9L94mXGfd7UwI6SWY8=;
  b=FI4RaqVYfmpu8Vudh3b8y2fK3ykSsJkcFb3Zgj2a7lq2R35Xt9Giu2Z3
   aqzxg0p/vo/rxhR2JXwiwanWc97ZRtQpg3x7LBlXafIu4yTAvpUXabv/7
   1yEpl7AVBj2RKgqoVHobIiMOKPMQ0v1yO1nmayIo4ne+fzyj0/FqKzZ5i
   KrKObyrV0klwEKpO0tUl2OMU2+HJH+zC2/Ff1ryWvPmbj138MDfmtYAeV
   HOcRoIz6nrQ3ZEQGEhn+rQnt2SurB9tc7xukVVkCnQYvFm/VuHNn10Kzu
   VUpSJK4GRc1Jc8eLa2+0Nu+q4GMrjfUYVFp0cKTYbdYvmJSOQkCFL2eKZ
   A==;
X-CSE-ConnectionGUID: zkiHTd6SQZ+4wx/xFt+pMA==
X-CSE-MsgGUID: yebn6M33RzC1eEZyxuBiRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59744201"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="59744201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:58:04 -0700
X-CSE-ConnectionGUID: A9nEmokyR4qykuRC4KEErQ==
X-CSE-MsgGUID: vLcUm8+LT9acG5CG+6mDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138437928"
Received: from unknown (HELO [10.237.72.53]) ([10.237.72.53])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2025 23:58:02 -0700
Message-ID: <19dce124-1a73-4f92-b4ad-4c95c73364cb@linux.intel.com>
Date: Wed, 14 May 2025 09:58:01 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: designware: Don't warn about missing
 get_clk_rate_khz
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513124015.2568924-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250513124015.2568924-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 3:40 PM, Heikki Krogerus wrote:
> Converting the WARN_ON() to a dev_dbg() message in
> i2c_dw_clk_rate().
> 
> That removes the need to supply a dummy implementation for
> the callback (or alternatively a dummy clk device) when the
> fallback path is preferred where the existing values already
> in the clock registers are used - when a firmware has
> programmed the clock registers.
> 
> The fallback path was introduced in commit 4fec76e0985c
> ("i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt
> registers").
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

