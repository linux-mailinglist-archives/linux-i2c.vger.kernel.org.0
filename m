Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091A783A73
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfHFUlH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:41:07 -0400
Received: from sauhun.de ([88.99.104.3]:36614 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfHFUlH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:41:07 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id 342422C290E;
        Tue,  6 Aug 2019 22:41:05 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:41:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     wsa+renesas@sang-engineering.com, orsonzhai@gmail.com,
        zhang.lyra@gmail.com, vincent.guittot@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: sprd: Make I2C driver can be built as a module
Message-ID: <20190806204104.GD911@ninjato>
References: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
In-Reply-To: <c9e2c50b54577e4b5cb7cc424f4c6de5f116cf60.1564041157.git.baolin.wang@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 03:56:16PM +0800, Baolin Wang wrote:
> Now there is no need to keep our I2C driver to be initialized so early,
> thus changing to module level and let it can be built as a module,
> meanwhile adding some module information.
>=20
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Applied to for-next, thanks!


--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J5eAACgkQFA3kzBSg
KbZPFBAAmf8B0A11/CmF52K0JXNqm9YZMEUiw89HIQ/EMTtRDivy/W/Ae/KUZ0Xs
MtV28B3D6nBcHkuoKy+BYX+nNWUL63P9lZ0oV3YISzvzqUwdM+prBhppMfD3tTME
+n5zwHt3qOgDlTVdt1/2i2qzCnZgpTRsOCnudBKp9BY34QeY/5Qbc6Hr7DuwghAX
R6bBwhxCRrzDyMtyjGlwSsYL9ioP9E81FZ1NqxUMCGbsww5Mh8xTOyYFx/e1+lJh
kZV4pTTsNKYeekffRd42YPduhTzDJ3y9YRgCM+vl65tdd5bFB/sDoEGz4Se4FSy/
arYmWNwMi1qv1gea7F70cz9JkwwHgKYArtHc8aQgZtEY1dqoXAozwmWDLZdUQGuO
AbXIjoL7my5tb83bY7iZVcHGaHY4sUxTGWzMe5983bnMdepo6sgQMYIZhUi7Y4BS
5l0J/1eJkiSVAcMCQX883ugnQ5aeLe51zDNViPZNgPfHZyLVcqoBwep59M2W4nHt
zSaoQAJ1WMa5XOa8oE5G1y0Lh421ItcKakkHkp4Ecxlufi8W9Jy1CplRW+M2KDU9
PRTgBGcm+FQ2AIhg9XNKUaRHOa1Z8Zl8WpAoo0JcZvSH59mSfkyRsXuy+CMqpX4i
7cq1i7T2DuuP2EFjH9o3vwho75MWw9EzEKRCcrrFxTQBNXnngtQ=
=Vh2q
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
