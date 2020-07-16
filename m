Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F12222B01
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 20:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgGPS03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 14:26:29 -0400
Received: from mga11.intel.com ([192.55.52.93]:18196 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbgGPS03 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jul 2020 14:26:29 -0400
IronPort-SDR: qGvNqRlJQCls0Rg38nwEwwzu2z3yh+E6zvWHGaKQvJ0q5Z32KSBoJZTXjQazdcX5AMvNXTIIkM
 JpIJnIIOr42g==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147461501"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
   d="scan'208";a="147461501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 11:26:27 -0700
IronPort-SDR: sNRhZZDdubKD2nsinea1jGjgLKdT7PBFxrDpzy+PP6d03Qh4m/FY1Nwk7Bje2doLA36MTzxcdz
 iN8ZJTJhzuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
   d="scan'208";a="361119837"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2020 11:26:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jw8aO-002CtJ-Lv; Thu, 16 Jul 2020 21:26:24 +0300
Date:   Thu, 16 Jul 2020 21:26:24 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V1 2/2] i2c: iproc: add slave pec support
Message-ID: <20200716182624.GT3703480@smile.fi.intel.com>
References: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
 <20200716080836.2279-3-rayagonda.kokatanur@broadcom.com>
 <CAHp75VeXBCqEhfna2mQaHv7bZKOrj+A6KkbCrMAfM=X9+boDjA@mail.gmail.com>
 <CAHO=5PEMou=a7Kqc=_ZJ8V9FQ=dHA0cJkkojdq91NBsO1Dp3TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHO=5PEMou=a7Kqc=_ZJ8V9FQ=dHA0cJkkojdq91NBsO1Dp3TQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 16, 2020 at 10:49:14PM +0530, Rayagonda Kokatanur wrote:
> On Thu, Jul 16, 2020 at 3:44 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jul 16, 2020 at 11:14 AM Rayagonda Kokatanur
> > <rayagonda.kokatanur@broadcom.com> wrote:

...
> > > -#define S_RX_PEC_ERR_SHIFT           29
> > > +#define S_RX_PEC_ERR_SHIFT           28

> > This needs to be explained in the commit message, in particular why
> > this change makes no regression.
> 
> I didn't get what do you mean by "no regression", please elaborate.

The definition above has been changed. The point is you have to point out in
the commit message why it's okay and makes no regression.
For example, "..._SHIFT is changed to ... according to documentation. Since
there was no user of it no regression will be made." Provide proper text, b/c
I have no idea what is exactly the reason of the change and if it's indeed used
to have no users.

...

> > > +                               ret = bcm_iproc_smbus_check_slave_pec(iproc_i2c,
> > > +                                                                     val);
> >
> > One line looks better.
> 
> Yes, but to have 80 char per line, I have to do this.

We have more, but even if you stick with 80 the above is harder to get than if it is one line.

-- 
With Best Regards,
Andy Shevchenko


