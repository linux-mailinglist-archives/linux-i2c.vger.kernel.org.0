Return-Path: <linux-i2c+bounces-12676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF9B450DD
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31D4256125D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 08:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE15F2FF155;
	Fri,  5 Sep 2025 08:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BahF6hnq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA22FD7BD;
	Fri,  5 Sep 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059469; cv=none; b=am1hacp3zX88q770cYFzMTMbYOtIOIoiGYtFDi9QWblZ0sS3afCW1lE87IdqG29INjrsHvdx4FXsYeIOXyu40CQwrv2c4m905N3d3OlHt4d7OJqurmevzk4Y8fkEC4XWcHGg7aNNCbPJfgOs2fQVpnu+jeXZY0apXmZ/zWoqZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059469; c=relaxed/simple;
	bh=BrKdr3XhHJwQOgkC5TmuWzJqeC1gvilVU3T6N7RnYM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnyFN15em6aTC2rCqblW2HujKmalLt61l5Vs/Af+ky0AUBcPJOOpNdBHRpfnjt1aESAX1840hNSkOE1Lky630JG+2wZTzgBFuC92TCCMsS0G+DDtH0f3Xqeg6I4MV9vUsWOZpoRZYBjxhbsU8AmjRH4dn9WosX4Cpdh5IZAmoKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BahF6hnq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757059468; x=1788595468;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BrKdr3XhHJwQOgkC5TmuWzJqeC1gvilVU3T6N7RnYM4=;
  b=BahF6hnqShQEYTyiWR9mPNdvg7qkj9HO6/pIzXJ7MFWmjMwI25KB1/N4
   i6BcmYnxAU3mjPaF92pByAnqTnT/PGYRPS7xkn1TN4Reb37CC1S4VfvjQ
   as4frV+eIShpviRxaETu+ZGCUToUPWxklSDnprB8FjzxMcfsXbfzpmBU6
   IVqiTcTHtRi39ppJqnS1HzJ7hO2AyQET02dbglF3Ct5Cn2mzvw/Z4+MUx
   dg4ThRGJTJVtW5cOQJq/EkFtnuf/jcEFuRFmpgSghhc5y9ea0W4wS5x5g
   f0BfXRSlll/JafryQHC20f0mdDhvXOle0WMK+SnjR1ReNL+IRpIHpKKxh
   g==;
X-CSE-ConnectionGUID: xAGfFTPeQH60wT0FQuWaIg==
X-CSE-MsgGUID: Do//6EnASp+qAF2DKM2WkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70022839"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="70022839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:04:26 -0700
X-CSE-ConnectionGUID: HSDSkKWZRr2B9g6b0gXcKQ==
X-CSE-MsgGUID: DXK6EYcYQBitEt57En04Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="176449192"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2025 01:04:23 -0700
Message-ID: <38c8816c-408c-4f9f-9c31-84072326f066@linux.intel.com>
Date: Fri, 5 Sep 2025 11:04:22 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: designware: convert to dev_err_probe() on
 request IRQ error
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
 <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>
 <aLmqCW1YwrhZkNSG@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aLmqCW1YwrhZkNSG@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/25 6:02 PM, Andy Shevchenko wrote:
> On Thu, Sep 04, 2025 at 04:31:06PM +0200, Benoît Monin wrote:
>> Simplify the error handling of devm_request_irq() in
>> i2c_dw_probe_master() and i2c_dw_probe_slave() by converting to:
>>
>>      return dev_err_probe();
>>
>> instead of calling:
>>
>>      dev_err();
>>      return ret;
>>
>> This also handle deferred probe error without spamming the log.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

