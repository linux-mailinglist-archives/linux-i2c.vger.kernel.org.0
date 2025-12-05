Return-Path: <linux-i2c+bounces-14458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D246ECA7D82
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 14:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5913117092
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 13:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FF61E98E6;
	Fri,  5 Dec 2025 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5WgnEWa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E632ABC3;
	Fri,  5 Dec 2025 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942730; cv=none; b=X3zeH7BRq1LvfJkwYMWv0YQ4CeXW8HFLoMKYrUBtkSltR5k8Gmd+J9uMIB2wGz//LgAC3vPwMNiG/vOYl9jMC5kAXT7BnRaavfN5i7wKiRlmcXKdVvIn/1uj0s1uHms20P9axhRaxyKQLuheV1Jx713MUxhHFm9ArYv9ZIjMK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942730; c=relaxed/simple;
	bh=k4hgjBGInSxYLHZeFSLPGQ6QSZkjySInF8Q+8uAlTcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebo2mNz0veMpGYMSJBfrvhqeDA2NSFsRh9rNVYNINgOZ3YQpOFDMlir6TZ61bR3X843Jz0iQZG7c8kNZ4NRrK55SHqw7dPXvj3Q4gJSASlnHyXprQSaz5c6DHMh1WJDz55LAVu+PY3N9LTxZ4v8fhP/lAaZ+YiCI2AOmDXioCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5WgnEWa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764942728; x=1796478728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k4hgjBGInSxYLHZeFSLPGQ6QSZkjySInF8Q+8uAlTcU=;
  b=Z5WgnEWatNgGQbhJkrjrLeeiooLWVa5mXfQ6rEk/CjpgwCnpLHvoOaUg
   STNtWhoa7QQZhjC+RjkcYnWbviL+FIRnxsswXfd1g/Nit8iXy2KSy18YJ
   pAgPhV0pAmuRx48PNNZMpwgb98+MGkCyVPS868U9Kmki2lMmhu1lJMoir
   ubiNdYqdMGaslaDKy7necUoAheYprTw4Ci6DU1UAJA9z+fb90D2IUWCQP
   PxVqeS7sr8Mf1A+viM3O5U17+xTACcPLXIBSmwiI/WwdRPFvTEJXvjLZ4
   K7gXI1xlxFgoTxhi48JyMYb627BISNhZGuh7uotd6xWkauHG9mnggPZZI
   Q==;
X-CSE-ConnectionGUID: AAWUQD2hToyMR6Fp2qK06Q==
X-CSE-MsgGUID: WAP5re4VTLm4ut1wS5jXrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66870278"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66870278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:52:05 -0800
X-CSE-ConnectionGUID: mnN5Jk7XTxeZlQ4Xt7iDJg==
X-CSE-MsgGUID: KyMJQb+eTrWTnIlE4vAyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194952297"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:52:02 -0800
Date: Fri, 5 Dec 2025 15:52:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org, benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev, rrangel@chromium.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
References: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
 <20251205040141.1735580-1-safinaskar@gmail.com>
 <8e3ae563-a058-40c5-a721-834d7bda141d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3ae563-a058-40c5-a721-834d7bda141d@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 11:21:32PM -0600, Mario Limonciello (AMD) (kernel.org) wrote:
> On 12/4/2025 10:01 PM, Askar Safin wrote:
> > "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>:

...

> > > But yes; failing all that it's viable to make a quirk.  You can follow
> > > any of the ones I've submitted for modeling how to do it.  Here's the
> > > most recent one I've done.
> > > 
> > > https://github.com/torvalds/linux/commit/23800ad1265f10c2bc6f42154ce4d20e59f2900e
> > 
> > Thank you! I will write something like this:
> > 
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
> > +		},
> > +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> > +			.ignore_wake = "VEN_0488:00@355",
> > +		},
> > 
> > I will test it and then properly send (hopefully today or tomorrow).
> 
> This match it too liberal.  We don't have any evidence it applies to
> anything more than your single system.  I'd pick some different strings.
> For example Product SKU is probably a good string to use because that's very
> unique.

+1. If we ever see another one, we can then think of a more generic quirk.

-- 
With Best Regards,
Andy Shevchenko



