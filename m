Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865C8256DE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 19:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfEURkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 13:40:46 -0400
Received: from casper.infradead.org ([85.118.1.10]:56642 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbfEURkq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 13:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PATrPOCzUrRyca27s4+V52qUY6FMWM43J+dPi/TPcgU=; b=AUfMmq4Ebtz9TIs/nzRr1IndZM
        tt9e5ucVfMGLPoo6TmBDOjcwvpoQrKr1zXqv347aPcohgn0nCCAgh/Z9HLbBZ/oXpX1i4Ju1BzUXZ
        yS+poUPSySX+6QKIsbi7h/Io/EbwqTDVf+yA8AksIuRjncfDMVcJrVvbZlVUnDPSioE55JrHwxxtv
        nRC5e0FmSAhdN5k+GgUpRhizTF094MLMQlou6bVwpWBsdm6UHhCuvrZhh27TonYwDteSK3QvtlukZ
        aBzirHeJzI2YhR+wGL4rLsxBvDryq1BnT95+gGNcf+Zc6qNlUry/fc4GuUTaF1PznCdfzb1FKG5KD
        rYM0rxRQ==;
Received: from 189.27.21.94.dynamic.adsl.gvt.net.br ([189.27.21.94] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hT8kj-0005Jt-PQ; Tue, 21 May 2019 17:40:42 +0000
Date:   Tue, 21 May 2019 14:40:34 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, "Hans Verkuil" <hverkuil@xs4all.nl>
Subject: Re: [RFC 0/4] TI camera serdes - I2C address translation draft
Message-ID: <20190521144034.100f9f8b@coco.lan>
In-Reply-To: <20190108223953.9969-1-luca@lucaceresoli.net>
References: <20190108223953.9969-1-luca@lucaceresoli.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Tue,  8 Jan 2019 23:39:49 +0100
Luca Ceresoli <luca@lucaceresoli.net> escreveu:

> Hi,
> 
> there has been some discussion on linux-media about video
> serializer/deserializer chipsets with remote I2C capabilities from TI
> [0] and Maxim [1]. I took part discussing how the remote I2C feature
> of such chips could be best implemented in Linux while I was
> implementing a driver for the Texas Instruments DS90UB954-Q1 video
> deserializer. My approach is different from both the one used by
> Vladimir Zapolskiy on other TI chips, which look similar to the
> DS90UB954 in their I2C management, and the one used by Kieran Bingham
> with Maxim chips, which have a different and simpler I2C management.
> 
> After that I had to stop that work, so it is unfinished and I have no
> plan to continue it. Upon suggestion by some linux-media developers
> I'm sending my patches as RFC in the hope that they bring additional
> material for the discussion.
> 
> I2C management is quite complete in my patches, and it shows how I
> envisioned I2C management. For the rest the code is in large part
> incomplete. Don't consider the V4L2, GPIO and other sections as ready
> for any review.
> 
> The whole idea is structured around a central node, called the ATR
> (Address Translator). It is similar to an I2C mux except it changes
> the I2C addresses of transactions with an "alias" address for each
> remote chip. Patch 2 has a detailed description of this process.
> 
> 
> A typical setup looks like:
> 
>                           Slave X @ 0x10
>                   .-----.   |
>       .-----.     |     |---+---- B
>       | CPU |--A--| ATR |
>       `-----'     |     |---+---- C
>                   `-----'   |
>                           Slave Y @ 0x10
> 
>   A = "local" bus
>   B = "remote" bus 0
>   C = "remote" bus 1
> 
> In patch 2 I enriched the i2c-mux to also act as an ATR. However the
> implementation grew larger than I desired, so now I think it would
> make sense to leave i2c-mux as is, and add a new i2c-atr.c which has
> ATR features without much of the MUX code. However the implementation
> would not change too much, so you can look at i2c-mux to see how I
> implemented the ATR.
> 
> In the ATR (i2c-mux.c) I implemented the logic needed to remap slave
> addresses according to a table. Choosing appropriate aliases and
> filling that table is driver-specific, so in this case it is done by
> ds90ub954.c. The ATR driver needs to know when a new client appears on
> the remote bus to setup translation and when it gets disconnected to
> undo it. So I added a callback pair, attach_client and detach_client,
> from i2c-core to i2c-mux and from there to the ATR driver. When
> getting the callback the ATR driver chooses an alias to be used on the
> local bus for the new chip, configures the ATR (perhaps setting some
> registers) returns the alias back to the ATR which sill add the new
> chip-alias pair to its table. The ATR (i2c-mux) then will do the
> translation for each message, so that the alias will be used on the
> local bus and the physical chip address on the remote bus.
> 
> The alias address for a new client is chosen from an alias pool that
> must be defined in device tree. It is the responsibility of the DT
> writer to fill the pool with addresses that are otherwise unused on
> the local bus. The pool could not be filled automatically because
> there might be conflicting chips on the local bus that are unknown to
> the software, or that are just connected later.
> 
> The alias pool and the mapping done at runtime allow to model
> different camera modules [or display or other modules] similarly to
> beaglebone capes or rpi hats, up to a model where:
> 
>  1. there can be different camera modules being designed over time
>  2. there can be different base boards being designed over time
>  3. there is a standard interconnection between them (mechanical,
>     electrical, communication bus)
>  4. camera modules and base boards are designed and sold independently
>     (thanks to point 3)
> 
> The implementation is split in the following patches:
>  * Patch 1 adds the attach_client() and detach_client() callbacks to
>    i2c-core
>  * Patch 2 adds similar callbacks for the use of device drivers and,
>    most importantly, implements the ATR engine
>  * Patch 3 adds a farily complete DT bindings document, including the
>    alias map
>  * Patch 4 adds the DS90UB954-Q1 dual deserializer driver
> 
> There is no serializer driver here. The one I have is just a skeleton
> setting a few registers, just enough to work on the deserializer
> driver.

Not sure what to do here... I guess I'll just mark the patches as
RFC at media patchwork, as someone has to need support for it and need
to finish its implementation.

> 
> Each patch has an comprehensive list of open issues.
> 
> [0] https://www.spinics.net/lists/linux-gpio/msg33291.html
> [1] https://www.spinics.net/lists/linux-media/msg142367.html
> 
> Regards,
> --
> Luca
> 
> 
> Luca Ceresoli (4):
>   i2c: core: let adapters be notified of client attach/detach
>   i2c: mux: notify client attach/detach, add ATR
>   media: dt-bindings: add DS90UB954-Q1 video deserializer
>   media: ds90ub954: new driver for TI DS90UB954-Q1 video deserializer
> 
>  .../bindings/media/ti,ds90ub954-q1.txt        |  151 ++
>  drivers/i2c/i2c-core-base.c                   |   16 +
>  drivers/i2c/i2c-mux.c                         |  218 ++-
>  drivers/i2c/muxes/i2c-mux-pca954x.c           |    2 +-
>  drivers/media/Kconfig                         |    1 +
>  drivers/media/Makefile                        |    2 +-
>  drivers/media/serdes/Kconfig                  |   13 +
>  drivers/media/serdes/Makefile                 |    1 +
>  drivers/media/serdes/ds90ub954.c              | 1335 +++++++++++++++++
>  include/linux/i2c-mux.h                       |   20 +-
>  include/linux/i2c.h                           |    9 +
>  11 files changed, 1760 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,ds90ub954-q1.txt
>  create mode 100644 drivers/media/serdes/Kconfig
>  create mode 100644 drivers/media/serdes/Makefile
>  create mode 100644 drivers/media/serdes/ds90ub954.c
> 



Thanks,
Mauro
