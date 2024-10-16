Return-Path: <linux-i2c+bounces-7428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA059A076C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 12:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C711F27971
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BDE205E0F;
	Wed, 16 Oct 2024 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MveEge+1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650F207A1E;
	Wed, 16 Oct 2024 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074586; cv=none; b=cCg0nzF4p04Yw59Fqf3ZxNhLO8VUYoJvxcqYIr2oGpDyE/5Aww2lcL4Lw4+uV2L9hsCC7MFD2MUq/VHjHOeNXkiIX9T7EAMP9KjUN4fiyQyJj6NhLjHQQdz6YZeIBhsApbGqZSmBC0Q00BHNb4kAHH3y2hj1L/Sr2+I9MgAXjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074586; c=relaxed/simple;
	bh=/I9NuBzwS0z/PzxTR4AlnYAU0plH7o11dVm/FJnJcMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBy3MGU/GfjmIpzvEikYlMgzZ6YHj4ij5veVBn85GG1uLpdXq6E4GzpqBJNfAFlWMwemnep9h6IW9r/xThuhPrkoCuMrtnSN38hIFesFPKLjsERx/lGoBb5l5ilyEwZNYlg16inks3wjhMvBpYdWlQyt26IcfAttGRb2+0UflN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MveEge+1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729074585; x=1760610585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/I9NuBzwS0z/PzxTR4AlnYAU0plH7o11dVm/FJnJcMY=;
  b=MveEge+1E6krLFQPenA5aFvAlcZDrhamJXubzsIhPiEt9ryXQaQ83tZW
   ILy3+wLLxRD76Gg2hIh/6x+9UaPXsyhIRINC+Ngp5aOfKIcNcqOJWe7Oi
   7cC8aAJwqRP5aUtKjLe2dQ+A44Q3tSoHzb7jFaQEpiNoHVonHTpaS0PaH
   XR8vs5SiuYbcPdVAmM0lyKaci0Vq93yOKSVDCImA4ZPxSellTRg3YeKFa
   PBgQYpJ1B+29fSmG2ew6k0XHidah2cNRXev/9rzcmgySE8u+Y6bu6id3Y
   arNAQVe86hHGMlcm7ZMMb4uWQOe7t+0N+ZhheZZqxtu3RGbdfp1/Ok0Dz
   g==;
X-CSE-ConnectionGUID: vjZCacEfTbWfYDL4Uz68lA==
X-CSE-MsgGUID: MJNLHGSgTOSdJF1rZw1vhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31380237"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31380237"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:44 -0700
X-CSE-ConnectionGUID: TYPotaPhQ9idPd4HWmjtZg==
X-CSE-MsgGUID: 78XPk2XQRJyYgT1Pni6Yzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="82148971"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t11He-00000003imA-05Ek;
	Wed, 16 Oct 2024 13:29:38 +0300
Date: Wed, 16 Oct 2024 13:29:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
Message-ID: <Zw-VkQ3di5nFHiXB@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
 <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
 <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 16, 2024 at 05:28:05PM +0800, Chen-Yu Tsai wrote:
> On Wed, Oct 16, 2024 at 3:01 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Wed, Oct 16, 2024 at 1:58 AM Doug Anderson <dianders@chromium.org> wrote:
> > > On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > > ...which means it'll call of_node_put() to free "i2c_node" when it
> > > goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> > > pointers. So I think that if you get an error back and then return via
> > > the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> > > ERR pointer. Did I get that right? Presumably you need to instead do:
> > >
> > >   return PTR_ERR(no_free_ptr(i2c_node));
> > >
> > > ...or change of_node_put() to be a noop for error pointers?
> >
> > Good catch! As Andy suggested, it should be updated to handle both.
> > I'll add a patch for this.
> 
> On second thought, it might be better to change i2c_of_probe_get_i2c_node()
> to return NULL on errors. That seems to be what most functions do. I only
> found a handful of exceptions.

It seems that OF has been written in the assumption that device node pointer
is never an error pointer. So, probably fixing your function is the best
approach right now.

-- 
With Best Regards,
Andy Shevchenko



