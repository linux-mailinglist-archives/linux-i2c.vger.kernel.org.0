Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B321527EA7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 09:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbiEPHfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 03:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiEPHfe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 03:35:34 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D0323173;
        Mon, 16 May 2022 00:35:31 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5BD3AC0009;
        Mon, 16 May 2022 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652686529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qBDInhr0yZ1fOXspgyh+6sLKoxgAx7ViWH8dL349Tjs=;
        b=d+goV1MEW4MIn5lwfeiPYXFuKknZCEbSnceabWOkWUCcFnwHzHhkbWbv19xk4BMzUin/If
        VjwgWZ+2vG/A+h+EZXcxrKu0u8t57ZPvipF/eGcow08Fz0VwqlylGmvh8UKXIPc/aCmgpH
        DjQP362ER2T9Qe6kOze832gbVDSHMmrrtHwrrvAMFDZsm2VXHTRDq+Mnxor1rrmA3j6DmA
        9CK0CxqjWbUg/NwlCriR+rYzjYzIW63YHN/1DqIkdCr45xIscptJW2iJmX06KF8FIj1RRr
        uIx3LpKShMGunnZdaDUppLXHJnnLuQVbuEkDEtm7nYVOtf6gHEDoSG9A7tXtWg==
Date:   Mon, 16 May 2022 09:34:18 +0200
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] introduce fwnode in the I2C subsystem
Message-ID: <20220516093418.0038845c@fixe.home>
In-Reply-To: <12be48dc-b5d1-063c-87a0-050886cc2505@axentia.se>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <Yn/BFKwzVLwrjF/F@shikoro>
        <12be48dc-b5d1-063c-87a0-050886cc2505@axentia.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le Sun, 15 May 2022 23:34:16 +0200,
Peter Rosin <peda@axentia.se> a =C3=A9crit :

> 2022-05-14 at 16:47, Wolfram Sang wrote:
> > O =20
> >> This series is a subset of the one that was first submitted as a larger
> >> series to add swnode support [1]. In this one, it will be focused on
> >> fwnode support only since it seems to have reach a consensus that
> >> adding fwnode to subsystems makes sense. =20
> >=20
> > From a high level view, I like this series. Though, it will need Peter's
> > ack on the I2C mux patches as he is the I2C mux maintainer. Still, I
> > wonder about the way to upstream the series. Feels like the first 5
> > patches should not go via I2C but seperately? =20
>=20
> Hi Wolfram,
>=20
> I also think it looks basically sane. However, there are a couple of
> comments plus promises to adjust accordingly. I guess I filed it under
> "wait for the next iteration"...
>=20
> Cheers,
> Peter

Hi Wolfram & Peter,

While doing the same conversion on the reset subsystem, Rob Herring
stepped in and mention the fact that this could be done using
device-tree overlay (even on system with ACPI) .

The result was that a new serie [1] which add support to create the PCI
devices of_node if not existing, and then allow drivers to applies an
overlay which describe the tree of devices as a child of a specific PCI
device of_node. There are a lot of advantages to this approach (small
patchset working for all susbystems, easier to use, description is
using already existing device-tree). There are still some concerns
about the viability of dynamic overlay but this might be settled soon.

Regards,

[1] https://lore.kernel.org/all/20220509141634.16158c38@xps-bootlin/T/

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
