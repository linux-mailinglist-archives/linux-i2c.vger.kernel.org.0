Return-Path: <linux-i2c+bounces-7921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DED9C3EC4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 13:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9E381C2197C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 12:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2F21850AF;
	Mon, 11 Nov 2024 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhSh1hzN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4758F77;
	Mon, 11 Nov 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329638; cv=none; b=kuhupVQNXOoFesNn5aS9pSYZK3u3V+/KSpJpz8t+yC2OiwlDpywWaC7bqEIA2aLqoXLJiUBeRP48VqEeZlwR0CVGyXMW9+IDuDQW0QNTQf7ia/uodfwOUis4GFocX0OSqN1XkytmB6sMwX9G/gCC/M4eaO4dg79i+QibNzYOK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329638; c=relaxed/simple;
	bh=tJZ/3mi2RZCvzetJ1IhLVWO2g6knw3vBpgL06O6mIzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJcpf/omkVm+ehNg5vvKS9ocL4v1UPBBdt5TRY/kUSOdeZjMlxZ99gojDI4w4xaHeZGWaMoLfhNXBhLPJm1pg2LKbeJlAYIENBXIn+MezGaPkFfIg3mCO85d2ei74QIuwsh1ofkJUpBDpSI/znYFX6GjwJsS3DaigPL6KlwLtZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhSh1hzN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731329637; x=1762865637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tJZ/3mi2RZCvzetJ1IhLVWO2g6knw3vBpgL06O6mIzc=;
  b=WhSh1hzNSi6oju1l3ZHFIV8nRpgYL6+Jg9xRUZZPFE48bC0h/wZFj1Gh
   U3vuUpv+gG4jzO40eERs/5M1LtuyffwqY0TUoZ7pr7MsjtR7dgCMagZ5C
   y/u7vloXNL9/f7ZDUN3bWfPZMyNLlyH1M12Gu6w53Uhq8JvO/MzzlI+92
   oslBXWFvoIu+yecIGQ9r+oZhdaoIGhjDEAQ8XaBqHb+Crvn5WAJAa8I8R
   YdzeDoXLLhtC/g0zsUfoY1nVOhGbsj4UOW+wtSfKYjwSW1Kz5samWNkAf
   U/Y9i241xj2kOYOYPV2R/wuALDR8VvSisZ2g8DWTm9I07BDqkRejJtV45
   g==;
X-CSE-ConnectionGUID: mQQh2AEvSD6fK/HuZ0Thzw==
X-CSE-MsgGUID: 5LxN8sg9RruBIb26cjtjkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="33993253"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="33993253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:53:56 -0800
X-CSE-ConnectionGUID: FE9e/Yx0QuaJLI3hQRVdcg==
X-CSE-MsgGUID: b2rWGM2hSlqLaFiqWgS+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="91433295"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:53:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tATvU-0000000DcM7-39TV;
	Mon, 11 Nov 2024 14:53:52 +0200
Date: Mon, 11 Nov 2024 14:53:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: i2c: piix4: Add ACPI section
Message-ID: <ZzH-YMl7o7_al4xv@smile.fi.intel.com>
References: <20241111115652.10831-1-aladyshev22@gmail.com>
 <ZzH-KeSavsPkldLU@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 02:52:57PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 11, 2024 at 02:56:52PM +0300, Konstantin Aladyshev wrote:
> > Provide information how to reference I2C busses created by the PIIX4
> > chip driver from the ACPI code.

...

> > +Therefore if you want to access one of these busses in the ACPI code, you need to
> > +declare port subdevices inside the PIIX device::
> > +
> > +    Scope (\_SB_.PCI0.SMBS)
> > +    {
> > +        Name (_ADR, 0x00140000)
> > +
> > +        Device (SMB0) {
> > +            Name (_ADR, 0)
> > +        }
> > +        Device (SMB1) {
> > +            Name (_ADR, 1)
> > +        }
> > +        Device (SMB2) {
> > +            Name (_ADR, 2)
> > +        }
> > +    }
> 
> You need to elaborate that some of this data may be already present in the BIOS
> DSDT (you give your example as it seems most common so far) and hence requires
> an additional per-port addresses. With that you should add a note that this
> will require to load SSDT quite in advance to make sure that the driver will
> see these changes before its ->probe().
> 
> ...
> 
> The rest is LGTM.

Also Cc new version to Andi Shyti who is I2C host driver maintainer.
It's probably he who is going to apply the change.

-- 
With Best Regards,
Andy Shevchenko



