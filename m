Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A8647647A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 22:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhLOVWw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 16:22:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLOVWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 16:22:52 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C62AE3F0;
        Wed, 15 Dec 2021 22:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639603371;
        bh=euTVl1Cnl1bPhsXphZ5i09i+m16ZyOMXSNCbblpciZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=udBHdrdyrmk9OsGoO3RVcyB1drz5mfBWuWR7Tlo2kJFxHXadFlkVYXiSeB6j5VtKD
         VMkNETd5AHpRWVqfRVHWvUqgD2tYpvxsuZ3TjeC/fZbBLqrp3HDGup0sl/G7igcup/
         MTRtNibxgH3xujSc7HZwmPXeJh4S90zGf13qDNBk=
Date:   Wed, 15 Dec 2021 23:22:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c Update PCA954x
Message-ID: <YbpcqK5BOrsFWhok@pendragon.ideasonboard.com>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
 <Ybh8cCU/zbfXkXYO@pendragon.ideasonboard.com>
 <a78b52ec-81bf-9ee1-9e12-135079d19b7a@axentia.se>
 <CALNFmy3vwkvU2ctBE6otCBnhMb2GAOXvRW6NGpOwwAD2qVt7ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALNFmy3vwkvU2ctBE6otCBnhMb2GAOXvRW6NGpOwwAD2qVt7ag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Wed, Dec 15, 2021 at 03:19:37PM +0100, Patrick Rudolph wrote:
> Hi Peter,
> thanks for your feedback.
> You are right, the added Maxim chips should not have set the interrupt-controller; flag.
> 
> The reason I decided to not handle that interrupt is that I don't know where to pass that bus error to.
> It looks like only the I2C master can signal bus errors by returning -EIO, however there's no API for I2C clients
> to pass such errors to the master. However any attempt to access the stuck and isolated bus will fail and
> the address will be NACKed, so I don't think that this a big issue as in the end the bus stall will be detected.

You don't have to handle interrupts in the driver in order to declare
the interrupts property in the bindings. If the device has an interrupt
output that is meant to be connected to an interrupt input of the SoC,
then an interrupt property should describe how that signal is connected.
You can upstream support for those devices in the driver without
handlign the interrupt, it can be added later.

> Is there a mapping between devicetree bindings and driver file names? If not I'll use
> maxim,max7356 as devicetree binding to make it easier to read and mention that interrupts
> are not supported for those maxim devices.

The bindings and drivers file names are usually related, as they support
the same device, but there's no specific rule that requires that.

> On Wed, Dec 15, 2021 at 1:42 PM Peter Rosin <peda@axentia.se> wrote:
> > On 2021-12-14 12:13, Laurent Pinchart wrote:
> > > Hi Patrick,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Dec 14, 2021 at 10:50:18AM +0100, Patrick Rudolph wrote:
> > >> Add the Maxim MAX735x as supported chip to PCA954x and add an
> > >> example how to use it.
> > >>
> > >> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > >> ---
> > >>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
> > >>  1 file changed, 40 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > >> index 9f1726d0356b..bd794cb80c11 100644
> > >> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > >> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > >> @@ -11,6 +11,7 @@ maintainers:
> > >>
> > >>  description:
> > >>    The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> > >> +  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
> > >>
> > >>  allOf:
> > >>    - $ref: /schemas/i2c/i2c-mux.yaml#
> > >> @@ -19,6 +20,9 @@ properties:
> > >>    compatible:
> > >>      oneOf:
> > >>        - enum:
> > >> +          - maxim,max7356
> > >> +          - maxim,max7357
> > >> +          - maxim,max7358
> > >>            - nxp,pca9540
> > >>            - nxp,pca9542
> > >>            - nxp,pca9543
> > >> @@ -40,6 +44,7 @@ properties:
> > >>
> > >>    interrupts:
> > >>      maxItems: 1
> > >> +    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.
> > >
> > > Could this be modelled by a YAML schema instead ? Something like
> > >
> > > allOf:
> > >   - if:
> > >       properties:
> > >         compatible:
> > >         contains:
> > >           enum:
> > >               - maxim,max7356
> > >               - maxim,max7357
> > >               - maxim,max7358
> > >     then:
> > >       properties:
> > >         interrupts: false
> > >
> > > (untested, it would be nice to use a pattern check for the compatible
> > > property if possible)
> >
> > Some of the existing NXP chips do not support interrupts; we should
> > probably treat these new chips the same as the older ones. Either by
> > disallowing interrupts on both kinds or by continuing to ignore the
> > situation.
> >
> > That said, I'm slightly in favor of the latter, since these new chips
> > do have interrupts, just not the same flavor as the NXP chips. What
> > the Maxim chips do not have is support for being an
> >         interrupt-controller;
> > At least that's how I read it...
> >
> > I don't know how this situation is supposed to be described? Maybe this
> > new kind of interrupt should be indicated with a bus-error-interrupts
> > property (or bikeshed along those lines)? Maybe there should be two
> > entries in the existing interrupts property? Maybe these new chips
> > should be described in a new binding specific to maxim,max7356-7358
> > (could still be handled by the pca954x driver of course) to keep the
> > yaml simpler to read?
> >
> > However, there is also maxim,max7367-7369 to consider. They seem to
> > have interrupts of the style described by the NXP binding (haven't
> > checked if the registers work the same, but since they reuse the
> > 0x70 address-range the are in all likelihood also compatible).
> >
> > >>    "#interrupt-cells":
> > >>      const: 2
> > >> @@ -100,6 +105,41 @@ examples:
> > >>                  #size-cells = <0>;
> > >>                  reg = <4>;
> > >>
> > >> +                rtc@51 {
> > >> +                    compatible = "nxp,pcf8563";
> > >> +                    reg = <0x51>;
> > >> +                };
> > >> +            };
> > >> +        };
> > >> +    };
> > >> +
> > >> +  - |
> > >> +    i2c {
> > >> +        #address-cells = <1>;
> > >> +        #size-cells = <0>;
> > >> +
> > >> +        i2c-mux@74 {
> > >> +            compatible = "maxim,max7357";
> > >> +            #address-cells = <1>;
> > >> +            #size-cells = <0>;
> > >> +            reg = <0x74>;
> > >> +
> > >> +            i2c@1 {
> > >> +                #address-cells = <1>;
> > >> +                #size-cells = <0>;
> > >> +                reg = <1>;
> > >> +
> > >> +                eeprom@54 {
> > >> +                    compatible = "atmel,24c08";
> > >> +                    reg = <0x54>;
> > >> +                };
> > >> +            };
> > >> +
> > >> +            i2c@7 {
> > >> +                #address-cells = <1>;
> > >> +                #size-cells = <0>;
> > >> +                reg = <7>;
> > >> +
> > >>                  rtc@51 {
> > >>                      compatible = "nxp,pcf8563";
> > >>                      reg = <0x51>;

-- 
Regards,

Laurent Pinchart
