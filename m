Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04F87333CA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 17:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfFCPm7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 11:42:59 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43984 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfFCPm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 11:42:59 -0400
Received: by mail-ua1-f66.google.com with SMTP id 89so5037656uar.10
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eFvvhaRusrBbL8rIah/3Coy1NP3U36B2fSZ3lMYlx8A=;
        b=nJh4XTxlZGurnl314LSdBmPwJLXwd8myttzFrQdqdfrUth4sB1WqCsVZtVpqczdZ9h
         hg+JKBWSdwKErXnEImgVEx7+P1zPnxw1i/LpwCBbs93V21N48nbs7HW/WD97yfad1hqv
         fREGryt58ccOsnJ1E60ail1mZ0nb/Dv0h8TsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eFvvhaRusrBbL8rIah/3Coy1NP3U36B2fSZ3lMYlx8A=;
        b=b+Vnx3I8KeIl94KGCUcRX3o9MkfAYBaMX02k/RkT03DQAlNcpyLUN4Oh4ScWr0omd8
         OOtP0MaDKZoHsicQaxaTTLxou5S3ZnKBc2j1WzdxQUeGXlIJmkYlqZwO3T0Af+nkgiwn
         jBe4J0CwrCHY3yY/XCYA3e0S7iLZ4QvMowbuCbcCmxdQ11t3NWPiWdvVG9zw/vpuvdDo
         6x7gRytUxHVARxxBwMgdgtnEBbAThchjuyxrnw1YnPD7PqBCenR1bw3awq3O15VdmJ4V
         aIf7LwRwzcyduRHcZm/kz2zpyF5H5GlAs49vGgzahh/GntK8eP/YW9tLak582JYbOH+T
         0y0g==
X-Gm-Message-State: APjAAAXIcBWfbcA1C/qztkFOSC3idX9i62zZc/MUD2udD3YV+FZ+nVge
        84E1qmiwL1/3jhPbc/kpHQ4Yf9uQazQ=
X-Google-Smtp-Source: APXvYqwAmXrF9kSnzrc7lFa2DbB+4CTF9AV2/16M6/GfhhpYULh/4kjo1TKnKfNhcOEosPic2a9Wsg==
X-Received: by 2002:ab0:146c:: with SMTP id c41mr12057291uae.33.1559576578303;
        Mon, 03 Jun 2019 08:42:58 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id r3sm2200287vkd.30.2019.06.03.08.42.55
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 08:42:55 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id l20so11542831vsp.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 08:42:55 -0700 (PDT)
X-Received: by 2002:a67:ca0a:: with SMTP id z10mr13299139vsk.94.1559576574955;
 Mon, 03 Jun 2019 08:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190530210421.24941-1-linus.walleij@linaro.org>
 <CAD=FV=UWNbMoUrs3ZucRuNEKP27sMD0nt6ew2=fH7pxmFiTeYw@mail.gmail.com> <20190601080245.GA1012@kunai>
In-Reply-To: <20190601080245.GA1012@kunai>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Jun 2019 08:42:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
Message-ID: <CAD=FV=XuA+ZEWFk9Wi0ZPMxdhuoqA7JUM6imYVZB3J41XM2tVw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sat, Jun 1, 2019 at 1:02 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > NOTE: any chance I can convince you to CC LKML on patches like this?
> > There's no patchwork for i2c so I can't easily grab this from
> > patchwork unless you CC LKML.
>
> See MAINTAINERS, there is a patchwork instance on ozlabs.

Ah, right!  Even so, CCing LKML can be a helpful thing to do for
patches.  If nothing else the archiving on lore.kernel.org is
valuable.

-Doug
