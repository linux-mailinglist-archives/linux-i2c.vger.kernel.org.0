Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93ABE78B145
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 15:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjH1NBc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 09:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbjH1NB1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 09:01:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5490211A;
        Mon, 28 Aug 2023 06:01:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E26FB6144F;
        Mon, 28 Aug 2023 13:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F22C433CA;
        Mon, 28 Aug 2023 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693227683;
        bh=YwWf+69ptq1lyMZ3WehfZU4zX7mpITK5ckcA15GNDIE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Aw0e7QTd83GlVDwR5IACmbCyziwaRoRDSDYLhZsN+exmsOIzzc8nZiMooYuvd4z7b
         aHn8TNqW/QFw3zqIU/cNFpmaol/dnQNV9WU0FSKQaFGsDJrF60rjEhWYz+9HJsPD5l
         Ne94NGEkGIWwisddBtA3tuAO1OaCbTyEs1fkB1tunHO4PssYz4mDIHAPU98xKGtJVl
         Iu6IEvwvfhP/2LOs0qE6TrskpJ3E6KevDF7aeSj7SgsFAjRw2i0HQrlBNqeYn1IaBk
         3jq4ZTrx0fTHRrFPRhZuV+3HJmWRN3+afF+LvDb56RG51ElppMtAVVHvLTO6JQca02
         Cdpes2R/2GQJQ==
Date:   Mon, 28 Aug 2023 14:01:41 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
 bus_type
Message-ID: <20230828140141.220732e0@jic23-huawei>
In-Reply-To: <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
References: <20230805174036.129ffbc2@jic23-huawei>
        <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <20230806142950.6c409600@jic23-huawei>
        <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
        <ZNFV+C1HCIRJpbdC@google.com>
        <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
        <20230809182551.7eca502e@jic23-huawei>
        <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <ZNT+NY99n7y3abwa@smile.fi.intel.com>
        <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
        <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Aug 2023 15:12:24 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Biju,
>=20
> On Fri, Aug 11, 2023 at 4:46=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > > bus_type
> > >
> > > On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote: =20
> > > > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote: =20
> > >
> > > ...
> > > =20
> > > > > I'm good with this approach, but make sure you checked the whole
> > > > > kernel source tree for a such. =20
> > > >
> > > > Checking against 16 is too short I guess??
> > > >
> > > > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums. =20
> > >
> > > So, what does prevent us from moving that tables to use pointers? =20
> >
> > I think that will lead to ABI breakage(client->name vs id->name)
> >
> >         match =3D device_get_match_data(&client->dev);
> >         if (match) {
> >                 chip_type =3D (uintptr_t)match;
> >                 name =3D client->name;
> >         } else if (id) {
> >                 chip_type =3D (enum inv_devices)
> >                         id->driver_data;
> >                 name =3D id->name;
> >         } else {
> >                 return -ENOSYS;
> >         } =20
>=20
> I don't consider that part of the ABI, as e.g. converting from board files
> to DT would change the name.
> In addition, using id->name breaks multiple instances of the same device.

This has always been a mess as I wasn't paying attention a long time back
and we ended up with some client->name entries being used for iio_dev->name
whereas it should be the part number.

Using id->name is correct choice.  This is supposed to be the same for mult=
iple
instances of the same device.  There is label and a bunch of other options
for differentiating them including their parent devices.

Problem is that is exported to userspace and often used as part of the
matching when a userspace tool is trying to find the device.

We could 'give it a go' by setting the name in teh switch statement in the =
core code
and hope no one notices but it's not ideal
https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/inv_mpu6050/=
inv_mpu_core.c#L1597

Jonathan



>=20
> I applaud more unification ;-)
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

