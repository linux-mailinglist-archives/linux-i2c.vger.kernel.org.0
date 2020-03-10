Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D151B17F5D6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJLMq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:12:46 -0400
Received: from sauhun.de ([88.99.104.3]:47492 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgCJLMq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:12:46 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id BE3D12C1EB6;
        Tue, 10 Mar 2020 12:12:44 +0100 (CET)
Date:   Tue, 10 Mar 2020 12:12:44 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCHv2 1/5] i2c: i2c-stm32f7: disable/restore Fast Mode Plus
 bits in low power modes
Message-ID: <20200310111244.GP1987@ninjato>
References: <1583148787-24236-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
Content-Disposition: inline
In-Reply-To: <1583148787-24236-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 12:33:07PM +0100, Alain Volmat wrote:
> Defer the initial enabling of the Fast Mode Plus bits after the
> stm32f7_i2c_setup_timing call in probe function in order to avoid
> enabling them if speed is downgraded.
> Clear & restore the Fast Mode Plus bits in the suspend/resume
> handlers of the driver.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
>=20

Applied to for-next, thanks!


--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ndiwACgkQFA3kzBSg
KbYEHA/+Ii6H+eSACR3Z7Q3F8CXBe8hDrrbKV/s/nJR1yi71hGOHyOhHN/H2odRe
lCVxKyWLCYhubBtWa/QvgGO9oIBtRfmiW72X6xeOeF8pI9Zwy/n0NOj+GhmrpTOI
O1rtHwvza+3t5BAf2pohXpil2X9BLhvBrzSLZ9q956N0bHKE2i6A5LWMenyVmZL5
kEmJ0ok2WJEfeSBF3eDL2hwDZzMRzRL8BRYNj7sXyG4wqbTe3HmZiAdFbMwuSuec
QbvFnKhtaQCWDGFz/W2eKyIK0H6YDuKpeGWRtW/c/pf5Nk3MXiU3xJCLkAsvmYq0
WXErJI/nbWyH1fDDV2lVUWd9qUbFdEafVoHqTPZ5HYeOvoRiRAlIT3GrYZzucvNX
OMsfShttaR5CJVS7ahRuqcJxHXTaJS11Jo6yVH7L1zB4p7DKSXfu4Rf7nvQgyk7x
zcEdlW8W7sGaPmEpSENRYsHANq3r6q3QpA5A9l14CQtQykIos4E3f9LDwheRn+Ei
/m8KW1MUqkY2PRsBT+hSlG2GezzHMTo4YXJaiTZi87urY3+LbbcWkHcCwUMfI6vq
2clES4iA9hZS8GAhUOqPHbQZc/bRM+n7zNmR9JHI1SoDdKpVgOLZv1MLofVJWOWI
q46Y8Z5LtBHYj59iyZT/qYXVGogkg1PkZIk6/UBSeV2wrKsenxI=
=J1aj
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--
