Return-Path: <linux-i2c+bounces-3365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92F8B976F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 11:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11F4A1C22A3C
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FAF5380F;
	Thu,  2 May 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvIsmP1n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA3537E7;
	Thu,  2 May 2024 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714641570; cv=none; b=bLJ3O1TuKH4wnsnsxYtfDbU6SbhNJsiiLBEuelrOt04twNjkW863+/zxVZYAbtRO2tkF1nuXpU0YfaZ0hivYk44+sdyE+pZJ6u/XAAqcQXyHUaFUgqd5MxA567UlwvcDul0XtjLJ294DjJVWmSQkmNez4VXvkpJbI65NSl4jVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714641570; c=relaxed/simple;
	bh=icDwQ3NnzKzaEU0fVTxo5GzqH06fgDy1OdNdLXdTKSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdWhqdEIJvBBnMiY/5lLjIY1xz/+lu4lk56hvpyS0RKDX+sG9OTPw2uK/UhlKDjVb1HBEjGt4waoizby+6rRRDEJ/KkBRnEKLkvgydEtVg3L7eu8jiAtTssN41KOMxj5Gd15hkBu8/YkfYKer9Qq+pCWsINzB14WfHOgF/x687U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvIsmP1n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641568; x=1746177568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=icDwQ3NnzKzaEU0fVTxo5GzqH06fgDy1OdNdLXdTKSs=;
  b=HvIsmP1nTrGur4ZIaFDLV3LC9ozEtWHmcZgGHdFVc2UsKVZPNY7vmH1y
   rWnK1xKk12+dz5GDwd09JzAiCUNjA1IoNQj9RUTJu93uj50V71UXYpZ4L
   MOcidFFtIG4uwvCdTzgmR6BK4DKpeuN9BpLopR/4XG14jHS7VkZTvKU4q
   oLgfwh3YFdushsjcam1fdKawmCAJ7Ex/NikInpW1X2hjyZim3fXdiMZ2i
   0Tyrvz8ekLEJdDa31CsnxRWZxLUOrcNDDC/gZF/M0QWn971m9TzL+GVRG
   wM1FNfg4HiVyIabyTjPZagDldbtGGcAyE4sWeHYlJC2KlJQ96sep2KOiE
   g==;
X-CSE-ConnectionGUID: oAArqpbjSVWiACZUqe2UkQ==
X-CSE-MsgGUID: yqFoPueoQGSXeWlGALX2iQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10273887"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10273887"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:19:27 -0700
X-CSE-ConnectionGUID: clc1dKztSw6SpXtD+ktJoA==
X-CSE-MsgGUID: i52VyOUxS2C9j0vRnbabvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27179198"
Received: from ehlflashnuc2.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa006.fm.intel.com with ESMTP; 02 May 2024 02:19:23 -0700
Message-ID: <fdbf6547-7e6d-408d-8ed8-13e449de181d@linux.intel.com>
Date: Thu, 2 May 2024 12:19:22 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] mfd: intel_quark_i2c_gpio: Utilize
 i2c-designware.h
To: Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Lee Jones <lee@kernel.org>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Duanqiang Wen <duanqiangwen@net-swift.com>,
 "open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
 "open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <20240425214438.2100534-5-florian.fainelli@broadcom.com>
 <Ziu6gDOqhEYQNhcH@smile.fi.intel.com>
 <fidbc7locp32lypdui67crj3qkj3nbcp5vpxcnlxrdmme2sn4c@npdan5ncxxog>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <fidbc7locp32lypdui67crj3qkj3nbcp5vpxcnlxrdmme2sn4c@npdan5ncxxog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/24 12:36 PM, Andi Shyti wrote:
> Hi Andy,
> 
> On Fri, Apr 26, 2024 at 05:30:24PM +0300, Andy Shevchenko wrote:
>> On Thu, Apr 25, 2024 at 02:44:37PM -0700, Florian Fainelli wrote:
>>> Rather than open code the i2c_designware string, utilize the newly
>>> defined constant in i2c-designware.h.
>>
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> P.S>
>> Note, my tags for MFD patches does not imply that I agree on the general idea
>> of this series, it's just in case if it will be approved by the respective
>> maintainers (I²C / MFD / etc).
> 
> I waited a bit to see if more comments were coming.
> 
Well I had doubts about the idea will it help maintaining code or do the 
opposite but didn't receive a reply from the patch author:

https://lore.kernel.org/linux-i2c/62e58960-f568-459d-8690-0c9c608a4d9f@linux.intel.com/

Also Lee Jones have similar concerns:

https://lore.kernel.org/linux-i2c/20240502071751.GA5338@google.com/


