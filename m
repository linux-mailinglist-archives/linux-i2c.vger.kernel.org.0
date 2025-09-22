Return-Path: <linux-i2c+bounces-13093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAADEB923A8
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 18:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0427644470D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E7B311972;
	Mon, 22 Sep 2025 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKdWsP7P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CE35963;
	Mon, 22 Sep 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558676; cv=none; b=B3Ulcu1xpAqgtAim86qYxSzELZf+AJtky9j+GO40sylh2/qIzoIYI8iPfb1n0g6JzMVw+uBKX99i6546WgE3HUHoWMJ7T277nkS5knumEdRjsu13zMdL6ad7x2COQ5sv3RGoj/DVNNp0Ooen6RGfOn26ZUcM3UJY9uHvZTGQ61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558676; c=relaxed/simple;
	bh=btDwjFPOayX+/oQJ5TvHVqLHZYkC80pmAfPiZhgiSGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4NOJCGSuKWGhvJ+2n/ydORts/Wx8YDi0MYmaPSAi7Jkqip5ZLzpf15Ia5xG63i1PcBaot23Y2sgZ17GpcEaN11HLHExsLLZyjJTZ6GL2jplqNsg0SWOWZFnsPFuKxYf6CEt29ALo6Yfb+jZkt8tYqXgJBHZZ0LDgT8935AKlN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKdWsP7P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758558675; x=1790094675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=btDwjFPOayX+/oQJ5TvHVqLHZYkC80pmAfPiZhgiSGw=;
  b=GKdWsP7PGwZgJLUnN+gmTmHQ6/lgdSlGYLqsNUBLIsCh16JD6BR/9bhc
   Vyin118tER7SOpmSLp6pPeMrDB5OfxihPU8C5grtPnY0JwdZ8Z8/HG+MO
   69GfQn8JQWHZn1+7DY7kObimxpSJVVLwA0mhAjwX5xc2A5AfHpTvM+4OG
   aNALDvkgO6HkAGCSTVxJtr/20M9Rwmep6bDz8bw/hbp13jLA9nsVwXphk
   qHNCo50j4yGQvEhy58adKKQDKue5gdjQnPxJ1TbD+Ya28o1cRH1gM5x1u
   +ul4u+bsovx3BwrGngdXVdLbU+1iIf7iLam9JHcryWqJljZ5h9Spe/VCa
   w==;
X-CSE-ConnectionGUID: nXrwLVzUTqGLhpOnvZY1Tw==
X-CSE-MsgGUID: VuE0DPDKTkyU7c1fmParXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60881832"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60881832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:31:14 -0700
X-CSE-ConnectionGUID: TVRLEJKRTpCr161c2NY23Q==
X-CSE-MsgGUID: QCDQsYlCRimIsZbTwfYk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176339978"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.185])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 09:31:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E4CD51201E6;
	Mon, 22 Sep 2025 19:31:05 +0300 (EEST)
Date: Mon, 22 Sep 2025 19:31:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] spi: ljca: Remove Wentong's e-mail address
Message-ID: <aNF5yWesKTev7Yo1@kekkonen.localdomain>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
 <20250922120632.10460-4-sakari.ailus@linux.intel.com>
 <CAMRc=MfaybFsuW1f=obVEX+1ij2F3vui2Q=3eTs5LVd2BCrv7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfaybFsuW1f=obVEX+1ij2F3vui2Q=3eTs5LVd2BCrv7w@mail.gmail.com>

Hi Bartosz,

On Mon, Sep 22, 2025 at 04:26:01PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 22, 2025 at 2:06 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Wentong's e-mail address no longer works, remove it.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/spi/spi-ljca.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
> > index 2cab79ad2b98..3f412cf8f1cd 100644
> > --- a/drivers/spi/spi-ljca.c
> > +++ b/drivers/spi/spi-ljca.c
> > @@ -289,7 +289,7 @@ static struct auxiliary_driver ljca_spi_driver = {
> >  };
> >  module_auxiliary_driver(ljca_spi_driver);
> >
> > -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > +MODULE_AUTHOR("Wentong Wu");
> >  MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
> >  MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
> >  MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
> > --
> > 2.47.3
> >
> 
> That makes perfect sense for MAINTAINERS but why would you remove
> someone's authorship from a driver's C file?

The patch is removing a non-working e-mail address, not anyone's
authorship.

-- 
Regards,

Sakari Ailus

