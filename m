Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318AE4E767D
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 16:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238260AbiCYPP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 11:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377402AbiCYPOR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 11:14:17 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F185583B0;
        Fri, 25 Mar 2022 08:12:17 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3892020001E;
        Fri, 25 Mar 2022 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648221134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eAt+TBAfengvsI3opJRvj5GMA9ByOtG9TQG+M6MuH4E=;
        b=CaBSjKEDovabjcw3Z4WagEYRSCZbtxPBvJ/sFLGjWvvpemYnV934wMAsR13Evys2twwsAS
        pPrfqvdQeersxQhABxBUygfrm1/JlkQWjv2zLmgo4Y8g6gJ9dYBO9eJmwL2jSJGGmk1Vvw
        TqYdSqP5NGbAHF1mHiPNtrmorTLkVSc1fQeS4jVvynj/dht+CqR/gu3o7cdcDOK93UIQBl
        GjhB2/IOhUK9N4wG45hKI56wAy1GgaS55PpURQPr8rL+hw+53OpwrvRhhuHgZ8cLFDXgeD
        xMsBL2/UYK1hrVWoA/qfQoo38Y45zL3GtdnqTLGoZ177mTC0xI173zB30ahPcQ==
Date:   Fri, 25 Mar 2022 16:10:52 +0100
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/9] device property: add
 fwnode_property_read_string_index()
Message-ID: <20220325161052.3ae6dd30@fixe.home>
In-Reply-To: <Yj3S0g9kaykY6S+A@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-5-clement.leger@bootlin.com>
        <Yj3S0g9kaykY6S+A@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
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

Le Fri, 25 Mar 2022 16:33:54 +0200,
Andy Shevchenko <andriy.shevchenko@linux.intel.com> a =C3=A9crit :

> On Fri, Mar 25, 2022 at 12:31:43PM +0100, Cl=C3=A9ment L=C3=A9ger wrote:
> > Add fwnode_property_read_string_index() function which allows to
> > retrieve a single string from an array by its index. This function is
> > the equivalent of of_property_read_string_index() but for fwnode
> > support. =20
>=20
> ...
>=20
> > +	ret =3D fwnode_call_int_op(fwnode, property_read_string_array, propna=
me,
> > +				 string, 1, index);
> > +	if (ret =3D=3D -EINVAL && !IS_ERR_OR_NULL(fwnode) &&
> > +	    !IS_ERR_OR_NULL(fwnode->secondary))
> > +		ret =3D fwnode_call_int_op(fwnode->secondary,
> > +					 property_read_string_array, propname,
> > +					 string, 1, index); =20
>=20
> This is not fully correct. See [1] for the details.
> I hope to send the new version just after the merge window ends.
>=20
> [1]: https://lore.kernel.org/lkml/20220308123712.18613-1-andriy.shevchenk=
o@linux.intel.com/
>=20

Ok, I think we can wait for your patch to be applied in that case.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
