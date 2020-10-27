Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2407729CC7F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 00:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbgJ0XBS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Oct 2020 19:01:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46570 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730065AbgJ0XBS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Oct 2020 19:01:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id v6so4419975lfa.13
        for <linux-i2c@vger.kernel.org>; Tue, 27 Oct 2020 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GG3UaJZA/uUQLU7mHf7NS9ozeUye78z/dtgMxwLZVbs=;
        b=gU0Y5uUXQhQkIq+clUzPRx+OUaLu+gAx3DRCwuq4B1OZDcn/cuQxE8TzHGnKx7/dod
         zgh0xGGvb69g40s1CSn25n90CNvks07IBlDy8ep9rycwxiqDOVX5PA7bxY8FerXY1bHW
         xkxt6DPh37axWXb/3QCqWiIKiegiVSHyg0LNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GG3UaJZA/uUQLU7mHf7NS9ozeUye78z/dtgMxwLZVbs=;
        b=YlHTA5Xz9HPpEClmmWJgz6lddSulaw58JwKQTbTQlBhDAyU0FiumqOJ2fqU1Dha/d6
         /+0d3V9BQuBoYxHRy0dS4hU5L2zI/ZJedMtL+AiKOSXwJFnBTKwSuUCPRFam2Ssq1IUv
         QMguhCtWO+7V1wb3/SdVVN8GG5Bv9tv6J4242fBGX6lKYOf1qQTmbiDIaYvygmkiOqR0
         dTu/AtbdjfooYnMjxsSsdIN8rIrqaAjRG5Z0Ark7pKOKpTaF6kOf8nvQ2xfNpI3nDdNW
         WRlZal0XDA4mVKWeXGvZ8T4b+cF654gnIkqzx4x5l5GCJszYa2wVOUZ+LcwzXGkOZPYA
         ko+Q==
X-Gm-Message-State: AOAM530jJfrhGx5qkDbSQTl7gKHq61uxbD+c+jx5AuYATKTH7GijYh2a
        +A+D1D8yNw3AEYAnvqTnG8HTrHCvNHbvhQ==
X-Google-Smtp-Source: ABdhPJzKWPbNidrxH+vBHHBnBvYD69xbbi2w+d4mswjTYJo/GTKslFrF4wVzPubJadcntdLdDvPg7Q==
X-Received: by 2002:ac2:5c4c:: with SMTP id s12mr1803396lfp.570.1603839676090;
        Tue, 27 Oct 2020 16:01:16 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id n7sm317806lfi.103.2020.10.27.16.01.15
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 16:01:15 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id m16so3682199ljo.6
        for <linux-i2c@vger.kernel.org>; Tue, 27 Oct 2020 16:01:15 -0700 (PDT)
X-Received: by 2002:a05:651c:207:: with SMTP id y7mr1891014ljn.99.1603839674753;
 Tue, 27 Oct 2020 16:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201016222523.364218-1-evgreen@chromium.org> <20201016152454.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VfsM+ysz_tr_h0rJpspcZAToiV+H5KDCi7J=LCEO0sFxQ@mail.gmail.com> <CAE=gft5cd4v=THHuBPAeB5ApgH+TAPiEukZiG0pC33RsZ4AriQ@mail.gmail.com>
In-Reply-To: <CAE=gft5cd4v=THHuBPAeB5ApgH+TAPiEukZiG0pC33RsZ4AriQ@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 27 Oct 2020 16:00:37 -0700
X-Gmail-Original-Message-ID: <CAE=gft4hrvHm=ofmF_-hc3UQczqV_GSDQ9hL906bKW4WfbWHSg@mail.gmail.com>
Message-ID: <CAE=gft4hrvHm=ofmF_-hc3UQczqV_GSDQ9hL906bKW4WfbWHSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 19, 2020 at 9:53 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Sun, Oct 18, 2020 at 11:58 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sat, Oct 17, 2020 at 8:30 AM Evan Green <evgreen@chromium.org> wrote:
> > >
> > > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > > property translates directly to a fwnode_property_*() call. The child
> > > reg property translates naturally into _ADR in ACPI.
> > >
> > > The i2c-parent binding is a relic from the days when the bindings
> > > dictated that all direct children of an I2C controller had to be I2C
> > > devices. These days that's no longer required. The i2c-mux can sit as a
> > > direct child of its parent controller, which is where it makes the most
> > > sense from a hardware description perspective. For the ACPI
> > > implementation we'll assume that's always how the i2c-mux-gpio is
> > > instantiated.
> >
> > Can you tell me if the following is relevant to what you are looking for?
> > https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-mux.c#L393
>
> I don't think so, but let me know if I'm reading between the lines incorrectly.
>
> The code you pointed to links the newly-minted fake i2c controller
> back together with its ACPI node. This is important, since I think
> that's how child I2C devices underneath the fake busses get populated
> in ACPI land. But the paragraph above is discussing how to identify
> the parent adapter (ie the real hardware) for an i2c-mux-gpio device.
>
> In DT-land, the i2c-mux-gpio floats at the top of the tree directly
> under /, and then uses a phandle to point to where transactions should
> be forwarded. I'm told the reason for this is historical limitations
> with the DT bindings. Rather than trying to translate the phandle over
> 1:1 into ACPI-land, I'm asserting that the mux device should live
> underneath the adapter it wants to forward traffic to.

Andy or Peter, Any other thoughts on this series?
-Evan
