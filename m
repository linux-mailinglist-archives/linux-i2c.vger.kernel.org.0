Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF255F78CE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 15:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiJGNUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 09:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiJGNUo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 09:20:44 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13EF87EFDA;
        Fri,  7 Oct 2022 06:20:42 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bj12so11193722ejb.13;
        Fri, 07 Oct 2022 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN1ILS/XaAxkmv7Qr0HgSkKZ/T+I7TUvBhKMzgNmA/Q=;
        b=HQToq95gCwSLDQbIkWdRsIH8yaWacVN8QRzXc/0CuCt0rQGSXtL1O8rArUko2jFJNG
         Xj/0LcjRwJn7Fx6N++EtObGFD9TmLaTduJGPa0JW6QcWarm34wi4CakC372ueT8V4CBX
         1Dc7AYKMJlZfLezzvZ07zRIhpbJHj+A+vLhxxa3/ew9Co2HcRwxgflKaSNP1HU9FBKXa
         4d2VQgzo9eBb/NcnWKq58RQL7S4THHiZpVz5zQ4RfadaDWHyl7PDlfetJR9+3mnBU11S
         qMjbJ+WGUiqldhgnWucTz51zbv2+eMVj0V2crWXdPNUoNDxtI7Sw3vl6MRH85yQv+rxz
         SGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN1ILS/XaAxkmv7Qr0HgSkKZ/T+I7TUvBhKMzgNmA/Q=;
        b=CfqRcAncz4CQtNnmVNsWxypSgGH+a50/mf6o5t7pLLpM91wSAht0U+m6fGs8T7069M
         U4HkIx6HIxDvIMJIoatB7IQuqLQ8RJS46x/c1znuq4LpabZcnM1SPAs/Q32uUdE598Tb
         eo4/Ut8aGmXzBnJVrqM3iud/gr6Hue5fu35zgjlNBbDWa43AOMFUsPLJQB3rkYzNQcxf
         u5t6IyH4ZE0hCuBssbkvXph7mHbyXqU37kM7aJTen0a1byffkso9F75GRifotZXpBaTK
         lqStKEutG3mbdvH1b7IYznTp9AYZLdqZ7r2sQEzQCylverbrk+EFqlFmC4tGNoESKoUQ
         W0aQ==
X-Gm-Message-State: ACrzQf21CqOtK5BZvtWsi7yTLVo1vNf6mnE8cBv9xReTU+ObXwCoIPZk
        60xt9Uj/xnZp3KNxUWIy+Ds=
X-Google-Smtp-Source: AMsMyM4Ub5PwdR3ymkjLuRW2b3AXvLb/WJb1xCbD7ZN8+5Ch8dgi/bOegSQ1xQVmt1i0nEDsb018WQ==
X-Received: by 2002:a17:907:7203:b0:783:6e65:c0c3 with SMTP id dr3-20020a170907720300b007836e65c0c3mr4085765ejc.227.1665148840549;
        Fri, 07 Oct 2022 06:20:40 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709060cca00b007402796f065sm1207664ejh.132.2022.10.07.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:20:39 -0700 (PDT)
Date:   Fri, 7 Oct 2022 15:20:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, devicetree@vger.kernel.org,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: tegra: Add GPCDMA support for Tegra I2C
Message-ID: <Y0AnpYeECoyQchmY@orome>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-3-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2nh9Rh/eMLM33gB/"
Content-Disposition: inline
In-Reply-To: <20220906144716.16274-3-akhilrajeev@nvidia.com>
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


--2nh9Rh/eMLM33gB/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 08:17:15PM +0530, Akhil R wrote:
> Add dma properties to support GPCDMA for I2C in Tegra 186 and later
> chips
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
>  3 files changed, 96 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra186.dtsi
> index 59a10fb184f8..3580fbf99091 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -672,6 +672,10 @@
>  		clock-names =3D "div-clk";
>  		resets =3D <&bpmp TEGRA186_RESET_I2C1>;
>  		reset-names =3D "i2c";
> +		iommus =3D <&smmu TEGRA186_SID_GPCDMA_0>;
> +		dma-coherent;

I wonder: why do we need the iommus and dma-coherent properties here?
The I2C controllers are not directly accessing memory, instead it's the
GPCDMA via the dmas/dma-names properties. The GPCDMA already has these
properties set, so they seem to be useless here.

I'm asking because they cause a lot of warnings from the DT validators,
so we either need to remove them (if they are not necessary) or add the
DT binding documentation for them.

Thierry

--2nh9Rh/eMLM33gB/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAJ6MACgkQ3SOs138+
s6FrCBAAo6+7wV1IijPKmArINgF4BAJvTVLS3ZBnbDY6Wujxrg2cxqmwk0ey9+sU
RhmaOy6rQi6l3AVfURxyHbwybwRpRL4fAuaxE8pxND8YqIYxGa8kBu536DuhfxxC
WARBhPMSrxTqnTq8bw0BzD64PV99kpR79eiwblns44XjsC3HMObcFzCG8/zIVmyb
QL0cNVHK+hI3SJDLaLfdY+8X8gaVoJi2jF8xJ1+hcBHlZDTLbCIGiY2hBzX8Z4EL
8uteO/Q9QP7qk5pJ0K5hE/LrB4jHEbxDLwnoumeQLHzxh/LNkn138mIis2KrEBW+
aN7IZyglYu2gOpi4MPWGPTs9LebQpnB+G6aRI5XqnraNuOOkkaK7FldrU8Fa/xzy
aABT2fxDA6JiuBpUfFXZVlvj7btlB12CKAwXd8jux8sqn1YpuZVV4aTQSTAKZuBT
HKbAJrCeTKq8ek/ykjk6kk48RB4PV/JkKwD3XxzbZNhRj+SngT2Ami/r/DvGtYKZ
T6J6QG9nHAYKpvk+G3uNHGrlJZmsKjvuoMHTnCkfEJPqPCw/ScZgAsk7Bj0Ib/0t
i+8VEJVVM+PHtM4JTWNdc4UWRdA8bBMa4+quSbnZNv16pHq8BLV+dAEtUL3ZTbr0
851rF9dc4pfIIl6XodDNem1N4bHNdPDvGmk6/EbPsIriFhDKflg=
=ENWq
-----END PGP SIGNATURE-----

--2nh9Rh/eMLM33gB/--
