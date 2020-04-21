Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9401B1B3B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 03:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDUBYE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 21:24:04 -0400
Received: from mga03.intel.com ([134.134.136.65]:26112 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgDUBYE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 21:24:04 -0400
IronPort-SDR: QnPUOwr8j1z9LEkLSY8XgpKFr7LulLW4S0mMd2UUf+dht/4ofPBzCW36UiCL45vsScrbkh4mSR
 L9dHxHXbr2YQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 18:24:04 -0700
IronPort-SDR: IEpCEcGrhvQfm09VJgMdCD6wh5y1oneeQ0RpY3QpwGzjKvOG+6U3IX/d6N+Qg81ERgeOQGL1IN
 oUwMG0yUQF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
   d="scan'208";a="429344270"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2020 18:24:02 -0700
Date:   Tue, 21 Apr 2020 09:24:03 +0800
From:   Philip Li <philip.li@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        kbuild test robot <lkp@intel.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>, lkp@lists.01.org
Subject: Re: [LKP] Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200421012403.GB32555@intel.com>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
 <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
 <20200419163600.GA19772@nuc8i5>
 <20200420094319.GA2094@ninjato>
 <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 20, 2020 at 12:47:12PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 12:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> >
> > > 5. Run `codespell` across drivers and subsystems
> >
> > I think Colin King is already working on that. I regularly get patches
> > from him doing that.
> >
> 
> I think CI should integrate it in their workflow,
> 
> LKP guys, what do you think?
thanks, this looks valuable, we will investigate the tool
to see how we can integrate it to our testing flow.

> 
> > > 6. Fix ioremap(..., 0) [size = 0] across architectures, now some return NULL,
> > >    some return address, some may even have leaks
> >
> > This sounds more useful to me. Would be great if you have interest.
> 
> But it much more advanced :-) Complete dive into the kernel guts.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> _______________________________________________
> LKP mailing list -- lkp@lists.01.org
> To unsubscribe send an email to lkp-leave@lists.01.org
