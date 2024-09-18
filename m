Return-Path: <linux-i2c+bounces-6846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4797BA71
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 11:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4580B2142C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD6017920E;
	Wed, 18 Sep 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv77TKpJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6EC176FA0
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653369; cv=none; b=gnuDUDs3AxRLQ3oxJowumV30SRM+TTk32BALS/BC5JcIexKz/Vhkl/BAcIjNcaIK/u+VjKcIEMJOFeDBaXt2tICe1wWVDvWSOAXi4Fbj1KSMUds0IgHKWT884VueSFgdabyJVTMyGhajCK4o93sr8hB5gtk298maFli0vEQlqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653369; c=relaxed/simple;
	bh=FHfm8PxDYEaqk5Bw2baWuhpNwpJzB9sdPVY34TzuWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmZZS1JOByB1ihZRZ9LKlGLoDW3fT4BtdFLY/6gxM7aUgxdTZf823qSnOfF6Ts+y2vNzjQAmtU9j6gn+tpTUD3AShL58QROE/lcf2YIqcZ5g7I9EusCsFYPfLjttOrr0ny6sNx3mg/21G9N7EZwMSvNnA12UqX6MZ20owlFDCn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv77TKpJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653367; x=1758189367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHfm8PxDYEaqk5Bw2baWuhpNwpJzB9sdPVY34TzuWZQ=;
  b=Hv77TKpJe7ZIaRY9VdSxWz70hrCWf14WADqZnz6dFAHNloHoZj1dscwk
   ZP69LhG6kCVldm/PTClK2tJfGENY33bIE6VW+0zyFdDL47833KcqG81+V
   sc5J1RneIZHxdWuX6TdanBgpcXiGMmUWimOxSrbnUmDdIp9C5m7tMGe4e
   zXSNk3ww1NWhQWkjRScguLxoIcFmjFHHXKZJSsB63DlGzlBtvSsGedLDE
   +zVn3Do1FZMlRpYLEQocpwVgsK7TeZPXazMEX2wxVrtOGbcBXqR1B4qIq
   erqSe0aPvTfL4DOU56yqvvLHfCZdmlCqkeoJQD9ikVW3aHHh4wAyHaw0v
   w==;
X-CSE-ConnectionGUID: rRyeoB6GTzu532qoPQ1FXA==
X-CSE-MsgGUID: /HTnEaz7S5a5m+je3DQgVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25648814"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="25648814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:56:06 -0700
X-CSE-ConnectionGUID: bzk4UzI8Q+2LE6F6c4kKww==
X-CSE-MsgGUID: mpxTpWVMTE6yPWT5JXR/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="100175329"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:56:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqrPl-0000000A8PP-1xA9;
	Wed, 18 Sep 2024 12:56:01 +0300
Date: Wed, 18 Sep 2024 12:56:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <ZuqjsaeTAKs5TaJH@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
 <ZuSKUCC1XqBURdib@smile.fi.intel.com>
 <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 17, 2024 at 11:44:04PM +0530, Shyam Sundar S K wrote:
> On 9/14/2024 00:24, Andy Shevchenko wrote:
> > On Fri, Sep 13, 2024 at 05:41:05PM +0530, Shyam Sundar S K wrote:

...

> >> Note that the git diff view is presented in two separate lines in order to
> >> suppress the checkpatch.pl "CHECKS".

(1) ^^^

> > This paragraph should be in comment block rather than commit message body...
> 
> I can move it to comment block but in the last version Andi mentioned
> that I have to leave a note about the function within one line.

What function? I'm talking about (1) which refers to Git and checkpatch.

-- 
With Best Regards,
Andy Shevchenko



