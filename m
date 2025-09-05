Return-Path: <linux-i2c+bounces-12677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C411B450D8
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D951E7A86D4
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 08:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B432FD7BD;
	Fri,  5 Sep 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqzZy77y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297D2FD1A1;
	Fri,  5 Sep 2025 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059479; cv=none; b=ZKdlOmBUc4g1ES71Kw8BDmmjEyzqnA7nIwenjasav0ftZE4tpY9+YLH6T613Cl8Me92ED6wRABw0/GaQOGzD/JMSeP7ZrVumUE1bsHCmYZLUC2ekthX671ToGhTo4axuOjV8RMdHYjsOnfF7FvUbqCILP9dgZfN0ABhkLsLzZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059479; c=relaxed/simple;
	bh=Y4OW2NlyscQTI3fNszjhP+YqdyCAN+FN0ThPKnfR+gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0mKRE29z/5CJk9X185ToOK4o5ijKTj/6pJF4bBEYuaKZe0CGV01UWO3muX3jmQHCByF/U1bTssmGkWh+hJMIOramTAVcgYDXSOe9t9Zrc57QSU+01XjkCCThZsK43v9P4nLkl7dgQQk8IV7GTgvstR5A67otoAoXdmZ0JFjXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqzZy77y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757059477; x=1788595477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y4OW2NlyscQTI3fNszjhP+YqdyCAN+FN0ThPKnfR+gk=;
  b=DqzZy77y661f27lMQVgO+Psu/mJN9M/aJZOQgGvGiKy4ufRtM0v0gIrk
   C3rB671rwmYAlCuKDsiNo8keo+XHPEtSes8JW5vVvrA1sOALYRCgQq6Ip
   U339fgmaV550Md28WKvtGzDOeaHuJ6qsux0ZkrUtFoehjlNMeEtZJ0h8Q
   00dj3HYSVJ6rdW4zXlXgYJYEiIbuiMMIk0E9MzNOrWXPj8PgnOrFHx4Hh
   LFwHDBpXgmJmoMP0l8NnQr0YGtXLn6xlk96+qA/PLioR0hN8IzwsXKoCh
   RnRDnFzsAwHzdLOljSY2XYlzMuQelv4qVND8RVAXzzc96Xe6jHOxu7c4T
   g==;
X-CSE-ConnectionGUID: TYlweBfSQkOKscwMcDDPhw==
X-CSE-MsgGUID: gyMPCPyuR+yZCzDmFUOFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70022847"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="70022847"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:04:36 -0700
X-CSE-ConnectionGUID: Xavvb35tR22mlZyztUFXWw==
X-CSE-MsgGUID: KBxfAavPSDmHDY9vd6Xo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="176449218"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2025 01:04:33 -0700
Message-ID: <61ecd626-1081-4bf0-8db7-a68980f31e45@linux.intel.com>
Date: Fri, 5 Sep 2025 11:04:32 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: designware: use dev_err_probe() when probing
 platform device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
 <20250904-i2c-dw-dev-err-probe-v2-2-e59da34815fa@bootlin.com>
 <aLmqfQm2w3y1MM_2@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aLmqfQm2w3y1MM_2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/25 6:04 PM, Andy Shevchenko wrote:
> On Thu, Sep 04, 2025 at 04:31:07PM +0200, Benoît Monin wrote:
>> Add calls to dev_err_probe() on error paths that can return
>> -EPROBE_DEFER when probing platform device. Namely when requesting the
>> reset controller, when probing for lock support and when requesting the
>> clocks.
>>
>> PCI device probing already use dev_err_probe().
> 
> Makes sense by at least two aspects:
> 1) less log spamming for deferred probes;
> 2) easier to debug an issue (I assume it's your case).
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

