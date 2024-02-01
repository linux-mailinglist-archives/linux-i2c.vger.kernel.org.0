Return-Path: <linux-i2c+bounces-1594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D998458C6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 14:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66521C237C2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF9D1A27A;
	Thu,  1 Feb 2024 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nME8et1U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6E1EEE8
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793722; cv=none; b=EQssFTLXJUuKprj9KGVhJnEK/bUtZNGRxf43TDGYWHx6x4/KRGDzB7vCHbNMHDwu0hCOFt7qaTS0YgzmlXVgDh6SKK3FrrTTelxe1rBBq/ltielKya8p7IjGLcsG4CIgZvJSmY2XDhfdU+b6KR/uQeIuEuV+cP8vL2nmGiSMgTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793722; c=relaxed/simple;
	bh=pExjiBYTNeENk5SfsLU3qRFBY0hjydejGfO49o5wAys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qhg4ciSt0WQecGkyw8GQAS9fnKtG7Ld+ofq0nIcALPMKIiqp4m1SIwduERdVWBTPIDLd9zWSl++y38E0ZgKDuw33ylqp6QaDlaSkWyqHg7EAyshQX2zopGq+lFNAmKxADcMr1CkjT9y+aSa18UoevvBQiF1qRI9gqFb+FaoTYTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nME8et1U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706793721; x=1738329721;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pExjiBYTNeENk5SfsLU3qRFBY0hjydejGfO49o5wAys=;
  b=nME8et1U3leyBrCdFE0Ouv5Cpiq7OykilD94JpuGZypIJ78vce0VKyQT
   54XzF95bgfrK0In7z3q20TArW6Tgc9mAOx35xz3hGvlgcdKdCNw36p3h9
   N1wMTNnD+3GGL4A079KeOQKpJLvsxwJ/w+5V+tLzoK7u4K/t0E+ENbEGa
   mw7f2JBbJ6M0Rl/1q6VmPhuaxB/AnNR1L0npagC5Rj07LmqBToXfRPAdz
   sZjCxPCnHG38GXVHSyqNxr2vdjfB2HiSjccA/girAmi0ONi4TxsYuuZQ3
   d02yVl3XrRcfJciSfm0MKKG9x8SzRlwgWECjmat+UqIYgx4GxsuO38iF4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11268633"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="11268633"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738427017"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738427017"
Received: from unknown (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2024 05:21:55 -0800
Message-ID: <e5ed3eeb-8301-4498-9ec5-e1eb624f176a@linux.intel.com>
Date: Thu, 1 Feb 2024 15:21:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i2c: designware: Implement generic polling mode code
 for Wangxun 10Gb NIC
Content-Language: en-US
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-7-jarkko.nikula@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240131141653.2689260-7-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/24 16:16, Jarkko Nikula wrote:
> I got an idea the i2c-designware should not need duplicated state
> machines for the interrupt and polling modes. The IP is practically the
> same and state transitions happens in response to the events that can be
> observed from the DW_IC_RAW_INTR_STAT register. Either by interrupts or
> by polling.
> 
> Another reasons are the interrupt mode is the most tested, has handling
> for many exceptions as well as transmit abort handling and those are
> missing from two polling mode quirks.
> 
> Patch implements generic polling mode code which shares the same code
> with interrupt mode code. This is done by moving event handling from the
> i2c_dw_isr() into a new i2c_dw_process_transfer() that will be called
> both from the i2c_dw_isr() and polling loop.
> 
> Polling loop is implemented in a new i2c_dw_wait_transfer() that is
> shared between both modes. In interrupt mode it waits for the completion
> object as before. In polling mode both completion object and
> DW_IC_RAW_INTR_STAT are polled.
> 
> I decided to convert the txgbe_i2c_dw_xfer_quirk() straight to generic
> polling mode code in this patch. It doesn't have HW dependent quirks
> like the amd_i2c_dw_xfer_quirk() does have and without users this patch
> is needless.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h   |   5 +
>   drivers/i2c/busses/i2c-designware-master.c | 169 +++++++++------------
>   2 files changed, 77 insertions(+), 97 deletions(-)
> 
Please discard this 5/5 which was accidental left over file in the same 
directory with the patches 0-6/6.

