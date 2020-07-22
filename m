Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E9A229A25
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 16:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbgGVObf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 10:31:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729126AbgGVObe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 10:31:34 -0400
Received: from embeddedor (unknown [201.166.157.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C28B20709;
        Wed, 22 Jul 2020 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595428294;
        bh=R9Fecg1j6n04pUIBM0fwXtjbmYSjbCHZRgh6WgCL/BM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ybp8cdiYia42CxukEZUwLynLe/KnejR4040+QxBwDPLd2Y6VWP7WL/XfwoPr+Fyk1
         RGtCGWvM6GZVsTWzCxGxbrO3zAcYMCGGu7cys+m7RNRwtgGP16lTZDeP0YXRqMPTYC
         R/eSlDeHRYB2J8f3lOfGdrs18n0Yuha2H9f5aM+s=
Date:   Wed, 22 Jul 2020 09:37:13 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
Message-ID: <20200722143713.GB22267@embeddedor>
References: <20200721233814.GA3058@embeddedor>
 <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 22, 2020 at 11:52:56AM +0300, Andy Shevchenko wrote:
> On Wed, Jul 22, 2020 at 2:48 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1].
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> 
> > [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Perhaps you may do it as Link: tag?
> 

mmh... that's a good suggestion; thanks, Andy.

--
Gustavo

> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> > index 8522134f9ea9..55c83a7a24f3 100644
> > --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> > @@ -90,7 +90,7 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
> >         switch (pdev->device) {
> >         case 0x0817:
> >                 dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> > -               /* fall through */
> > +               fallthrough;
> >         case 0x0818:
> >         case 0x0819:
> >                 c->bus_num = pdev->device - 0x817 + 3;
> > --
> > 2.27.0
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
