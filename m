Return-Path: <linux-i2c+bounces-13130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E6B98B36
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Sep 2025 09:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B464A765F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Sep 2025 07:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8A6289E0B;
	Wed, 24 Sep 2025 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+2UMnRp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657272882B4;
	Wed, 24 Sep 2025 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758700318; cv=none; b=OEO+o7kVhlEke0S8ANNfnvb/8S/4tdCouYIVu5PhSiXJtwERjl4bJiLiN6RCu9FbpLfr+rGGmXWl2lOja91C3pH3j7OLFw/eXvEy3/Kclip9qeBCSWFE7VKGn2X7NUrqsDwuGipQuzKMmEzMAqqRpjnvLJ58131iNuXTwbMirp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758700318; c=relaxed/simple;
	bh=WaJ2eaaSZ2tDy2dFa7jdgb0wqBaGWrbs7O5Yko8R49k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0v70aTq8+XsbjMPcQuukkcTP4Fv+5uyAlFbm5iulPSnucfbc2o/F3mXMt9thg9+LqSRw8CkjAriIZo+S5LOSJMDkobuyQPYQYIWCiIE4FXJ3c5DAkcLHAanxlyr7ZhtjECPCTA/tkzxAkpYcW+9SSuVQjMjo0VNdb5bW8Y0ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+2UMnRp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758700317; x=1790236317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WaJ2eaaSZ2tDy2dFa7jdgb0wqBaGWrbs7O5Yko8R49k=;
  b=F+2UMnRpOQnHbx351/hFwZ946uqnWVYNockM3Zi8xEziSJSBLxyjN68V
   sg63whqJq8kRA8kyoOkLdwjozRS/1pJzdKdAWkpB0ZeC8AWtIwMu1hivu
   JFxKUVQf4ncEQPc9oKbJnKXR+uzC7PywsZSYRsteSACvx93LNDHG646V5
   a7hFcuUfI2+8sPCL8ZMc1fHY7ahvJdJCJMT5VYYjaRei+wBgGC+FwRBwT
   pq2G1h0nQJVvI+RRYIY1bild2iaFn/Hvc1GIH+b/Mz12JC2UcqL2vE61Y
   6JSUfZ+1v5yO5skDWIP7RrkL2EH3+ftoarmL3IbdXDNTaM0cUwfkmGoZa
   A==;
X-CSE-ConnectionGUID: hqTW+WGSRn6b98+pr5qDnA==
X-CSE-MsgGUID: inN1DGcrRFmBhAgAtJzHyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86434463"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="86434463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:51:56 -0700
X-CSE-ConnectionGUID: QCZxO2UFSX+qBI1JeWQi5w==
X-CSE-MsgGUID: cO6qki2BQma1KZyRy8F0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176095748"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.128])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:51:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4F2DD11F8D0;
	Wed, 24 Sep 2025 10:51:49 +0300 (EEST)
Date: Wed, 24 Sep 2025 10:51:49 +0300
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
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	wentongw@amazon.com
Subject: Re: [PATCH 1/5] usb: misc: ljca: Remove Wentong's e-mail address
Message-ID: <aNOjFfQ63UIjMVQb@kekkonen.localdomain>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
 <2025092234-magenta-scouting-c3c4@gregkh>
 <aNF5ahYzteTjq8Iu@kekkonen.localdomain>
 <2025092246-swiftly-foothold-0c48@gregkh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025092246-swiftly-foothold-0c48@gregkh>

On Mon, Sep 22, 2025 at 06:48:13PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 22, 2025 at 07:29:30PM +0300, Sakari Ailus wrote:
> > Hi Greg,
> > 
> > On Mon, Sep 22, 2025 at 02:18:00PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Sep 22, 2025 at 03:06:28PM +0300, Sakari Ailus wrote:
> > > > Wentong's e-mail address no longer works, remove it.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/usb/misc/usb-ljca.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > > > index c562630d862c..1846156c0800 100644
> > > > --- a/drivers/usb/misc/usb-ljca.c
> > > > +++ b/drivers/usb/misc/usb-ljca.c
> > > > @@ -891,7 +891,7 @@ static struct usb_driver ljca_driver = {
> > > >  };
> > > >  module_usb_driver(ljca_driver);
> > > >  
> > > > -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > > > +MODULE_AUTHOR("Wentong Wu");
> > > 
> > > Is there a new address where they can be reached?  SHouldn't that be
> > > used instead of just deleting the intel one?
> > 
> > I believe Wentong has had plenty of time to update his address. If he still
> > prefers to do so, he can do that after merging these patches.
> 
> I would prefer to get Wentong to send the patches themselves for all of
> this if at all possible, thanks!

Cc Wentong (thanks to Lixu for the address).

-- 
Sakari Ailus

