Return-Path: <linux-i2c+bounces-204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54737EF3DE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8C91C20803
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFB834554;
	Fri, 17 Nov 2023 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJmGm0xW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AAFD52;
	Fri, 17 Nov 2023 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700229120; x=1731765120;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uRPZW1EhDMvmdSa0U9aNmDPgsgvZ+Itub0PWfB9Y9/Y=;
  b=EJmGm0xWom1pkHseEXUdAge5VBjjHnJbiQnHfwjg4U3nGw/53uAQ3z+B
   K6I/Oe0rLCF5+ClPl9zwvIw9NaDopEilK1ZDtYKMoVp4KuG4edxidj91g
   CLH6M9Ll7molC886YUwNIX3FzPVtgcqYhOcE7JB5Z0uRgZPRAMPHpAzCx
   0tHuwJNKAyYTYWg14Misas/OhfkUzumOgs4qB9ae21Ka4HvfHem6Gmwn6
   3+A5nkw939NnDwwWzZ5WBO04M1KlYr9obV+7NjVwmIG4DnwFC9ermhN86
   1CRslcK4DkIwsP3i9wOmebvqCClcOS3tFGDDcpuCvgWW11FxlB0StWJIm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12849787"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="12849787"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769226529"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="769226529"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga007.fm.intel.com with ESMTP; 17 Nov 2023 05:51:55 -0800
Message-ID: <3f30ed45-d63c-47c0-a533-43a2d2cfc31a@linux.intel.com>
Date: Fri, 17 Nov 2023 15:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/25] i2c: designware: Save pointer to semaphore
 callbacks instead of index
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-8-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> Instead of saving index and do an additional level of referencing,
> save just a pointer to the semaphore callbacks directly. It makes
> code cleaner.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h    |  4 +++-
>   drivers/i2c/busses/i2c-designware-platdrv.c | 12 ++++--------
>   2 files changed, 7 insertions(+), 9 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

