Return-Path: <linux-i2c+bounces-9861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242FBA64985
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 11:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A1C164064
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1940F24168E;
	Mon, 17 Mar 2025 10:18:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597B239592;
	Mon, 17 Mar 2025 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206704; cv=none; b=rJFK0W8UuIrOk7M7PrZCNo8lMiIsskUAb8XsIbyFZmdQ746FqEPnOamQRu59XoqjYABJa1TS5vys6iV95n3PbrIfBT87h4MAdc1cHX3P+sVLTBX38GoMRpS5dscxkS1m3ZLkYpuqfWE7vn1eocCne0FSNzMxYPf0wH5RFFpyv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206704; c=relaxed/simple;
	bh=66SiudjzIDxSwFtin0L+uNd7NW666ueGu1cStKyMpsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPM7cfBhC/AMkm9rsb5Rh2OO1FSXCdU5WPmTOwezo3gt5/OcDXYdSmkuI8YTJkgXh49jN6XdkkmaIlvkncxZ25kRXN9YJs6B0F4OwS9ahn4bFdy6iFWursyrnubvjX1aoMqm01q/sMTgXhNaH4V/EOzqM1kK8fwVIEVVRX1o2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: UaL2gQh9RK2sY2l7Y+fM9Q==
X-CSE-MsgGUID: EtySeaDNTPa8dtQDlh1vaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43175916"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43175916"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:18:22 -0700
X-CSE-ConnectionGUID: PPHtrT4lRSyibWWHM6RVPQ==
X-CSE-MsgGUID: +/k8gcoNSwCRWM6j8SOPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122845893"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:18:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tu7Y0-00000003HHt-06cG;
	Mon, 17 Mar 2025 12:18:16 +0200
Date: Mon, 17 Mar 2025 12:18:15 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9f25-CUNMiEz4kw@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
 <20250317100856.GC17428@francesco-nb>
 <Z9f2CE7cI4ODkM8O@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9f2CE7cI4ODkM8O@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 12:14:33PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 11:08:56AM +0100, Francesco Dolcini wrote:
> > On Thu, Mar 13, 2025 at 04:08:14PM +0100, Hans de Goede wrote:
> > > On 13-Mar-25 3:43 PM, Francesco Dolcini wrote:

...

> > > 1. A drivers/mfd/ MFD driver with the regmap stuff,
> > >    registering "board-reset" and "gpio" cells
> > 
> > So, we considered the idea of going with an MFD driver, but looking at
> > drivers/platform/cznic, that is doing something relatively close to what
> > we are doing (just more feature rich, as of now), drivers/platform/
> > seemed a better fit.
> > 
> > I am not 100% sure what's Andy opinion on this topic, from what I can
> > understand his concerns are about the toradex directory (that we'll get
> > rid of), not the drivers/platform/ parent you are concerned about.
> 
> Yes, my point is to have this inside existing folder whatever you decide
> with the maintainers of the respective subsystem to be.

But if you have more than one module, it might be still good to have at some
level, and drivers/platform might be too low for it (too broad).

So, either path/to/foo/toradex.c, or path/to/foo/toradex/*.[ch].


-- 
With Best Regards,
Andy Shevchenko



