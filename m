Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD31229459
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGVJEE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 05:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVJED (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 05:04:03 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907F8C0619DC;
        Wed, 22 Jul 2020 02:04:03 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id y9so270321oot.9;
        Wed, 22 Jul 2020 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxpuzEB9KMj0t9s7OpDkA/XsxcLlP2L79Bj3H31wGQg=;
        b=qAxVGgydjt7gac3OWXNzknnBRu/Ayp4cFle9nv2nEPqB5M5+vdb0v3MDGbQ06e+7ay
         b0TzDGT/L02h91uiZTDfpT+t8IGImRvqqRI6REKGm2NO2yM8pg5bu2/WMEPANPwESafj
         NsfMyrZBjDtNsro5JfsYKKqZTaqDSpaj89xS8AHgBem4i5Ui7goYOUnYHn6X9Bxglawa
         u3sQ0Cm74g2yY2Ik9zKg5Xz5etuPnsqFdCkdhqatBU+DL04f3Ui0HP96+t4hi5KGx9PQ
         dGUTetX4hzJgJdDQBbmcRkvGE/hY25XhaSTujaxIV3M7KqqZDEP9L7DCYm2/ihxJjhq5
         l1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxpuzEB9KMj0t9s7OpDkA/XsxcLlP2L79Bj3H31wGQg=;
        b=nqMUjMEwwG3dP4pAofXgB0PP/z1wLsoga6I9UHooDg1004GGZij/7/Ji7Q/zUE2FfC
         VZMNEMw75F9S2q6Xcd4jvuqm7MAX4qDp9Ftq391zw54hTtv+T+pu16iy4wpY0rrU2liG
         k3gFA6iawigs0bZweXf25eyXkSIWz1qSSACJWyMx+gwICNkXWipTDxKM/P6yEQQICLNG
         y6lgj7Ix9hEPJlkUEHxZPtUx6e2vzqUZTqcF0xESwjLHtlYyU4ZJhG0n8VjdMOUk7J5v
         gH7ys/56yRTL1NFG5OybAz2ixhf0a8oAjn0Hb+wDAz0Vde64V9i0HsBbP5zYdFIWDyEO
         SHmA==
X-Gm-Message-State: AOAM532w5mY3n9xgwia5WJ/8Kk8B+vkXCkoztY+VmKkqUEW2QxQNqX8D
        mmOgXHIInoRWzb3/082ECAxGVhCzvjNstGQsWW4=
X-Google-Smtp-Source: ABdhPJyvkWCP9ZAp2wHyowUwbZiqTpOrvwaJyTM71SEZs7Fadah0GjZv4QqaCe1IG4/I4xEhqsLD0r+pvHu/A3NxZFs=
X-Received: by 2002:a4a:4cc1:: with SMTP id a184mr27367539oob.62.1595408642769;
 Wed, 22 Jul 2020 02:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200722085849.GF1030@ninjato> <20200722090017.GG1030@ninjato>
In-Reply-To: <20200722090017.GG1030@ninjato>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 22 Jul 2020 10:03:36 +0100
Message-ID: <CA+V-a8vtCBYsDE2Tw4f-FgvfuZ3RUUNwEvfrbq-sv2+4H6VxNw@mail.gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device nodes
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Jul 22, 2020 at 10:00 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Wed, Jul 22, 2020 at 10:58:49AM +0200, Wolfram Sang wrote:
> > On Thu, Jul 16, 2020 at 06:18:17PM +0100, Lad Prabhakar wrote:
> > > Add PCIe{0,1} device nodes for R8A774E1 SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Hmm, doesn't apply on top of 5.8-rc6 for me. Is there a branch to pull
> > for easier review?
>
> My fault, I missed the first series. Please note such dependencies in
> the cover letter.
>
I didn't mention as they were already applied to Geert's tree [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-arm-dt-for-v5.9

Cheers,
--Prabhakar
