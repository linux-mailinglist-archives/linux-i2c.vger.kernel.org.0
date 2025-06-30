Return-Path: <linux-i2c+bounces-11691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE058AED6BC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 10:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EDB3B6216
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F48212B3D;
	Mon, 30 Jun 2025 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdM0l3c7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1802742A80;
	Mon, 30 Jun 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271008; cv=none; b=rCwU5ahzAqF2ls4IKoktN82AOPBjLUgJT9IQQeRQfPXjiPkJmFupiyPqzIkcL5NvPe33Kgq9aJP/sXo/wXf82iMMaMViCve2HiP0ZF6O5rNhIdbgcu7kxeQ4WbFKK9PyqH0O1FPqZUPWy6sRWcsvOw8ttm9muK7pYAaA1VKroZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271008; c=relaxed/simple;
	bh=XjCziwLh/M47LtkXzPuWSgze06sAN1CpF/QSDZYoe5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li0a1TEYfdOLc+V41cXcHV7GZo/6AwN5Z8mytmAlFdaexItFgghWoABcEYmaqKDfsoBOIYhmSrh8uTF0r9OTd7F3z8woRfryY1NHQcMNQ57T6Bkso0i+Mn+kCUhu4r4zthH2yCi+H3mib1uP/haPGmhQ4PG2ve4ESY2yLn3LpnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdM0l3c7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751271007; x=1782807007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjCziwLh/M47LtkXzPuWSgze06sAN1CpF/QSDZYoe5E=;
  b=ZdM0l3c7CZC8IVZ4tInrTB2UDJBU7QDW8V2qpRwj7muoF9ReGrfTGmod
   D1Q6PBdT2vZdPNMKbLDU0YCrNq2aZZeHa14NBwVglEfPoE4oTkmcQNtZ1
   KYGbDAUvUJ+SIcR3aIEaMak4gfemEafiLS4sunLzUTaYmnVP6xlC5qfk6
   Te/xJ24F+FInDA9ZpO0yl70p/dpf3KBdKTa+7pRpRYFcH4lw7D9tyLY6a
   tTBb/bkQv9uiKALrXfexssSuXSRb82Wy1opg92d4nDWAOHMm7V8LUQ1GU
   4CLSKfK6Kz3VFxbGFT+MrJA9xu3xDkdXuXjRFjx7U1/Ze1zZzF/Snuh21
   w==;
X-CSE-ConnectionGUID: wULQgE2oQsWeXthWoCKZIA==
X-CSE-MsgGUID: UUk8NkjmSwumfqVCbSeV3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53428431"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53428431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 01:10:06 -0700
X-CSE-ConnectionGUID: 61uZ8m06SIqRVWaWZKuwlQ==
X-CSE-MsgGUID: 83P5icZhS9S+Njg8Af8XmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153935577"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa008.fm.intel.com with SMTP; 30 Jun 2025 01:10:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 30 Jun 2025 11:10:00 +0300
Date: Mon, 30 Jun 2025 11:10:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
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
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGJGWFOpccaNzpni@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGI9C6MR8qhe0MHR@smile.fi.intel.com>

On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > >  {
> > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > 
> > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > >  
> > > >  	dev->dev = device;
> > > >  	dev->irq = irq;
> > > > +	dev->flags = flags;
> > > 
> > > Maybe I'm missing something, but why do we need these (above) changes?
> > 
> > in between, it is introduced a new one:
> > flags |= ACCESS_POLLING;
> > 
> > So, the initialization moved up, before the ACCESS_POLLING, and
> > it let the assignment to the last, along with the group.
> 
> I still don't get. The cited code is complete equivalent.

This was requested by Jarkko.

thanks,

-- 
heikki

