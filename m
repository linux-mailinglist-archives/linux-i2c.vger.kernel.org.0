Return-Path: <linux-i2c+bounces-11613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5BAEA073
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 16:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D08216EFB6
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9634B2EA484;
	Thu, 26 Jun 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFnHTUUm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D72EA16C;
	Thu, 26 Jun 2025 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947876; cv=none; b=Jn40VKbk8ExoQbNTqLg5aWtdLUdT43o1n/6D1fww2X6jlykRX/agtSCKOCiYmBmy5WKdJwkEdBw5jokJ8IX/AVewhU8WZwxMYtNp/Ixz4IqOYMVNyb10MgqXd3IrjKvQ6oEt6TgkHXXd77O6X6KsGOJd7rh6oNMVrBPb7qi751s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947876; c=relaxed/simple;
	bh=AWURGxNzG6EnaOcS8fijAmqGcl2i0t+H3UsBIkyG1sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi5+iokFrlRAPQrKoEDGFUKdSUGVtggzcez3SnhDSden4JAoH6lRQX5c8rkb7bKHgxXoMDuzI9wCOYcEQSMaQkevktUKjp8iPOeR76Yw4QOwicJ0UC8xpeQQX1TaC4/Mq3Zl3uxRq1Qub0LpDWWOp9RNG5wzLIVKISIagvozbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFnHTUUm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750947875; x=1782483875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AWURGxNzG6EnaOcS8fijAmqGcl2i0t+H3UsBIkyG1sQ=;
  b=WFnHTUUmge5mpbvLmsreJJF0DIhWOLkr6HtvYboOT3/7xdao8KtBNw9R
   ZI1Bd+j/BAlFnSz1Q+Rw7DLLLuFaecE7T8xJKTC75SHD4kyyIQQHEFD7J
   BVWhisTMIZGvAr+dgD8NRBcfL2fBx07Ra3pjDmLjheCyams+ag2/t7HvX
   Ole+h8QhT8VZhuq6/ieZKWr4NanQjwlfy2LmhyLW3QxQ9KZb3YEEL2MmN
   j7WsvKgnAxB0EedVWWwW2GfVNCIg/z9qwRP3qLvEVZrHN+2EMBg3HVSo0
   b208GtSVvo9RCazI2VFJ9stYQgZoYLVWu3OQ+zg4YUnN8S2Osayyh+x0Q
   w==;
X-CSE-ConnectionGUID: UbseCNlZRgW0HRNm1LlddQ==
X-CSE-MsgGUID: Foq21cXeSbmanRBPnKNXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63503643"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="63503643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:24:34 -0700
X-CSE-ConnectionGUID: cXkDad8pRjymYE54LcwmpA==
X-CSE-MsgGUID: hYCNCOR5S92ymj0rRHPIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="158280207"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:24:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUnWc-0000000ACOy-43Ez;
	Thu, 26 Jun 2025 17:24:26 +0300
Date: Thu, 26 Jun 2025 17:24:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe/xe_i2c: Add support for i2c in
 survivability mode
Message-ID: <aF1YGk2TNda9r32o@smile.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626135610.299943-5-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 26, 2025 at 04:56:09PM +0300, Heikki Krogerus wrote:
> 
> Initialize i2c in survivability mode to allow firmware
> update of Add-In Management Controller (AMC) in survivability mode

...

> +err:
> +	/*
> +	 * But if it fails, device can't enter survivability
> +	 * so move it back for correct error handling

While at it, add a period at the end.

> +	 */
> +	survivability->mode = false;
> +	return ret;

-- 
With Best Regards,
Andy Shevchenko



