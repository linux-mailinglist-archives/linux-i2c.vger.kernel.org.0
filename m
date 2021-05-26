Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1C3391AAF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 16:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhEZOtm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 10:49:42 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:41542 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbhEZOtm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 10:49:42 -0400
Received: by mail-ua1-f46.google.com with SMTP id 105so905474uak.8;
        Wed, 26 May 2021 07:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylnTZPq3+ze+TGLTY2mrWfCbd/vE+r5fhyKK1lOY+Mc=;
        b=EdaltyescWZljJQOF/q+DPnBw7Y5X4GE2dIIOgURcUmsnBB5ET94nTWn4dZHYd6ELf
         17s1/Kbe/CS/klsyNauBKdrCre1E4r5DE5xxsbtG/DkOXvdAWPLp5evDO+tpwjOD4q3u
         fYXugxDF6F+5diFC8BVqyfOpQJ29wNuBc/DjrOey2Ynk4Dik9q9wNJ/I2CO/DGDXhfg6
         jW5oXYJRgRicMuweWgQyEf2+9Q/0to81ewWoBqTHbZ2dS1tdi0nWH2oZvm+Me9ci0nVj
         5+7/wVGYl6+mNJIdnGLnH3bbeZqzBUTD4KFQzKxi+5EU9Hsg1BD3GLUaqeJU1iEsPztP
         LmQw==
X-Gm-Message-State: AOAM533bnfjJKtdPW+y8nembrLO+R/3ZYrvCCPys6prazQg3VD/0OI1s
        lnwXfnUc1EMU1FydtRewZqoawcy6JKUQZ+PpGko=
X-Google-Smtp-Source: ABdhPJxybmaI9gniqBmGtWHou7ZayOIDh+er2tJlRdFGyu64kbLHSCsjsHLUqUwdJMKMykAP0oipBoCIFgr79+3RD8U=
X-Received: by 2002:ab0:2a8b:: with SMTP id h11mr33538192uar.4.1622040490016;
 Wed, 26 May 2021 07:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138454.git.geert+renesas@glider.be> <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
 <20210505073327.GE1009@ninjato>
In-Reply-To: <20210505073327.GE1009@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 May 2021 16:47:58 +0200
Message-ID: <CAMuHMdX3jw_Cm4hrg4QLr5H45nydmdbJzd7Rd-HY-rncOoKxvQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 5, 2021 at 9:33 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Possible alternative interpretations of the note are:
> >   - Only IIC3 has the automatic transmission registers.  But the
> >     automatic transmission feature is not useful as the SoCs lack DVFS
> >     support.
>
> I immediately thought "yeah, this is it", but had to do some resarch
> where my assumption comes from. I found it in older H2 datasheets
> (v0.9). Here in 56.1:
>
> "Automatic transmission for PMIC control: The IIC3 module of the R-Car
> H2 and M2 supports automatic data transmission under PMIC control
> (DVFS)."
>
> Or table 56.8:
>
> "Registers of IIC Command for Automatic Transmission Mode (IIC3 only)
> [R-CarH2, M2, and V2H]"
>
>
> This all is a strong indication for IIC3 only. Which SoCs that have is
> still confusing. Table 56.8 mentions V2H but 56.1 doesn't. Then again, I
> could imagine that V2H has it but simply DVFS is not advertised for V2H.
> And in the later documents, DVFS advertisement was removed for H2 and M2
> as well.

From off-list experiments checking for the presence of automatic
transmission registers by writing to them, and seeing if they retain their
values, we know that all IIC instances checked on R-Car Gen2
SoCs do have these registers.  The same is true for R-Car E3, which
is explicitly documented _not_ to have the registers...
In addition, Wolfram tried transmitting something on R-Car H2 from
the U-Boot prompt, and noticed the ICINT.ADTE bit is set afterwards,
indicating success.

So I went one step further, and hooked up a logic analyzer, to see
if anything is actually transmitted.

Koelsch (R-Car M2-W):

  - IIC1 (I2C8) IIC1_SCL_C (GP6_22) EXIO Connector C pin 37
                IIC1_SDA_C (GP6_23) EXIO Connector C pin 39

    # Configure pinctrl for IIC1
    mw.l e6060000 f77fffff
    mw.l e6060098 08800000
    mw.l e6060000 ffffedff
    mw.l e6060058 00001200
    mw.l e6060000 3000c0c0
    mw.l e606001c cfff3f3f

    # Enable IIC0-2 clocks in SMSTPCR3
    mw e615013c ff7bfffe

    # Reset using ICCR clears all ICINT flags
    mw.b e6510004 1

    # Set up clock (ICC[LH])
    mw.b e6510010 0x69
    mw.b e6510014 0x1e

    # Write dummy data to ICATD00
    mw.b e6510100 bf

    # ICSTART.AutoStart = 1
    mw.b e6510070 80

    # Logic Analyzer says: S / P / P / P => broken?

    # Check ICINT; 01 => ADTE
    md.b e6510054 1


  - IIC3 (I2C6 DVFS) IIC3_SCL EXIO Connector C pin 19
                     IIC3_SDA EXIO Connector C pin 21

    # Enable IIC3 clock in SMSTPCR9
    mw e6150994 fbffffff

    # Reset using ICCR clears all ICINT flags
    mw.b e60b0004 1

    # Set up clock (ICC[LH])
    mw.b e60b0010 0x1b
    mw.b e60b0014 0x14

    # Write dummy data to ICATD00
    mw.b e60b0100 de

    # ICSTART.AutoStart = 1
    mw.b e60b0070 80

    # Logic Analyzer: S / Address: 0x6f / W / NACK => Good!

    # Check ICINT; 01 => ADTE
    md.b e60b0054 1


Ebisu (R-Car E3):

  - IIC (DVFS) IIC_SCL EXIO Connector D pin 75
               IIC_SDA EXIO Connector D pin 77

    # Enable IIC clock in SMSTPCR9
    mw e6150994 fbffffff

    # Reset using ICCR clears all ICINT flags
    mw.b e60b0004 1

    # Set up clock (ICC[LH])
    mw.b e60b0010 0x1b
    mw.b e60b0014 0x14

    # Write dummy data to ICATD00
    mw.b e60b0100 ad

    # ICSTART.AutoStart = 1
    mw.b e60b0070 80

    # Logic Analyzer: S / Address: 0x56 / R / NACK => Good!

    # Check ICINT; 01 => ADTE
    md.b e60b0054 1


Preliminary conclusions:
  1. Automatic transmission works on the last IIC instance on R-Car
     Gen2, which was originally intended for DVFS (which is not
     implemented, as of Hardware User's Manual Rev. 2.00).
     It works partially/not on other IIC instances. Perhaps I did
     something wrong in my setup?

  2. Despite the Hardware User's Manual stating the single IIC instance
     on R-Car E3 does not have the automatic transmission registers,
     the feature seems to be present and working.  So we can declare
     it to be compatible with the generic version.

As the Linux (or other OS?) i2c driver doesn't use automatic
transmission, and it's very unlikely it ever will (anyone with a
use case?), I'm inclined to simplify, and declare all IIC instances
compatible with the generic version.
If we ever want to implement support for automatic transmission,
we can still differentiate by the SoC-specific compatible values,
as they are present anyway, and may have to resort to checking
e.g. instance base addresses anyway.

Thoughts? Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
