Return-Path: <linux-i2c+bounces-11736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DBAEFB28
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 15:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF903B60AE
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 13:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84892749CF;
	Tue,  1 Jul 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="am5HClE2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB06242D9B;
	Tue,  1 Jul 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377823; cv=none; b=E5gIZtwaAtItw/eyTHDqZPuG2pDOGkjVW78xF8nCPrM/UzWsH8K0mxvRX+RqxV7jIhDzWN1AadFFYBxJS5ry5hGLNPzJEsZbTwFO66qtialsdaMUiIbforQI8CJltTSPFmExnfP61dOeW+iahi22BPtYKNd7jYN/Xz8w3JHTlRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377823; c=relaxed/simple;
	bh=RFvF9KCP9IGby3aofIlAsOtLhVx+o/OGg9eljFscdY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfAgz2VwdFE5ZaPoQ3LN3OrngdbRimcrRFxBCeSx4jhnR/le0VmJ6dLehRovYV0Up6q0yWaknB/PRSEC2AWvmcFvV8qxyXeWB2rTzw7U3V/vZLZlEDPqj2GJygjBXNQU+WZJ2qHUjegzTlY47hBOpoBLCXAgk1FL5Q9tXbeGERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=am5HClE2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751377822; x=1782913822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RFvF9KCP9IGby3aofIlAsOtLhVx+o/OGg9eljFscdY8=;
  b=am5HClE2CGri4t7Gbckko4xs/Ia1FFWaQBUaI6IVFzOxY/w3bvp7njR4
   89aL2sUdRXYVxtAPSzdE0zX/ZNqZk7V8mv2jSMN1yH0Qi3xyKpG1tyfoH
   /7u75I7PvGC6WH4NuLJXaNaHxuQwScXBT/jVjyhMxDs1GbnzcqwKoZsBz
   H5bdMefFTr51ZREXGXbbxYAQRLlXqkHnNe7zDoWfyAXfqECZfjn3GhlzY
   wl7qhgapkqHXXBAsUuZIy3bhkVBeWUgAest1qticlu3XC9FqhrrIqH24P
   rPtHEjHXpopvMzd/epOwbsHMTsEtlEinc+fRPlFDhb3dJJsglD/yisjEM
   Q==;
X-CSE-ConnectionGUID: acZKFMktQpeRYp6FjxzeGw==
X-CSE-MsgGUID: KpkVs5aqTASIdJViiFaSDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53580113"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53580113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:50:21 -0700
X-CSE-ConnectionGUID: WK+qwPOzTcaVSaXuAyLtSQ==
X-CSE-MsgGUID: h5jLGJhYQ3SqfnGfjSzXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153187653"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:50:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWbNG-0000000Bby5-05AH;
	Tue, 01 Jul 2025 16:50:14 +0300
Date: Tue, 1 Jul 2025 16:50:13 +0300
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
Subject: Re: [PATCH v6 1/5] i2c: designware: Use polling by default when
 there is no irq resource
Message-ID: <aGPnlWbWn8NyTNFM@smile.fi.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
 <aGPXwll6Hh2cZfnp@smile.fi.intel.com>
 <aGParHQ3GSdAA8rL@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGParHQ3GSdAA8rL@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 01, 2025 at 03:55:08PM +0300, Heikki Krogerus wrote:
> On Tue, Jul 01, 2025 at 03:42:42PM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:

...

> > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > 
> > > +	irq = platform_get_irq_optional(pdev, 0);
> > > +	if (irq == -ENXIO)
> > > +		flags |= ACCESS_POLLING;
> > > +	else if (irq < 0)
> > >  		return irq;
> > 
> > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > 
> > Now I'm a bit puzzled why do we need to add this flag explicitly here?
> > Does Wnagxun provides an IRQ and chooses at the same time to poll?
> > Shouldn't this patch rather fix that?
> 
> No. I do not want to touch the behavior here. The flags were
> overwritten and continue to be overwritten.
> 
> I will propose an improvement for that together with some other
> modifications to this file later, but those are out side the scope of
> this series.

Sure.

-- 
With Best Regards,
Andy Shevchenko



