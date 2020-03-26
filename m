Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9091E193E92
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 13:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgCZMFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 08:05:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:55934 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgCZMFS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 08:05:18 -0400
IronPort-SDR: J+Ugs1EyZSk51dsu3pP4+sSD1XJPwzeZ85GSoqC5bVRoPjZGTEi3qZWhRczKP30rHh0+WDoOcW
 T+VBr3n2boGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 05:05:18 -0700
IronPort-SDR: WNd680x+3yR7O9UQOXuYCW9ptLjBJO5Ar2yJ7lwfzfl4cmgWmuptR0XvyfgSRWX/kCnx+I0jJM
 P1wRi+b//h7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="293614158"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2020 05:05:16 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHRGB-00D72B-C8; Thu, 26 Mar 2020 14:05:19 +0200
Date:   Thu, 26 Mar 2020 14:05:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326120519.GS1922688@smile.fi.intel.com>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
 <20200326105241.GA1538@ninjato>
 <CAMuHMdWmBE5qpouuJfJMvw_TuxbmnQd70CTH3RVaoK6k5eUcqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWmBE5qpouuJfJMvw_TuxbmnQd70CTH3RVaoK6k5eUcqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 12:15:22PM +0100, Geert Uytterhoeven wrote:
> On Thu, Mar 26, 2020 at 11:52 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > +{
> > > > +       int ret;
> > > > +
> > > > +       ret = device_property_read_u32(dev, prop_name, cur_val_p);
> > > > +       if (ret && use_def)
> > > > +               *cur_val_p = def_val;
> > >
> > > Alternatively, you could just preinitialize the value with the default value
> > > before calling this function, and ignoring ret.
> > > That would remove the need for both the def_val and use_def parameters.
> >
> > I can't do that because if !use_def and ret, then the value must not be
> > changed.
> 
> Of course the preinitialization must still be done conditionally:
> 
>     if (use_defaults)
>             t->foo = DEFAULT_FOO;
>     i2c_parse_timing(dev, "foo-name", &t->foo);

If the default *is* coming from timings structure?

Care to look at rcar case?

-- 
With Best Regards,
Andy Shevchenko


