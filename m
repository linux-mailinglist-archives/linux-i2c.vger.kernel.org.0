Return-Path: <linux-i2c+bounces-11556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C7AE5BEE
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 07:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 221F81B6788E
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 05:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E14227BB5;
	Tue, 24 Jun 2025 05:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzkN5mJ/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D020EB;
	Tue, 24 Jun 2025 05:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750743915; cv=none; b=KpnrY0oEF+Wsj66Y4vZMFu8AF8QshOqmWYG5VQVS0Hjeeue1i4yQec4+NEvGyZ/uktjaqkbEZn26ikB8btPu9cHmhTOjluYV1Ad/nbwf4lP1LgGnLfJ9Gm8PPg9phYrGo+DTpFQtex8/bVkXan76nwGuFVJXzddnPR7/L+GFqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750743915; c=relaxed/simple;
	bh=ReIAIGIakmsYHmySBe4krsH5TJHx/5joaiJ9z2zdajo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hm3K2mKkBNzpufPs+fKdTJKbbE8k81SgRlYdKzQipCsY269H8qJkYoAeYAiIX8Dh7uSX/uax7bomOErYXb9aOhpKMBKOHgr5+bSd2fPFWxfmK8ocYoHUZk8+gBsT2hOnieyAijTmhK9eorC9RPaiQFxK+hhG/znRtrKxDlk6tKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzkN5mJ/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750743914; x=1782279914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ReIAIGIakmsYHmySBe4krsH5TJHx/5joaiJ9z2zdajo=;
  b=YzkN5mJ/mN/jqthkslSfH3qYetAD5T+cH3LyEYCb32t0NUU67zslD0Lo
   u2XlWexYacKryYCjPHlge9/uYUUfCeZhHCo4vDk4OALRHSZSWZ2UqzFr5
   NkPl0jvlfbDZY5IbY3OOdYh8nJJVkUObac3QCVjp11+BXQnJZpw82IhDW
   FeQ5Ik452KRfgVBDH9tYTmvD5t0NjvEZoaglJ+kN0wcPmHeLOmjTe6YY7
   3/TKeNy1Vzw7QTRiuJ6YahXJeT1gCbkzNMGrle8KezU7Z8ylfSqhZ4fQp
   kNknQS436j2eF/t3nemfmNjKI+Q4R3N1Fk/dsEeT17hXNhf4HeKFij9oT
   g==;
X-CSE-ConnectionGUID: 4yfF+Es9RsKqulBRng0msg==
X-CSE-MsgGUID: BsnU/F8gQIWDNdbx3FvplQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52194552"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52194552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 22:45:12 -0700
X-CSE-ConnectionGUID: CVB1lbuRQiKAayedD7CqFw==
X-CSE-MsgGUID: XIggt/sdS9qu4atT/5+UMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152516971"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 22:45:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C919A138; Tue, 24 Jun 2025 08:45:08 +0300 (EEST)
Date: Tue, 24 Jun 2025 08:45:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <20250624054508.GA2824380@black.fi.intel.com>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>

On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> Since driver core provides a generic device_match_acpi_handle()
> we may replace the custom code with it.

Well okay but now you replace a simple comparison with a function call. I'm
fine with the patch but I also don't think this is an improvement ;-)

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index d2499f302b50..3445cc3b476b 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -250,7 +250,7 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
>  
>  	if (adapter) {
>  		/* The adapter must match the one in I2cSerialBus() connector */
> -		if (ACPI_HANDLE(&adapter->dev) != lookup.adapter_handle)
> +		if (!device_match_acpi_handle(&adapter->dev, lookup.adapter_handle))
>  			return -ENODEV;
>  	} else {
>  		struct acpi_device *adapter_adev;
> -- 
> 2.47.2

