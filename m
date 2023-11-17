Return-Path: <linux-i2c+bounces-207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CE7EF409
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 15:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FCF72813A6
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 14:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9818C328D2;
	Fri, 17 Nov 2023 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1brDbqN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BC8C5;
	Fri, 17 Nov 2023 06:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700230120; x=1731766120;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l+Kj4OtVTtx7rbh+BfmdDrOXOtH14Y7IhTMpmwIbWhA=;
  b=I1brDbqN80AYO3pukIIqSZsPVu/E7mHsZkoEq1mQst3WkOV8bTPirKOw
   rhBUPlTXKfWVForIgpbVNvMak+JKMV0cq3+vmq84EUod4H8A612PZ9EQ8
   Xjy4UxwIhDtqv8D0F5xbTHQyaFpYUlz6cn6ZOS4CWHtOfHxuUIcmakron
   nfChGv9+jzbXal5L6vKK3o4koXvtsUvBtWfCKeBeGnSGA2NY/i6vIWi0I
   AsRO9FlOD2/4mVkamSHvUBcf0jj1Hvu10wg+AKJV41Hj6aGbx6YE1KU4Y
   XWpvDsbfP3Ol2d8+lR5ha6AX/ibQxHgvvZRGlcappHb4inqNB0iXNXY+q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="391087741"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="391087741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909443226"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="909443226"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2023 06:08:37 -0800
Message-ID: <cb9e7b22-cc46-4e8a-937f-bd395d05a999@linux.intel.com>
Date: Fri, 17 Nov 2023 16:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/25] i2c: designware: Unify terminator in device ID
 tables
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-11-andriy.shevchenko@linux.intel.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231110182304.3894319-11-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/23 20:11, Andy Shevchenko wrote:
> Make the terminator entry look the same in all device ID tables.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 +-
>   drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

