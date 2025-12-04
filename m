Return-Path: <linux-i2c+bounces-14407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBAFCA501F
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 19:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14EB830A6633
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 18:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582AC3491FB;
	Thu,  4 Dec 2025 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZppYAIpW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F32F12B5;
	Thu,  4 Dec 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874490; cv=none; b=Blxax8wMgAHomvNZvRVJLWH0ei9+MyIW0VB0AKM1ZkvPFXTN51pVJvCQeYrNwNs9z5dG/aanYgmnyLx1mbltE+6fiK+8SjIkDF7sAyeuApEgtGJenXIQehXlXSHW49x01UUorvkisP2EfVrefu8BnX5fiiuNTaUd7NqsdcwOEeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874490; c=relaxed/simple;
	bh=ImiduMHCnTBp77in1tppwgIySRFoBPJWpJy0SrzZ1Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J24thABuQ3RXHWF7P7gI0Ki++nc3JvyAF23UuyTeiTmoZZJ8saZgDD415CgtU3z5MZOR04qu9BWYEGYjT+NZ5DYq2NiOxTVGfXuLFZ+13jIkV3bilxBOTQ7VcFBQBT/bBt3axJq8AWcsZ8Lem0F+9zCUeiP+kGtLDd1lakECWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZppYAIpW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764874486; x=1796410486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ImiduMHCnTBp77in1tppwgIySRFoBPJWpJy0SrzZ1Y8=;
  b=ZppYAIpWmF5XbTZcgO9em3NUMChyFHqkaUFebAXr8YIG6dS2wFQA8/Z+
   xGt4DVlhhBYSegQhhJ/HDd+kHnzNpT4fmkvcrdT0LveAmOosCXVu4k7vM
   7spz3GG1QoO+4r5VAOMm66Am7/zjVuWASy0UzsGEYg2e2qYiTF9gVpn85
   R8fSkWWniADhHEohZ08QVmFfVrWlgiaDIJ67lnNYskkEuUVzhhrFI9DQP
   BYrH48KDyLSiUuC773VtA5matzFR96/jKXybXDh0dt6Qh8hxgyC0rGIjq
   kfGppiU19ZfHDxWDsA7RfqBptpQoVLixHASja4SHPU7Y093wMALzRLXW7
   Q==;
X-CSE-ConnectionGUID: xnQgiEhCRdWn3aphTjpPXg==
X-CSE-MsgGUID: jNKPiSHSTgSvua/z32J7pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78015794"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="78015794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:54:45 -0800
X-CSE-ConnectionGUID: gXI+FC6gSVyKUKzSF0+8sg==
X-CSE-MsgGUID: EbAUWmxJRw2nFruClqlcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="200190901"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 10:54:45 -0800
Date: Thu, 4 Dec 2025 20:54:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <aTHY8pP0zjjX1NNB@smile.fi.intel.com>
References: <20251204161309.750032-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204161309.750032-1-a.shimko.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 07:13:08PM +0300, Artem Shimko wrote:
> Replace various magic numbers with properly named constants to improve
> code readability and maintainability. This includes constants for
> register access, timing adjustments, timeouts, FIFO parameters,
> and default values.
> 
> The change makes the code more self-documenting without altering any

s/The change/This/

> functionality.

...

> +#define DW_IC_DEFAULT_BUS_CAPACITANCE_PF	100

_pF

(yes, it's fine to use CamelCase for unit suffixes, some of them historically
 use capital letters, but it's better to follow the actual unit spelling from
 Système International d'Unité)

> +#define DW_IC_ABORT_TIMEOUT_US			10

> +#define DW_IC_ABORT_TOTAL_TIMEOUT_US		100

Those TOTAL are not needed, just use a multiplier in place, this will be
basically the explicit number of "iterations" (yes, I know that the real
ones are 2x or 4x more).

> +#define DW_IC_BUSY_POLL_TIMEOUT_US		1100

Why not 1000?

(Yeah, I see the original value, but I think it makes no sense to go
 specifically with 1100).

And in this case it might be better to write it as (1 * USEC_PER_MSEC)
which makes it easier to get that this is 1 millisecond (in µs units).

-- 
With Best Regards,
Andy Shevchenko



