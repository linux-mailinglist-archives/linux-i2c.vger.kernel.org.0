Return-Path: <linux-i2c+bounces-3729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7798D63D7
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 16:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD7F11C2160E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 14:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A849E15B0EB;
	Fri, 31 May 2024 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbK9s/zi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9815B128
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163680; cv=none; b=E9aUoc0uK6incDX5WrVqrpGslDOsOxxprLpxKmws8sozDF10lOLOkVO6kspYErG1q8AQJC41WWzDhX8qKNBsxWW/4V45hcBcJCdtIN9+FeAXR5z3m41Yu2sc4nVMQgemUMbeXXVn8IwDEd+Fd+Kv9JfIiVlFx3HhHyl8R3H2Ozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163680; c=relaxed/simple;
	bh=XR/ddc62BPork8DuyEUzWe7Wo5ppryZ51hCLzsBTeZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+PPD6RVMmUXrjFJdN49GWLla8/dDBCOazkjL9lUJ4geNG6YXQD7T+Q+/CpMGR70JhQvZi8/gyaNllgC/5mA8oK9ZhHmvYAPGZEZm53xesvY4AiroGHOF/C3eOXc7VRO8tjzJAPAOva5cCPzs8/Yu6XnjYcDi6I3j8TPY07txNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbK9s/zi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717163678; x=1748699678;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XR/ddc62BPork8DuyEUzWe7Wo5ppryZ51hCLzsBTeZw=;
  b=QbK9s/ziZFnb5qrz2bE99Apj8SIYs48v+xzzkF3eKx4piR69ZXTiVLnV
   IVoGO/u5duymcXldrCAD2hzxBi94CKSHZRnG27+ma0jU6t5NYQ5LISunu
   +9oEMPCdAT8Q88rlULP2Dn+xdl0u3z20tjTinfU6/tjZNJ928JVIgxJvJ
   f9HvUdB3j9YWycfBw0hx5Qx9ziSBuNIpXAk65f7a/dVrRFj06dxVVpc92
   mWocLcgl4khvTpvhiQ/BiXK5pfGjCEW3rWCRCPnxo4N68la6WOmKkovH/
   w4JBjRiPCwo/nFp1yM4EcbNGvQsf4JD6IykkPPMXprGcVmF7t9frCCtPf
   A==;
X-CSE-ConnectionGUID: l1yGNl7kShaWPnTOVqjgtw==
X-CSE-MsgGUID: DMCZ7kFDR0m2DIf6JOvZ9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17552318"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17552318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:54:38 -0700
X-CSE-ConnectionGUID: iIz30gftRoaQDqqlalwDTw==
X-CSE-MsgGUID: J/aN8dCHSEGccmvWyQq1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36157633"
Received: from ehlflashnuc2.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa008.fm.intel.com with ESMTP; 31 May 2024 06:54:37 -0700
Message-ID: <a93e1889-7d81-4730-b50c-a727a09504d0@linux.intel.com>
Date: Fri, 31 May 2024 16:54:35 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Fix the functionality flags of the
 slave-only interface
To: Jean Delvare <jdelvare@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <20240531111748.441a85b6@endymion.delvare>
 <ZlmXDgHnWNvVIN20@smile.fi.intel.com>
 <20240531113113.47225d65@endymion.delvare>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240531113113.47225d65@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/24 12:31 PM, Jean Delvare wrote:
> On Fri, 31 May 2024 12:23:26 +0300, Andy Shevchenko wrote:
>> On Fri, May 31, 2024 at 11:17:48AM +0200, Jean Delvare wrote:
>>> When an I2C adapter acts only as a slave, it should not claim to
>>> support I2C master capabilities.
>>>
>>> Fixes: 5b6d721b266a ("i2c: designware: enable SLAVE in platform module")
>>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>>
>> The below can be separated by
>>
>> ---
>>
>> to avoid noise in the commit messages. The effect, namely Cc'ing to people,
>> will stay the same.
> 
> Noted, I'll do that from now on.
> 
>>> Cc: Luis Oliveira <lolivei@synopsys.com>
> 
> BTW, the address above is no longer valid so it should be omitted when replying.
> 
>>> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> Cc: Jan Dabros <jsd@semihalf.com>
>>> Cc: Andi Shyti <andi.shyti@kernel.org>
>>> ---
>>
>> Other than that, LGTM,
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>


