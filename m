Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2842347C245
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 16:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhLUPKJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 10:10:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:9532 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235683AbhLUPKI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 10:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640099408; x=1671635408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P3XoF6yKs58kRefwZIbHOEan+69dqpkFZ2rWnl4oE7c=;
  b=RPO9O5aiZmmEwEHzQeXA+TwjZBsnrSAAZ8fVovKKjvf9xkfdEEhqINSA
   DW8iPX82wbXe545PzFMgnKFLMG1CWcx5MqhQnOWUPAtY4NDpHe5kb9utw
   OmRoJThj7TkV7faVOWoFitK2eD5LVo1PVfGOhaiPZhtS8qlSHuAY4M/ku
   oeQbmJxwm1cC7A/ihySldIEhOntjkhEVSmRg9B3EJex1hjQnZ2vYBslZs
   RoycSREzX0vZ24HS6FSz8fgfbRwBtskHY0hi33M9ITk7gjUeqIaxIw8w+
   ZuLgvIg3P6Vv3ZYjNGkge2qxMVrqDmOqfHquWCxRrbO0YD13xV05cufLy
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227703433"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="227703433"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 07:09:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="548094670"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 07:09:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mzgkf-000T09-Ak;
        Tue, 21 Dec 2021 17:08:29 +0200
Date:   Tue, 21 Dec 2021 17:08:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: Re: [PATCH v1 7/7] i2c: i801: convert to use common P2SB accessor
Message-ID: <YcHt7YWCjFaNPBw9@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-8-andriy.shevchenko@linux.intel.com>
 <20210310155145.513a7165@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310155145.513a7165@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 10, 2021 at 03:51:45PM +0100, Jean Delvare wrote:
> On Mon,  8 Mar 2021 14:20:20 +0200, Andy Shevchenko wrote:

...

> > -	res->end = res->start + 3;
> > -	res->flags = IORESOURCE_MEM;
> > +		res->start += SBREG_SMBCTRL;
> 
> I can't see why you no longer set res->end and res->flags here. I can
> imagine that pci_p2sb_bar() may have set the flags for us, but not that
> ->end is still correct after you fixed up ->start. Am I missing
> something?

Good catch of the res->end! But flags actually may be MEM64, which the
original code doesn't properly handle.

...

> >  static const struct x86_cpu_id p2sb_cpu_ids[] = {
> >  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_D,	PCI_DEVFN(31, 1)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_D,	PCI_DEVFN(31, 1)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		PCI_DEVFN(31, 1)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		PCI_DEVFN(31, 1)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		PCI_DEVFN(31, 1)),
> > +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		PCI_DEVFN(31, 1)),
> >  	{}
> >  };
> 
> Any reason why this is added in this patch instead of [3/7] (PCI: New
> Primary to Sideband (P2SB) bridge support library)?

Filling this on demand, no user no entry. I think it's how we assume the code
to be applied in the kernel.

-- 
With Best Regards,
Andy Shevchenko


