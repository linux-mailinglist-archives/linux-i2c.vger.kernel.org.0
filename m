Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2654F805A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfKKTmE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 14:42:04 -0500
Received: from sauhun.de ([88.99.104.3]:49384 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbfKKTmE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:42:04 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 985922C0428;
        Mon, 11 Nov 2019 20:42:02 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:42:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix & reorder remove & probe error
 handling
Message-ID: <20191111194202.GD1608@kunai>
References: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline
In-Reply-To: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 04:04:24PM +0200, Alain Volmat wrote:
> Add missing dma channels free calls in case of error during probe
> and reorder the remove function so that dma channels are freed after
> the i2c adapter is deleted.
> Overall, reorder the remove function so that probe error handling order
> and remove function order are same.
>=20
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JuYkACgkQFA3kzBSg
KbYcnRAAq1jv0t+cBFdjV0cAyRRX0WL1Iv9MAU84u/vxXm3x5WV277AuXXWzofmd
XqKJsLIq6lSoh20bC+LHePMkmQ+T8oX6C8c4wjmqzls5Uq2St0evOX39JoQa+yFu
Q+/S1xdhPIjOzqJbwtEw/iVZ3KaHzEsTJEBpQEhH786eiv1vfkUiAKFrJ7KLSEMs
BUsNPYE/b+EasW9rylAPjoVp6ALXxPU8ScXQq4H8mh7Ifvlp01kx8Vi4ukI0niXQ
W+VtoiCxEjRTIx9EaeVZAzcbVouvePqp8hB7GP5+ys5s8bXaTnJcSc86Uu5tY9Ax
0oZ1s1irGqpDz67hb5inyDvC0d0cvhaqNcqW5Ez6tCA4A0sKYETGfRWXMmFIbNTd
8j8M2Ecq+twpTpwoMwtYMLwkFJvVhizOM7MSYctisgGkhZcLzNVq2CzJ1bEIVk3I
qSQT4JfDWiVCpt/aUSrxdrzAarpbKIbfKmBtNlXKkOu2g4QTioty1LxntndndIpC
HHgk7ZuoqnDk2IQdzv7MJiBDVEmAZICPCZ/dESjNnZuQ/W45Iuc28CZiYpDW+mmh
64zfpSo/jAp9ZVoU0Imp+zKCtuqldEEAScptvP3e06kMuNsZRuShAl1DAudYfFIf
Y8NeKiE3ex/XEW5c5jLlt7o9oc0ipoOd0CPALRJjXnjyl4DICFE=
=exY/
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
