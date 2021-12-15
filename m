Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44E1475A94
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 15:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243341AbhLOOTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 09:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243336AbhLOOTt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 09:19:49 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28293C06173F
        for <linux-i2c@vger.kernel.org>; Wed, 15 Dec 2021 06:19:49 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id i12so20825466pfd.6
        for <linux-i2c@vger.kernel.org>; Wed, 15 Dec 2021 06:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYO72Xiz+IzX17yEGA37Zawk+fJB2f9J+6VJQ3xUS98=;
        b=BWp1cHOc9CE/pRtoQNg2hI2YavfSzPgvejTKmFzRYOumv7tR/K643vWh4TmtqjSZw/
         xUqOGFcQpMfXKK6sLtJ32mRhM9Tt//hq2rH7HuZlYqMtb0bpba4Olrsd6syTzybzpPFk
         LCAvrJpj/GwSrJ5XWLKBrpaHCY0y4lqKnLBaGFP/UOCfhACOhlDN3XHpYMpQjVbLrAw7
         VIMuQtFhUh0pp4qP39i/mvhdtAaRMmUkGYavkvSfwKTIPBt55sdDdQkLqhuN+KQlxaP7
         5JwjH8VQMue6Yoh4gXN1fdC0b4plh0t+SVYgqU+H7Yn3qVUVh542klijzos2yUcWE4P2
         kgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYO72Xiz+IzX17yEGA37Zawk+fJB2f9J+6VJQ3xUS98=;
        b=FogQgK278O5FBJTTzNRbdrgaAPrzXRYHSRDxFROCZpof61lxrHXr+jJNis5uHaPMNL
         a2Qbl98RQkkoJoOo4flPqnhHVyjLgSalZLVn3KF7orAgn2mxszNsij5g6tz7rr9qe9hn
         SwZUNoBgQV7jir63STXAan6D0hiX8+CISahXtXLgo2+zxmfTtJzZL/++fuLzr5olsRHb
         mdjK9mKR0lX5mXWYAW77ANVsIOdu22Y29mTElQ1NpdgkY/XWcKHB81ZV+PAnCBKQBP5F
         L16D7+kwu9lXGmxhCKRPmlfKbfTXILSoDQVB82vFTQgTo3U2afyKlJNPe+kjEumAJRNF
         dImw==
X-Gm-Message-State: AOAM5303v+oFK1VLkn5lNGxa3G+YKXm/cMZBKZaPmLnSq1DslCeEJ4h+
        sL96V8F0i8rO72mzwurmx2P6bGodhgXB4NmL9nvOIPXr4UX2Kw==
X-Google-Smtp-Source: ABdhPJx8GVAYnl9B182MKt8R6HBm86O0PhVJCK98BFGGAB/cxX0g6LKlCE9LCr8tlExy5HRq8PA94KkSeIoQ5nnOomQ=
X-Received: by 2002:a05:6a00:1389:b0:4ad:528b:bf86 with SMTP id
 t9-20020a056a00138900b004ad528bbf86mr9300370pfg.80.1639577988433; Wed, 15 Dec
 2021 06:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
 <Ybh8cCU/zbfXkXYO@pendragon.ideasonboard.com> <a78b52ec-81bf-9ee1-9e12-135079d19b7a@axentia.se>
In-Reply-To: <a78b52ec-81bf-9ee1-9e12-135079d19b7a@axentia.se>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Wed, 15 Dec 2021 15:19:37 +0100
Message-ID: <CALNFmy3vwkvU2ctBE6otCBnhMb2GAOXvRW6NGpOwwAD2qVt7ag@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: i2c Update PCA954x
To:     Peter Rosin <peda@axentia.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,
thanks for your feedback.
You are right, the added Maxim chips should not have set the
interrupt-controller; flag.

The reason I decided to not handle that interrupt is that I don't know
where to pass that bus error to.
It looks like only the I2C master can signal bus errors by returning
-EIO, however there's no API for I2C clients
to pass such errors to the master. However any attempt to access the
stuck and isolated bus will fail and
the address will be NACKed, so I don't think that this a big issue as
in the end the bus stall will be detected.

Is there a mapping between devicetree bindings and driver file names?
If not I'll use
maxim,max7356 as devicetree binding to make it easier to read and
mention that interrupts
are not supported for those maxim devices.

Regards,
Patrick

On Wed, Dec 15, 2021 at 1:42 PM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> On 2021-12-14 12:13, Laurent Pinchart wrote:
> > Hi Patrick,
> >
> > Thank you for the patch.
> >
> > On Tue, Dec 14, 2021 at 10:50:18AM +0100, Patrick Rudolph wrote:
> >> Add the Maxim MAX735x as supported chip to PCA954x and add an
> >> example how to use it.
> >>
> >> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >> ---
> >>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
> >>  1 file changed, 40 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> index 9f1726d0356b..bd794cb80c11 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> @@ -11,6 +11,7 @@ maintainers:
> >>
> >>  description:
> >>    The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> >> +  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
> >>
> >>  allOf:
> >>    - $ref: /schemas/i2c/i2c-mux.yaml#
> >> @@ -19,6 +20,9 @@ properties:
> >>    compatible:
> >>      oneOf:
> >>        - enum:
> >> +          - maxim,max7356
> >> +          - maxim,max7357
> >> +          - maxim,max7358
> >>            - nxp,pca9540
> >>            - nxp,pca9542
> >>            - nxp,pca9543
> >> @@ -40,6 +44,7 @@ properties:
> >>
> >>    interrupts:
> >>      maxItems: 1
> >> +    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.
> >
> > Could this be modelled by a YAML schema instead ? Something like
> >
> > allOf:
> >   - if:
> >       properties:
> >         compatible:
> >         contains:
> >           enum:
> >               - maxim,max7356
> >               - maxim,max7357
> >               - maxim,max7358
> >     then:
> >       properties:
> >         interrupts: false
> >
> > (untested, it would be nice to use a pattern check for the compatible
> > property if possible)
>
> Some of the existing NXP chips do not support interrupts; we should
> probably treat these new chips the same as the older ones. Either by
> disallowing interrupts on both kinds or by continuing to ignore the
> situation.
>
> That said, I'm slightly in favor of the latter, since these new chips
> do have interrupts, just not the same flavor as the NXP chips. What
> the Maxim chips do not have is support for being an
>         interrupt-controller;
> At least that's how I read it...
>
> I don't know how this situation is supposed to be described? Maybe this
> new kind of interrupt should be indicated with a bus-error-interrupts
> property (or bikeshed along those lines)? Maybe there should be two
> entries in the existing interrupts property? Maybe these new chips
> should be described in a new binding specific to maxim,max7356-7358
> (could still be handled by the pca954x driver of course) to keep the
> yaml simpler to read?
>
> However, there is also maxim,max7367-7369 to consider. They seem to
> have interrupts of the style described by the NXP binding (haven't
> checked if the registers work the same, but since they reuse the
> 0x70 address-range the are in all likelihood also compatible).
>
> Cheers,
> Peter
>
> >>
> >>    "#interrupt-cells":
> >>      const: 2
> >> @@ -100,6 +105,41 @@ examples:
> >>                  #size-cells = <0>;
> >>                  reg = <4>;
> >>
> >> +                rtc@51 {
> >> +                    compatible = "nxp,pcf8563";
> >> +                    reg = <0x51>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> >> +
> >> +  - |
> >> +    i2c {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        i2c-mux@74 {
> >> +            compatible = "maxim,max7357";
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +            reg = <0x74>;
> >> +
> >> +            i2c@1 {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +                reg = <1>;
> >> +
> >> +                eeprom@54 {
> >> +                    compatible = "atmel,24c08";
> >> +                    reg = <0x54>;
> >> +                };
> >> +            };
> >> +
> >> +            i2c@7 {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +                reg = <7>;
> >> +
> >>                  rtc@51 {
> >>                      compatible = "nxp,pcf8563";
> >>                      reg = <0x51>;
> >
