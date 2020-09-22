Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FA9273D68
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 10:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgIVIiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 04:38:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgIVIiu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 04:38:50 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F3DA23A1E;
        Tue, 22 Sep 2020 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600763929;
        bh=Mm0cw1XMHiTcGFvYZ5YAxmxvfxAfdbEoZVA80me39JE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJGS3A93Lgq85UkTDgJdes21K55ht2plPLTIViCrhCUCIC3GbnIc5h/FFIvwdAN7y
         GZhrRI/BtSs3f5OiCBv4YSrBUeSmOmarfFBLok5wtLaSTM8T+VppMPRyZogheOejZ9
         PC9RJDxQ+/0Q63ijmDGf4+v/jSPWVgbPUXU+FO1g=
Date:   Tue, 22 Sep 2020 10:39:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/20] dt-bindings: usb: renesas,usb3-peri: Document
 r8a774e1 support
Message-ID: <20200922083909.GA2092905@kroah.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vJ2n3KEL8P+XmVob2zjoWaX+s4a6c1TV_WoPFkwdkZmA@mail.gmail.com>
 <20200920140824.GA2915460@kroah.com>
 <CAMuHMdUyXMfZcVKkqaZHJ8tJf-3Kotqg+S2NHMZT0VFO0ZJJww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyXMfZcVKkqaZHJ8tJf-3Kotqg+S2NHMZT0VFO0ZJJww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 21, 2020 at 09:30:39AM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Sun, Sep 20, 2020 at 4:08 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sat, Sep 19, 2020 at 11:50:07AM +0100, Lad, Prabhakar wrote:
> > > On Thu, Jul 16, 2020 at 6:19 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > >
> > > > Document RZ/G2H (R8A774E1) SoC bindings.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > Could you please pick this patch.
> >
> > Don't DT patches have to be acked by a DT maintainer first?
> 
> https://lore.kernel.org/r/20200721033508.GA3504365@bogus

Ah, missed that, sorry.  This, and patch 11/20, now queued up.

greg k-h
