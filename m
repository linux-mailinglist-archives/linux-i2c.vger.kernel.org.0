Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC921A9BA0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896704AbgDOLBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:01:55 -0400
Received: from sauhun.de ([88.99.104.3]:52498 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896698AbgDOLBf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:01:35 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 2CE8D2C1FF1;
        Wed, 15 Apr 2020 13:01:02 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:01:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: i2c-stm32f7: improve nack debug message
Message-ID: <20200415110101.GM1141@ninjato>
References: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Content-Disposition: inline
In-Reply-To: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 07:21:55PM +0100, Alain Volmat wrote:
> From: Fabrice Gasnier <fabrice.gasnier@st.com>
>=20
> Add information on slave addr in the nack debug message.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks! (I'd drop the __func__, though; doesn't
add information, does it?)


--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W6W0ACgkQFA3kzBSg
KbbB7A/9EmAD4ef/5loAXglkahpH2UJci8WgDL5JIyHmGpZKPB2FhoVScwPzkz/B
DflvRJg4S7nQBvVe5o1ewFgNW5mH4M0QTAEA8tyE7irUfAxZR0FH7C6ub95v8JKs
eakWVl4yeoDOkQMJRQZEF5yq0ra0ASjFAt3b0YgxLGJ3TRuC1AGJ0Iwm9GyFAaK9
7jhntL11lD24Thyw+NhYbK4a4VZNFZMDemq4+5ZtlKVHUs6NjrhAY2E6panB5BBd
nANADQQv/hXHgxEscLqtGrCx5CTfVvYd3+v78q+ALi2Sj1pVBie4wUvT8Ev5EA35
t8V9MGWNS4R5K9+7qU78vkNzbm59xteR7zYJOzOQYFOofsbWR9t/l90w0vxT2VKv
7OyQ6S1V2doz+oaIGQaGXBdl9t9ObXAyZfOvyDpER4Ot6D8hToO7FavQJ15o0Rm0
uahzgFBdufsWy/ltSSIio0HdjNT9mWP2YWlc2HsLrx6GtzQ7epdTVCjQ72q33kDC
9QAeJ77rN/BVfZmKsaq1RjtP6A9LFSy/hVIqLnBl4uVDoHTx1bBCTexiVVXOROEu
TBEpcU57cwC1wZ39KfJh74lyV1JAnOhPw81e5C0Rd6wyEm07DBhvpAhcfzR5T4R/
NcF6tc6ANE8t8lGsPoYwwlcTgNrxh+BBKwy5yFERn6bHYOV71DI=
=52zH
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--
