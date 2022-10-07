Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C79B5F79B9
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 16:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJGOeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiJGOeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 10:34:14 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9861204FB;
        Fri,  7 Oct 2022 07:34:13 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bj12so11654289ejb.13;
        Fri, 07 Oct 2022 07:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OfRzfvGQplGU7KzVyUA0KYEUZfrG+sQjnBVSkZzjLI=;
        b=WPO8WC81v98yYaImvnCXaDzpqJXYBFaPFNtzg4hPTiUqSsuoTBaNHzc6dhwSaBKjSv
         Yo5UCFNH4MmsUgWXVxj6rORS6ofTaOVfWQqDbnM4aFyo92WJ3YlM7VUgdBIWS6kNPq99
         eWQgL4Oy2VBo0eTpj6+ipZCBZwSerLP9i8S3jYC1oxLC397lV56iC6YIqjt9idZCbCGX
         e/f/veB89SN76wwXPZf0uk8hi0arjHQ4/6P8JCqdKnWX/4c4kMLY4TAiodXXyF1pneMA
         GoOMTnfladzgcBC/L+A3aDpu97knUL9NfaTAc0KuVBxkzE0l4CjU4cGXkS8zelcJBjWT
         XSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OfRzfvGQplGU7KzVyUA0KYEUZfrG+sQjnBVSkZzjLI=;
        b=nZum044X6cz7naZaOUzdgOsBbFAm3R/yZYMHxpBihajdCR5eoOyudzaVXICYtCu/Ly
         NmfR+j8ln1T2RB3iWBErAlQf6QITZDneMp31XegM866bDAx1naMZRn1nga37I2k0rIWf
         jYWfryUWR8zt/X6LnVlphoG6qWKGsZi6xUtKwUUPJjHlwRwzQ2MgjoRPfG8W2Xx1FU5p
         GhfhbH5a/bQBIS1XvcpUCggvbpWSPyYfdMOZV9YjBvnLAhmXECw13m1PJIzhbCfCUPsW
         CVUNaLAUDSzqAJzMQzCXnXbcveISu1JIxYEI2RR7RxKTjtJtR4uYD6Md2d80SexIKg8s
         NQbA==
X-Gm-Message-State: ACrzQf3NWDgzwIpAG6rJqlzOPYKFXUZyJkF6dxSfKviBhGRjnz2NkKkw
        UwFxuuxmPSxxxSEBbVhjYMo=
X-Google-Smtp-Source: AMsMyM7KEYJglyk6yfk7yTvXWNdvnkCSkA1XJTsxRIHZdr945NYOquOrT0n1qex8/0K28upnUNvP/w==
X-Received: by 2002:a17:906:8476:b0:78d:3e87:cc1a with SMTP id hx22-20020a170906847600b0078d3e87cc1amr4121952ejc.592.1665153252067;
        Fri, 07 Oct 2022 07:34:12 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090632c900b00773f3ccd989sm1310777ejk.68.2022.10.07.07.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:34:10 -0700 (PDT)
Date:   Fri, 7 Oct 2022 16:34:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: tegra: Add GPCDMA support for Tegra I2C
Message-ID: <Y0A44EIF74bri/uu@orome>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-3-akhilrajeev@nvidia.com>
 <Y0AnpYeECoyQchmY@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KAH+mYH1JEje4nKf"
Content-Disposition: inline
In-Reply-To: <Y0AnpYeECoyQchmY@orome>
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


--KAH+mYH1JEje4nKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 03:20:37PM +0200, Thierry Reding wrote:
> On Tue, Sep 06, 2022 at 08:17:15PM +0530, Akhil R wrote:
> > Add dma properties to support GPCDMA for I2C in Tegra 186 and later
> > chips
> >=20
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
> >  3 files changed, 96 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra186.dtsi
> > index 59a10fb184f8..3580fbf99091 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > @@ -672,6 +672,10 @@
> >  		clock-names =3D "div-clk";
> >  		resets =3D <&bpmp TEGRA186_RESET_I2C1>;
> >  		reset-names =3D "i2c";
> > +		iommus =3D <&smmu TEGRA186_SID_GPCDMA_0>;
> > +		dma-coherent;
>=20
> I wonder: why do we need the iommus and dma-coherent properties here?
> The I2C controllers are not directly accessing memory, instead it's the
> GPCDMA via the dmas/dma-names properties. The GPCDMA already has these
> properties set, so they seem to be useless here.

Looking at this some more, the reason why we need these is so that the
struct device backing these I2C controllers is attached to an IOMMU and
the DMA ops are set up correspondingly. Without these, the DMA memory
allocated by the I2C controllers will not be mapped through the IOMMU
and cause faults because the GPCDMA is the one that needs to access
those.

I do recall that we have a similar case for audio where the "sound card"
needs to have an iommus property to make sure it allocates memory
through the same IOMMU domain as the ADMA, which is the device that ends
up doing the actual memory accesses.

Rob, Robin, Will, do you know of a good way other than the DT workaround
here to address this? I think ideally we would want to obtain the "DMA
parent" of these devices so that we allocate memory for that parent
instead of the child. We do have some existing infrastructure for this
type of relationship with the __of_get_dma_parent() function as well as
the interconnects property, but I wonder if that's really the right way
to represent this.

Adding "interconnects" properties would also duplicate the "dmas"
properties we already use to obtain the TX and RX DMA channels. One
simple way to more accurately do this would be to reach into the DMA
engine internals (dma_chan->device->dev) and pass that to dma_alloc_*()
to make sure we allocate for the correct device. For audio that could be
a bit complicated because most of that code is shared across multiple
vendors. I couldn't find any examples where a driver would reach into
DMA channels to allocate for the parent, so I'm wondering what other
people do to solve this issue. Or if anyone else even has the same
issue.

Adding Lars-Peter for the sound/dmaengine helpers and Vinod for general
dmaengine. Perhaps they have some thoughts on or experience with this.

Thierry

--KAH+mYH1JEje4nKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAON4ACgkQ3SOs138+
s6EbtQ//VEqhYY/FuOeuv6skQUWw/j/LKEmiCzYtcWKIV32CDZHEsmCFL9yt+TPq
lcfz4LgVvgt/eDY6MVSKb2a3hd7aHVnYi3eT6K/djwZ03o63HUYWthV724HjEdGE
4pj7R4jjFS9naGILqjMLgCqM0DJUxPtukTFIbdT25GDHdZ6ZUJB2s10LNe4hoh+f
2M5MZD3TA9Ky2vXt0zikIjiMAX/QT08cHR+JHrqDRLG0RLfzff7v8x1cKmnbq/l2
TocjHqU6v4O+N/8D4fdhjLw2oFWBKMy6DTZmnwPVceNTtIQi0QPY+RUmvPiC0SG9
VuwmYnW/J8Q/V8hGhHrqZqCgZDT87Z8u32QEUv8I0cdGNiZPgV+WGrwBnNuKHE0o
Lw3HvG6X7uDA5MVxDMx9TxtOMPG0th1h+SABOgbZPBwFWyTg8Yvpeei3nEfAbq//
iqZq2nb8sa5bKBbjSbL0sH0qJQziT8xcQDu/7tHMTC7S92sE7uhBAFDQV7KqzPP+
VQ2nQefamiu6H9EdlYMPrluDXd2nY4N03Nq5QW+VjS1oO4GeWf8pJKNnO3ripFBj
OZU4qzh6JKNFocAhlRkYT8dEdv3A9UWnsGWAyNwis6CmEJaZx4TYAbzF2mAhoMPu
M5zYEASL+/K/PPDjKAuVlMS8PZqf8zH9ivJ7GaTKYt8dPBWgy40=
=d/bA
-----END PGP SIGNATURE-----

--KAH+mYH1JEje4nKf--
