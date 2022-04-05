Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473AB4F48F1
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbiDEV4C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383966AbiDEPOv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 11:14:51 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCB157B08;
        Tue,  5 Apr 2022 06:28:32 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 709324000D;
        Tue,  5 Apr 2022 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649165311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qnhE1fGjUafmBC+KaTBnXvOD8ef7wgKM3WFEC0Tf58Q=;
        b=PNZNMPwtfLbDvJj2rr5VXgbxaCGxcXBVC+gZHBtIAYoLT4hU6bhMpirHr8gz34mNJXLwRO
        6LDLtXVpQnIuL7joOzxx9Ymx88UJvXp25mqd5+1fwpkfq9LPc28eaU0N05kaOwcWtbuWmk
        GiTNuRJji7YMiyuTKfkrzQ+z3IpmfDY/JtMPHS4AI82mAnxjTgra4Kc/vf8XNy2XPyhn4G
        +R377fFgzWK/qsqrQV4FhwQeZHFkMf9ok4VSgKwai8hmm2ocIWz0Z7N3wOY3gDfIsP4wdc
        1+jboRxEU1Fhwg8JYtN+22rUVhqpabxaS2J78OFowBUg/dKrZYmIvsQQdPdskw==
Date:   Tue, 5 Apr 2022 15:27:02 +0200
From:   =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/9] device property: add index argument to
 property_read_string_array() callback
Message-ID: <20220405152702.50ba516d@fixe.home>
In-Reply-To: <CAJZ5v0hOjaOCUxbFzKG90Db0bgfdb3q988oAvLB4kmD3-HS8sQ@mail.gmail.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
        <20220325113148.588163-4-clement.leger@bootlin.com>
        <Yj3SFYdUQ4r7GXqs@smile.fi.intel.com>
        <20220328162812.16deac92@fixe.home>
        <CAJZ5v0hOjaOCUxbFzKG90Db0bgfdb3q988oAvLB4kmD3-HS8sQ@mail.gmail.com>
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

Le Tue, 5 Apr 2022 15:22:51 +0200,
"Rafael J. Wysocki" <rafael@kernel.org> a =C3=A9crit :

> On Mon, Mar 28, 2022 at 4:29 PM Cl=C3=A9ment L=C3=A9ger <clement.leger@bo=
otlin.com> wrote:
> >
> > Le Fri, 25 Mar 2022 16:30:45 +0200,
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> a =C3=A9crit :
> > =20
> > > >     pointer =3D property_entry_find(props, propname, length);
> > > >     if (IS_ERR(pointer))
> > > >             return PTR_ERR(pointer); =20
> > > =20
> > > > +   if (index >=3D array_len)
> > > > +           return -ENODATA; =20
> > >
> > > I was about to ask if we can check this before the
> > > property_entry_find() call, but realized that in such case it will
> > > shadow possible errors due to wrong or absent property. =20
> >
> > I think you are actually right, the check can be done after
> > property_entry_count_elems_of_size() since it already checks for the
> > property to be present. I'll move that check.
> > =20
> > >
> > > ...
> > > =20
> > > > -           of_property_read_string_array(node, propname, val,
> > > > nval) :
> > > > +           of_property_read_string_array_index(node,
> > > > propname, val, nval,
> > > > +                                               index) : =20
> > >
> > > Dunno about the style there, but I think it can be one line. =20
> >
> > Seems like the complete file is strictly applying the 80 columns rules
> > so I thought it was better to keep it like this. However, I think the
> > ternary oeprator is not really readable with such split. =20
>=20
> So FWIW I would entirely change it to
>=20
> if (!val)
>         return of_property_count_strings(node, propname);
>=20
> return of_property_read_string_array_index(node, propname, val,
>=20
> nval, index);
>=20
> which IMO would be way easier to read.

Hi Rafael,

Agreed, this is way more readable. I'll modify that.

Thanks,

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
