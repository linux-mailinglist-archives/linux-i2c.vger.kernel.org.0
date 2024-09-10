Return-Path: <linux-i2c+bounces-6476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88256973620
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9ECA1C24665
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB1218E773;
	Tue, 10 Sep 2024 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhGevTi5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126018E76B;
	Tue, 10 Sep 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967212; cv=none; b=SQlQDJm+K9I+77DsfPM+QYC/9d/ka0paaahbIj3iBKyShFJGAfETsZwid51OzSfhux1UQdQCudoeojnoemTUGp504MIrDKPjU+TZNQne9J5BnS7BQotXci3elaUnb00JgtzYX+JD3F2L/OWYLCsHoB7H02Mil5fI6YhzXVkPqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967212; c=relaxed/simple;
	bh=rjSAcUspmC1erC075y4kkh9aADQDozFpK3nh4qi12uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlXwFBoI9vM+BOFAa+UPC3J6iEX5zzW3Z2tqYp2REuYJoHinG/PpQt7LgfqkZ71NRU0ZG89YvV5JpXMYIBXhNvwPqBXkR0DBveBrGmfIfCmUtbvXzV6m1nbySdwrhMtn5IwLzXrOjc7kmvypUNeFWNTAuV6CkBpWfwp5jWvfKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhGevTi5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725967210; x=1757503210;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rjSAcUspmC1erC075y4kkh9aADQDozFpK3nh4qi12uA=;
  b=OhGevTi5AkW0N+M01WVtdMLexcO5NPbgF1hAdoNpy5Pxkvs4ktHgGwBn
   oic+Ei+oSuf7FMH+ILWEihf4W3bOMmVs/tY5T0cbwRwvbe3G7LL5VzA9r
   /GH13O/7jJi81qIFFXq/1+vfABQ6ThO3w2WNPY9zvAGG7XprkA10Dg3eq
   gUQ4kK6PhFCKmWguuq7uMiV97/jUrUnAjxSAlshiXkblzXR4I8lE0wgpj
   7M7OakiMDQ6ma7tJZfzISggJr71XG63HVCK/v76HwjSta1K1PkJ/gVLqV
   1K3f3fVLqX3m1Ei2opJmRrhc3buWXPEfq7uJKeqCYRtmOAlLqLxkarh3/
   g==;
X-CSE-ConnectionGUID: PDB4GJoPR4SH9ioWWoa62g==
X-CSE-MsgGUID: Vv5P7XqJShWVK19Kx629nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24901165"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24901165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:20:09 -0700
X-CSE-ConnectionGUID: RcDe75R8QkSddEGNeSS98Q==
X-CSE-MsgGUID: iXnIP94LTLOWfiLrhxTI2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71118578"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2024 04:20:07 -0700
Message-ID: <a2de8e23-d2a0-4585-8b51-2144801eeff8@linux.intel.com>
Date: Tue, 10 Sep 2024 14:20:06 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
To: =?UTF-8?B?TGl1IEtpbXJpdmVyL+WImOmHkeaysw==?= <kimriver.liu@siengine.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "jsd@semihalf.com" <jsd@semihalf.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/24 12:38 PM, Liu Kimriver/刘金河 wrote:
> Hi Andy,
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Sent: 2024年9月10日 17:03
>> To: Liu Kimriver/刘金河 <kimriver.liu@siengine.com>
>> Cc: jarkko.nikula@linux.intel.com; mika.westerberg@linux.intel.com; jsd@semihalf.com; andi.shyti@kernel.org; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v8] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
> 
>> On Tue, Sep 10, 2024 at 02:13:09PM +0800, Kimriver Liu wrote:
>>> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
>>
>> "...observed that issuing..."
>> ...bit (..."
> 
> 
>>> IC_ENABLE is already disabled.
>>>
>>> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> 
>> "...bit (..."
>> master --> controller
> 
>   Update it in V9
> 
Please add back also kernel errors that are shown when the issue occurs. 
I saw those mentioned in the commit log in some earlier version of the 
patch.

Those may help googling the solution (i.e. this patch) if somebody sees 
similar error on their HW.

