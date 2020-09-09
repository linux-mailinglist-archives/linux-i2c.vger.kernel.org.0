Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A87B262A62
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgIIIdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:33:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgIIIdh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:33:37 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA64321532;
        Wed,  9 Sep 2020 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599640417;
        bh=/Xns4HHW2G2UxmwEFbWTwgk0vs0gt6z6T5GSbFIQFPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CbamQ2FFRyfNb/M2maIUspr/rjDwE9SwzJk3wlEBYFxmsBkL62ss7cv2DfQxVdorW
         XdgYCqvFLr7kcP/tgYYdK34SS6AZ0Mx0yHlDTRLLXlzQKCoUcduaMlBYEq9yeraPLR
         /u2RdDUXiuNO5i1m2a/2ZUEF6Ttl8tM3L5pD3Bbs=
Date:   Wed, 9 Sep 2020 10:33:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] i2c: imx: Use dev_err_probe() to simplify error handling
Message-ID: <20200909083334.GE2272@ninjato>
References: <1597203954-1803-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline
In-Reply-To: <1597203954-1803-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 11:45:54AM +0800, Anson Huang wrote:
> dev_err_probe() can reduce code size, uniform error handling and record t=
he
> defer probe reason etc., use it to simplify the code.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied to for-next, thanks!


--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Yk14ACgkQFA3kzBSg
KbZh/BAAq21CPjCqhk2Uf/IkNhLJiAZzBHHALBUH2PRPvkOJg+yu90fSdAmRUDJ8
GaahF5wxRjyvn0Kgo4mzBq4pCANegTxd+6Rii7n7x0Nyx8w/oRQX5PyABYxKxNaB
7/BJQK9DzGw2gimnom9YYMfCiY2b0hKgzhOIHQTDoFofiseAc712hAzWOqH4Tqes
gmELgFdSFAF529r8NiGB0u0mHFHuaGplLyxB7z37sUaEwvc5wsehP7MhRqlOEwTY
frDALIHWhUSLO/jtOaDIPidn27rPlvk09vEQyvDNMLzZCJSii3lsVu6wXb2I8kWv
dXxl0+WztpScy9ohdret8K2BAQacYyNFf3bHEwENXicaAZI5AaYKZ1MttSLXijR4
TquyzOWfbm5oJPHzZMjXrLPsnqiVCxbBWdtXeChln2l6HFUHBHP/8HYwV1diZ2OM
yp5nkUuFSrO1OEW1yxb/MbAalj8kUJt6lgdsE4tERJBoMuhY0mt40I8yAZLIj7Jw
QiHlQe9SqvlrW7DFs07ClQ4jqWeEC6O2TONLrktQZJS2ttry37MpHCaHpJK8mdI0
oB2EYDdlJyqht3vlaPeubgPVND1KZihDAaJ6kkbSfKbXRgzykDx8vZecA7l+cpxT
JpGp8LvVqDDqoavMuOmMTxyOXaVQMdHjRgmtzks2sct75Nu9ZNk=
=G/tr
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
