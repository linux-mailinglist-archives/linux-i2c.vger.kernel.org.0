Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9513193D43
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgCZKuM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:50:12 -0400
Received: from mga09.intel.com ([134.134.136.24]:14806 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZKuM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 06:50:12 -0400
IronPort-SDR: xwDxZvg70KlseplL8CyBfr4AudMWSWOrSRrh3IpCV7anY7ngXf2pvdJiA3vuGE3dzTTbJCayfp
 Lsc0SQ3JdfGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 03:50:11 -0700
IronPort-SDR: M0amHD3MPVMlEJU+XQjOzgUglcdYP6/EcfcXDNEslyuwHukvN2/Lpdnxv/AwYWsJao5ttKea7c
 7NP8429VXeNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="265832861"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 26 Mar 2020 03:50:10 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jHQ5U-00D5oD-Gv; Thu, 26 Mar 2020 12:50:12 +0200
Date:   Thu, 26 Mar 2020 12:50:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326105012.GN1922688@smile.fi.intel.com>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVy1acwXxD9C==gGve-Xb-oPbF7BOpu1BaT=1gvUTdQQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 11:36:44AM +0100, Geert Uytterhoeven wrote:
> On Thu, Mar 26, 2020 at 11:17 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > When I wanted to print the chosen values to debug output, I concluded
> > that a helper function to parse one timing would be helpful.

...

> > +static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
> > +                           u32 def_val, bool use_def)
> > +{
> > +       int ret;
> > +
> > +       ret = device_property_read_u32(dev, prop_name, cur_val_p);
> > +       if (ret && use_def)
> > +               *cur_val_p = def_val;
> 
> Alternatively, you could just preinitialize the value with the default value
> before calling this function, and ignoring ret.
> That would remove the need for both the def_val and use_def parameters.

Some drivers are using false to use_defaults. How they will survive this change?
(See rcar case, for instance)

> > +       dev_dbg(dev, "%s: %u\n", prop_name, *cur_val_p);
> > +}

-- 
With Best Regards,
Andy Shevchenko


