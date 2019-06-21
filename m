Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E619F4F053
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 23:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfFUVOG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 17:14:06 -0400
Received: from sauhun.de ([88.99.104.3]:56086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726237AbfFUVOF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 17:14:05 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 583FB2C077A;
        Fri, 21 Jun 2019 23:14:03 +0200 (CEST)
Date:   Fri, 21 Jun 2019 23:14:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, fabien.dessenne@st.com
Subject: Re: [PATCH v3] i2c: i2c-stm32f7: fix the get_irq error cases
Message-ID: <20190621211402.GB950@kunai>
References: <1560757981-10532-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <1560757981-10532-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 09:53:01AM +0200, Fabrice Gasnier wrote:
> During probe, return the "get_irq" error value instead of -EINVAL which
> allows the driver to be deferred probed if needed.
> Fix also the case where of_irq_get() returns a negative value.
> Note :
> On failure of_irq_get() returns 0 or a negative value while
> platform_get_irq() returns a negative value.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-next, thanks!


--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NSJoACgkQFA3kzBSg
KbaKLg/+IDVBZI+FWBpYna0/CpvmO5Uyzx0xj2RFArNr4l7IySOTfA79vSKuZ+cx
VB+ap4ihOQ5gta95Jt7ZFgHj1h81yy/5ER2C8yCbn9NNkv5NjF3HvVSNaolQuU4q
LIDq5JjlKMOExTBuRFfDvDC4jnTAPZcIv9KfxsC98tK4u47jzh2GIAnrX/BjIydl
khpnpg1KwbS52qFfm6OxxKtZBZrIJg42kEt7IH7AYG3IqpE52zO0Xg92e5HVdRJV
KP/E13T5YZXONCzT8ZB4vYiPC0lpl3QFCEO1VpwVCTM/AqxTA573L9GOmoFurPra
6vkNeUgZdfBXvTvIQo1Qteuuim8NfpZMy/Q44WZUDNVG5VEGzlDFli3j3z5GON9r
c0N1SbA9ev+U+4Lrw+6N+RLG3VKNiEAKLILKWzP3Kc4KOlRZDa6mxgTdHL3E9i86
stVEayxqkOZPiTtmb8AaJz513cWFMIlnqolWZqgl5hXL80JHE7lmebA7xC0GzN6z
o8V33npjYNMPH8vaS4Fm+2Huo3q95A1DccuN3xqhx6WClG3vrpkImyBOKEla15NT
Ox70qsmBi2q+rXdqcM/g5gaedc/568Le2FT/whNDxr3mJ8o6lGfwRDupZFKGN8Vm
8LJRUVAA5fokwSR9C1IJfHHJgGi47RA8dBJy3pLJWV4BbjrbGtg=
=etZv
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
