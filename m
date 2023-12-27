Return-Path: <linux-i2c+bounces-1021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D2E81F090
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 17:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A7F3B212F3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 16:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E91C41C66;
	Wed, 27 Dec 2023 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJLtQqq/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EC46522;
	Wed, 27 Dec 2023 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703695513; x=1735231513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8fNHv41ga8MjRO0b2iqdygR+BQH2D32ZIf1bcug268=;
  b=YJLtQqq/coaMWGYw2hlY2yjYfMM3MjxCkHkXDCjZzRzy9Yv/ZDnqst+M
   yk2Huodsop0VPAjmXmiCpXH9XqCUotaA0l9p7SRTPDn4cUQFDYoqt3Ecu
   cQksxEBbxbVMJj3JnqhtQ4CnTTyTlehyapCirCoQv1OTuoMfeowGPkqKY
   j7XVIV3aIai5sNUcJE+R2ttzeF6WGuVALKUyZ47vLTQhUFW0NMEMAU4Y5
   ZsU4uYWgOX0iGv33jVFTphjNZm9UzCx93i9DDyZ1NRtTi3aY4xLzzHqav
   eJfZ+ubBWz0rnk5HSDNbfgk0gSaCHHk7r5WEqnuZT8T0Uh+IKvzeo4FBg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="18019626"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="18019626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1109680240"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="1109680240"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:45:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rIX1l-00000009Sy1-4A6W;
	Wed, 27 Dec 2023 18:45:05 +0200
Date: Wed, 27 Dec 2023 18:45:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <ZYxUkSxjXQV_dZrJ@smile.fi.intel.com>
References: <u6v2mm6ncifgretsozi4kad2rlbz5zo3bdz4uexwkuvjyigbaf@betyniztbojq>
 <20231227131450.GA1499391@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227131450.GA1499391@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 27, 2023 at 07:14:50AM -0600, Bjorn Helgaas wrote:
> On Wed, Dec 27, 2023 at 01:09:03AM +0000, Shinichiro Kawasaki wrote:
> > On Dec 26, 2023 / 18:34, Bjorn Helgaas wrote:
> > > On Mon, Dec 25, 2023 at 06:26:56PM +0900, Shin'ichiro Kawasaki wrote:

...

> > > > +static int p2sb_valid_resource(struct resource *res)
> > > > +{
> > > > +	return res->flags ? 0 : -ENOENT;
> > > > +}
> > > 
> > > This got worse because it's *named* like a boolean, but the return
> > > value can't be used like a boolean, which makes callers really hard to
> > > read, e.g., this:
> > > 
> > >   if (p2sb_valid_resource(res))
> > >     /* do something */
> > > 
> > > does exactly the opposite of what the reader expects.
> > > 
> > > I see that you want to use this -ENOENT return value in the callers:

> > I have to admit that the function name meaning is opposite... When I
> > followed Andy's idea to make the function to return -ENOENT, I
> > should have renamed the function to not cause the confusion.
> 
> Oh, sorry, I hadn't seen that idea.  But your v4 looks good to me (at
> least this part; I didn't look carefully at the whole patch :) ).

Bjorn is the maintainer, I'm pretty much okay with his suggestions.
I will be off for a month, so feel free to use my
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
as starting from v4 it LGTM.

-- 
With Best Regards,
Andy Shevchenko



