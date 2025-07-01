Return-Path: <linux-i2c+bounces-11734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF866AEF953
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F8348468B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49AE274668;
	Tue,  1 Jul 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3XnNBvb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B80274658;
	Tue,  1 Jul 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374516; cv=none; b=enCyMt5Yk/PvCBXfgl3Ew31CR53YWr1XBG4JGWL9I7uSMaekPoSsJy0s1AfVkwK/bcViYKLYB1t0xAijfm18csliQPQUynmMYH6rMXb0de39aNnhAWSrU6L39kntUH17kQTSJYwfwKMBO8Yaqve1qoXqmceMD1Va46HolKCmTTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374516; c=relaxed/simple;
	bh=+yY+3KSt3ynAhcXYbFssvIUhcWthWIfrF7Ct2jTDnvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjgBuFTbY3Fi5b1EiJz2oekJpE5EB7D6TWzbeSizyaCwRBLFZ1q3CqICBLI/nX1Qc6owIBRRP8RaZ6q9ayEMpQtsdnG/xdfP3UKoNFT7Z2ERtFSM76Gkain5qMbUUUSMdAJz0NOLBfD7+/sIiPxZXgT4niMwLYtQdxV0ZTQMaPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3XnNBvb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751374515; x=1782910515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yY+3KSt3ynAhcXYbFssvIUhcWthWIfrF7Ct2jTDnvE=;
  b=E3XnNBvbwc5PMaWc6qqXuJQiGubgUQUNv0tA4bVkmzHlcTAghMvoWLqT
   dsHRC/GW+LzorjKGBaLSLFNL0drM7NnsrS6gTOLo/lXWpjzlLtNDV4etc
   OHyqtNLzKj+7Dt+V8WTOQIk9R0gEEGscZmSyF8ArETb1mkcUE81YnlE5Q
   4U9fwVnQwdB75PUfmBthzaseVhTOCInfKQx9dvAUFUTvap0uKz1WgPr+s
   mReNnUuQzzA1Fh5oXgH74q5QH208v9Bkujh35tLgW1PZda7VZGgWx+uNp
   IBoZ7TV7fng7M4fmzHxP0E+hM2fJI9pnfa9vS/qDZjY79wuWcUzAdNLvw
   w==;
X-CSE-ConnectionGUID: nrL0BwRMTAelmzWj4L1m2A==
X-CSE-MsgGUID: g+/zTLSmS4KjUSNnriQXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53508848"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53508848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:55:14 -0700
X-CSE-ConnectionGUID: Ttnvo9hlSQCNzeMQoACEKQ==
X-CSE-MsgGUID: 1FfFZIGZQ+mRVtirxIX0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154081383"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 01 Jul 2025 05:55:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 15:55:08 +0300
Date: Tue, 1 Jul 2025 15:55:08 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <aGParHQ3GSdAA8rL@kuha.fi.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
 <aGPXwll6Hh2cZfnp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGPXwll6Hh2cZfnp@smile.fi.intel.com>

On Tue, Jul 01, 2025 at 03:42:42PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 01, 2025 at 03:22:48PM +0300, Heikki Krogerus wrote:
> > The irq resource itself can be used as a generic way to
> > determine when polling is needed.
> > 
> > This not only removes the need for special additional device
> > properties that would soon be needed when the platform may
> > or may not have the irq, but it also removes the need to
> > check the platform in the first place in order to determine
> > is polling needed or not.
> 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > Hi guys,
> > 
> > I found the thread with Jarkko's comments from my archives. He wanted
> > the local flags variable to be added because he wants the order of the
> > calls to remain as it is now - the device is allocated only after the
> > irq is checked.
> 
> Yes, thanks.
> 
> ...
> 
> > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> 
> > +	irq = platform_get_irq_optional(pdev, 0);
> > +	if (irq == -ENXIO)
> > +		flags |= ACCESS_POLLING;
> > +	else if (irq < 0)
> >  		return irq;
> 
> >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> 
> Now I'm a bit puzzled why do we need to add this flag explicitly here?
> Does Wnagxun provides an IRQ and chooses at the same time to poll?
> Shouldn't this patch rather fix that?

No. I do not want to touch the behavior here. The flags were
overwritten and continue to be overwritten.

I will propose an improvement for that together with some other
modifications to this file later, but those are out side the scope of
this series.

thanks,

-- 
heikki

