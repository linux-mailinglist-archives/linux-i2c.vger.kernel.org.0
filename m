Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7E4390993
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhEYTY6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:24:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232308AbhEYTY6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:24:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48A1A61417;
        Tue, 25 May 2021 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621970608;
        bh=UO65MsW5+yB2jxZcSd7Il+YyAtlpHOYMoAQRFy/mYzY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=L6l4HDmFszt2vUhTcBq6ATvzX0JTKdtjQQ+y2qgaqaRWEDPHhWXQl4YvAKxJEIB4e
         BOibmDOtdIceMRNK6gdUsazpPaU02B8PJ1r3TB4dutbHjxw6lT9mqV87vGFidkWeWN
         oBfdo4gM7kob1DfYNwpoB+EYPyXQjlInsx/2u3ik09qJXW62hbtlSspp9g3rlsdbLh
         o42NwaLjpKK8a2yOGiklV4HocIc3L4M2Soo+0p9q/5ed9JAxltPKqA4vJ+paDSJrYs
         MjIxcgs2FtgxjckbmX0bzeeXpCxA57RoZIQg/4DBJCzZMgZ0ZfLt52dt5wRH7te++A
         P5rewMfx89QSw==
Date:   Tue, 25 May 2021 21:23:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>,
        Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" ->
 "unexpected"
Message-ID: <YK1OrYO77rXlivZI@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Colin King <colin.king@canonical.com>,
        Alok Chauhan <alokc@codeaurora.org>, Andy Gross <agross@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191103212204.13606-1-colin.king@canonical.com>
 <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
 <ee839cf4-6310-aa4e-6ed2-322f20343953@codeaurora.org>
 <YK1Oc2wVZ7Y7qgya@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e0xijyBadRQCRWG0"
Content-Disposition: inline
In-Reply-To: <YK1Oc2wVZ7Y7qgya@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e0xijyBadRQCRWG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 09:22:27PM +0200, Wolfram Sang wrote:
> On Mon, Jul 27, 2020 at 01:28:56PM +0530, Akash Asthana wrote:
> >=20
> > On 7/27/2020 1:25 PM, Akash Asthana wrote:
> > >=20
> > > On 11/4/2019 2:52 AM, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > >=20
> > > > There is a spelling mistake in an error message string, fix it.
> > > >=20
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>=20
> Applied to for-next, thanks!

Oops, I mean for-current, sorry for the noise!


--e0xijyBadRQCRWG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtTq0ACgkQFA3kzBSg
KbbU6g/+NfQJCmAPWtlAjl18CMC/CKgYgOKNMn9cCWs/Rh9C2TVbEM3WmIZgECLZ
5FK2RtcCgK/jUD0EPmeHxbo6XO/ud08iGHgr1L2uS9RQ99e/1VUwIHVkSUVfzRPV
N9MOtUp+DQAqP/0zIlGGR7+LaxOZbRZlOdi93BQ15PlXiD6lV9bOvty4fexcJ75T
t5fKvVtvSi1/0Be/YJHHEO3RpEpai2NZJEwQwmyFDMWsntr0uelkN7/dJSC2hvhW
UufOQS/Vy0+C75riCgf/v47lsunUmvC+UJ2/gWc5oBEOt+wIRPVBeCi+IGKN58Jc
2XoS5RDYFFELBb+wOfSThcvjrnV1fzFWWheViFAN1reFypc3ORXdOzw0V4nTk1lH
XI3GhY5RYhr4r/r9XQY7FHY3PLWfyCQM4H59vEuSpVMyVhwjOI80dla8kmLpApua
MjJyv+z1ervSNI1G+YhAdqpRxoWivJzaVw2QqyAjFLAiKDDtq9O0aaiRXkDI4wYe
LsQKgPIqpnRtp1AgBiyjeKfMit9AvFXP6kr8SEOBHXpd2rcVb1indCsLRFBmHLcd
RTHnUDwcoaOs/vDd7KNBnmqFriALrJLlLldx/vCtLJooRotWPBXR0ZZGzLj2UEAz
UZDROnRtptn+bltVWGtp6qnTLJQJIBwBr81+wMsiHBNK2efFteM=
=0AJi
-----END PGP SIGNATURE-----

--e0xijyBadRQCRWG0--
