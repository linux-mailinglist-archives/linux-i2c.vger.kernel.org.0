Return-Path: <linux-i2c+bounces-7028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6FC987369
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 14:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E1B28644D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 12:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF5C1607AC;
	Thu, 26 Sep 2024 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amZG26hA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E9156230;
	Thu, 26 Sep 2024 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353114; cv=none; b=aeN7TZek2QJO7qwaCQ5oU2p901hGPK0KYoHLEjPc5bhkBKXN2NSA2jwdfrIAaElPV5NsyhRldxVBu52JF7nwadCkUEFMRkb88jsVnDLiILJfT7lSa2XfkEZNCcondKzFDO943hBKaQ8OZsk/5btKYG0xus4nzHm62xXKlFrfDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353114; c=relaxed/simple;
	bh=HQXO7o3riQdPFesFSwYSfdIhvpIGm+oI7H5ultkxg68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWr5WMkGLAmn0oly65GxuB1Lsteix80x+dgRYZ2EL5IGMlZT/1QDEQXxGOZvenc8wy4SYE4x+r9opIz7EgimCOnOwOTVKQ+eg5ocltXv0eg8YFgDzhlwEwtWZHcd8DNW1gmRg+3n0BYav8jJQu/ZgCG4zfONhPgu46g4luYc8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amZG26hA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727353112; x=1758889112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQXO7o3riQdPFesFSwYSfdIhvpIGm+oI7H5ultkxg68=;
  b=amZG26hA2O1TiESnVjQigkneZY/VfLnr5szJO/3rrl296lkvHX/QD7nG
   byAflHlIirdy9EW7eIyU6cHeJv5qqRzI650nlgpOWpvkGgxdT/X+8gxKh
   bHBoDpmYLIVnNT8KbxudG5yQkEytePyOQ1BxTyneUsvXrQwqiqx0H7wdR
   yPHkAB4+scQyKbbfEL2vz4rSpHQ0wHcqICT4xJub+Oj+5m13fyT6FwSWT
   VVLoZVckiDwFeCBGiUnYCTZEakgPdqv1Q/FDgWtvOBbkjbaXR3UyKEsUz
   Sr8p9so3f11LE+3tyr2z/eZ8XXVMlvtl3XlIDbDM/mA2BT+hooNL/nD4v
   w==;
X-CSE-ConnectionGUID: tFgYtaZZSwGVByKE4hixug==
X-CSE-MsgGUID: YocG60MJQAaCM5dDKoXpEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26580797"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26580797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:18:30 -0700
X-CSE-ConnectionGUID: 7zPqT07DS3qnzhChXgjLWw==
X-CSE-MsgGUID: fhP+BA3NQPW8PAkaOjXaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="77050993"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:18:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stnRx-0000000DBu5-21Zi;
	Thu, 26 Sep 2024 15:18:25 +0300
Date: Thu, 26 Sep 2024 15:18:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <Michael.Wu@kneron.us>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	morgan chang <morgan.chang@kneron.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <ZvVREcwQSKZb5IU2@smile.fi.intel.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com>
 <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
 <IA1PR14MB6224EAAD5566CC5288CDC0838A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR14MB6224EAAD5566CC5288CDC0838A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 08:45:47AM +0000, Michael Wu wrote:
> > On Wed, Sep 25, 2024 at 12:16:10PM +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:

...

> > > > + * @bus_loading: for high speed mode, the bus loading affects the high
> > and low
> > > > + *	pulse width of SCL
> > >
> > > This is bad naming, better is bus_capacitance.
> > 
> > Even more specific bus_capacitance_pf as we usually add physical units to the
> > variable names, so we immediately understand from the code the order of
> > numbers and their physical meanings. 
> 
> Sounds good. However, I think the length of "bus_capacitance_pf" is a bit
> long, we may often encounter the limit of more than 80 characters in a
> line when coding. I'll rename it to "bus_cap_pf".

Limit had been relaxed to 100. I still think we may use temporary variables,
if needed, in order to make code neater. That said, I slightly prefer
bus_capacitance_pf over the shortened variant.

-- 
With Best Regards,
Andy Shevchenko



