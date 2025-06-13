Return-Path: <linux-i2c+bounces-11403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379DBAD8388
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 09:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB5093B6563
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 07:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A2025BEE2;
	Fri, 13 Jun 2025 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euIEhjk7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDE825A327;
	Fri, 13 Jun 2025 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798045; cv=none; b=VR0NvHsYKnHTn1C2RqhUUF6+y1avWm0aQLNCRE4jVQq/xSLKej3RK9WRdFueEJwuGvCFhV+IfGJoA9N+IcIqPpgjqPXu9m7g6BARbXAO+sSZN8W5EAo2p950+qqIsBR0UWFbYyMFrZf8CgPkIOiJwpUeTncYIbjcObbRNDUIR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798045; c=relaxed/simple;
	bh=Bvj8CtaShUexAfMaH2rcjFAH8uSwrjT3+TlcJ5+aHgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtyRWnfyAu6GzgK/2P1RUy3ybrLyTLJg5oJN6cG//Obo+BL/juZzUu+g889v52GP6LbmLJ9TMn3/1+xZey+zR7F0uprXD+0oeqCCsKHAwft/0zBNXCOebAZfUMDAcJTyJMkTfpirgNjyq6fL4W4PwQH3TvFWqi7JoYwVZRy5yTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euIEhjk7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749798044; x=1781334044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bvj8CtaShUexAfMaH2rcjFAH8uSwrjT3+TlcJ5+aHgs=;
  b=euIEhjk75uNY27/cmPZsIRC4ZAkVHCDWmVu13CNSZAOddjYF3JYCgjTV
   fxahn/RL8Ew2pA1oDxFLDa+f/nwdfkHgDGh5A5HX8B4nzt503IfIWUtqC
   nl+BvhbtUxudb+pseT/XFG6EVl6ptSmhlOCxbMSu9hw3fUtiAwaoh3gON
   Yj/NiP4KTLx9RLzGW3OHPzC0IT8mFrMC6rZPR/ZDoV8ERosdkQezsYTqr
   iUBoA7fc4fl3JsKZr0wmEUbu3Gla+DdDH5uXDhB/J9xEZKW0uY4ID1ZLn
   96YMbjEC9YG2TsV6W1a2vBjljFbLrC6Ta8a0hR/b7ZtmUVd1IChUFhvL9
   A==;
X-CSE-ConnectionGUID: S1I/r/I2Q0aHD4ZR6NLVlQ==
X-CSE-MsgGUID: OYObDru+S5KGjsJrP/3wEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55803189"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55803189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 00:00:43 -0700
X-CSE-ConnectionGUID: 7//jaAb9Tjqk9OACg5dc1A==
X-CSE-MsgGUID: u/GJR5lmQHun57KFWNtcEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147625757"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 00:00:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPyOy-00000006AQq-4AUO;
	Fri, 13 Jun 2025 10:00:36 +0300
Date: Fri, 13 Jun 2025 10:00:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andy.shevchenko@gmail.com, andi.shyti@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	krzk+dt@kernel.org, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	p.zabel@pengutronix.de, robh@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <aEvMlKIfcccD_s-O@smile.fi.intel.com>
References: <aEsf7Ml__JE1ixQX@surfacebook.localdomain>
 <20250613060032.14927-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613060032.14927-1-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 11:30:32AM +0530, Akhil R wrote:
> On Thu, 12 Jun 2025 21:43:56 +0300, Andy Shevchenko wrote:

> >> >> >     if (handle)
> >> >> >             err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> >> >> > -   else
> >> >> > +   else if (i2c_dev->rst)
> >> >> >             err = reset_control_reset(i2c_dev->rst);
> >> >> > +   else
> >> >> > +           err = tegra_i2c_master_reset(i2c_dev);
> >> >>
> >> >> Can you please take a look here? Should the reset happen in ACPI?
> >> >
> >> > This is a good question. Without seeing all the implementations of _RST method
> >> > for the platforms based on this SoC it's hard to say. Ideally the _RST (which
> >> > is called above) must handle it properly, but firmwares have bugs...
> >> >
> >> > TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
> >> > the workaround (quirk) needs to be added here later on.
> >> 
> >> As in Thierry's comment, I was in thought of updating the code as below.
> >> Does it make sense or would it be better keep what it is there now?
> >> 
> >> if (handle && acpi_has_method(handle, "_RST"))
> >> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> >> else if (i2c_dev->rst)
> >> 	err = reset_control_reset(i2c_dev->rst);
> >> else
> >> 	err = tegra_i2c_master_reset(i2c_dev);
> >
> > This will change current behaviour for the ACPI based platforms that do not
> > have an _RST method. At bare minumum this has to be elaborated in the commit
> > message with an explanation why it's not a probnlem.
> 
> This sequence is hit only at boot and on any error. It should be good to reset
> the controller internally at least for those cases. We are reconfiguring the I2C
> anyway after this and hence should not cause any problem.
> Will add these in the commit message as well.

This is not enough. You should explain the ACPI case. The above is just generic
wording as I read it. It does not explain 1) if there are ACPI firmwares that
have no _RST method for this device; 2) why it's not a problem for them to do
like this and why it was not supported before (with the current code this
platform will return an error on the method evaluation. Moreover the current
code is buggy. The acpi_evaluate_object() returns an ACPI error code and not
Linux one. so, for the such platforms (which I think do not exist, but still)
the err will have positive code which may be interpreted incorrectly.

So, fix the bug first, then rebase your code based on that change and
extend the commit message to really elaborate on all of the aspects.
W/o this done it's no go change.



-- 
With Best Regards,
Andy Shevchenko



