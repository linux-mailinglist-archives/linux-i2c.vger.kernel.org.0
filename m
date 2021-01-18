Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A461C2F9CE1
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389845AbhARK3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:29:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:43786 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388927AbhARJeg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 04:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rWzjCq1apcJX7BOPIY4Wuk8smjit
        0Oa42YCJAC4QtcI=; b=oQQ+7mQ+0/QkwRJPoLG7P5eRAZorZ2l7voXnXIUvmgvm
        trY/7pl7nsGXADvnzo9JLirfv6dEg1fxhR05KHL470Yn/Eb3nfP2Hti935nyfM61
        tYheijrYcl/iq1W+BCODWuYaPJ/PXurBm9U3YwwWnFXr/d6vRoMhmjJnlRkMaeE=
Received: (qmail 643757 invoked from network); 18 Jan 2021 10:33:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2021 10:33:54 +0100
X-UD-Smtp-Session: l3s3148p1@dqahaym5vIYgAwDPXwacAOByz8F9Mgm1
Date:   Mon, 18 Jan 2021 10:33:54 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] media: i2c: adv7842: remove open coded version
 of SMBus block read
Message-ID: <20210118093354.GD1018@ninjato>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
 <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
 <62c10525-69c6-e681-feaa-5ec3a865c06c@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <62c10525-69c6-e681-feaa-5ec3a865c06c@xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

I hope you are well!

> > The open coded version differs from the one in the core in one way: the
> > buffer will be always copied back, even when the transfer failed. It
> > looks like it is expected that the sanity check for a correct CRC and
> > header will bail out later.
>=20
> Nah, it's just a bug. It should have returned and checked the error code,
> so your patch does the right thing.

I see. So, I will only update the commit message.

Thanks for the reviews!

All the best,

   Wolfram

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAFVgEACgkQFA3kzBSg
KbZ3Cw/9FeXBB9yAE8JaLW1qfx818VZsFHqynPt8ZQfpHw5NjG0LWG0PDLV7zexc
ICRQU3Q/OeL+6Gvabu2whzaKNsi6Ms5fdOcrEHpiG1kAjjHSFTdEpHmbXbNy/b8r
lZRPMs1Ch9qDQut4Jwmn1DsZ6jJCcdwokust+jQj32IsbJEsIabT/ixy9bn/uDf3
SBLWPt4mNJMjMzTcq375BcBdXaMt0SmPzsZ7rHbTTDuao7q8CFjbLdQbrmxW8vEE
NMdF/YgSX1I5hp467gissGJahs108kKZhAU7SArH8j0aUbfesb6vRMEF0aTpEiwG
jwT0etOmlFyubjNnS31ONAQBPEf8psZg8k/WUHKdj87Re2yZBueeiZ06t6k8/Sr6
XXK5gLUAkF8DHF61dJZlVqe7Fhdmwy/+RkfkM1RSaqlC66teSXZror3y1w3bavtr
qT71YfT221Vxx/gFaoEdWPTW6M8mQyS9umSmCf8BJXwsKo/QCVdkBdpXOfHLOsPT
bfHAuS7UidzJwgbCwuO9GlrsH/Mvn0GkKQcivzjD4NnfFq6Ll5cYbHKH5u2J3iiy
VTdl6zcMrend4NTTvXkWyFmM7hwT5ClxKfmTMR0ahvmvU8wg7KWuv95bFhDXU2w8
jrVDuXDj+NvDKlQ2NgvG14DiHri2/FBvoIqEpgX/w3DdAHizOxc=
=sKTP
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--
