Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F857E4A0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 18:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiGVQop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 12:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiGVQoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 12:44:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938A6904D2;
        Fri, 22 Jul 2022 09:44:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 42156B8296E;
        Fri, 22 Jul 2022 16:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F724C341CA;
        Fri, 22 Jul 2022 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658508280;
        bh=7Wgdp8pT/DMcl6oBRwYh1bDRQ4T7DI5L38U2DOeEG6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N3tehWuWuUyBbw6+7U0VxYzRUgzOkQcerGAN0k7SAs5FwQ51wVSaEz0VrJRFOansk
         gQDX3WxVYvvVeJBSWTdSAAqBfHQtmpudh4ns9lElK56oZKY0GT0J0FC+e8diEdBdEO
         ulOnZZsd3XLhEK2tG/SIybiW00FFFkwaRaPHrxPKLXNp9PoxblCEJAoLAgcRcVtHf7
         pCO16wWTMoBK/mhiGYu10BdNQI0n+ddGVolEbzIOcMDqBWHkws5MCxIQtMW6nGWDjy
         R3hraXbql+jzLapLrvJ23oakZV1D6dsZW341XL/c3+90B7UuFcZuXcXLM2kbw6eEpt
         1xJ7eVBIgwitA==
Date:   Fri, 22 Jul 2022 18:44:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Message-ID: <YtrT7gw6sKBN2AcW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20220708100350.12523-1-phil.edworthy@renesas.com>
 <20220708100350.12523-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JCzjOonC1e0D44gN"
Content-Disposition: inline
In-Reply-To: <20220708100350.12523-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JCzjOonC1e0D44gN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:03:49AM +0100, Phil Edworthy wrote:
> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--JCzjOonC1e0D44gN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLa0+oACgkQFA3kzBSg
KbZaFA/+LUwJ3sbu21PAmpJfMuHnzggenp3/TCkazZyTPicZ7i+Ks+6y7dHCeNeT
0rYZUWluQdEmyIFphgROrhKRoCHGZUX+q4AoqtXwoV/eNYnOwR7/j8qbmUJAbG0m
OYdRe3QNlrmSVGiGUsjVdOVJvhL2eg2DuhilletWSrTbMftmbzLi/E8Pl/fw+kRm
TFanxXNmvUIACJCzF8toRpqEXTnrPQ47x7E1rJwesF/KH6cNVyemHMfKkeWCrs3X
ojglDdCq+mBHsDnTd01dwl3LwvX43d/12+CQyb2ujd/fZ6YKLSSaUgwd3BLQdYgY
d3adSSZxeuNykWUf2+BJtoHO+VFi7jYQV8zD13x/pwYf5mA+HxyzmVwg5taMWvjp
qby+FoExAo0dxByIYpoQex2BWKfi21/DrQj8rV861Wgm/SutF0E/v4X9nen6AQsF
OUiHKSaPPa9wQysg4HJ8fcpcfpV1uYE5VjUIzHpQmQIsGuI27aCZYeXobns2B4PL
skTvMNQoD0FdMt8NKSNwbTDZ4+V2SPaPQlabHkKmE/v98fJMwq4HvEQNBu4L4u6A
5Q2Q8mBvU1JW6NnFLSDp7JLcx4UBZq1ioDeiabsJVd5+ff9fDaIF3YX1derAKHA1
Kzc4nvdPs4mmAxvZA80EdnI1gz6yk0lIh3EpFKG/0PFIcxgUfow=
=yMtu
-----END PGP SIGNATURE-----

--JCzjOonC1e0D44gN--
