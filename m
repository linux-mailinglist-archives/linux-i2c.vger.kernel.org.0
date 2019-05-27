Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E03B2B65B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 15:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfE0NZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 09:25:53 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35260 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfE0NZx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 09:25:53 -0400
Received: by mail-vs1-f68.google.com with SMTP id q13so10528616vso.2
        for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnqAkKZ/K76fAJWhEEPhgphkdIHfqKGIyyQzSf7jGME=;
        b=BbvtYWZg5ZkOTgXuU5uOKiPR9P+u1cNbjMcHQ0bPb8azbm/FfT4yBlauUVp3em1+1j
         WZu5L2UC9NKmnUmn7T7BTBAkJkeohU1meVLncwtcXjZrLZoknxGGqRxPxtBjRmJLoFoP
         i3PW+wuEJ4ShMtK0rWFE0ub1VEasVVK0DhewCXLc3hefACh3/1FYsoXBXrva2Azu8hRm
         63DpSp63Q2YukGWqGo/GUAUWjYsFjdj0kbxyGZ1jOfCgwHmbAbV9s4XNQJQLVRBKGMUS
         BpJqJsQk397yx+u6FjnmkEcDWJpZPd2qe7q/l06gW94TTsb9RmCOS5IFXIpZpnE2Sd2F
         RNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnqAkKZ/K76fAJWhEEPhgphkdIHfqKGIyyQzSf7jGME=;
        b=fqgutyAei5nA45Ju6hDOOaMVxH4wfUblXWvKJ9WegeRW6iP9fDA9Tn8V1hgeJQ82tO
         4pO1jyJO/ZPdCZ4edqLGCd4aKPyMZhIEO9WcpkT+lM+88oDl2wY/h1y/qToUVN6wJqI9
         zo/lYLQhp06cJvbYXEKICbE1tiHaO54Sotg2rczx6MOH3j9eI6QBE9pEjAT4chd4VFF8
         z3MNmg6pw/3Hyu12GnnB+jqrECTmXCPhQD6DB8r7EB5T9RRba/Rslzq1GnZQmwLPJp+c
         NSP/K69ycb+QlLkUb0iTx0vnJ2gEI7w3kbW/deRSWCfPD1GbBgYmHfqE/cp6ixY7FIDO
         AaIQ==
X-Gm-Message-State: APjAAAWh2QiNB9CBrnSuw8o/e6sgkorTIrtqxHJTIy+0XEHoFMMAo8P8
        Uy9X2v7nsiyD90Xkz1wJ50dCWKtUDkOoyB/1HI9Wdw==
X-Google-Smtp-Source: APXvYqy4tUwxlDxM4P+E2AZD0QtkW0gxj57YCASYDfSgwOAeG101rQ0S+ov4VOwe/SZeF71qMCMhrXm9O39FqYVPGhM=
X-Received: by 2002:a67:f057:: with SMTP id q23mr57437576vsm.116.1558963552162;
 Mon, 27 May 2019 06:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-2-git-send-email-sagar.kadam@sifive.com> <20190524204012.GA2580@bogus>
In-Reply-To: <20190524204012.GA2580@bogus>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Mon, 27 May 2019 18:55:41 +0530
Message-ID: <CAARK3H=qGkKodSdMe+e9N6A-t1cZoiJLatZfcv+A1G1Zuw5VVQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: i2c: extend existing opencore bindings.
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Sat, May 25, 2019 at 2:10 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 22, 2019 at 02:29:32PM +0530, Sagar Shrikant Kadam wrote:
> > Reformatted compatibility strings to one valid combination on
> > each line.
> > Add FU540-C000 specific device tree bindings to already available
> > i2-ocores file. This device is available on
> > HiFive Unleashed Rev A00 board. Move interrupt under optional
> > property list as this can be optional.
> >
> > The FU540-C000 SoC from sifive, has an Opencore's I2C block
> > reimplementation.
> >
> > The DT compatibility string for this IP is present in HDL and available at.
> > https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > index 17bef9a..db96951 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -1,9 +1,13 @@
> >  Device tree configuration for i2c-ocores
> >
> >  Required properties:
> > -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +- compatible      : "opencores,i2c-ocores",
> > +                    "aeroflexgaisler,i2cmst",
> > +                    "sifive,fu540-c000-i2c","sifive,i2c0".
>
> space needed                                   ^
>
> And drop the end of line commas and period.
>
>
> > +                    For Opencore based I2C IP block reimplemented in
> > +                    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
>
> And here too.
>
> And 'refer to'
I will incorporate the changes you have suggested.

Thanks,
Sagar Kadam
>
> > +                    for additional details.
> >  - reg             : bus address start and address range size of device
> > -- interrupts      : interrupt number
> >  - clocks          : handle to the controller clock; see the note below.
> >                      Mutually exclusive with opencores,ip-clock-frequency
> >  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> > @@ -12,6 +16,7 @@ Required properties:
> >  - #size-cells     : should be <0>
> >
> >  Optional properties:
> > +- interrupts      : interrupt number.
> >  - clock-frequency : frequency of bus clock in Hz; see the note below.
> >                      Defaults to 100 KHz when the property is not specified
> >  - reg-shift       : device register offsets are shifted by this value
> > --
> > 1.9.1
> >
