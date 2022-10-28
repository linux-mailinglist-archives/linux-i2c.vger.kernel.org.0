Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3524D611408
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 16:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiJ1OHh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 10:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiJ1OHh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 10:07:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C591D586A;
        Fri, 28 Oct 2022 07:07:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y14so13179514ejd.9;
        Fri, 28 Oct 2022 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWCvMt3elQQkvkQ/TKdQKZ3J9fekFt08XY7JDczxDLs=;
        b=S5eY76mlN2tFMg+4pLeThtnQhlp4ocsMO1J3iG4xW0oV/kkyPzOpnEnvV96kPcbAEX
         pbGUvnoQJIZ95APLSXS4hW6GB5gy94WKMjEToBbUpw4NokE4TqtkSCm9ACSDWfZGnNQD
         b7wVwNfYnewVRwljr++Ct92/bcHX7eKuqEDn5CnNEZE+7KkxIzNTS8UpVME4hZhTIKZm
         bzuBhN9OxJ4li3ASyX2rXrq/8f2r3EURY1gPKsL1td0mHbqjux9QNh48qlZfTruxE9sG
         bAU1D0LXvoFLKp0wN4wQ5wve7qS/mVmphAbQwyoyPxa3aEv55geRY6CSrrb0aneRY0Tl
         41iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWCvMt3elQQkvkQ/TKdQKZ3J9fekFt08XY7JDczxDLs=;
        b=5vfpgsSzEqpxMK6rhzAuSNrqQgApJICrnHEWgRxjKvY0/mtk2zCsBwKWBdaAEbbpQ/
         a6S9/MEvv6GjbJAJz12rPEa0Z3Ij3qadlOCPeSIZWSwCmO3/vSP4QHAfW8vokZgcXlXm
         szyEsa6xdYzed3vGKhKJvOrpxGD4P8A8zeKdofWAtn0us8N9aBZ78qBm+RYH8JRZZs8H
         p6w0guBgCZHGKCKEyD+4O3kF5NoO+n3O7qteC7m86ZDlJaylVCW5hjT4FZgeHm8fv3lb
         Q0uhoAPoQEuNC4/KhUg+IDtD+/0l/ojccSI/SokhjNnD+awkOIiU9/pA8VpyBvUGxNl9
         AsQg==
X-Gm-Message-State: ACrzQf2n5XP2uc33XGMeiSkRDZzn0+Nae79SExJggmPTEpd31Zib/lUP
        ooWxtz8urvjG67wOUT642vM=
X-Google-Smtp-Source: AMsMyM7D3twQkFaMfCxUy6j9VvCERfNQOjRgLpCvU6hp4Gwe+FiZ4kg6TX2AcUjBQmTjLeWIeDMKGw==
X-Received: by 2002:a17:906:846c:b0:7a5:ccb:c174 with SMTP id hx12-20020a170906846c00b007a50ccbc174mr25997482ejc.583.1666966053263;
        Fri, 28 Oct 2022 07:07:33 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cs8-20020a0564020c4800b00461816beef9sm2736314edb.14.2022.10.28.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:07:32 -0700 (PDT)
Date:   Fri, 28 Oct 2022 16:07:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        treding@nvidia.com, heikki.krogerus@linux.intel.com,
        ajayg@nvidia.com, kishon@ti.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Message-ID: <Y1viIsL+Nxthc97j@orome>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-4-waynec@nvidia.com>
 <f8eeeebc-e635-9c97-b97b-46df38f06002@nvidia.com>
 <Y1vLoT+/dgOgrxjD@orome>
 <7a1c4943-4ae2-cde4-221b-fa972c2baab2@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QbiyuPHHLdatsw0h"
Content-Disposition: inline
In-Reply-To: <7a1c4943-4ae2-cde4-221b-fa972c2baab2@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QbiyuPHHLdatsw0h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 01:42:36PM +0100, Jon Hunter wrote:
>=20
> On 28/10/2022 13:31, Thierry Reding wrote:
> > On Wed, Oct 26, 2022 at 08:13:57AM +0100, Jon Hunter wrote:
> > >=20
> > > On 24/10/2022 08:41, Wayne Chang wrote:
> > > > add device-tree binding documentation for Cypress cypd4226 type-C
> > > > controller's I2C interface. It is a standard i2c slave with GPIO
> > > > input as IRQ interface.
> > > >=20
> > > > Signed-off-by: Wayne Chang <waynec@nvidia.com>
> > > > ---
> > > >    .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++=
++++++
> > > >    1 file changed, 86 insertions(+)
> > > >    create mode 100644 Documentation/devicetree/bindings/usb/cypress=
,cypd4226.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226=
=2Eyaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> > > > new file mode 100644
> > > > index 000000000000..5ac28ab4e7a1
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> > > > @@ -0,0 +1,86 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Cypress cypd4226 UCSI I2C Type-C Controller
> > > > +
> > > > +maintainers:
> > > > +  - Wayne Chang <waynec@nvidia.com>
> > > > +
> > > > +description: |
> > > > +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interfa=
ce type-C
> > > > +  controller.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: cypress,cypd4226
> > > > +
> > > > +  '#address-cells':
> > > > +    const: 1
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 0
> > > > +
> > > > +  reg:
> > > > +    const: 0x08
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  cypress,firmware-build:
> > > > +    enum:
> > > > +      - nv
> > > > +      - gn
> > > > +    description: |
> > > > +      the name of the CCGx firmware built for product series.
> > > > +      should be set one of following:
> > > > +      - "nv" for the RTX product series
> > >=20
> > > Please add 'NVIDIA' so that it is 'for the NVIDIA RTX product series'
> > >=20
> > > > +      - "gn" for the Jetson product series
> > >=20
> > > Same here please add 'NVIDIA' so that it is 'for the NVIDIA Jetson pr=
oduct
> > > series'.
> > >=20
> > > Rob, any concerns about this property in general? Unfortunately, ACPI=
 choose
> > > a 16-bit type for this and used 'nv' for the RTX product. I don't fin=
d 'gn'
> > > for Jetson very descriptive but we need a way to differentiate from R=
TX.
> > >=20
> > > This is needed in the Cypress CCGX driver for the following ...
> > >=20
> > > https://lore.kernel.org/lkml/20220928150840.3804313-1-waynec@nvidia.c=
om/
> > >=20
> > > Ideally, this should have been included in this series but was sent b=
efore.
> > > We can always re-work/update the above patch even though it has been =
queued
> > > up now.
> >=20
> > The driver seems to use this 16-bit value only to compare with a
> > corresponding field in the firmware headers. How exactly we obtain this
> > value is therefore not important. However, since this 16-bit value is
> > embedded in firmware images, we also cannot substitute them with
> > something more sensible.
>=20
> I am actually wondering if this is actually embedded in any images becaus=
e I
> see it populated by the i2c-nvidia-gpu.c driver [0]. So I am wondering if=
 we
> can use PROPERTY_ENTRY_STRING() for this driver instead and have a more
> descriptive name such as 'nvidia,rtx'?

What I mean by "embedded in firmware images" is that the value read from
the property is compared to values read from a firmware blob (either one
read back from the chip or one loaded using request_firmware()). See for
example ccg_check_vendor_version() and ccg_check_fw_version().

So the way that this 16-bit number is used is to define what type of
vendor firmware we support. So this is also used to avoid trying to load
a Tegra firmware on a GPU and vice versa.

So yes, we could potentially still make the i2c-nvidia-gpu.c driver add
a "nvidia,rtx" string to make it more descriptive like DT, but then we'd
still need to somehow resolve that to the "nv" string for the assignment
to uc->fw_build.

Not sure about how that would impact the AMD bits. Another of those CCGX
UCSI devices is registered by the i2c-designware-pcidrv.c driver, but it
doesn't pass a software node. From what I can tell that simply means all
of those checks will work with fw_build =3D=3D 0x00. Primarily I think that
will cause flashing of the firmware not to be supported.

So yeah, having that string be something else (i.e. more descriptive)
and then match on that instead would definitely work. After looking at
this some more, using existing driver-matching may not work after all
because while there's ACPI matching and with this series DT matching,
the various GPU I2C instantiations are purely done in software, so they
have neither and therefore would need a secondary lookup mechanism. We
may be stuck with that ccgx,firmware-build property, but as you said it
should be possible to at least sanitize it.

Thierry

>=20
> Jon
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/i2c/busses/i2c-nvidia-gpu.c#n261
> --=20
> nvpublic

--QbiyuPHHLdatsw0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb4iAACgkQ3SOs138+
s6Fb+xAAmX8j8dRwWMQ2s1lwzVNMk1Jcsa77csUwNBOti7FLrLvg8Mlvy2To7Jm8
TZ9NcUHoe1ox+EMElJpijz0qYsTGLo0tz38HGVdKOQbnASevsZ/1SoFqZebuGzb5
IqRi35yCKQa9bRdVP1i874yU4eN8HKSFbcU6p4gFIkJ3pCJtvBDbh0fF8E5z94xI
gmnDehmn7SSBDzZiyTOymRSEktbFxHJo/qutCB38Ev2C2winovtLIqMWLgnKRG86
M8dyVJE5+FePHdKH3YkcFNDQn7nvA/vEdp+9xn2uTax+Z7rLNccFW1k3eM3aYnoY
QMhnZdaYI/rf8GUpmih9jeeoNfyG8sidF2oXkRCeA94RWmyoWaoEeh5mQNOSJEq8
OooqWxiUKPlJMQZ5mksTiFTJcUYg3fRCw1gLzH9h0ojIWBuIGw8CpizTCPLSzBiS
zmNYm/vCPn6YRawDw3ngtMBGI7oK2+0lqdQNAGhAlBno7TOFKHqiNCdg32gykHYi
jmBlK3gGuCvHCJzoZl9YGesXLdcHw1xeqpl70suWxmRwcXsPfFMnuWT6lI+zvSqi
j2JpsXltKEdhbmNsy6v/HzqL5KMZAaG36oxuphUXf4NIaSvtDDgx1/VQbABjA3Lw
z5g+HW/ArQqDwfBnasDZFURWw1czK8LcD/rse4hQt+zWeZES9Ow=
=S/4p
-----END PGP SIGNATURE-----

--QbiyuPHHLdatsw0h--
