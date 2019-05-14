Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92DF1C903
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2019 14:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfENMua (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 May 2019 08:50:30 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41844 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENMua (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 May 2019 08:50:30 -0400
Received: by mail-vs1-f65.google.com with SMTP id g187so10227236vsc.8
        for <linux-i2c@vger.kernel.org>; Tue, 14 May 2019 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YpyAuaSZoUHmHgqCL0JrMDK/4+eoaePOQg+dGsDeL1Y=;
        b=MAWEzXx5qOA1QwYeqN6veTqPQLb/4+B2P5h8QxPYJRMmB1y1oMI8sLWFmX6BP6/QLs
         VUBaWuPfPS1KXulqH0sHLqI4Cfiw9oy9hoXmtV/zqdyiW92xllzX74sLSZSdh3S9Wq9d
         4P457sTJO8IU92CsF1vniHU08XY/teMwmxHDMgGGdER7KaMY7xSSF1NsXCO594nbhm0C
         1PsmVa4tN+PjH3E7jnI0BlNCC4ppWKVVJAqSyZJfvxbc7eNZD8SKTUF1cxO1vHnAh8sh
         gg9neERTPdzxWPmZJCUi9rAtMDbDUuXLa0yMV2M9oAtkQu7ftn0J66kT3gsa99q2OLh9
         vRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YpyAuaSZoUHmHgqCL0JrMDK/4+eoaePOQg+dGsDeL1Y=;
        b=Rw/dVKQFdx/1ehTyhYE/6ApfQTnbjK+K60N7ZMCPZLcARf0qbXdAZmcwZ2eRdJBwTN
         +5x8SG4eY1/28YHVqBWmrYOaEzYyamq8+rhRvVPPtsdeuKCaOtmfOZ5Q6QOFAaajMlaB
         AMqjsYWAXD4uLlEsI9pn6iZ2fWfyWPYhaDyagWBU+V41ACrDHm9c4rWySi8P61+NiTpP
         PUhSKCeboFBGw4DAbJ9Jc1d4pOks9aG40ftDvOTxoASVYFna5ubn1xlZlV/AQI2zZJwG
         0ZtUA0vY+Z65vGzsiKfIzn92qVkLlCCca5Y2mI5ZymQZqQCjM0wHxl99C9KnzGBzXgyo
         aSgA==
X-Gm-Message-State: APjAAAXFzQ9+YUiWp8HZruZWcTGuS/hOcn6fjlJwELTpC58LEiEHtNXX
        IBRoJz1pv5KKO/HQzZe+77tDQR2CDVSawhEl/mHt4A==
X-Google-Smtp-Source: APXvYqz02W8Tl8ABmOcKNrSj4JOkabiO1hA1e7uKDCwhZhtelH9kj9SMsgerh3ZJ/AjW0izPMOm420t7EG/bszZ1lW0=
X-Received: by 2002:a67:ea45:: with SMTP id r5mr16171685vso.92.1557838228453;
 Tue, 14 May 2019 05:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
 <1557242108-13580-2-git-send-email-sagar.kadam@sifive.com> <20190513205615.GA5844@bogus>
In-Reply-To: <20190513205615.GA5844@bogus>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Tue, 14 May 2019 18:20:17 +0530
Message-ID: <CAARK3HkTCGWg4CAo1LmQHmf4_NFukjTwO1LAHjgSTS+R_5CRSg@mail.gmail.com>
Subject: Re: [PATCH v2 v2 1/3] dt-bindings: i2c: extend existing opencore bindings.
To:     Rob Herring <robh@kernel.org>
Cc:     mark.rutland@arm.com, peter@korsgaard.com,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Rob,

Thank you for the review.

On Tue, May 14, 2019 at 2:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 07, 2019 at 08:45:06PM +0530, Sagar Shrikant Kadam wrote:
> > Add FU540-C000 specific device tree bindings to already
> > available i2-ocores file. This device is available on
> > HiFive Unleashed Rev A00 board.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > index 17bef9a..f6bcf90 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -2,6 +2,7 @@ Device tree configuration for i2c-ocores
> >
> >  Required properties:
> >  - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +                    "sifive,fu540-c000-i2c" or "sifive,i2c0"
>
> If this is Opencores IP, does it really follow the Sifive versioning
> convention? If so, please reference sifive-blocks-ip-versioning.txt
> (which appears to have missed going upstream). Also, referencing the IP
> repository would be good too. If this IP block doesn't follow the same
> convention, then don't try using it for this binding.
>
Yes, the sifive,fu540-c000-i2c is a SoC specific compatibility string,
this way SoC specific
workaround's or bugs, can be handled in the software and the ip-block
specific compatibility
string "sifive,<ip-block-name><integer version number>" i.e.
sifive,i2c0 is IP block specific compatibility
string. Please let me know if I need some correction here?
I will also update reference for sifive-blocks-ip-versioning and the
ip repository into next version of patch.

> >  - reg             : bus address start and address range size of device
> >  - interrupts      : interrupt number
> >  - clocks          : handle to the controller clock; see the note below.
> > @@ -67,3 +68,22 @@ or
> >                       reg = <0x60>;
> >               };
> >       };
> > +or
>
> Just a new compatible isn't really a reason to add an example.
>
> > +     /*
> > +       An Opencore based I2C node in FU540-C000 chip from SiFive
> > +       This chip has a hardware erratum for broken IRQ
> > +       so it's recommended not to define interrupt in the device node
>
> Then interrupts needs to be optional.
True, I will move interrupts and interrupt parent into optional section
>
> > +     */
> > +     i2c@10030000 {
> > +                     compatible = "sifive,i2c0","sifive,fu540-c000-i2c";
> > +                     reg = <0x0 0x10030000 0x0 0x1000>;
> > +                     reg-names = "i2c-control";
>
> Not doucmented.
In v1, I had added a new binding file as sifive-i2c-ocores.txt for
SiFive i2c core.
After Andrew's suggestion,  extending the available i2c-ocores.txt
seemed to be a better idea rather than adding a new file.
so added an example node which is HiFive specific in the existing file.
Please let me know if I need to handle this in a different way.

>
> > +                     clocks = <&tlclk>;
> > +                     clock-frequency = <100000>;
> > +
> > +                     reg-shift = <2>;
> > +                     reg-io-width = <1>;
> > +
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +     };
> > --
> > 1.9.1
> >
> >
> > --
> > The information transmitted is intended only for the person or entity to
> > which it is addressed and may contain confidential and/or privileged
> > material. If you are not the intended recipient of this message please do
> > not read, copy, use or disclose this communication and notify the sender
> > immediately. It should be noted that any review, retransmission,
> > dissemination or other use of, or taking action or reliance upon, this
> > information by persons or entities other than the intended recipient is
> > prohibited
