Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031B65F7A64
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 17:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiJGPRe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 11:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiJGPRd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 11:17:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A22E9C2DB;
        Fri,  7 Oct 2022 08:17:32 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sc25so5890478ejc.12;
        Fri, 07 Oct 2022 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V26sKgll4yhf5OInasFDPraHLvHOGfKc1/jMD2mrCdY=;
        b=HA5zI4mup8zTLt3WQStDfg7k3NeT7Yc8cvgSPBai5Izl7qJIV0YtjZxNDtUcdK2PAh
         fOP1TkhdDQgyhptFHhccV/Dj5OC3DaGtMAVeBZ3/LeUmbdvKQqKICceLkRmRnyJGMsMK
         zsEMARo2RA5jP9uOOWHVzQTJiVJGtRHbyHlayaSBxfl+Dba72aWbgkHZ9fI2fmEm5nD1
         qrxdGuBrMyFnbZZJzOgwZoZprGpvexF88Eb1I+js3/2CaDzzfH25U06seM1afjt+sEm/
         Cpj/f/a6XkEzyW0XjAaA3zVPQ9TIjF22wvzFhtDsTGxVoFqGkHnwN3GDgN2gZZ0OKf9r
         BUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V26sKgll4yhf5OInasFDPraHLvHOGfKc1/jMD2mrCdY=;
        b=ebLbBkA8MRFCak8Y9stMw2DRwPBYtru+4msYJKsDR1Diqqd2ul3Fdr+8ZmaGhfQqZ3
         bYE/0GFMr27unxjqOx7Dcwd89MMP6Y1L35ODQhWtKA3o90PrJgzspGnEG2QhtVh4SklN
         WcTi148CJUBnOYqGBNcVfq0yKu/pqtGYnPMPSP5MY/RXD6fR5jbU/Cc+wkDUjPV74HX/
         M2y2xwm+d8E7/ccETzL2tj6Mm2K8mP8Xi1FJ8ienoHQf5D7PVYnmi9CtTukUiGd0DLd4
         msJqj9K437R+HKB24k8bjBQjSog0jGOlRQFst10/GLnvedL7+sLGq/Vr86DK3ymO5V+c
         38TA==
X-Gm-Message-State: ACrzQf2iyJ1PxqcR4ON3hC1s7932A0XhMqMFkju17EMa2KYEW5zP3vwv
        m6kr0899tqxQy9GUHb4KQ50=
X-Google-Smtp-Source: AMsMyM594vSZP896w39KXYsrXRxzj4eqfemAMF8fnZ4o3nlz15LhKzCy6tF0fW1JqIS5m825zDidCg==
X-Received: by 2002:a17:907:724a:b0:782:405f:8115 with SMTP id ds10-20020a170907724a00b00782405f8115mr4443202ejc.147.1665155850917;
        Fri, 07 Oct 2022 08:17:30 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d1-20020a170906304100b00788c622fa2csm1366255ejd.135.2022.10.07.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:17:29 -0700 (PDT)
Date:   Fri, 7 Oct 2022 17:17:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Vinod Koul <vkoul@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: tegra: Add GPCDMA support for Tegra I2C
Message-ID: <Y0BDB2lz4PHUwE8L@orome>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-3-akhilrajeev@nvidia.com>
 <Y0AnpYeECoyQchmY@orome>
 <Y0A44EIF74bri/uu@orome>
 <d95eb458-151b-0a31-0aa6-4073ea962d2c@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wQZPKONB5tShC1t9"
Content-Disposition: inline
In-Reply-To: <d95eb458-151b-0a31-0aa6-4073ea962d2c@arm.com>
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


--wQZPKONB5tShC1t9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 03:53:21PM +0100, Robin Murphy wrote:
> On 2022-10-07 15:34, Thierry Reding wrote:
> > On Fri, Oct 07, 2022 at 03:20:37PM +0200, Thierry Reding wrote:
> > > On Tue, Sep 06, 2022 at 08:17:15PM +0530, Akhil R wrote:
> > > > Add dma properties to support GPCDMA for I2C in Tegra 186 and later
> > > > chips
> > > >=20
> > > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > > ---
> > > >   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 +++++++++++++++++++=
+++++
> > > >   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 +++++++++++++++++++=
+++++
> > > >   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 +++++++++++++++++++=
+++++
> > > >   3 files changed, 96 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra186.dtsi
> > > > index 59a10fb184f8..3580fbf99091 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > @@ -672,6 +672,10 @@
> > > >   		clock-names =3D "div-clk";
> > > >   		resets =3D <&bpmp TEGRA186_RESET_I2C1>;
> > > >   		reset-names =3D "i2c";
> > > > +		iommus =3D <&smmu TEGRA186_SID_GPCDMA_0>;
> > > > +		dma-coherent;
> > >=20
> > > I wonder: why do we need the iommus and dma-coherent properties here?
> > > The I2C controllers are not directly accessing memory, instead it's t=
he
> > > GPCDMA via the dmas/dma-names properties. The GPCDMA already has these
> > > properties set, so they seem to be useless here.
> >=20
> > Looking at this some more, the reason why we need these is so that the
> > struct device backing these I2C controllers is attached to an IOMMU and
> > the DMA ops are set up correspondingly. Without these, the DMA memory
> > allocated by the I2C controllers will not be mapped through the IOMMU
> > and cause faults because the GPCDMA is the one that needs to access
> > those.
> >=20
> > I do recall that we have a similar case for audio where the "sound card"
> > needs to have an iommus property to make sure it allocates memory
> > through the same IOMMU domain as the ADMA, which is the device that ends
> > up doing the actual memory accesses.
> >=20
> > Rob, Robin, Will, do you know of a good way other than the DT workaround
> > here to address this? I think ideally we would want to obtain the "DMA
> > parent" of these devices so that we allocate memory for that parent
> > instead of the child. We do have some existing infrastructure for this
> > type of relationship with the __of_get_dma_parent() function as well as
> > the interconnects property, but I wonder if that's really the right way
> > to represent this.
> >=20
> > Adding "interconnects" properties would also duplicate the "dmas"
> > properties we already use to obtain the TX and RX DMA channels. One
> > simple way to more accurately do this would be to reach into the DMA
> > engine internals (dma_chan->device->dev) and pass that to dma_alloc_*()
> > to make sure we allocate for the correct device. For audio that could be
> > a bit complicated because most of that code is shared across multiple
> > vendors. I couldn't find any examples where a driver would reach into
> > DMA channels to allocate for the parent, so I'm wondering what other
> > people do to solve this issue. Or if anyone else even has the same
> > issue.
>=20
> As far as I'm aware that's the correct approach, i.e. if a driver is using
> an external dmaengine then it's responsible for making DMA mappings for t=
he
> correct DMA channel device. We ended up being a bit asymmetrical in that =
the
> dmaengine driver itself has to take care of its own mapping for the
> non-memory end of a transfer when an IOMMU is involved - that's what
> dma_map_resource() was created for, see pl330 and rcar-dmac for examples.
>=20
> The only driver I have first-hand experience with in this context is
> amba-pl011, using pl330 through an SMMU on the Arm Juno board, but that
> definitely works fine without DT hacks.

Oh yeah, I see. That's exactly what I had in mind. And now that I'm
using the right regex I can also find more occurrences of this. Thanks
for those pointers. Looks like that's the right approach then. I'll try
to make corresponding changes and see if there's any fallout.

Thanks,
Thierry

>=20
> Robin.
>=20
> > Adding Lars-Peter for the sound/dmaengine helpers and Vinod for general
> > dmaengine. Perhaps they have some thoughts on or experience with this.
> >=20
> > Thierry

--wQZPKONB5tShC1t9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAQwUACgkQ3SOs138+
s6GNYw//Z/EGBx4Jcbvb8wh30msO6xog/7vX4qgTtWGmVVAVWNHscABOJwQ2KoJP
+pLZPg9wqKy9J7r7Qt0z0YwIj1cgKbnfSb9itLc32LeST0bOrUuvMuV5O3mT+b8F
kvs1XpNUY7lOqC4rMjVB+JyzfzL2EaEzDZN7lTwIVy5JbeZqipmU3jdconExQWdP
n1s8EHZXUiRlmEkIpECaCka6iXk6olz9dm8qocjjafvLSM67lhUlQozCOmC4Qnby
sA3jOGN48sZm+ubTyoD69Ew+fJgZRGGXBov4T3poApUG2nB0WsII7QnhoDlRjeGx
ljsRZbI4zZYysA8kaJPYai+Y4G5VffDPDdrJgHh8caUYWa8EasM2KKFqAM4Aifk0
cgbzZhBi/ezRRNjuu4AISHXnwIkaKZwtWk5v+Y8fL3w+dGx9H+xB67i4ltrEwbqR
eaJ45GyEWZ6fHMghZGK89A93uwCtR3yhOF3LRXYmtQQfy8h/F3iYLZM4Lc9x5wqE
vCvRLEy+5OkNUAmvZKO8VOF9r1NqyXfFYGbSkZ4j+uaSzy+F4s1CGEGi+qa8h5ua
wDPsQlIBqJ7Ccum5n4MPTF0TJw92TW80cCM2DaVw7h8UcPsPq1/qYSzU4tAACyVl
5gwtg99X2JHIYrnq1J0fL8l2AxB5qcjm6qjYaul1KWgyYKMsvdE=
=7MPa
-----END PGP SIGNATURE-----

--wQZPKONB5tShC1t9--
