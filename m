Return-Path: <linux-i2c+bounces-8344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B59E4F71
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 09:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F15A1881A93
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 08:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFED21CF7A1;
	Thu,  5 Dec 2024 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diiRW2N1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB871B4F1E
	for <linux-i2c@vger.kernel.org>; Thu,  5 Dec 2024 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386368; cv=none; b=RMtJJeZAs4HjIJ37T2DAsMjZgVCgCy+4LH50/HYfTsx4+rrFhjHXIVZzyV3l8I3u9Sb6qYH0/7hszmDbiWAAU+mdUJKt3RsM8bD3JqZKFKu/Ghylc59FH0UFaPC72A4WneLsFJt7PtNxnYSgm0JQNR0Fo+MpcS1aPu2E3kmGr3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386368; c=relaxed/simple;
	bh=jb6GBPdgcnQOIyKMhtZDFh5/ZeOVyYvMuo4o/VRL54s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkjG/FGA/DZQIaHBO3xZcHYj17u8rm2AxCH2DlZu1IZYr7heDDuMGhylpiwwYyF07V7pt/HLjDo4HrY4TukasOZwT48wZ5+ERedZAKlJbDashRLcLzdtcuZbgTtR2fqNV+LmGZsCZdGOIUgvsZoH7uMoFdxImhJuzRHibT2Oj70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diiRW2N1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733386367; x=1764922367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jb6GBPdgcnQOIyKMhtZDFh5/ZeOVyYvMuo4o/VRL54s=;
  b=diiRW2N1vIkdnZnQc+e8JEZ5HxifXVq7EirSqys9P5UZlsOqHTQkeogt
   e2jRLYDSPaRqy/YyXagFLWTiljeQW2Y4NG6sQUNezN+zk4W6l5ZJNLvZi
   ZzU4Y0qXM167fMUoRnoEt+TW26hJWJax+T3xcDrR8/b8lMT4i9wLrbusH
   h9CS/AvGKrf4fsRAY9cAXTiugT9u7uf6FuPM3uieaTGnX2XmNB+CmCh6G
   qYeE2E/T7VMLeizoSPC7wH46VMJKo0pgoIv1OEZwt9jfp6rl5kePsXGsM
   SztEyF1/gAZtw6+ewt+Lgm4QEmik4AuUOnhx6JJUAfv/PyYAeEut0RlLf
   Q==;
X-CSE-ConnectionGUID: 3ffcKCweRGu8w1E8Ni6XUQ==
X-CSE-MsgGUID: BCoMMFAMRCC6hRiAvcNodA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36522680"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="36522680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:12:46 -0800
X-CSE-ConnectionGUID: zfTVebt/ROWhqqTH092wmg==
X-CSE-MsgGUID: yqqC29kzTBGUEL6PVfs/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93909668"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2024 00:12:45 -0800
Message-ID: <907e39c2-ca06-4b51-9fb0-5b0745bf0f56@linux.intel.com>
Date: Thu, 5 Dec 2024 10:12:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
 <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
 <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/24 9:53 AM, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 11:25:40AM +0100, Uwe Kleine-König wrote:
>> On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
>>> On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
>>>> On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
>>>>>> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
>>>>>> is included. So move the define above the include block.
>>>>>
>>>>> As in the other email I pointed out the doc says that we need to undef the
>>>>> symbol. No need to move it around.
>>>>>
>>>>> The only requirement is to place that before any EXPORT_SYMBOL*() we want to
>>>>> add it to.
>>>> [...]
>>>
>>> Perhaps we need to update the documentation first.
>>
>> I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org/
> 
> Thank you!
> 
Andy: is this your reviewed by? If so then

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

