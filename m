Return-Path: <linux-i2c+bounces-13092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AEB9238D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 18:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2980916309E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06F03115B5;
	Mon, 22 Sep 2025 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SedTejnP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99320FA9C;
	Mon, 22 Sep 2025 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558580; cv=none; b=QHxX1S3C4PAUosys+QwaNF6m7FMJcKjRNuZDsd7l686DunJokbgqJ4Zf3sV2H1cDNRrTw7GJYGI11s6G6/yR3dv7ZYApdSX+sGZw72slk7LQgtHMgABTxTWBmWQIN/76kdx6fN6LzsFvB+Y+Cpw7CY+Ioo4rHMoLieMES5gRtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558580; c=relaxed/simple;
	bh=Lktyop935DFfKFImXAnxl7vjM62RPJLDrgPmg0O6LGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idG7JKtKY49zkdZ5GZI+c+/3/ZKRe6gui7gtXO9UNvJloREbYqWk9ZeRpF+juc4SUNeuO+O6cuS2gHtlCKjHERjcOsARMkselx2y5iptQZ5M1+qBWyDnGUtQ4N8fg2Aj+Ej1dlfc6rOMFedOG22W5Aez12BSFm3F/wkjq/vB9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SedTejnP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758558578; x=1790094578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lktyop935DFfKFImXAnxl7vjM62RPJLDrgPmg0O6LGk=;
  b=SedTejnPR13dYxPEOnZzOxE3CV8ErZPMXfYFJ2F2F39Cwun7w7DaIHim
   gOhMqlhYYAFf2PCuwyPIqX6MLTZ3mfO7POz3EvNbgY3ymHzmIk8Ml3x8h
   1rOgB6Sx7q46l7bHyj2voFUtgCzCdXCYLN6sxZn/DdrIPt6SbV5izjB6D
   +QojK+aUGg2RlJ2/JEXkPfELYGZvc9+VArfgtjlDX0QtnRBeNN43mhzYI
   qQx4su642QFYreleJqiw3c/aU1qcTFf1xCC5ZytAtKu6kpInuVjHqCT0Q
   KqUxzyX94FP/F5whQ1c1ADAyADGwUbvvg15OnWrnfoUzdsy14xZu4vpYI
   Q==;
X-CSE-ConnectionGUID: Z35kUL5WS4eQ9eSrax8pAg==
X-CSE-MsgGUID: k4pZJMXJQsemXkQ5RjxDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60942891"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60942891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:29:37 -0700
X-CSE-ConnectionGUID: d4pQkdktTEG6BDoWC/F/aQ==
X-CSE-MsgGUID: sPWf7SxnSY2hLbe6BYOPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="207258016"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.185])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:29:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 70F4A1201E6;
	Mon, 22 Sep 2025 19:29:30 +0300 (EEST)
Date: Mon, 22 Sep 2025 19:29:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail address
Message-ID: <aNF5ahYzteTjq8Iu@kekkonen.localdomain>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
 <2025092234-magenta-scouting-c3c4@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025092234-magenta-scouting-c3c4@gregkh>

Hi Greg,

On Mon, Sep 22, 2025 at 02:18:00PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 22, 2025 at 03:06:28PM +0300, Sakari Ailus wrote:
> > Wentong's e-mail address no longer works, remove it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/usb/misc/usb-ljca.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > index c562630d862c..1846156c0800 100644
> > --- a/drivers/usb/misc/usb-ljca.c
> > +++ b/drivers/usb/misc/usb-ljca.c
> > @@ -891,7 +891,7 @@ static struct usb_driver ljca_driver = {
> >  };
> >  module_usb_driver(ljca_driver);
> >  
> > -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > +MODULE_AUTHOR("Wentong Wu");
> 
> Is there a new address where they can be reached?  SHouldn't that be
> used instead of just deleting the intel one?

I believe Wentong has had plenty of time to update his address. If he still
prefers to do so, he can do that after merging these patches.

-- 
Regards,

Sakari Ailus

