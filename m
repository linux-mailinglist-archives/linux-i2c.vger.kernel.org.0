Return-Path: <linux-i2c+bounces-1677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B384F700
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 15:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B13B287A6B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 14:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DB76D1B5;
	Fri,  9 Feb 2024 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0lq4+KN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71A4EB4E
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488083; cv=none; b=QyBv5fbKc7rfaEd4zL/WgMN+s6YbsFlCrGzoMEnXNUfnX4w2gbxX+7aaH5V1T6sMFqA77IwojdXxHfsasdkKvBpX+NhVFz1pA1aduMh1V6YRsnETEtW4/4HFaIfDfSKmdgspcHZn+80tH4b0zXGAt7UWmY6FXX6Ex1gNaPLihE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488083; c=relaxed/simple;
	bh=/50ghlXUrszJdjDMyLbh8D3xonYaQnrH/iPIyaJayt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvYNQbajl/fcbzicYapZnuqM9jheHDKFpzuMQZXquTDXceKwy+tIem9rr/8Gnds2EKxh/be7BW/Rl9gOJS/xy4zIs65pbW9zvFijoRC2ovKj7MeXd12Ftb0VNKzdY/TrqQrincU67/c05gLRTu8iF9oGahBhbGq94rhU4lKMjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0lq4+KN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488082; x=1739024082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/50ghlXUrszJdjDMyLbh8D3xonYaQnrH/iPIyaJayt0=;
  b=V0lq4+KNir+pbHs38x60PI/QKrhk1FLboAp4L7hxFS4xEcUSBh+BwsRm
   z0uhDnOTGWbdTIvWEQ8hjZTkK7EXiq7uwBdtwKgKxQi7Yjq7DSd88EybM
   AdBiY6L7lNLhOY5QkrhbcldRbDcVpXn7Sh3N5KaKKzFv78Dsym0bkxm6v
   qr+ttFpOAVbY8Qai+HCC4qgZr6Rj/0PPYkplqm/2pOATfziXIL8QKyxIO
   VAv77QhNh1NGdlJb/fIqFs4dbk6Ai9/uZno+ij7tp+lUVeylZUrdL6lPj
   9sLHw2B3INjumFfthbGJnLIq/NLCmRHiKYfhzBtcfyGzzkFxWzLUa2Sf7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12809888"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12809888"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="825147872"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="825147872"
Received: from unknown (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2024 06:14:38 -0800
Message-ID: <849af5df-4b7d-493c-ad70-b99fc322af90@linux.intel.com>
Date: Fri, 9 Feb 2024 16:14:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] i2c: designware: Add some flexiblity to the model
 info
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, michael.j.ruhl@intel.com,
 Hans de Goede <hdegoede@redhat.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-2-jarkko.nikula@linux.intel.com>
 <ZcJQljILDGq9Xk_A@smile.fi.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZcJQljILDGq9Xk_A@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/24 17:30, Andy Shevchenko wrote:
> On Tue, Feb 06, 2024 at 04:51:50PM +0200, Jarkko Nikula wrote:
>> From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
>>
>> Currently the way to identify a model is via a bit field, of which
>> 4 bits are currently defined.
>>
>> Use a shifted value to that more models can be defined.
> 
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> While this is true review, internally we're still discussing
> the possibility of moving to plain numbers and shift, so we
> may add arrays which are indexed in model-based way.
> 
I was thinking I'll drop these first 3 patches in the next version and 
go back to v1 version. IMHO it's better this patchset to focus 
implementing generic polling only and not mix with cleaning up the 
semaphore or other random stuff.

So planning to go back to v1 version and take your notes for v2 7/9 and 
9/9. What would you think?

