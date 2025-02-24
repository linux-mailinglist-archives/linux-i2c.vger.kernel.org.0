Return-Path: <linux-i2c+bounces-9550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80CA4199D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 10:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B04316F2DF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2025 09:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F7F24A059;
	Mon, 24 Feb 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4D8VNGP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28B245035
	for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390804; cv=none; b=m8UCnLdAZzvzP9oRMZdm0tSMSzv5wrZVdiSR52oNR6W810hrBsRVfOR9illJTA5AUd4KkfeznoCH4ZD6eJa5VzFQURdhI/raNZ9MtIoZO6bnMHWPmfmKn9cZ9TEeff3Ld0L0hmMccndogcnsXUSXxmSu4XOcyNkfzjapCXEEepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390804; c=relaxed/simple;
	bh=MRuESYK6TzKuWe6yHv3DbV55Jktmw9rr4HXTx+vIXQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVje31dbYXwxaEi8XAs8Qvul1au2GsvEzWyoairuPzpLW+BWyQ91rsJRoEIkbGB32WW+48jonFlY5aq12VRarB0yXtI9tLcYmJsnf3KQDhVx+9HEaze8wSyxE8KNd8ErTnF1f1vajqb8jFhb3F3ZtxfGLove/mcqTDG4jcCQmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4D8VNGP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740390803; x=1771926803;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MRuESYK6TzKuWe6yHv3DbV55Jktmw9rr4HXTx+vIXQY=;
  b=d4D8VNGPWbQ79dosUxTZsSB3UWuOUFN6r3dmpFJfIqxmFLpCPl0S8ZTk
   jfaXWnAi25BqWPz2z0cLl2SUs2BAeRHXFVSVtqSM82UoRsnp/5ezlFI8y
   vQNnWhh42G7QA+2A8r4+EoMejzlNqyA7a79oH4LBtr/B/yYHsX1pDGZfC
   dcZ2U6GZkWOGhasTqrYOnIUy+frsrO/3O7EOFp2CJvt83/9uoYr+mGPkt
   XwQp1EYB01PJLJo7CRQrmY7d77ozu76PEN+fimgKCdEmLG6D3J6GzoD+m
   N9JRZMZsyKe1zNjjgsUeJK79YDxBzzVk7nGzGco5eY5ciN00NYnzgjYFS
   Q==;
X-CSE-ConnectionGUID: TSQ5KsiYSrK4zFbkJ35C8g==
X-CSE-MsgGUID: ewNsEtYEQrq7is1St8Qtcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="52130049"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="52130049"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:53:22 -0800
X-CSE-ConnectionGUID: ae1qGB6nSpmiM6iY2jzGkQ==
X-CSE-MsgGUID: NJAJ5wuZSTW83oDatxOGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146897915"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2025 01:53:20 -0800
Message-ID: <eba0150e-dcb7-4686-a768-83ed6ef1437f@linux.intel.com>
Date: Mon, 24 Feb 2025 11:53:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: amd: Switch to guard(mutex)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
References: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
 <Z7OZvxCCnil-nerR@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z7OZvxCCnil-nerR@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/25 10:19 PM, Andy Shevchenko wrote:
> On Mon, Feb 17, 2025 at 06:17:08PM +0530, Shyam Sundar S K wrote:
>> Instead of using the 'goto label; mutex_unlock()' pattern use
>> 'guard(mutex)' which will release the mutex when it goes out of scope.
> 
> Both LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> But next time either sent them separately (seems like they are independent),
> or add a cover letter explaining what the big picture behind all the patches
> as a whole.
> 
To both:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

