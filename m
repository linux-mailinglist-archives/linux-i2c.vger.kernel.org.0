Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3EE4B2C1D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352348AbiBKRvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:51:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352338AbiBKRvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:51:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B434CD5;
        Fri, 11 Feb 2022 09:51:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF85D61D23;
        Fri, 11 Feb 2022 17:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E45DC340E9;
        Fri, 11 Feb 2022 17:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644601882;
        bh=F9tdVd/GDTZbvc3ckgl4zG5hYWLfWn7hfZRmCIg/enA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IXOeZ1iY3ZvTdG1cnr+PnCeqk52FaVZ4zceA+hi4w+Z75siHdwa7pQU3L0KhrDNFe
         T7CGyOEZN/+K0WqHR2YYMFLZ27mDlP2MFnahsgjWrX4WuKGJDfsshuNFhuIVJK/Ams
         1xjdU76gzEtVZMJ+urrQB/DtIAwsAu2SHuemK6blx8PXA6FmMGar+AtzbT5lGOyGpe
         kLfN8lsr79dGy03jOugMcSW8MepZg77nX1O9Gfw3vlxddnglAfMKZObEKUtVGj3dzy
         wBg0YypUP+gO5EP8Syad13aMW0nDnyPjw8UcvD2mxE7jEwwfSrkbEsfnGMtcEZCdqi
         EDwlA31Ad4Lqw==
Date:   Fri, 11 Feb 2022 18:51:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in
 adapter"
Message-ID: <YgaiFsgQUSeUTUwz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <20220106122452.18719-1-wsa@kernel.org>
 <Yd6gRR0jtqhRLwtB@ninjato>
 <98ed8d6d16a3d472d9432eb169aa2da44b66b5cc.camel@yandex.ru>
 <4dfbee97-14c2-718b-9cbd-fdeeace96f59@yahoo.com>
 <CAJMQK-h38XdN=QD6ozVNk+wxmpp1DKj21pkFZ+kY31+Lb8ot6Q@mail.gmail.com>
 <6121a782-6927-f033-1c09-ffe4ad7700ae@yahoo.com>
 <CAJMQK-j5YYqen78Vgng_5jhja-YKSTRut7f7vJ4wWufVfbZy6w@mail.gmail.com>
 <363432688.323955.1642272250312@mail.yahoo.com>
 <CAJMQK-jx+z974AT_p+-AVAbMQQ33V-XU9NKmy-i6nbS5zagHBA@mail.gmail.com>
 <297191986.3285872.1644002564779@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3O157vMkPgoB/jJu"
Content-Disposition: inline
In-Reply-To: <297191986.3285872.1644002564779@mail.yahoo.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3O157vMkPgoB/jJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 07:22:44PM +0000, Tareque Md.Hanif wrote:
>  The issue still exists. It takes very long time to suspend (10-12s). `DR=
I_PRIME=3D1 glxgears` is a black window.
>=20
> journalctl attached
> Looking forward to any testing.

Any new ideas which Tareque could test?


--3O157vMkPgoB/jJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGohYACgkQFA3kzBSg
KbYDQw//dSIhBi4A9Y5h1tFwTrTxqGfsRpDAbPqba0S7hNAE+QbhZ4KpBc04w36A
c6btSwh/3oE9UKJzjxxiS6ZcZUzkZeVvhhyWq/Z1Ihg0xVfwXgm5G3Vlm9bh+JWA
ABxqZy4xcKnCspu3s0gARFnvD1g+iFcRkIDnBQM6xcSySBL/Ke0hK6s5xdO5ia20
69U31+agvOLQPyo6QsFlt1aDMT7XgzUUtQ70p7fuQfno+yfNGsSN6AF1DnOwkiGg
/IIfeU/kTC6fYTNdbjUETvBHmjLH8yXYySyFRsMQIFwDUVsNwUS4c87eZgH8iWsf
kCIpq/+hdFvapcKe+JqzuhbrExEBnevj6fcRQZKwWvgbznOuIc1HKrksiKIdfBZV
OdM2qOwJpDhOKJY92moMFMsKqa/2uw4VZmho+bOUYTzFufnal6ljDuPvMph3wLig
21Ri0cMGDINVg54LTS/BE7oUZfvfE6lb4e0fRI9z/bPhcAOdAepHNuLmUjkK7Vfy
8PCwa/cX37mUpQM7ECgYwrTzKm+iuQhY7Gh+Pcjb8EUFut1OVIRhrtSQFM3ufeNh
RsmFZx31UDr/0RBnxTdhSsJU2JDDI9bfRxbaJBkSG1R4B3DgSbw1j5cBTsHyOwb3
gBT6emvOJ6h1bLF32+/IaJft0JKu33hPpwTvu74v8VdeS1BNV4I=
=ZVJG
-----END PGP SIGNATURE-----

--3O157vMkPgoB/jJu--
