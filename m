Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36239103E10
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 16:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfKTPPH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 10:15:07 -0500
Received: from mga17.intel.com ([192.55.52.151]:60061 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbfKTPPH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Nov 2019 10:15:07 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 07:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="357463795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2019 07:15:04 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iXRh9-0006gg-Uj; Wed, 20 Nov 2019 17:15:03 +0200
Date:   Wed, 20 Nov 2019 17:15:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1] i2c: i801: Correct Intel Jasper Lake PCH naming
Message-ID: <20191120151503.GP32742@smile.fi.intel.com>
References: <20191107105529.22825-1-andriy.shevchenko@linux.intel.com>
 <5f1cc181-c45e-bea2-f466-f9db9276335f@linux.intel.com>
 <1ef8d354-d5dc-19b6-206c-f07519323965@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ef8d354-d5dc-19b6-206c-f07519323965@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 20, 2019 at 04:09:41PM +0200, Jarkko Nikula wrote:
> Hi Andy
> 
> On 11/7/19 1:29 PM, Jarkko Nikula wrote:
> > > diff --git a/drivers/i2c/busses/i2c-i801.c
> > > b/drivers/i2c/busses/i2c-i801.c
> > > index df02040d36d5..2de184bbd21f 100644
> > > --- a/drivers/i2c/busses/i2c-i801.c
> > > +++ b/drivers/i2c/busses/i2c-i801.c
> > > @@ -67,7 +67,7 @@
> > >    * Comet Lake-H (PCH)        0x06a3    32    hard    yes    yes    yes
> > >    * Elkhart Lake (PCH)        0x4b23    32    hard    yes    yes    yes
> > >    * Tiger Lake-LP (PCH)        0xa0a3    32    hard    yes    yes    yes
> > > - * Jasper Lake-N (PCH)        0x4da3    32    hard    yes    yes    yes
> > > + * Jasper Lake (PCH)        0x4da3    32    hard    yes    yes    yes
> > >    *
> > Let's crosscheck this first. The spec version I have explicitly says
> > Jasper Lake -N and I wanted to carry it forward in case there is another
> > version in the future.
> > 
> Would you like to send an update to this? I can do it also.
> 
> As we were told it's Jasper Lake *SoC* so also drivers/i2c/busses/Kconfig
> and Documentation/i2c/busses/i2c-i801.rst should be updated accordingly.

Ah, thanks. I'm on it!

-- 
With Best Regards,
Andy Shevchenko


