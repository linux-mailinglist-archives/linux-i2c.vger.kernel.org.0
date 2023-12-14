Return-Path: <linux-i2c+bounces-793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72B8132B3
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E84A81F2145C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 14:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A05359E2A;
	Thu, 14 Dec 2023 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDnoVLV5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE659C;
	Thu, 14 Dec 2023 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702563191; x=1734099191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qVWmLmZWB18LARbQELKdDZQ98UegEYFbrzEnCny2biw=;
  b=VDnoVLV55N0kqxVGBz2rXEQAbBt7g01YmzHzsfVPutKO/Ycu/w5zMHkF
   HqT+UDs8LKDMlBCiL27E16YOzVbEB8Ot52H0lMv4UHwTnJFI6jGHrFign
   f/1Bt31EQlrUaOmU9wu2uFUbZwLjHCH22BztHpcpv4iWKo9a0RnHViAh9
   64HrDg08BEbheMUmnBmW+pSG09OUP8XbHN97uFtgORZJ6Hqy3aCs8L0WX
   ODWnbR2Uov2V0FYR2OECwT6WNtrZwXkUp3PEc1wiqJfCOFzI2VJvD+H8s
   OCZGGHnItyHjIg436g+24HogRf3kPobm6n8+bE7HBTvPiNlAOzuUkIrDd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2283330"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2283330"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892482377"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="892482377"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:13:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDmSW-00000005rZ3-3j41;
	Thu, 14 Dec 2023 16:13:04 +0200
Date: Thu, 14 Dec 2023 16:13:04 +0200
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
Message-ID: <ZXsNcGnlTPwgQE-T@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXm6QrRkyzGRg8SB@smile.fi.intel.com>
 <eo7bnkdph6fwb74zn57r33a6unodkpagpk3dk5euz5cdc2mve4@557h3e3v5og7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eo7bnkdph6fwb74zn57r33a6unodkpagpk3dk5euz5cdc2mve4@557h3e3v5og7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 12:55:36AM +0000, Shinichiro Kawasaki wrote:
> On Dec 13, 2023 / 16:05, Andy Shevchenko wrote:
> > On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:

...

> > > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > > +#define NR_P2SB_RES_CACHE 8
> > 
> > Here... (at least some better comment with TODO needs to be added,
> > and next patches can address that).
> > 
> > >  	struct resource *bar0 = &pdev->resource[0];
> > 
> > ...and here... (okay, not exactly here, but with the same idea,
> > to use pci_resource_n() macro)
> > 
> > > +	if (!PCI_FUNC(devfn_p2sb)) {
> > > +		slot_p2sb = PCI_SLOT(devfn_p2sb);
> > > +		for (fn = 1; fn < 8; fn++)
> > 
> > ...and here...
> > 
> > > +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> > > +	}
> > 
> > ...and so on I gave comments. Any reason why they left unaddressed?
> 
> Andy, thanks for the response, but I'm not sure about the comments you gave.
> I guess you responded to the RFC v1 patch but it somehow did not reach to me,
> probably. According to the lore archive, only Hans responded to the RFC v1 [1].
> If this guess is correct, could you resend your comments on the RFC v1?

Oh, my... It seems the message was never delivered and I haven't paid attention
on the bounces.

Give me time, I'll try to restore the review from my memory and will send
a new email.

> [1] https://lore.kernel.org/platform-driver-x86/20231201104759.949340-1-shinichiro.kawasaki@wdc.com/

-- 
With Best Regards,
Andy Shevchenko



