Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC08452F63
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 11:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhKPKp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 05:45:59 -0500
Received: from mga07.intel.com ([134.134.136.100]:16239 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234596AbhKPKpj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Nov 2021 05:45:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="297091372"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; 
   d="scan'208";a="297091372"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 02:42:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="504520815"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 02:42:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmvv4-007OBo-7L;
        Tue, 16 Nov 2021 12:42:30 +0200
Date:   Tue, 16 Nov 2021 12:42:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH v3] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <YZOLFSpQqw1haCC2@smile.fi.intel.com>
References: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
 <YYv+YdRWzU9HzEY8@smile.fi.intel.com>
 <71a5c6d4-4ae8-2c54-78e7-94a37b43a986@linux.intel.com>
 <20211116111821.75ba4ea6@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116111821.75ba4ea6@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 16, 2021 at 11:18:21AM +0100, Jean Delvare wrote:
> On Thu, 11 Nov 2021 16:39:28 +0200, Jarkko Nikula wrote:
> > On 11/10/21 7:16 PM, Andy Shevchenko wrote:
> > > On Wed, Nov 10, 2021 at 04:10:32PM +0200, Jarkko Nikula wrote:  
> > >>  	/*
> > >> -	 * Clear irq sources and report transaction result.
> > >> +	 * Clear remaining irq sources: Completion of last command, errors  
> > >> +	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
> > >> +	 * assertion independently is the interrupt generation blocked or not  
> > > 
> > > is --> if ?
> >
> > hmm, I don't know which one is correct or neither. Or should it be 
> > something like "independently of whether the interrupt generation is 
> > blocked or not"? Grammar polices, please help me :-)
> 
> ... independently of the interrupt generation being blocked or not.
> 
> Sounds better?
> 
> (I think your "of whether" variant is grammatically correct too, if you
> prefer that.)

For the sake of bikeshedding :-) I lean to "whether" variant, because I think
the determiner usage is decreasing over time, while its presence makes language
richer.

-- 
With Best Regards,
Andy Shevchenko


