Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B87130B2
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 16:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfECOwE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 10:52:04 -0400
Received: from sauhun.de ([88.99.104.3]:34318 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfECOwE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 May 2019 10:52:04 -0400
Received: from localhost (p54B33153.dip0.t-ipconnect.de [84.179.49.83])
        by pokefinder.org (Postfix) with ESMTPSA id E8BD54A1428;
        Fri,  3 May 2019 16:52:01 +0200 (CEST)
Date:   Fri, 3 May 2019 16:52:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Message-ID: <20190503145201.GE24385@kunai>
References: <1556607314-32401-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
Content-Disposition: inline
In-Reply-To: <1556607314-32401-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 07:00:02AM +0000, Anson Huang wrote:
> Use __maybe_unused for power management related functions
> instead of #if CONFIG_PM_SLEEP to simply the code.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied to for-next, thanks!


--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzMVZEACgkQFA3kzBSg
Kba7pRAAsCwWRMqP8Z9JiWuNOqYNSCChv9BFTD+NYuI10hGXBROtML9ZAMdmlXAz
b3vuwRselOKxChnnLH59XrroG7Mlfahh4fZSP+BvslAtXB5WFJMI3SshzL06gd0a
ethOMyoS1XaO9VYk7+6UyqR3tUERTNgc8d3cRz7zMR12z8dFZAICsjIjGqsmTwcc
XM9ZeIikuCGuJpUCY2RMfrA+FPLN+rzM91xYBM2O4Pu4sxmKdJKoB3baKsksUuef
akHGHPXLvIrWnMO8kVFhIQnqbQB8j6sL4RUUIPYLo8hUUrC4tvmd7IQcQh+4ug2f
madEaETWrRIW/WSFcH5EMgH6bII9e2rIpHkZsAW55Kf7EsWcMK3Uo6wsol80Z9HS
wMLb2Zz1/fEi51NaC+E9XX/4rPyPIEYP3TQ7y2zqzCCPxhfl24ywjyfBfmVI4QDW
r/u4fyfSDg960h5DgqGhpM7oaJkX/T6bJgKoXPNkMAMiGQwR26FIhBzmh5bxkDdS
zI07PC0wMnN1Bzl1sIVBQov46s7WMN783xenfjTY9+IVRj9vlcHwAb0NiyvF+gcl
q8dzyppY8aSWsB/QRgZRwfzfb4u8kV1fefbZX89XYFESUeHmT7vDMhHs3etRhPaO
P5BVyarrEjcOg/2+2CZNiCBZysUa/BXa/BIIO/16gWW6e8JXsrA=
=hoAm
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
