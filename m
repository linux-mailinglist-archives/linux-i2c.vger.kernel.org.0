Return-Path: <linux-i2c+bounces-6778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D4979F06
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D945028401B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C68C14F9EA;
	Mon, 16 Sep 2024 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOuRtlLU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF314D6EB;
	Mon, 16 Sep 2024 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726481620; cv=none; b=E50RjU8Ea2GEsaK/2qr3xSPY9Gd+DQQSNkpmSGiaMnkk1909FSGDdmyDyPlaGSZd4wHHPm8wh0iyMA7SG8AJNnKIYanSUUPAkqEBLrhzNgpavByDwcUEt5VoT+31fidGWEFyorxU8pCKKYbrENiS9A02Ym2UGLSiDK/1jS15KJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726481620; c=relaxed/simple;
	bh=AJClUZHkcOc0nIkFKgtMeGqAt/Ij2O5DgRNhQvRHDw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkLaseQ4YHy4xkPRuo9Oi+lks8TRGpEQ3voQkXnHf+yhBUKKEx8MXHfluQLko3gIhhPDj2iTA5tYJdf1MtEDPx0tjPS2BlTCDrKHnxNqN4RNNL4oISn9wdMNUzUkM8KbIAbngOMWiLyo43crOPNKxXm2LKmZGm+1iwP3GCdW1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOuRtlLU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726481619; x=1758017619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AJClUZHkcOc0nIkFKgtMeGqAt/Ij2O5DgRNhQvRHDw4=;
  b=bOuRtlLUsg7H7Ys2pM0yG01NHRH6cFKKxaDVBWkVIurdUk53CenG1sbp
   dRuZCKyACY8x1LEi/xLbGM+dxIS1xwRpW1Vh3SifXPcPyKViCQBZ11KfK
   nONWkQdgORIR1TanGzPTl1D8bfnwMGlDiP1siALLjrCT6q+CbFYZv1RjG
   RPn+FmaoU6vZdtL9Do9txA2GgAN99JRrCN7CdZ5/mW117V5OpBNQXCLHN
   torSDAkAgSTblIQPNZi3279luKgagWvpOI64qOYkXHXc23h/hkrqe+EHn
   cMqxHXE+6hhoZcgQAeKZUYCDBcHX1ZcooM1T/IprBpOAu0mz8QebmLkL/
   w==;
X-CSE-ConnectionGUID: rssQSRwsTzCa8AR/cyXRRQ==
X-CSE-MsgGUID: /FY4BnfhRNSSWaB2zM9uHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42815758"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="42815758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:13:38 -0700
X-CSE-ConnectionGUID: 6/QFDO/ZT/CAOga95eN+gA==
X-CSE-MsgGUID: 9nXYsiyvTTC1+eAvvYp/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73419425"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:13:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq8jb-00000009Pyj-0z7J;
	Mon, 16 Sep 2024 13:13:31 +0300
Date: Mon, 16 Sep 2024 13:13:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZugEyqg-2ZL2VVEd@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 04:43:04PM -0700, Doug Anderson wrote:
> On Wed, Sep 11, 2024 at 12:28 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > +static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
> > +{
> > +       int ret;
> > +
> > +       dev_info(dev, "Enabling %pOF\n", node);
> > +
> > +       struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
> > +       if (!ocs)
> > +               return -ENOMEM;
> 
> I guess the kernel lets you mix code and declarations now? I'm still
> used to all declarations being together but maybe I'm old school... I
> would have put the "dev_info" below the allocation...

In general yes, but we don't allow it everywhere for everything,
we have two exceptions:
1) for-loops;
2) __free() RAII.


-- 
With Best Regards,
Andy Shevchenko



