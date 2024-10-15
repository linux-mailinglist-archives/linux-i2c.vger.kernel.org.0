Return-Path: <linux-i2c+bounces-7405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80C99F4C3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 20:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CCC284AE6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 18:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216EA16D9AF;
	Tue, 15 Oct 2024 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7DpASe7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165E28691;
	Tue, 15 Oct 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015403; cv=none; b=TeznQ/U6gpq1THQJPZMicdrBMDjia8JgYPf4zr0Vjx8J8Yf2kR/UoalmE+0dtepqUkepMR8qDJOVGajoT82j0UVQGRZOcsW7goE2yd54KzdczPWfcqzHCB0BJjAoGP15uAsp5Lo2+lTKzH0809gZkNGOV9KyMIwGXGsSH+Qq7CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015403; c=relaxed/simple;
	bh=eh6byDyRvz0D0m9V0d4eNpB5N5SL207MeVOFPzaUivs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZQzurUa3RA8MyvO5cy7nTNhimLk2o4JgW7U96edxmVVRJSEZ1d3kHOGg8npaIPxP6Tw37lESKq/1kjVWQHH5p9n1fLf8hRG/tbnAuImBNJw2e6W/8MTrtFDeOvtnaGOL2pJR3BkSEBnSiRDqNQmYtl/5lQy8bIcU1iWz725HLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7DpASe7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729015402; x=1760551402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eh6byDyRvz0D0m9V0d4eNpB5N5SL207MeVOFPzaUivs=;
  b=j7DpASe7RLW9RIYZjwlhNO/THE0O8BNdUQqyYwYp2heZMqP2W4vvY9Vy
   Zf/dY3vQc1om0tt1gxjakXUOd+TjrL0SuIcFOzF9Os7ewn0eosaxYPyeu
   TjUBU9QjKpRxvhGCum5lPHjrjnCN6zkD97HpCptsIX+LDW5lm13cL6n3q
   hUVQLyvoiZl2XVUTFWRN0jYAwf6Eoc+zzI45OFj2B656+HWcsgBHh8HQ4
   C+FSzG9ZO+u2+8ywF1hGTwKKdsT/guWffMJhc4vkfC9zu2mMQ2Vy5YFuC
   YdfJadfudEN/iGgLDEUtwPrf6LraRENnhuFx75Uh029GXpkNOmCVtVhSl
   g==;
X-CSE-ConnectionGUID: s8bFPH9sTeaQ6rtL5FqcOA==
X-CSE-MsgGUID: ROYQJQqsQfeov0EdIMS0yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28558236"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="28558236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:03:21 -0700
X-CSE-ConnectionGUID: jDCVe1NaS82xc497trlqsA==
X-CSE-MsgGUID: 0g268ps7TfOSgloJEy9fVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77988218"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:03:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0lt4-00000003Tee-1SQx;
	Tue, 15 Oct 2024 21:03:14 +0300
Date: Tue, 15 Oct 2024 21:03:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <Zw6uYl0CXhl_ru08@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 10:58:31AM -0700, Doug Anderson wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > +       struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
> > +       if (IS_ERR(i2c_node))
> > +               return PTR_ERR(i2c_node);
> 
> I'm still getting comfortable with the __free() syntax so sorry if I'm
> wrong, but I _think_ the above is buggy. I believe that the definition
> of the free function for "device_node" is from:
> 
> DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
> 
> ...which means it'll call of_node_put() to free "i2c_node" when it
> goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> pointers. So I think that if you get an error back and then return via
> the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> ERR pointer. Did I get that right? Presumably you need to instead do:
> 
>   return PTR_ERR(no_free_ptr(i2c_node));
> 
> ...or change of_node_put() to be a noop for error pointers?

I could state that device_node FREE class has to be updated for these cases.
fwnode, for example, handles both error pointers and NULL.

-- 
With Best Regards,
Andy Shevchenko



