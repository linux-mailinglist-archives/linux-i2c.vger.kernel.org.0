Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C9C292BEB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Oct 2020 18:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgJSQym (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Oct 2020 12:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730498AbgJSQyl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Oct 2020 12:54:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8612C0613D0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Oct 2020 09:54:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z2so355870lfr.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Oct 2020 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WWe1nyT09mfP995hqz7RZGWn3qxoOPoS4oyItVvSHIA=;
        b=OuBRRIaNVW4sTCoqWv1mPmTw7hVN3ZKuzZpOcOF5DDEf/55sVq99t/SFPfjSK/56KA
         oCp/8BNdCL7+xQJJXdjtBzwqWKHzB6VfZxcXStrY/0/16UcUNhMpE/0lPrPazKKI11Hm
         q9wLB13d9P9GsiPO66kJn/lpgvunLWukaHsNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WWe1nyT09mfP995hqz7RZGWn3qxoOPoS4oyItVvSHIA=;
        b=tkEtSqMGAFNdW7t0xsRfyx6reY59BoVS8g6/3Gqqy/VqwfxUz8XGTJrptvJ6Ok/vDk
         qCYP/1qrORRVaenQ8PIKeH01frp1qgTZKxMTZRkHqlXYrw2VoJOL/3izFvCgACucqvfZ
         exPDNT9xWfZUvRwlb2Y8midFXnccj4DCa2KupbBrZh28TnhieoEp4D8qVdllmbO7RkCu
         8xT1skBTL1QwOFKjd5a78riWxaD2jhToJ6AIEP7B0TMXtFuHshW0r7A67ItFe2acFPhX
         n7RegPQNejZzqb7znfm8QOJMzGdzz40NopYctFRKfVBKwy0vD7M66la+8EpXpvzsPd14
         Aqaw==
X-Gm-Message-State: AOAM530MRSpw/SwJBKAAjhHjD0xmLB+KN/XQZfcEemouLp1EvQjJEKIm
        4qW4hn0OOIsIKZWeu1HPBskp2h6cePOj8w==
X-Google-Smtp-Source: ABdhPJwyZ6LKmmJvy0Ggdp8HbVt8fR82sfi2aWxPSuvqJ+C+9mL4fkLIs0xGdvLP4Jzqod/FtiOZRQ==
X-Received: by 2002:a19:68a:: with SMTP id 132mr180083lfg.429.1603126477917;
        Mon, 19 Oct 2020 09:54:37 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id a24sm53621lfg.282.2020.10.19.09.54.36
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 09:54:37 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id p15so809718ljj.8
        for <linux-i2c@vger.kernel.org>; Mon, 19 Oct 2020 09:54:36 -0700 (PDT)
X-Received: by 2002:a2e:9955:: with SMTP id r21mr380357ljj.124.1603126476431;
 Mon, 19 Oct 2020 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201016222523.364218-1-evgreen@chromium.org> <20201016152454.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VfsM+ysz_tr_h0rJpspcZAToiV+H5KDCi7J=LCEO0sFxQ@mail.gmail.com>
In-Reply-To: <CAHp75VfsM+ysz_tr_h0rJpspcZAToiV+H5KDCi7J=LCEO0sFxQ@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 19 Oct 2020 09:53:59 -0700
X-Gmail-Original-Message-ID: <CAE=gft5cd4v=THHuBPAeB5ApgH+TAPiEukZiG0pC33RsZ4AriQ@mail.gmail.com>
Message-ID: <CAE=gft5cd4v=THHuBPAeB5ApgH+TAPiEukZiG0pC33RsZ4AriQ@mail.gmail.com>
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

On Sun, Oct 18, 2020 at 11:58 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Oct 17, 2020 at 8:30 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> > property translates directly to a fwnode_property_*() call. The child
> > reg property translates naturally into _ADR in ACPI.
> >
> > The i2c-parent binding is a relic from the days when the bindings
> > dictated that all direct children of an I2C controller had to be I2C
> > devices. These days that's no longer required. The i2c-mux can sit as a
> > direct child of its parent controller, which is where it makes the most
> > sense from a hardware description perspective. For the ACPI
> > implementation we'll assume that's always how the i2c-mux-gpio is
> > instantiated.
>
> Can you tell me if the following is relevant to what you are looking for?
> https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-mux.c#L393

I don't think so, but let me know if I'm reading between the lines incorrectly.

The code you pointed to links the newly-minted fake i2c controller
back together with its ACPI node. This is important, since I think
that's how child I2C devices underneath the fake busses get populated
in ACPI land. But the paragraph above is discussing how to identify
the parent adapter (ie the real hardware) for an i2c-mux-gpio device.

In DT-land, the i2c-mux-gpio floats at the top of the tree directly
under /, and then uses a phandle to point to where transactions should
be forwarded. I'm told the reason for this is historical limitations
with the DT bindings. Rather than trying to translate the phandle over
1:1 into ACPI-land, I'm asserting that the mux device should live
underneath the adapter it wants to forward traffic to.

-Evan

>
> --
> With Best Regards,
> Andy Shevchenko
