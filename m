Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B637D3A97
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjJWPVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjJWPVW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:21:22 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43409FF
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=/lW1
        5QY2mLQk0UYe8nd2wwn2yRz01ab2AXLiBHW25eo=; b=YBzrIDH3SpdEfMGzksmZ
        6fVnRQGlvLL3LHxZfzY6g6j3PEEgfyzsUKI4VH6pmUfOu2DXXsPvOULo2F7z1tPE
        JmYwhrpm7YMZSWUfcD7ypDYM4Afu1ZdltW/QgTYd329sLdKS9K8zcnn2gileM9YW
        GydqbY3XndfRHOt/v5g7ij96eFuPnGyM/E9gBCUgPa+o5LLkLtFI/6EE7aP+Uq/k
        H7B+NEcshhH63+UAwBL5o3Dy2yac8f8egrpNV1U+d+OX9vSTKC9FFH4dvkKmkCwF
        L7WuhgmS6snqThbTgjpyluLwmeFmwFlGLc70XIj7L1dQaD7wzjNb8HyCrfUFJ6LW
        BQ==
Received: (qmail 1984619 invoked from network); 23 Oct 2023 17:21:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2023 17:21:18 +0200
X-UD-Smtp-Session: l3s3148p1@Wy4NxmMIDpcujnvq
Date:   Mon, 23 Oct 2023 17:21:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-demux-pinctrl: Convert to
 json-schema
Message-ID: <ZTaPbYCS3I8tFAXy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k0tRg1tZhNnQeqiO"
Content-Disposition: inline
In-Reply-To: <28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k0tRg1tZhNnQeqiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Oct 23, 2023 at 03:53:00PM +0200, Geert Uytterhoeven wrote:
> Convert the pinctrl-based I2C bus demultiplexer Device Tree binding
> documentation to json-schema.
>=20
> Update the example to match reality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>=20

One minor nit:

> +            hdmi@39 {
> +                    compatible =3D "adi,adv7511w";
> +                    reg =3D <0x39>;
> +                    interrupt-parent =3D <&gpio1>;
> +                    interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +                    clocks =3D <&cec_clock>;
> +                    clock-names =3D "cec";
> +
> +                    avdd-supply =3D <&fixedregulator1v8>;
> +                    dvdd-supply =3D <&fixedregulator1v8>;
> +                    pvdd-supply =3D <&fixedregulator1v8>;
> +                    dvdd-3v-supply =3D <&fixedregulator3v3>;
> +                    bgvdd-supply =3D <&fixedregulator1v8>;
> +
> +                    adi,input-depth =3D <8>;
> +                    adi,input-colorspace =3D "rgb";
> +                    adi,input-clock =3D "1x";
> +
> +                    ports {
> +                            #address-cells =3D <1>;
> +                            #size-cells =3D <0>;
> +
> +                            port@0 {
> +                                    reg =3D <0>;
> +                                    adv7511_in: endpoint {
> +                                            remote-endpoint =3D <&lvds0_=
out>;
> +                                    };
> +                            };
> +
> +                            port@1 {
> +                                    reg =3D <1>;
> +                                    adv7511_out: endpoint {
> +                                            remote-endpoint =3D <&hdmi_c=
on_out>;
> +                                    };
> +                            };
> +                    };
> +            };

Let's drop this huge hunk. It doesn't add value for demuxer.

Thanks for doing this!

   Wolfram


--k0tRg1tZhNnQeqiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2j20ACgkQFA3kzBSg
KbbJuQ//VaIqoynZOG9ANtx8tU1NKofPUJ0JH0oFa/6+boXSdGYipWAoXZ2WwV5z
4qhOU7XLQiZ7edRjIjMzVuj/mrVktwFKYwjK9gQcJNQe3vcXqQCoc7cprbXxTgfM
kDKVOnHWuVTVUtnZbTtKTzKLGGS7Hc/WsnoE11g8NFk39pFBYZLiOEbEgOQOsnts
ih/DqmdCVk9Rp9fkDysUU+OL5mNGOB98AmsDOlnotgA6gUOwmSA9DycCgiI/Uvh7
Jzj0jV9J1xp6OLqaeeNrH0LddLTanDSy/+Cq9dFM96jSUNfhb569UhfEuPzFxN3A
bYbYfSIFxTEYQ/NzFpmZmjqBPOoRCer+daBHgZ7h+Qh7I944w5f91vPuVpSrWnbk
jwiap0DwFY03Kpk4hIXTVZVoHKdyWL+BAe6agssR5cPorLbt87xowTy1uUXjMrdT
by1/VeKnfo2m6WSD82xCEg8GHb82ugdVDtSgrtalobn2gleMQCFYf9WPi5x6jlzE
RmFM4CmqTHHCMhC26a3JENs48hoUWNQIuPZzFKOD+qBkmTmHsrcne/8+YcpvO2/P
kr59olxpv4El4MON115gA/wYJ6vBTYwbK4U/UXMYoNqshQDXf0g63c3G08Nj4Nnv
1sZThMZ3UXFh4DgjiOWx3CHd03EUU8Ciw4ihZ0RfLgiV7UKo8mU=
=TCCS
-----END PGP SIGNATURE-----

--k0tRg1tZhNnQeqiO--
