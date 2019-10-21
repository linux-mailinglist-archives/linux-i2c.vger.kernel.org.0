Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71977DEE96
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfJUOAG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 10:00:06 -0400
Received: from sauhun.de ([88.99.104.3]:47866 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727344AbfJUOAG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 10:00:06 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id 00D412C0076;
        Mon, 21 Oct 2019 16:00:04 +0200 (CEST)
Date:   Mon, 21 Oct 2019 16:00:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     pierre-yves.mordret@st.com, alain.volmat@st.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-stm32f7: fix first byte to send in slave mode
Message-ID: <20191021140004.GB26782@ninjato>
References: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2019 at 05:28:01PM +0200, Fabrice Gasnier wrote:
> The slave-interface documentation [1] states "the bus driver should
> transmit the first byte" upon I2C_SLAVE_READ_REQUESTED slave event:
> - 'val': backend returns first byte to be sent
> The driver currently ignores the 1st byte to send on this event.
>=20
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
>=20
> [1] https://www.kernel.org/doc/Documentation/i2c/slave-interface
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-current, thanks!


--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tueQACgkQFA3kzBSg
KbZTyhAAp/6ikU2tjHpRxjgZnSAod2mj8OCWeVydcZ/Gap7u+MByaZr7O8UmP6ag
tOOEm0xsfIT1pvIu4akUdeA2y9OsXJK28GhjOadbAtuJyjOrk2NyN68XI0dXMXet
tB+va3XAy8LrlM0JzhoTQOquxv0UwkcCOhWq2estjbC31eYSAz8/8SYifQ0+XwqH
mKaJ9BGYl0UtfP3vGg06vSEniZOY5YB5U1876X0JAjtYkXnwjBaKRn8Dda+BjrNl
TdIYcQN3scBOk32sdkSjqTTPLbV3X1+wDA7GplLF4EIcEobB27xGZ8r8JoUQeiqu
miR8ve5vXkIXSkvH4AN/8rHKQZzXO4UGMgt8/a4/6/7IMn+UrjIKv31z0Jaj1hha
IO/rRr38DVCDy0RVIOuTLBjfohi4VuQcR0GsdkQJRFDQQDnD8zzBXq5ud67McLDO
phzybx1wvtC1u0JNrpdYaEvl5E7rZdtBHG2Dhyk7wfs2FV7289an+/891Nl97lCj
KoxpVgcXdaPpyIdnvrB/iLkV9pX07S6TUTaY5E1t7XVqQayuI578Gq+7BK46PLaL
kHvnQU5/2ZIV9gmw5hyK0byMi80F933BZyRHgwoC2RHJEpdjzvERsjHS4KllgIJ7
99bZCeNxQZdbfD7I580nH6w8YNtHTfxZs2h83RWH04QpmOcjgHY=
=uZla
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
