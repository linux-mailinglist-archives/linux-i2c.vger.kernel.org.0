Return-Path: <linux-i2c+bounces-10217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1034A80EAC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3471F18921FD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8E31DF728;
	Tue,  8 Apr 2025 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jA6iJuvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F721C460A;
	Tue,  8 Apr 2025 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123380; cv=none; b=LgdVeJ5gIzj8gb133qztexg5TNW1Ea2WplNOptBqG1SyUSvvbYmPIBBLgAojR2JQziA3iHpYGm/Gp9OUIr5UxWyZ56XLQ8c69WL9f5TTPXymMX/1K+cDoQzkty/LY5RxNMVyQ46TjfCxuM8i4Z2VQ4ROX4f+tgce2NaAFXa3nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123380; c=relaxed/simple;
	bh=l6oFyVAt4wXLWA2TqcIrqoKCFya7/t3LgR8BVOx+Hr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8tGAreNEz0/XaMuMaKMktujGip0QT2zHKBQGK4q/FCzUkztfG8FU0iyN83Gl/wB6YiFtLw8a0njNHke+3HnbwnmaPSoeZ0H2AKS1qKNR1A2XNxE9yzkc12wp6e5Vw1hTpZNms7ugaTWGv/L92Q9nQDpmhZhTJ3LjNFDXuYB9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jA6iJuvh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123378; x=1775659378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6oFyVAt4wXLWA2TqcIrqoKCFya7/t3LgR8BVOx+Hr4=;
  b=jA6iJuvhnMwFea+hWNjG5cLf1/0OBvjyW7MAfaz98UVjAgnO9WkNxUOs
   hofZTqqcQKh+kSEqrgAot4zwagbbhZEnHSIzlhokaGvS9zTJUCGAwTC4b
   iNfGIwO+2LnntNs3s3sa1qYX58NbiEXUQLb0utpgZwJ83auZIXmQrSvDK
   fBsIS9+bpHTeUeHcM9N4tSkkQBhCyTDjNSYz+rWvqU1WXQI5e2S5IYBDN
   ZgGv6RnK4juIPztxJjwqOmuWOxWngaRA/r8jqKax5gctqGVVYvD6E6uRA
   IvEQlQ3gtT+ropfdmdCgb6XceKsOkpTseM32PeNs1mlS1GcunrajQOqcW
   g==;
X-CSE-ConnectionGUID: kPNw0k0pQk+kRzdKmSCjDg==
X-CSE-MsgGUID: 7A6h67r2Q42tbDwXkgpYxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56930298"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56930298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:42:57 -0700
X-CSE-ConnectionGUID: rDljgZRaQVOzQN6NsrB8lA==
X-CSE-MsgGUID: IfKpmEYYTYyH6fkZzxJdKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128275222"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:42:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E2C111F74E;
	Tue,  8 Apr 2025 17:42:52 +0300 (EEST)
Date: Tue, 8 Apr 2025 14:42:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_U162kNEPSZI3zD@kekkonen.localdomain>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <20250407154937.744466-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407154937.744466-7-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Apr 07, 2025 at 06:45:02PM +0300, Andy Shevchenko wrote:
> Two members of the same or similar semantics is quite confusing to begin with.
> Moreover, the fwnode covers all possible firmware descriptions that Linux kernel
> supports. Deprecate of_node in struct i2c_board_info, so users will be warned
> and in the future remote it completely.

Too long lines, should be up to 75 characters long only.

> 
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/i2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 2e4903b7f7bc..cc1437f29823 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -405,7 +405,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
>   * @addr: stored in i2c_client.addr
>   * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
>   * @platform_data: stored in i2c_client.dev.platform_data
> - * @of_node: pointer to OpenFirmware device node
> + * @of_node: **DEPRECATED** - use @fwnode for this
>   * @fwnode: device node supplied by the platform firmware
>   * @swnode: software node for the device
>   * @resources: resources associated with the device

-- 
Regards,

Sakari Ailus

