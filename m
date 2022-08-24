Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D7A5A015F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 20:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiHXScQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 14:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbiHXScP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 14:32:15 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE76665245;
        Wed, 24 Aug 2022 11:32:13 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id m5so10700528qvo.4;
        Wed, 24 Aug 2022 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=dPOGfBT54RWRtu5CeO5LKRCTkkIsVZr0LQex7RYeaCk=;
        b=ILqCftLPvIZmDnkp/ng1MWr95opHLoBnWEdaG37b0jq+/4XJ8nkHwJfKHIBNc/mLfb
         XId+RCpY3rKHVL90QTPRUGcaKd4TQ03KcK1TMQHJYP13OPPVTGmrCpvY0pjk6QaKlSNo
         NZsw9R2QRAT1tbArRKehY3+IPyCHJRXq+mJOgxBvwa8D5URyTz68P8hJhCxHDFoeOscb
         i9YvUViz18LEy2dVw1EYEPfee+E5twLiMclRSdoAoK6IoIAvyM98R/KtCgo+EEgErX2k
         zAHryZF6EDLo7J57NPKmPBXKzQtofuvzeJyXj7q3+GuuklMVIUcKDp2Q7O7MWcTMt0a+
         H0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=dPOGfBT54RWRtu5CeO5LKRCTkkIsVZr0LQex7RYeaCk=;
        b=THgDNCaYj/jp/BpP9Xd0NLmtXMM7TVqIJ0z0FWA5q8EiULq6A0wMrqDwcKxn6au/Nq
         joe2C0b2nacY6AsphiddqjFg81v4M/jo9VwgW0Q6w95yfcJvArGADZKXqRQgIPLwFAC7
         3+IVxPGD6GMSbTUUhxqKBkN0twTSR3CSfwwOBESVURkoP7eP1UbUmZ22xoDH0gp6PqM5
         JlRI7bvbY5+IadhmqWq3NK4vxjFM0er1ML7WT6OPTmtflXRDSYSSONcxSl2G4B3/M8lK
         j1ZeYXyON9QlZz7cEEY04GogamKxmvgn932jwp+lEttazJU+LD4WXc3AW7B4sqPDNcts
         kebA==
X-Gm-Message-State: ACgBeo3P1YvlDZAojQeEdjemRpEVof06dXkw8G4F4/3n0bGgEGmwfkZ/
        zB3nYqwv0d2VyMNA9ebIz5EW1qeX+ZqwslAU4mI=
X-Google-Smtp-Source: AA6agR410aiBykrfbeOjiPonwyOQ+1cuMpsFlMq5t6G+5byVmu9jMrYRrKfM34vRB650YpxdgRwL3t2jS6ctnHPE6Mk=
X-Received: by 2002:ad4:5baf:0:b0:476:6a9e:b5e1 with SMTP id
 15-20020ad45baf000000b004766a9eb5e1mr373770qvq.64.1661365932922; Wed, 24 Aug
 2022 11:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
 <YwTsnCdxM5I6BoJu@smile.fi.intel.com> <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
In-Reply-To: <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Aug 2022 21:31:37 +0300
Message-ID: <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sven Peter <sven@svenpeter.dev>, Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Olof Johansson <olof@lixom.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jan Dabros <jsd@semihalf.com>, Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 24, 2022 at 6:04 PM <Tharunkumar.Pasumarthi@microchip.com> wrot=
e:
> On Tue, 2022-08-23 at 18:05 +0300, Andy Shevchenko wrote:
> > On Tue, Aug 23, 2022 at 08:26:03PM +0530, Tharun Kumar P wrote:

...

> > > + * Author: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> > > + *         Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.co=
m>
> >
> > Single or many?
>
> There are 2 authors for this file

Do you see the issue now?

...

> > > +#define SMB_CORE_CTRL_ESO    0x40
> > > +#define SMB_CORE_CTRL_FW_ACK 0x10
> >
> > Are they bits or numbers?
>
> These are bits

Use BIT() then. Ditto for the rest of the bits.

...

> > > +#define SMB_IDLE_SCALING_100KHZ              0x03E803C9
> > > +#define SMB_IDLE_SCALING_400KHZ              0x01F4009D
> > > +#define SMB_IDLE_SCALING_1000KHZ     0x01F4009D
> >
> > Shouldn't these magics be decimals?

This Q seems unanswered.

> > Ditto for the rest similar stuff.
>
> There is no direct correlation between the hex value and time. Configurin=
g
> registers with these values in driver will set the time in device.

...

> > > +#define I2C_DIR_WRITE                0
> > > +#define I2C_DIR_READ         1

https://elixir.bootlin.com/linux/v6.0-rc2/source/include/uapi/linux/i2c.h#L=
24

> > Namespace collision. Doesn't I=C2=B2C core provide these?
>
> I am unable to find any existing MACROs for WRITE and READ in I2C core. K=
indly
> let me know the MACROs

...

> > > +#define PCI1XXXX_I2C_TIMEOUT 1000
> >
> > Units? Same to the rest similar cases.
>
> Unit is milliseconds

So you know what to do, right?

...

> > > +#define SMBUS_PERI_LOCK              BIT(3)
> >
> > BIT() out of a sudden. See above.
>
> Will use hex value for this like in other places to maintain uniformity

See above.

...

> > > +     pci1xxxx_i2c_shutdown(i2c);
> >
> > Do you really need this in ->remove()? I would expect something in
> > the ->suspend() / ->shutdown().
>
> pci1xxxx_i2c_shutdown API will reset the registers that are set as part o=
f
> pci1xxxx_i2c_init. So, this API is present in ->remove() and not in ->sus=
pend()
> callback

I understand that, but it doesn't really answer my question.

--=20
With Best Regards,
Andy Shevchenko
