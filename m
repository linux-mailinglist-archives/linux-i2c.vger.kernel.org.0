Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE575297E18
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Oct 2020 21:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1760432AbgJXT2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Oct 2020 15:28:45 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44984 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760426AbgJXT2o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Oct 2020 15:28:44 -0400
Received: by mail-ed1-f68.google.com with SMTP id t20so5040660edr.11;
        Sat, 24 Oct 2020 12:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4VBZrIVbXA5K5+1xS8Vj2wOcFTF1ErdEn+41O+kAnI=;
        b=XDKfwaJj8eGL+G4NfUNuTTunaGyFZjcSBPAWGjLZ6gvknWYHOD+sF1/iy50gr5sJyB
         eDYa0RtTjGGriDtoNsy8gUh4FUj3HjOjl0xGhBk8PzgDmvMYXgOzTBGy+eeu9GyOn+KO
         9URCWXEfVTHLMLYIXwjd2asS/S/HphkbeqbniPDa0LKRrIPiLYNpSV47uGB2hOOK0nkM
         y61hgL3Q0dEXFnwFa5fqXX5fMHw/4F4d71NYvIWerhAjVSaDErp7wfUmnoTBovBeHvrc
         IJrN8F9377YxGPFSSzPU5+9YyxBaeRjILVbpskKjBwI3UG2sghINeisuK6uYohn/mkAN
         4uCg==
X-Gm-Message-State: AOAM530j0CAdgGXEhkydHjzm+MnuV3ah201syJhyCNHJ+a+Cp5MUlE2q
        GRJ2QUop6hUsdHNKzpD8C14FbakRhh4=
X-Google-Smtp-Source: ABdhPJyRoEAbypDQg0qtaAsbMF+T7hVlpTz9RCVWfQQu8jR7NTFcNbptSFnllzrrpdcbVbtXrbx9Sg==
X-Received: by 2002:a50:9e82:: with SMTP id a2mr8219658edf.117.1603567722004;
        Sat, 24 Oct 2020 12:28:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id 22sm2746047ejw.27.2020.10.24.12.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 12:28:40 -0700 (PDT)
Date:   Sat, 24 Oct 2020 21:28:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify
 code
Message-ID: <20201024192838.GB4638@kozik-lap>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <CAJKOXPcPMRYmQURxAX5JPOR7k0JQmzoaX4xkmyZar_HHLX3dkA@mail.gmail.com>
 <DB6PR0402MB276054D75742322A734DF638881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB276054D75742322A734DF638881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 24, 2020 at 07:39:47AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify
> > code
> > 
> > On Fri, 23 Oct 2020 at 10:27, <peng.fan@nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use devm_request_threaded_irq to simplify code
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 10 +++-------
> > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx.c
> > > b/drivers/i2c/busses/i2c-imx.c index e6f8d6e45a15..ba9d639223ec 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -1216,8 +1216,8 @@ static int i2c_imx_probe(struct platform_device
> > *pdev)
> > >                 goto rpm_disable;
> > >
> > >         /* Request IRQ */
> > > -       ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> > > -                                  pdev->name, i2c_imx);
> > > +       ret = devm_request_threaded_irq(&pdev->dev, irq, i2c_imx_isr,
> > NULL, IRQF_SHARED,
> > > +                                       pdev->name, i2c_imx);
> > 
> > Really? You silently revert commit e50e4f0b85be ("i2c: imx: Fix external abort
> > on interrupt in exit paths"). This is not a simplification but serious change. NAK.
> > At least without proper reasoning of why this is suddenly safe.
> 
> Oh, I need look at git history before. But
> Is it because i2c interrupt enabled too early? I'll try your case on i.MX8M platform.

Shortly, it is because shared interrupts do not go well or at all with
devm-managed interrupt handlers. Probably they could be made working
with additional code, e.g. devm_free_irq() call or some additional
checks in interrupt handlers. But in that case there won't be much of
simplification.

Best regards,
Krzysztof

