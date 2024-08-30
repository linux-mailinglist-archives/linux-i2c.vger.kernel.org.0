Return-Path: <linux-i2c+bounces-5946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA19656EB
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 07:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA72284811
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779CC14884E;
	Fri, 30 Aug 2024 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+v7izWE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6A4683;
	Fri, 30 Aug 2024 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724995936; cv=none; b=YbKq7I+dZHGZDvUQaW99eH43HgRlQr1Qz2SvpbJWlR8CoDyVXneSqmjt9crmCTisN5pAz4M+0brseUUsJLsIaSP0X8dYGkWz18VRKOHwMxnaJ/KsFZ/H5wt8x4jdgi3dHSVhZ5mwzD1GIhAuj9zptw/i4rKgTnNtm8GQvVDO8tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724995936; c=relaxed/simple;
	bh=J8z+rX2pZ9+dry5/V78IuKVUK+zB38v/cOVOuHDyB3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5kSngGM8WcnhV0cJPCtKem6V8ZFKW6/DZOaN/+dsuEDFcOrl3A7taPhzONshEe8Wx7li9J9fBmWeVse8m+SWjk0bPCs5P88ZZlalChK/ebTYQJn2Q2UdnCW4f8aWwjsbVG8CFQQGMweCIhIj5zJNOu2Nqmcpu0vB17WyY9thLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+v7izWE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724995934; x=1756531934;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J8z+rX2pZ9+dry5/V78IuKVUK+zB38v/cOVOuHDyB3c=;
  b=f+v7izWEoxw3+23vC7nxf11EeljlISv36z8ndMZlKw8kTGa83LchApdf
   FlrOWmMWkzHK0pW/dFMJm+RfF/malGBz5Pm42X/pyqty3Mb6DGb7+Rvyb
   Ch1s51vvBJRGgNNQToHDNoSzwKc0Z0olGSs0Bemy9I0FEw561UfKLce6Z
   2xaZxf/YoXwZiCTfvs1TPhWOS2ML7ANfhim67ZUmOVtflZQOzyn9X060V
   my8xCcYUjEc5FXmD1Lr7da1nG69Nw029gnBOMsFdkVsiPtnDYkH1Epp3U
   GwO9OJ0VWL86SZR6jIpuvzR2SatBpJG7JBmzje4jFmJgZcealSu1bWLWr
   A==;
X-CSE-ConnectionGUID: gOkJtxMcSXW8fO8YqjVkWQ==
X-CSE-MsgGUID: MjX9OLfrR06TVUn4pn3+Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23506980"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23506980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 22:32:14 -0700
X-CSE-ConnectionGUID: 1hD+BdonSIy1j5hsg4VUXg==
X-CSE-MsgGUID: 4JHvl8W1SymzfRRkMO4V+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="68610544"
Received: from unknown (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Aug 2024 22:32:11 -0700
Message-ID: <708aabde-58fb-48ea-80af-bcbf60d95a81@linux.intel.com>
Date: Fri, 30 Aug 2024 08:32:09 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
To: "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
 Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>,
 Shyam-sundar.S-k@amd.com
References: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
 <9d424592-c157-417a-9d6e-d12d80e19829@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <9d424592-c157-417a-9d6e-d12d80e19829@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 5:55 PM, Goswami, Sanket wrote:
> Adding Shyam (as he asked me to check this change on AMD systems)
> 
> On 8/27/2024 8:30 PM, Andy Shevchenko wrote:
>> We have the same (*) PM ops in the PCI and plaform drivers.
>> Instead, consolidate that PM ops under exported variable and
>> deduplicate them.
>>
>> *)
>> With the subtle ACPI and P-Unit behaviour differences in PCI case.
>> But this is not a problem as for ACPI we need to take care of the
>> P-Unit semaphore anyway and calling PM ops for PCI makes sense as
>> it might provide specific operation regions in ACPI (however there
>> are no known devices on market that are using it with PCI enabled I2C).
>> Note, the clocks are not in use in the PCI case.
>>
>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Tested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

