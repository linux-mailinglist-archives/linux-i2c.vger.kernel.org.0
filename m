Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60E30B2A3
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 23:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhBAWOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 17:14:34 -0500
Received: from sauhun.de ([88.99.104.3]:57922 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhBAWOe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 17:14:34 -0500
Received: from localhost (p5486cf8f.dip0.t-ipconnect.de [84.134.207.143])
        by pokefinder.org (Postfix) with ESMTPSA id F323E2C04D3;
        Mon,  1 Feb 2021 23:13:51 +0100 (CET)
Date:   Mon, 1 Feb 2021 23:13:51 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kevin Paul Herbert <kph@platinasystems.com>
Cc:     biwen.li@nxp.com, leoyang.li@nxp.com, linux@rempel-privat.de,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        o.rempel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        xiaobo.xie@nxp.com, linux-arm-kernel@lists.infradead.org,
        biwen.li@oss.nxp.com
Subject: Re: [PATCH] i2c-imx.c: Synthesize end of transaction events without
 idle interrupts
Message-ID: <20210201221351.GG24315@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kevin Paul Herbert <kph@platinasystems.com>, biwen.li@nxp.com,
        leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        o.rempel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        xiaobo.xie@nxp.com, linux-arm-kernel@lists.infradead.org,
        biwen.li@oss.nxp.com
References: <20201222194850.2274527-1-kph@platinasystems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline
In-Reply-To: <20201222194850.2274527-1-kph@platinasystems.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2020 at 11:48:50AM -0800, Kevin Paul Herbert wrote:
> Only the Layerscape SoCs have interrupts on bus idle, which facilitate
> sending events which complete slave bus transactions.
>=20
> Add support for synthesizing missing events. If we see a master request,
> or a newly addressed slave request, if the last event sent to the backend
> was I2C_SLAVE_READ_REQUESTED, send the backend a I2C_SLAVE_READ_PROCESSED
> followed by I2C_SLAVE_STOP. For all other events, send an I2C_SLAVE_STOP.
>=20
> Signed-off-by: Kevin Paul Herbert <kph@platinasystems.com>

Applied to for-next, thanks!


--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAYfR8ACgkQFA3kzBSg
KbYJ0w/9FQnLfC55VmP8t6aTjCqy+E+/nyOQJPuxB/ziB0FircuoZ/mP2S+uctrj
C4RNKRETehyechcKIgcuMZLBs02Z/6aU/LbyHdNLuyf/gElA9H8NZHIOjB+GUdx7
NLPPNYb1vNDer+Xa93swWvcrtDBovaD8SVPexCQI1O/Dx/Ymk9agBPpxGQjv1lld
BOyBacq1JVW2O7I7NBZ1xwPR6xRLZudr9N/yNAKPXXBcC7D3f111nGVUlrl/MYCj
+laXagVvlRFEXSQkCB+aRZ2HJR2g8GUU0hf57+DBg2bYZ6lsG9hlqG/Pg3gLS2xV
6e+ONkf9Ao+rZaWmo7E4SITMcLmLUJr9TaO3URUsceIQnotESNbYTY+QImbQG04t
AL+2500K5MC1vVmQWKg2NcA7qLH+EFo8TjWGCSRLCdO0tqfu/Ft7pUhL4zRSlJfo
hZam4uOW42p9uLpBWx2NwYT2Sw56xhniD3nUtNLpnLfIs21ovsIwadJPnhsp/S7W
53nZIfX/8FqA+90hJLrEmuFMcnsC1RgA7An1mUcHo80Eggu89/IMhTMWRjYmSyoO
YPdufzcn56WSneEdrb6eCvsEHZB5CP84/zi7XEZ8fDkePj8sxE2iU19hjIUbdTdY
AoP1jzsE/I+kbAUPm6/Vd6QT0o0fp0beMZH/wYKIE8ZiNDqJBHs=
=7NoN
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
