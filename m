Return-Path: <linux-i2c+bounces-7476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22E9A3EA1
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 14:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1224284135
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 12:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9433D96D;
	Fri, 18 Oct 2024 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chjZEcYH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638922EEF;
	Fri, 18 Oct 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255317; cv=none; b=J1B/XWJcB5evG1Ef6tjxZdj4CdM6RcwWEjgATw+VM7AU3uzfncbUaf1IYw2gbI+8lPt3VcLaGgujIr3urwTI903Z5s37S3WsqAHKsRdobtNfqDpkMHqkEkeHMMyYY+y6vDATJ3KpwFPwqyGIJXoGUjiK0RCP0Eh0aUBbgDeRgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255317; c=relaxed/simple;
	bh=fWQ1C019OrLL79GjgJMechJSkH86Mhtqt/rQQpqf5W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lU43xpJWYheGEanNH0RzmWVWGD+wGqinwxvnJZshCuQ+OSXnTO43xufgXnkd4JlX2rw3JBfDplUwXgrk4vm9ECz1S3ltePsYbd7ASpp8X1lZD1gk6Wh7S8/bNEekd88WpLAFH0f3KYvRlq5iKQSPMF+qlDS9g5BEmaqDYd0ozVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chjZEcYH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729255316; x=1760791316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWQ1C019OrLL79GjgJMechJSkH86Mhtqt/rQQpqf5W0=;
  b=chjZEcYHKOYbXUqfwK/1TFZkFc5bTE+KHu02CzWg490tUi96wq7iNbj/
   VV3Vxno7d/PXgPsoZIZahRQWtzajH0zU9kd2CZcyl7CTHt4gf96ivYG2+
   KBPO36q9cxVTM9AoJ5w1Oqgzfo2jxLhFu9dWCwxlJY4uiVdrdXO/j+ulY
   juAvG1vRq6ThxowZm61O8I/sTke4ATSGfB18nXh+WuVZYxGdfWU/SntIn
   i+6JmStRIyAchPpB8NnhaHB9E+3oKAmos2jFogVwQX1eIDEBJ8kFBGNIy
   ZI9o+Yp3kLprGBGZT8TNLnmi3u7ipHBczOM1fy1RUlGeuOM59PHqeB2Qn
   A==;
X-CSE-ConnectionGUID: J8dCpeUWTomxNV9okS+0NA==
X-CSE-MsgGUID: EO9yxPL1TtqtTZ5ypIF2XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28575902"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28575902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 05:41:56 -0700
X-CSE-ConnectionGUID: uEPg6B55RTadAUoAC76otA==
X-CSE-MsgGUID: 5JoMyiv3TWmr+fcmE+QzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="79666154"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 05:41:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1mIh-00000004SnJ-1NWI;
	Fri, 18 Oct 2024 15:41:51 +0300
Date: Fri, 18 Oct 2024 15:41:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Message-ID: <ZxJXj3holsMIdnC2@smile.fi.intel.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:
> This patch enables DWAPB I2C controller support on Fujitsu MONAKA.

s/This patch enables/Enable/

Also please give more details:
1) is this ID already present in the wild
   (in the products that one may just go and buy)?
if so, mention the example of the product.

2) provide an excerpt from DSDT for the Device object that uses this _HID.

Otherwise the vendor ID is legit [1] and code wise patch is okay.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[1]: https://uefi.org/ACPI_ID_List?acpi_search=fuji

-- 
With Best Regards,
Andy Shevchenko



