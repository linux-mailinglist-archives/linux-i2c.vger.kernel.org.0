Return-Path: <linux-i2c+bounces-5599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51C95858C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 13:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244B31F2425F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 11:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BF6155C80;
	Tue, 20 Aug 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VauGGiMr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611B15956C;
	Tue, 20 Aug 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152520; cv=none; b=LSrhF9RdfK3C7SdYQYkVuQLS9MTRvS3/WfV4/PswFkJWwj7gUZ1KzJCeBqvwnZNVtrH0js7JXXHr1oAogdue5fntC0rfiWklr6yNKCD8pFp2MFooofJU9aYkBwU6jdlg6a1cd7kEfNRywTZ+vl8gc8SG5iD2ieApdR05SOeFzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152520; c=relaxed/simple;
	bh=s9Giacz+Jhd88BbipHDuVSmKAmt6k6HUGj1SMH2Zf1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqNrgcX1dSFGkiCjLFS3t7Zm4GCZjo4RC7X9FjzFRyap4JPHQZKSIjqDHFHfSNeNXX/XPmKOIbPiKnlJMSIxVQG+7ija1Pt4VWS18vq03cuNEIh5p+VGJVIF9p6hTIjFn89RmCaZNkDboYzAK2/W09o4ZqSKAV+DxaNP+shd1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VauGGiMr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724152519; x=1755688519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s9Giacz+Jhd88BbipHDuVSmKAmt6k6HUGj1SMH2Zf1A=;
  b=VauGGiMryXddRkzgNJvBsHX43fQOu25lFRdbjVZVhqpzVd1Rn2Szmrsj
   uHyRB93mzun2wYJv1JAl3RwuUNbfoogRwljmMXkd/ZnmjI37e/H4xdRGd
   Z5WGleGLa7tlnguWF3kFxrpUY3/1wzf1zf5g3ZaysaOsIpaPr1oEjRYeZ
   chc4p5G504OZBKlcVdu+4rMX8nZ7ktcNTYL1nP9LBOJQMyDptjMJxL3E+
   Qqfy6bvAc+/z2jXVMQQCIuTESulJeOCck/WtPfOsH0IP7JUohua6VbaiL
   SoLl28lH5Vb1d8Hwx4vz6NfcMZenzVVcS3/cgNYyRf6mG65zzeKcruQpB
   g==;
X-CSE-ConnectionGUID: qhsrH6QJTpOjqTE4MhvQnw==
X-CSE-MsgGUID: TMuEJljGR9qqzctPpSHt1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33106421"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="33106421"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 04:15:18 -0700
X-CSE-ConnectionGUID: HEogvhjzRSSdNVRUXZUt7w==
X-CSE-MsgGUID: 3yRf33G+Sk6O1B3aVbBcyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60386424"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 04:15:16 -0700
Message-ID: <7e3e71aa-cc07-44a0-963d-8965a7fffd7e@linux.intel.com>
Date: Tue, 20 Aug 2024 14:15:15 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] i2c: designware: Let PCI core to take care about
 interrupt vectors
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
 Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
 <20240819184600.2256658-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240819184600.2256658-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 9:45 PM, Andy Shevchenko wrote:
> PCI core, after pcim_enable_device(), takes care about the allocated
> IRQ vectors, no need to do it explicitly and break the cleaning up
> order.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
I wanted to test this due to earlier 9be8bc4dd617 ("i2c: designware-pci: 
Fix BUG_ON during device removal").

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

