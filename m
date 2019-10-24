Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18720E3B13
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504069AbfJXSf2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:35:28 -0400
Received: from sauhun.de ([88.99.104.3]:43716 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfJXSf2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:35:28 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id 5BDF02C04AE;
        Thu, 24 Oct 2019 20:35:26 +0200 (CEST)
Date:   Thu, 24 Oct 2019 20:35:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: i2c-stm32f7: rework slave_id allocation
Message-ID: <20191024183525.GD1870@kunai>
References: <1571144589-3066-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <1571144589-3066-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 03:03:09PM +0200, Alain Volmat wrote:
> The IP can handle two slave addresses. One address can either be
> 7 bits or 10 bits while the other can only be 7 bits.
> In order to ensure that a 10 bits address can always be allocated
> (assuming there is only one 7 bits address already allocated),
> pick up the 7-bits only address slot in priority when performing a 7-bits
> address allocation.
>=20
> Fixes: 60d609f3 ("i2c: i2c-stm32f7: Add slave support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x7u0ACgkQFA3kzBSg
KbYt7RAAlOWKsmZkKq0ugHqSQYr08yUKywJd6XHETx5vGcJPNGSQMR/vdJlGlyWj
hEYV6ArZssUiQtgdzNOiFQqKj9D536DaomVrdluuQkY4JrJgffLl3aIBKw+cMubF
GAdg24aaCCgEWLk+Y1ZWN8MvKdzLNL0Fy4w78yZL5sTxUW2jRIvTnG+LzAnbkDWA
eJUP/xIjSNgbzjWsZ0ZxXx7gcFfokMgZdZCgln+az/3KAWHyTVSvfI18bXVuG3wi
yoM98jJIl12fqxkNI82c2vS/UvCUJVN7CMDO6rkg70IOQt2bsoteGsK1/URIREQM
ZXpjUSuxw6hAwuDQsXu2FmdDFjnpXBBgw71y+A3CLZoxV0g2FbITkGc+8t8Cn7zY
cfqPbqG0v/B7fXscy+tleE9NTcH9E/wNt36RnWP0/kyILBzHbsCu2U/vj782Ynr1
QfufwfRydQWuZaY1VxtZ6hC0ez4CDRD9kgDLjQrc9atpOilDDCU+Jxo3TboCRaQ9
RiS4POvlaawN+i9CjtDOFxBcoz9hafvrUYW6oAQvBVSrQP4/Tv4oPFf9f1yP69A6
jhdJrLjF7sF06ejko8Q4psTN2WxNkW4jtxlV4DlMwgC2cnCuEnfjXsAviUHOSDWa
7bE2j9nE4aYjieUAx6Jod2BXpToAjhV4uEOWYz2v9nFCnfHpuUA=
=EBnH
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
