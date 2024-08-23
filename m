Return-Path: <linux-i2c+bounces-5738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C311895CE4C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50AEAB25F83
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFA918660E;
	Fri, 23 Aug 2024 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeVtSMUN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C91DA23;
	Fri, 23 Aug 2024 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420796; cv=none; b=LtJ4X6R2wV2C6VZRLe6+Bkf/OqTH0ycsWEfbbyFxjp/2Lp6u27uVGY79LNTxvwVfMWXvEkFjgF7wI4OKBwlzWlG4nhFTSo48CfgJ/pMGyLSI34ugncG1plkzdvTYFMejtZb0bChb+3Ov32P4m9czIBYRKR+60hYw9rziyvcQlDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420796; c=relaxed/simple;
	bh=oj4nyYMV4gB+mypoya7w5RGqytEUERznSMy5TvYxR6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rALshZsp2SDhpmr5K1Hle4xpWbsdr0XYaOStbih2uhLBN9QLj8ia5RKRTvnNhS++PAXdjjPzgstcsvmUcKitRx91vj2wmzzGh4TYLpHvElbRfgxeyl1/novGNHsvN4Hv0p/ct94oq/xYGZRVAKnPHtOsLao0ycBY2DeP87DkIzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeVtSMUN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724420795; x=1755956795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oj4nyYMV4gB+mypoya7w5RGqytEUERznSMy5TvYxR6Y=;
  b=HeVtSMUNgveKSRtG1UIa0YX8ECUoUU1synEkhOMgpPi+Cce43Fzaddux
   OUT66GJiGP2QDO4bvTsebq51rpIpd7yBt5hQGUoSmdZ7cnsYRbHp+1Kdf
   gvX1wPV/8682yzQolWgIdCQjs8m9Zp4fGWp2wcJenorFwRhs3QLJ6AlX7
   CNa/pNyvnQuRdGlHmbRN1Qj5VQ//qoZkgEyrv3D63FFizTMZj/flad/zi
   miSYkkLS06Vx01Ah9mAwTLWXKYhyntkn5Sk15VsBSWytk5tFaXa/+6xmJ
   k5LoQQykhjkcBvtKsiVeKtsxKvdwb/ubZ9QOeINgp5i3fgyxh7ZLPwwoS
   Q==;
X-CSE-ConnectionGUID: 0xZDNFumRPKusJN874HT/g==
X-CSE-MsgGUID: kFDw9S11SOOSGqFzI8n/AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33456386"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33456386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:46:34 -0700
X-CSE-ConnectionGUID: WWhL323KQ3WR5KbQYnhSwA==
X-CSE-MsgGUID: rYcEtennSpqHFKRmjZnPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66729372"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:46:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUcV-00000000oDe-2JZj;
	Fri, 23 Aug 2024 16:46:27 +0300
Date: Fri, 23 Aug 2024 16:46:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Message-ID: <ZsiSs-OrZRrDBplk@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-6-wenst@chromium.org>
 <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
 <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 03:50:55PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:

...

> > > +     len = strlen(str);
> >
> > If it has a thousands characters...?
> 
> Shouldn't matter much? I suppose using strrchr() as you suggested
> requires one less pass.

Yes, this is the point.

...

> > This can be combined with the above
> >
> >         for (const char *const *p = gpio_suffixes; *p; p++) {
> >                 /*
> >                  * Find right-most '-' and check if remainder matches suffix.
> >                  * If no separator found, check for no-name cases.
> >                  */
> >                 dash = strrchr(propname, '-');
> 
> I believe this line could be moved out of the for-loop. Otherwise it
> looks much more concise compared to my version. I'll omit the comment
> though, as it is just rehashing the kerneldoc description, and now
> that the function is so short, it shouldn't be hard to read.

Agree. And I put comment inside the loop, while it should be outside. But then,
as you said, the function becomes so little that kernel-doc above does the job,
hence no comment in the code needed.

> I'll add you as "Suggested-by".

Fine with me.

> >                 if (!strcmp(dash ? dash + 1 : propname, *p))
> >                         return i;
> >         }

-- 
With Best Regards,
Andy Shevchenko



