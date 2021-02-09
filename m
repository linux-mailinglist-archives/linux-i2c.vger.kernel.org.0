Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C22315163
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 15:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhBIORj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 09:17:39 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:38976 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBIORa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Feb 2021 09:17:30 -0500
Received: by mail-oi1-f172.google.com with SMTP id l19so7062870oih.6;
        Tue, 09 Feb 2021 06:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxFRPEUXUgFBIeTDAlCgAGbqFmpVn3Z9yEcK5/5S9uU=;
        b=kWer89l6cs8ePDtRFTYOdoykJKg3PvXQQ8S5VXSMArNaswx6vKuWvwwJl09qEzJ7rx
         K5Z8BC2xKVEr+m/7AzI8hguNhUznZ8/+6SxGy2GbYm12yncL9QTYaq68A6yqMbscvkrw
         7t33DqtYjV9pSatrGzAYUqCe2HMlnMKzEZlEqpBJq0PzWxq0lpND/Kjyc7l+UyMZ3Wh2
         SRmRrOtf1XW7Kc00QHyH6qrEQHhtnCfWz5BirVbW9Nb95aQ6S8sjTL8oz/uZwPpDnbQg
         ZBpvbPKZKfUkvtQZ+NfL1+iiu7Ja/uymfs2gOKZoZR1dqOmNdy6sEW5gGLGjqg2yHhhR
         BMCQ==
X-Gm-Message-State: AOAM530y1yBFyC3aNiE0JwnRghDdncoNl16OOxGpMtAkqcwwCyUEG2XQ
        59uRokji833PX3bos3uAnVe+xvDVLtD3NI3tUBa3k/jF
X-Google-Smtp-Source: ABdhPJwJT+K387GCQS0TB4FK8uH84hgOgBWpRLJp2tBGgz84dJmS9gAWcp+8QvgLjv8gy7U0d2plRaH8QJF/X0ppVzY=
X-Received: by 2002:aca:744:: with SMTP id 65mr2562501oih.153.1612880209235;
 Tue, 09 Feb 2021 06:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20210128111343.2295888-1-geert+renesas@glider.be>
 <20210128113353.GN963@ninjato> <CAMuHMdW--A2bwe==+A35_sLAS2OkXzi2hY0Ky_dwL0n8irHMZw@mail.gmail.com>
 <CAMpxmJXcbTnCbseAap=F0QO2Er6ANGSfgPMuoufaD2qQyUbpRA@mail.gmail.com>
In-Reply-To: <CAMpxmJXcbTnCbseAap=F0QO2Er6ANGSfgPMuoufaD2qQyUbpRA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Feb 2021 15:16:38 +0100
Message-ID: <CAMuHMdU3g3TaWTu6XvKTUU9cdj6Dnbjcgy4zSRhshzeAhH30GA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Fri, Feb 5, 2021 at 11:33 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Thu, Jan 28, 2021 at 12:59 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, Jan 28, 2021 at 12:33 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > On Thu, Jan 28, 2021 at 12:13:43PM +0100, Geert Uytterhoeven wrote:
> > > > Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
> > > > EEPROM.
> > >
> > > What is the difference between those two? Could one also be the fallback
> > > of the other (just in the highly unlikely case we need "generic" Rohm
> > > handling somewhen)?
> >
> > Good question.  The datasheets look similar.
> > Parametric search on rohm.com says the G-series differs in using
> > "Cu wire bonding".
>
> I'm fine with the current form as it's simpler than using two
> fallbacks. Do you want to submit another version anyway or can I pick
> it up?

If you're happy with it, then I'm happy, too ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
