Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246D0333305
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 03:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCJCPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 21:15:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:35400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231816AbhCJCPs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Mar 2021 21:15:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E7AB64F7E;
        Wed, 10 Mar 2021 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615342547;
        bh=gGnNhPr0DWADGFGUMyDj2hs2uSoxRdjKvxqqvQf6wfo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k713Q0fCTwC990xf6Ejohm0kHuGHp7Idprckbo+eXb62Wm0pXHPRDC8U0Ns+ckixH
         1/EyzRZep1H4DsljiN0G4vq0trN4Y7mCJHPG8u4zqCw/qBd077UgD6zPe4ogE4EQYr
         ZnMJ0XObXPRk0CunPDeqKHm+rKoXwJCjf5H8jzpHF6SXbUF+oBFKPuK2F8Snh++Wwl
         Kz+e3QuDEI2tGESTFgLsBEYVw62uPLlM+8DGoApXPeqRzdZx+eUWGBXP1+pi5JvO3T
         u1OvyRfqI58/DVNKQLLEZxLuv8MTTnLeM++QFxkrypwbza3jZ9GX0VW0gk6uwR8WrA
         QTNH1d8OfhBdw==
Received: by mail-ej1-f52.google.com with SMTP id mm21so34162541ejb.12;
        Tue, 09 Mar 2021 18:15:47 -0800 (PST)
X-Gm-Message-State: AOAM531XIONbQ+GRbDAP/cZbj/J81fw1xAUOHmrfkZhtaQhxIrtFK1Gb
        AxVvuV3nTRNvUDAZG1Ze5lDv1slzDwD1bUXloA==
X-Google-Smtp-Source: ABdhPJzlfAtTISVZdDB2/RHfhz3nQgwk53TFhdnxLL8gRi9G9LQzZBtYiWJCkHcPfSznl4nBDUJz+aLmd5O2hUr/DZU=
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr1022276ejb.360.1615342545964;
 Tue, 09 Mar 2021 18:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com> <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
In-Reply-To: <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 9 Mar 2021 19:15:34 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
Message-ID: <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 3/6/2021 12:30 PM, Rob Herring wrote:
> > On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
> >> Append bindings to support transfer mode.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >> ---
> >> Changes since v3:
> >> - None
> >>
> >> Changes since v2:
> >> - Moved SRAM resources back to default dtsi and added mode selection
> >>    property.
> >>
> >> Changes since v1:
> >> - Removed buffer reg settings from default device tree and added the settings
> >>    into here to show the predefined buffer range per each bus.
> >>
> >>   .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
> >>   1 file changed, 30 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> index b47f6ccb196a..242343177324 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> >> @@ -17,6 +17,20 @@ Optional Properties:
> >>   - bus-frequency    : frequency of the bus clock in Hz defaults to 100 kHz when not
> >>                specified
> >>   - multi-master     : states that there is another master active on this bus.
> >> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to select transfer
> >> +                      mode defaults to "byte" mode when not specified.
> >> +
> >> +                      I2C DMA mode on AST2500 has these restrictions:
> >> +                        - If one of these controllers is enabled
> >> +                            * UHCI host controller
> >> +                            * MCTP controller
> >> +                          I2C has to use buffer mode or byte mode instead
> >> +                          since these controllers run only in DMA mode and
> >> +                          I2C is sharing the same DMA H/W with them.
> >> +                        - If one of these controllers uses DMA mode, I2C
> >> +                          can't use DMA mode
> >> +                            * SD/eMMC
> >> +                            * Port80 snoop
> >
> > How does one decide between byte or buf mode?
>
> If a given system makes just one byte r/w transactions most of the time
> then byte mode will be a right setting. Otherwise, buf mode is more
> efficient because it doesn't generate a bunch of interrupts on every
> byte handling.

Then why doesn't the driver do byte transactions when it gets small
1-4? byte transactions and buffer transactions when it gets larger
sized transactions.

Rob
