Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462A31C5980
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 16:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgEEO2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 10:28:23 -0400
Received: from sauhun.de ([88.99.104.3]:33798 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729308AbgEEO2W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 10:28:22 -0400
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
        by pokefinder.org (Postfix) with ESMTPSA id 911B52C0892;
        Tue,  5 May 2020 16:28:20 +0200 (CEST)
Date:   Tue, 5 May 2020 16:28:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: fix missing pm_runtime_put_sync in i2c_device_probe
Message-ID: <20200505142817.GC2468@ninjato>
References: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 05:43:21PM +0200, Alain Volmat wrote:
> In case of the I2C client exposes the flag I2C_CLIENT_HOST_NOTIFY,
> pm_runtime_get_sync is called in order to always keep active the
> adapter. However later on, pm_runtime_put_sync is never called
> within the function in case of an error. This commit add this
> error handling.
>=20
> Fixes: 72bfcee11cf8 ("i2c: Prevent runtime suspend of adapter when Host N=
otify is required")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-current, thanks!


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xeAAACgkQFA3kzBSg
KbYhiA//T+l0PEzPiaE6M7x6gAJ8psbfRCvstiVnIPTm05RkWxc6F5hPg/P3gCbJ
23pSTbYP2xAhWve343T6dn/OsD/oRphhcu1av5v0yMee5k4QQ7I3MbAvxZM99bfG
mfzQoZngIvCKgEA4PMl7Bq9JPIV0dS+6CpAl7OWOBjJGt6H6uJ+07MQNmyyGoz5e
S3esTcF/60pQzcl5/VHA6/OyXExbqOOq92zcnd5IMXoqWC6xtIJjVoCHje0gJTpI
bO87BHiDe5iK8tSzhLqUU/QRAvGBPgTNa4vjew9OhZgvoFsBI8GA9gAcJqYYoh3j
t0XXWIq5sUjcWNZSlalb2/WLOdDHvEbvGMzc1jphUjdklw9ZYbY7fqA/6QIUvz6+
NqF/j0wrBsj+dxyfxj5f82Q0672glf0Zqzt4n/QuPJ4QLf3qPVW3u96CRl0HPV1C
/AwGTLPZUIbAmYiHaODfMlZ/v83HybqVZoRzhBS0xK/T7o4uUriVWag7tLOHmMni
eswp+a+MsxyL+WrrC+Ug9PslANq0/VM83k0edA6MfwkHGM/DMFiDP0/ZAFGnKkjn
zb6Wx0utBOgT7EaxNYwqFWlPHNK3X0l1cIKr4uO3t5hzIjjrF5tYoAzfTyV2uvQJ
uT6/TtJbeWnxuW1lLmepPYYse4XDeWrHj8q/DnBVBsFJW+wnfAg=
=e2w7
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
