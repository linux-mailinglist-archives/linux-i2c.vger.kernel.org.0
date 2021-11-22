Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168F445947C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 19:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239869AbhKVSIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 13:08:21 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:50644 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235590AbhKVSIU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 13:08:20 -0500
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Nov 2021 13:08:20 EST
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id 3EDF5261B33; Mon, 22 Nov 2021 18:59:03 +0100 (CET)
Date:   Mon, 22 Nov 2021 18:59:03 +0100
From:   Janne Grunau <j@jannau.net>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Mark Kettenis <kettenis@openbsd.org>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: apple,i2c: allow multiple
 compatibles
Message-ID: <20211122175903.GA28130@jannau.net>
References: <20211121171545.27402-1-j@jannau.net>
 <20211121171545.27402-3-j@jannau.net>
 <2baebbe6-0080-4cff-86de-a00f23aea95e@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2baebbe6-0080-4cff-86de-a00f23aea95e@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-11-21 21:22:47 +0100, Sven Peter wrote:
> Hi,
> 
> On Sun, Nov 21, 2021, at 18:15, Janne Grunau wrote:
> > The intention was to have a SoC-specific and base compatible string
> > to allow forward compatibility and SoC specific quirks,
> >
> > Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > Cc: Mark Kettenis <kettenis@openbsd.org>
> > ---
> 
> Yeah, this should've been "apple,t8103-i2c", "apple,i2c" all along :/
> Given that we have no i2c nodes in the dts yet and that this binding was
> only added for -rc1 I think it's fine to just drop "apple,t8103-i2c"
> here instead of marking it as deprecated and keeping it around forever
> if Mark Kettenis also agrees.
> 
> >  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml 
> > b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> > index 22fc8483256f..f1cb96c08212 100644
> > --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> > @@ -20,9 +20,10 @@ allOf:
> > 
> >  properties:
> >    compatible:
> > -    enum:
> > -      - apple,t8103-i2c
> > -      - apple,i2c
> > +    items:
> > +      - enum:
> > +        - apple,t8103-i2c
> > +      - const: apple,i2c
> 
> Nit: the enum makes sense once we add t6000-i2c but right now
> 
> properties:
>   compatible:
>     items:
>       - const: apple,t8103-i2c
>       - const: apple,i2c
> 
> also works and look a bit less weird.

I split it from change which in addition added "apple,t6000-i2c" as 
second enum value. I have no strong preference but the weirdness will 
hopefully vanish soon.

Janne
