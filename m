Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC7227573C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 13:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgIWLif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 07:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgIWLif (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 07:38:35 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDE1C0613CE;
        Wed, 23 Sep 2020 04:38:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so6766654wmi.0;
        Wed, 23 Sep 2020 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W4t+72Rd9BRbOxDCzWkNzy7ayx5sj6wel8M7/f96GfE=;
        b=gMwZsd4FyKgaQjgL0cQVNKc6IVCeaCTkg1MFtFL1R9P/JFC8qBT8q82SbMQEPNJtmx
         SrATKCtochuXDfyps32jh5mtXSKhZUVbPelL+mVFLX13vKn/5AuX6vRHq9t+iXWhyE8p
         N0wqLmuS1cgcxp8QGW6/UbdEqnawplKOIFdSvnn1ONRgp8Mdg1kplyo+Z+aHZyjFOMzj
         blKEqaSJyTlbLYVNYcawptR5hE3dJwWpUvtSchNEzjpr6UAMkggbARrawCKziyNnkWdA
         ASKohbeURgNYB8T9LWhU8Cn0RM3kREzshNGq6QtvfKE/fYU5y1iMyr523cfOsYodda71
         apeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W4t+72Rd9BRbOxDCzWkNzy7ayx5sj6wel8M7/f96GfE=;
        b=rbREjusnDY860a7fHLjnKmFkvMfS2MNcBQEEiUnrIwXfO+gC336Vlno3dJWdhiT02f
         soY4hREbMc+wvwejuWHL1jMqRRj5vRSqrZdNukva3FVzZXY3WQ+GTs9uzVafzgn7VebY
         /g+RcZe5ZGoO2/Sna9C/HZdmVJf2+s50oDDhDN5sC5VadYmSQndnBN4FtkYwPDvk6UPm
         NvYwCVRofot0dWnCA7c3wUWZGoxUp0/xbQOoqjVNcjF0iocnPJiuXlMes7ZyuMV5USlM
         ndSj0+a3xXKZkojrfSMSQ214rdLGSg4axkeOyBzAqY6C0FMD2lpbcxNRkyjrjN8XLypV
         wFhg==
X-Gm-Message-State: AOAM531gnpqMKT1DWJKgjFGtkEpAYlHZ9NV3xWtI+bMi6nb03nbAo4Uf
        364DztgZ60CSUqgLuuLHdYo=
X-Google-Smtp-Source: ABdhPJyP7M6ejF+lzdGEE6Fr5/fL3p4IQ5iKzHXqk5PjV9rwA2+Jo5TuDsnlbCuZSMpdJ2cGhWRhFw==
X-Received: by 2002:a05:600c:2312:: with SMTP id 18mr5920078wmo.141.1600861113644;
        Wed, 23 Sep 2020 04:38:33 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u8sm7803632wmj.45.2020.09.23.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 04:38:32 -0700 (PDT)
Date:   Wed, 23 Sep 2020 13:38:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 0/5] Add support for custom names for AT24 EEPROMs
Message-ID: <20200923113830.GA1846003@ulmo>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
 <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 11:15:03AM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> > For platforms that have multiple boards and hence have multiple EEPROMs
> > for identifying the different boards, it is useful to label the EEPROMs
> > in device-tree so that they can be easily identified. For example, MAC
> > address information is stored in the EEPROM on the processor module for
> > some Jetson platforms which is not only required by the kernel but the
> > bootloader as well. So having a simple way to identify the EEPROM is
> > needed.
> >
> > Changes since V1:
> > - By default initialise the nvmem_config.id as NVMEM_DEVID_AUTO and not
> >   NVMEM_DEVID_NONE
> > - Dropped the 'maxItems' from the dt-binding doc.
> >
> > Jon Hunter (5):
> >   misc: eeprom: at24: Initialise AT24 NVMEM ID field
> >   dt-bindings: eeprom: at24: Add label property for AT24
> >   misc: eeprom: at24: Support custom device names for AT24 EEPROMs
> >   arm64: tegra: Add label properties for EEPROMs
> >   arm64: tegra: Populate EEPROMs for Jetson Xavier NX
> >
> >  .../devicetree/bindings/eeprom/at24.yaml      |  3 +++
> >  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  1 +
> >  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  1 +
> >  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  1 +
> >  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  1 +
> >  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 14 ++++++++++++
> >  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 16 ++++++++++++++
> >  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  1 +
> >  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  1 +
> >  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 ++
> >  drivers/misc/eeprom/at24.c                    | 22 ++++++++++++++++++-
> >  11 files changed, 62 insertions(+), 1 deletion(-)
> >
> > --
> > 2.25.1
> >
>=20
> Just FYI: I'm fine with the at24 part. I can take them through my tree
> for v5.10. Who is taking the DTS patches for tegra? Thierry? I can
> provide you with an immutable branch if that's fine. I can't just ack
> the at24 patches because they conflict with what I already have in my
> tree for v5.10.

I don't think I'll need an immutable branch since the device tree
changes are not dependent on anything in the bindings, except maybe for
validation, or the driver.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rM7MACgkQ3SOs138+
s6FSxQ//Y3cu1pKoORNASb4SjuhJ1XGyVeT1xKWlhPxPQ1aAR3KgU/LGMQ3WbU6M
FJ63l/kiFyUdMspp0VTssirFu9QxgSLPtOtz8W+s9bJQgEq2ePTGcd5lbS+Vft9a
mGYfpDPCMo3rxvLKFZ1rXeqhMQKqU+Sp7rxYDAFlYXzTHyQREmnnR3HZNsEIMfqy
xOXa0coi2G15CWUtdsBQD5DZn4r8fgENfkXSTXrpv/SqAFz5XBt6VPGMr+s/486f
Bj/N0Exbjf07P5vTsbN+KmVH7eMbJg+LCRjZ+SxtGgn3UwRU7Fg/oO0UpinzISBK
7WFyzGw2bKKbIFXRL4nEYyrJO4IIXje6VB8pg+Qtx6qdwgJk1jOz0QGjrhqzlyNn
WaLSqxohWtTsmQdrTN2bbzSmKfKUtp4DcYdn1WSvGAsgc3oEbcSpXR6tSHhK1c35
xshvEZopkDrNxUdg1fwetfyUbyyNNNGjUatcXMKZsMTJ+F4xPf1tcB1xneAJmmj8
l0Y0cUh3SCO3IZvN4xrkxEK8EwiYES2LnrIdZjIj/DSkwa9W5FylrnOA6GK+niGn
9PtaoeJfe4M2jmFrZDlI7Kh7A8AuuTH+WjUVBoxQJxY6EdAJWlIcvh2u/Ee4stcX
NaKddzWQd6nEGDIa11KIZ6RZa/bSU+oM8D5WKlVkSgLVSTSwG0I=
=UAvS
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
