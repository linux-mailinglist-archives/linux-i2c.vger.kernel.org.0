Return-Path: <linux-i2c+bounces-1593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA98458C0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 14:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8671F29C13
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA385CDE3;
	Thu,  1 Feb 2024 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UphsFgW2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F475B69B
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793634; cv=none; b=aQ0LhflBbr4zhppJ3Appj/0rXW0E1Wv6zvNZ3h4+r3uBuBLGlbnozSuj4L3B4AEA8Rulbou/nkrTHEzOPMNx+wUczC3zan8VkyzypzXlrwk4ahHLAAXUklhlhFpI9XR2GSlA9zn9ACxsyP8reyHWoQUPRKcC3O5LRMU6RLEEAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793634; c=relaxed/simple;
	bh=aHOwpmWGFTRc1TgF/UQNBvX4kKAG6PnEhbP4URPZdqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJbJFqXmpD/K5RZTov+3lE4Ky/CvmanKG4eakcM6Zxz5DJZc9QkgZzAK82iDgQ2Gr+8uPZQdX0eDOvLW/bsGvyDEqAUL21AU+R7l/qhZAOJ5N+IJuUtMAiZEb6fIW86qc4riilrcWrMm2K9PfTqaJnzxxq8K7ggF3xan/A6lOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UphsFgW2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706793633; x=1738329633;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aHOwpmWGFTRc1TgF/UQNBvX4kKAG6PnEhbP4URPZdqE=;
  b=UphsFgW2xvwRdada9GTIieYuHD+AE/Au+Cdwq+OjUL/UoTw919fy70TD
   sGdns/Spr4asiiphWXNHBQL1XLlrYOBIi9H7g8zBWR3U/35LQapRbgmxq
   awE1X3KZMjpdnK78EvO2iB9BBqTDUmGP2c94NiLAK4mwMBXYh9nmsU3xj
   r6UNQTfzeZUUYnV9iYAiU2XgM70PB51GInyC1UyneYAapfeD8EmZhONjS
   nGD9V9m2pxbFLwAgIywkaU662/pEhP9vXAgn9PXURAGwq7TUSHTcHj4N/
   N5fw17UNYtLh/UokcyqeE5+Yerd9vpe3R87Lx5gNCUyuHCOjZerEGueCG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11268470"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="11268470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738426714"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738426714"
Received: from unknown (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2024 05:20:29 -0800
Message-ID: <66468788-5117-4f5d-bc1c-39180c16821c@linux.intel.com>
Date: Thu, 1 Feb 2024 15:18:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] i2c: designware: Generic polling mode code
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <ZbuJqcmSBzxaAONm@smile.fi.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZbuJqcmSBzxaAONm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/1/24 14:08, Andy Shevchenko wrote:
> On Wed, Jan 31, 2024 at 04:16:46PM +0200, Jarkko Nikula wrote:
>> Hi Jiawen, Sanket and Basavaraj
>>
>> Could you test on your Wangxun 10Gb NIC and AMD NAVI GPU harware this
>> patchset since it's touching both.
>>
>> For the AMD NAVI GPU and changes are less but for the Wangxun 10Gb NIC
>> patchset replaces the txgbe_i2c_dw_xfer_quirk() with generic polling mode
>> code.
>>
>> I've been testing this on our HW which all have interrupt connected and
>> tried to cover also FIFO depth defines for Wangxun 10Gb NIC. Obviously I
>> would like to know how this set works on your real HW.
> 
> ...
> 
>> Jarkko Nikula (6):
>>    i2c: designware: Uniform initialization flow for polling mode
>>    i2c: designware: Do not enable interrupts shortly in polling mode
>>    i2c: designware: Use accessors to DW_IC_INTR_MASK register
>>    i2c: designware: Move interrupt handling functions before
>>      i2c_dw_xfer()
>>    i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
>>    i2c: designware: Implement generic polling mode code for Wangxun 10Gb
>>      NIC
> 
> Last two patches named the same, Something is screwed up.
> 
Indeed, thanks Andy. 5/5 was accidental left over file.

