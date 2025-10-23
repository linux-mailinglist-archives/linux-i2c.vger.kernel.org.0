Return-Path: <linux-i2c+bounces-13766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18476C03040
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 20:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F673B2C74
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 18:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FA927FB12;
	Thu, 23 Oct 2025 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpJS3qYe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E127F749;
	Thu, 23 Oct 2025 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761244476; cv=none; b=t6finQBa5dqQLS/1EypMXU8GxWXorzPbhVWRUP43UUHWM7caiDUBzz+tJArCVgJMXr0aczzmvcghKeBIxgSKvyTmCSNSKi88XbKSXT5VKpnNOVrLYmPZW5tWScPKfwSbYP4etjwn6MG5egg40TDsyx+R6rrUz0Hr3ujTbFrYKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761244476; c=relaxed/simple;
	bh=gkUPz23E0FDwykVELaqDflNUBgc+n7Zhh4fdU6+Mf+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeENKnYANYuAv0vXMd1+UjnwcgMbIu2AcPGBrvDckoP2icCUVBr6xQ01VtdTAjMIF1XTOEsgqQxau1stOLTqnySoiAiuGiRJm69eqbbxeK+IIxVh08nFn18EtHAK/PT79VgIXjHE/hJc1GiWhRh3rCvl+evotf7t9TNBTU5gdJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpJS3qYe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761244475; x=1792780475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkUPz23E0FDwykVELaqDflNUBgc+n7Zhh4fdU6+Mf+E=;
  b=EpJS3qYeshH838z2cade16JoKT4lAQSxcXUaEpecTKu4my2RHCinwHB6
   wTE/POWgxRtA/1GDxrolyMgrmig/T4yxRhCSkZb7pNTzvA53SC0BasUCs
   FU/MYsnF2cz5N/FKZJGaX++r4V8lG6aTfvoAWfK6tvKzVOws6TSKTFpXf
   46t1hAQJc96oROSPZfXqax21hy9Ryxh67j+qEEaCXsUXSQI19ZCdzh73D
   42uwjclJdVdPmjmFXH0KNvUuKQF+GUiOljem56Rl1v7NGW7U0hdVGZvI2
   H52kVqTfYh8Yh8FphAU+eEh+TdrI0hfIPxqa5CbTe/Vqg+gBvnrZpXJTO
   g==;
X-CSE-ConnectionGUID: O3B0QevJRGu+yJ24zcbIHw==
X-CSE-MsgGUID: 9ohpnlIkSS+xrNkmjqMW1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74770535"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="74770535"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:34:34 -0700
X-CSE-ConnectionGUID: mkRFhIz1SCKqfF/0+KVMgQ==
X-CSE-MsgGUID: WCWZFJO4RASzLF98XQnYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183408130"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:34:33 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vC08s-000000020uy-0Sph;
	Thu, 23 Oct 2025 21:34:30 +0300
Date: Thu, 23 Oct 2025 21:34:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/3] i2c: pcf8584: Move 'ret' variable inside for
 loop, goto out if ret < 0.
Message-ID: <aPp1NRDgBwemLfs1@smile.fi.intel.com>
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
 <20251023120043.8661-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023120043.8661-2-chiru.cezar.89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 03:00:41PM +0300, Cezar Chiru wrote:
> Require spaces around '=' and '<'. Add spaces around binary operators.
> Enforce error fixing based on checkpatch.pl output on file.
> Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
> improves usage of ret variable.

...

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I haven't suggested much, but if you insist in the tag I won't object.

-- 
With Best Regards,
Andy Shevchenko



