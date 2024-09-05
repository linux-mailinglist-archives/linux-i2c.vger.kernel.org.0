Return-Path: <linux-i2c+bounces-6233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B196D225
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 10:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 702F8B2459B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 08:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86861193079;
	Thu,  5 Sep 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe9d4Xyd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDB155306;
	Thu,  5 Sep 2024 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525017; cv=none; b=UZnPtvapwB6suB3xyd4sLWhbXKQQ2QanzIxXAzyWITVi0595IdSUO1fkYyvVxlURD5eXT3okJ3+S0kQ//omTOm5eZ36V+bqeTz50pM2cfoaqz/NK8v7WJm8+CxJO2zNA0B5eQEHNjrte0+TUN8JzpBvkx5iDCb5i26e6pZaWru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525017; c=relaxed/simple;
	bh=iXBsd3oypDiySyTP3KMHchgA9ERUDyB4wPzDOwrSMoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdzUysJTONs++tBDmBmqjQsvr2outoT9A3/1/7D51hKHj/yqAh/+v3t9gztVpz+ZVJXLsMZKZYMpQjgTI9k3tIt4sXpN2I43uvXU56V0q0NrC4vSuM+o9i5YCZPDSh+W6hhdB95KnFe6f/TLaA8tJKKJUePc0NJDB94ffclg8w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe9d4Xyd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725525016; x=1757061016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iXBsd3oypDiySyTP3KMHchgA9ERUDyB4wPzDOwrSMoQ=;
  b=Qe9d4XydKK88wl6NTR6Vczn2k9oBSgWBaoCQ9yuaaBZ/15Vgn+l6iCf7
   8oIc2CQy46tJQZXw2shfEOobQDBS5ewIvGkIb7tpjfDU0apTc3FW7PZtF
   WpSNMKxWLC5sASyFc38Iz7DNZZhxHsnTF8PfgG7+FWLkCSnj5kwRBp0qW
   Z0RvhRtUkguMi+gAj52G+RuDBv4GMr4qpz5NzZN+bopdxNAr58z10dH1m
   QD2mT1G8ymup7pmku3rA8iQvgjqJqAFoUGZkPetynCHl8yLlQdFr0IIPr
   /asqt1y/kyBe9gBYqagmmjY/yPUMOWLo4uXKADlr5hb8ubJFYVMDWxRE5
   g==;
X-CSE-ConnectionGUID: XVxU9lS+SyWC2F2PSGBg9w==
X-CSE-MsgGUID: Mb+QiDz+S8K5Ew76Nn63hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34892768"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34892768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:30:15 -0700
X-CSE-ConnectionGUID: 5zvZRKJrTl2+B4EI9zTBiA==
X-CSE-MsgGUID: gVuy0mQvQxyN4gOuKIoumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="88792411"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:30:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sm7sF-00000005KfR-0tbh;
	Thu, 05 Sep 2024 11:29:51 +0300
Date: Thu, 5 Sep 2024 11:29:50 +0300
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
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <Ztlr_hKm75fMBaBO@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
 <ZthdU6UGlM75GJVj@smile.fi.intel.com>
 <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 04:11:18PM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 4, 2024 at 9:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> Looks like Mark already merged this one. I'll send extra patches to clean
> this up later.

I was OOF, haven't read this and I sent already a patch yesterday evening.

-- 
With Best Regards,
Andy Shevchenko



