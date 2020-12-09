Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650092D4C29
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgLIUra (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:47:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:50414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgLIUr3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:47:29 -0500
Date:   Wed, 9 Dec 2020 21:46:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607546808;
        bh=mgWZJMnlHPNKk3G+8BwkQUcX4IRQNVusX1bax+wFkBY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=JNO3XBKSlWouy47UmeJO4vI4b1M4+hFzwEQsyqogkXyZyy2GwHlfW74/cNAoORePW
         OCNiGIX+Yr5/3R/uYdT7TMZnIMKWQQ+Fj+nUoLC5I6I+8H2tsdO/thqpdmlrcty+z4
         zQs51lZf8YUhKQwE3Dsn8x3vZNUQmXlCeWkCSbTRmmUITyRxZaJN/RrSobn2m5q1pK
         gO3U2XMm+FzMTKEsrgYC0EuNdSwd4OAIT+LG+omJ4NfKvi5p4vRHMeGSJ7X1+h9397
         vaL0R86hISbRhrAEgZug4Y9WFxVPkYLB5uPhHgUlSTY6mg9eRVE8ucIG2mD9tVhx39
         2DxY3XYOK72gA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, rmk+kernel@armlinux.org.uk,
        alpawi@amazon.com
Subject: Re: [PATCH v3] i2c: pxa: move to generic GPIO recovery
Message-ID: <20201209204645.GF3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, rmk+kernel@armlinux.org.uk,
        alpawi@amazon.com
References: <20201004100711.1093343-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Content-Disposition: inline
In-Reply-To: <20201004100711.1093343-1-codrin.ciubotariu@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2020 at 01:07:11PM +0300, Codrin Ciubotariu wrote:
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
>=20
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-next, thanks!

> ---
>=20
> patch not tested.

LGTM. In case we missed a glitch, we can still revert the patch later.


--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RN7UACgkQFA3kzBSg
KbYc2BAAiiCx5TicTmnQ2Y3k/DLOHrMguzZe+dJVoOagrXFM8iTo121597Ocjzi+
vmrpwv7W4lYJ9KTBpxNTz7h8l6KmfPozHqHttzGqVzjMFhYljadCxcnnDgqwQd+y
UvSawLOVOroFpfwoi0wqyk4KM8NF7LcWvOI/0c80UkVD2178hh5n4aKoHFE7fyCR
2LPfh/rf7R9wEJ3Krttp34m77prtHCn1sLt32d63qcmY5hPwsiSV3NkZX8b/uiFD
UX458zJIMtq05IF/LKAYnheSeOCJ6wyoIz0ohyVr9a+wuU3QpDRkKnGu7bRBi2IP
JcKt5GVcSFp7hVvbgwF8X0D48VedT0S3Lar/G2Ki+nbOi75b4ljfVlALksHENRtA
DTzLKE20M+2NIb289hTMdR6Q6RHtBdWhSfYmrIzr1qqT0pO86OBWRsrLdOvNfcea
Ot8YLickpAkoDMSrbk5xp23eiIXi640i2U8RyfQStDI/qe3iHHkDXeaJnx2y6MkO
GwwTzASevlnggEuynjhIdypT6wVma1IbZGjhkq0FT9yypk1xgZPaxlXbSQRMLoiL
IHbF0NygVesPowHecHfrc2ALw7iRjQap3xDtiDH6S/x3xvAI+GFcldxJtIP8V35l
BE/PqpYspIIMaJ0vqsVS8y+jhxX5twY9UAvR6wDbFpdJXpm9oUQ=
=2eVC
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
