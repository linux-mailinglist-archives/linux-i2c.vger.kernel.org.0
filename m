Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38639DB2B5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394393AbfJQQqD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 12:46:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:33046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390763AbfJQQqD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Oct 2019 12:46:03 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31D8C21848;
        Thu, 17 Oct 2019 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571330762;
        bh=ST385NSYuwXC3f6iHRWFfEjB9cPothZhVKZ/sW1hOw8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=za4tq5vxbNcSvvLnkN6A9TiO1Idkq04/ElICw324HADDcbqcrZtHySN/UFkGpqzvW
         5SPz+zqRqt3aBCThINGWrnWstht1//SGm9z4eOMyfns6G03+y9OZvvFhne1HgJfgFe
         LEDiVOWasXy37i0RToY6/Nr5ZfRTrXe0sEYHiaRk=
Received: by mail-qt1-f170.google.com with SMTP id m61so4531685qte.7;
        Thu, 17 Oct 2019 09:46:02 -0700 (PDT)
X-Gm-Message-State: APjAAAWGsu9DQAHHBggPKhAYq9vG/0ncSmEDj5GLkws++eBUb5vnypRg
        hJmZiLFN8GtnYkqjZwm1wa6P//ONZSbC72UsbQ==
X-Google-Smtp-Source: APXvYqwxmloo/IijujMedfKeIrZqpNiMPv1IfUbUmiboin2+5egtsuLRNN7GW7JwEX6FcQMEjc3eB3oVnwY1SUOJQIY=
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr5010364qto.300.1571330761301;
 Thu, 17 Oct 2019 09:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191016040920.8511-1-biwen.li@nxp.com> <bfdb97c1-76f4-52d9-7f02-c62bed8192ce@axentia.se>
In-Reply-To: <bfdb97c1-76f4-52d9-7f02-c62bed8192ce@axentia.se>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Oct 2019 11:45:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK_BOSZ=UNP-L7OpuNsFUAqWBhAjCObex+0xtkYp=7c+A@mail.gmail.com>
Message-ID: <CAL_JsqK_BOSZ=UNP-L7OpuNsFUAqWBhAjCObex+0xtkYp=7c+A@mail.gmail.com>
Subject: Re: [v3,1/2] dt-bindings: i2c: support property idle-state
To:     Peter Rosin <peda@axentia.se>
Cc:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 17, 2019 at 10:38 AM Peter Rosin <peda@axentia.se> wrote:
>
> On 2019-10-16 06:09, Biwen Li wrote:
> > This supports property idle-state
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v3:
> >       - update subject and description
> >       - add some information for property idle-state
> >
> > Change in v2:
> >       - update subject and description
> >       - add property idle-state
> >
> >  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > index 30ac6a60f041..7abda506b828 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > @@ -25,6 +25,8 @@ Required Properties:
> >  Optional Properties:
> >
> >    - reset-gpios: Reference to the GPIO connected to the reset input.
> > +  - idle-state: if present, overrides i2c-mux-idle-disconnect,
> > +    Please refer to Documentation/devicetree/bindings/mux/mux-controller.txt
> >    - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
> >      children in idle state. This is necessary for example, if there are several
> >      multiplexers on the bus and the devices behind them use same I2C addresses.
> >
>
> Rob, should i2c-mux-idle-disconnect perhaps be deprecated here? Is that
> appropriate?
>
> idle-state provides a super-set of what i2c-mux-idle-disconnect provides.

Yes, seems like it and it is not too widely used.

Rob
