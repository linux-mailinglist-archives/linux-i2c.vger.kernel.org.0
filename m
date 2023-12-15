Return-Path: <linux-i2c+bounces-833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC304814BFE
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 16:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B3A28448A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 15:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BBC374C4;
	Fri, 15 Dec 2023 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZh7NHz+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770C9381AF;
	Fri, 15 Dec 2023 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702654941; x=1734190941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=juk1J314+/S3a//H3+F++gkbN9iiXV070ZvkWVIQfYU=;
  b=LZh7NHz+LolXO3Rd4ZiaUXkHQP3NF3YoIIT7JNPq6eq49Ucb1lC+6qmd
   jzSTVbmH8YH87bMrLZk3w2w2K/a3ZhuIClhdriAVXaYYmJOmIXYl5SofK
   w4YgULIWJq4/OvkR35ouOczwZQapIV54s4wt+TiJ3V6Z/+5UAd8vHsfrI
   hWcspHCYujm0DnoYGh1BCVLwylAyxBtWkmpEdK97a5mmgINBq85LReyq5
   tTDD0Bq0Fco8WGGi+1Xb2R325Y7P52DIHYWxFeXJdsupHWeRqzsi4Rmp+
   tPsa9/ky+Y9/cnjaSalMnJLuF8/wpVlO3USbgyYnAYn/5Q79wX2aqqu9k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375436530"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="375436530"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778296024"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="778296024"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:42:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rEAKO-000000069uL-13ME;
	Fri, 15 Dec 2023 17:42:16 +0200
Date: Fri, 15 Dec 2023 17:42:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <ZXxz16ecl4onz5w7@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
 <kbaq6ejaujr565ubdxn6f4e2vxjppoabsbgmpp4zbtkpfpheyr@exlxebf2hy4j>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kbaq6ejaujr565ubdxn6f4e2vxjppoabsbgmpp4zbtkpfpheyr@exlxebf2hy4j>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 15, 2023 at 07:33:37AM +0000, Shinichiro Kawasaki wrote:
> On Dec 14, 2023 / 18:38, Andy Shevchenko wrote:
> > On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:

...

> > > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > > +#define NR_P2SB_RES_CACHE 8
> > 
> > This is fifth or so definition for the same, isn't it a good time to create
> > a treewide definition in pci.h?
> > 
> > See also below.
> > 
> > (In previous mail I even found all cases and listed, a bit lazy to repeat.)
> 
> I'm not sure where are other definitions. I guess PCI_CONF1_FUNC_SHIFT in
> drivers/pci/pci.h is one of them.

Maybe, but I'm talking about treewide (drivers/, arch/, etc) duplications
IIRC it is 5+ of them.

> As you suggested in another mail, I'll add a
> TODO comment and note that the NR_P2SB_RES_CACHE should be refactored later.

Yeah, there are two ways, make this one dependent on the definition or
introduce a definition and update later on. In the latter case it means
a technical debt +.

In the lost email I suggested to list all existing cases somewhere in TODO,
so we won't grep again, but okay we can do that (although I forgot the
exact `git grep ...` command line I have used for that search).

...

> > > -	/* if @bus is NULL, use bus 0 in domain 0 */
> > > -	bus = bus ?: pci_find_bus(0, 0);
> > > +	/* Assume P2SB is on the bus 0 in domain 0 */
> > > +	bus = pci_find_bus(0, 0);
> > 
> > The pci_find_bus() is called in two places now. Can we avoid doing
> > this duplication?
> 
> I will add a global variable "static struct pci_bus *p2sb_bus". It will keep the
> first call return value and allow to skip the second call.

Hmm... Global variables are prone to subtle race conditions, OTOH the P2SB is
not supposed to be hotplugged or moved, so I think it will be fine.

-- 
With Best Regards,
Andy Shevchenko



