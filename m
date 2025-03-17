Return-Path: <linux-i2c+bounces-9858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E34A647E9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 10:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4C087A3B9D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BB3227EA4;
	Mon, 17 Mar 2025 09:45:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBD11AAA32;
	Mon, 17 Mar 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204717; cv=none; b=lErpP8/ULMeVrORsz/mcLTH/7sVH1hpte/n9FuJVnW602YNNlMKEhGnCcPUM24VhUWxOHwnMGJOP0dp3xPZreAfClGJlkPl5zkJ68IiEIH0wvuQQ7Z4TdUSBknbQym3xdT+VmADDOw38Roj/ij9DaSrr1UOACis0kGriTYEgIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204717; c=relaxed/simple;
	bh=mB6FFkRcdfw5WyFfQba6zYpw2u1nYuK208JXEazRhs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVv9GFAPJre05SQs1lDYbhjac08/P8TTmLHfy99ESCsWoS9zgbOI7rP/Mw8NVCOOUJP1g7/NNUhud6FxGtT685FgFSvQhOAWSPZvBKvztmZgnxUBy3qjqco+Gni/Syier+4LQGe9p7OwhnIBrY+cE110ikOplJJTk2LpdlgOtU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: DXOfXw2cR2uDqrMHjy4dyA==
X-CSE-MsgGUID: LwQrO/kMQICluomH1Gh21g==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46057270"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="46057270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:45:16 -0700
X-CSE-ConnectionGUID: PQ4ErtDmSoepdDYa+4k0+Q==
X-CSE-MsgGUID: 8bSHPyIaT7OTvLP20X4Amw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="152762423"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:45:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tu71x-00000003Gnp-27La;
	Mon, 17 Mar 2025 11:45:09 +0200
Date: Mon, 17 Mar 2025 11:45:09 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9fvJVyOs7BxLa5T@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <Z9Lxw4qVApejzeAE@smile.fi.intel.com>
 <20250317093127.GB17428@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317093127.GB17428@francesco-nb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 10:31:27AM +0100, Francesco Dolcini wrote:
> On Thu, Mar 13, 2025 at 04:54:59PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 13, 2025 at 03:43:29PM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > This series adds support for the Toradex Embedded Controller, currently used
> > > on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.
> > 
> > How many do you have that will come with like 99% guarantee?
> 
> None? What I know is that
> 
>  - Toradex is building SoM since 20 years and not planning to stop any
>    time soon
>  - Recently we decided to get into the SMARC market
>  - From an engineering side we decided that it was the best decision to
>    have a small microcontroller to act as an embedded controller, sitting
>    between the SoC and the PMIC, handling reset, power-up/down sequence,
>    strapping options, I/Os and potentially more
>  - In our roadmap we have more SMARC based products planned
>  - The firmware interface is designed to be generic and handle future
>    boards
>  - We expect to use the same driver for any upcoming board using such
>    embedded controller, the EC firmware and the DT will be the only
>    differences.
> 
> But, I do not have a third product in my hands now, so, I have no such a
> thing as 99% guarantee. Honestly I have only one thing in my future with
> such a high probability ;-)

So, perhaps it is not a good start for a brand new folder right now
as we might not see any new products.

> > > The EC provides board power-off, reset and GPIO expander functionalities.
> > > 
> > > Sending it as an RFC to gather initial feedback on it before investing more
> > > time in testing and adding the remaining functionalities, with that said both
> > > the code and the binding are in condition to be wholly reviewed.
> > 
> > This doesn't explain why you need a separate folder.
> 
> Can you be more specific here? You mean the `toradex` directory, within
> `drivers/platform`? The only reason is that maybe we'll break the driver
> in multiple files, but we can as well just get rid of it. We did not
> think much at it.

Yes, kinda. I mean the folder in par of, e.g., Chrome OS related HW.

> BTW, the idea to have this driver in such a way was partially inspired
> by drivers/platform/cznic/, that was merged a few months ago.

Ah, I see. They have already 3 devices on the market.

-- 
With Best Regards,
Andy Shevchenko



