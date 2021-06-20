Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C873AE099
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 23:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhFTVPJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 17:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhFTVPI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 17:15:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21E5F610CA;
        Sun, 20 Jun 2021 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624223573;
        bh=BmY/iYTrW8sHMSRkIF2F4/gZ+S0AVwlDGhLakMHc8Pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IBdvRDYjHsFsV1MiJU8B5LLAxwh3acgs/kTE9eQMKbeWJ9h8rB3StA1ZloSZNS79z
         qqOwHESQOdy3+Q0je7i/XlLBb3wqPsX7LsLbJ8eW7VMbOh6N7urvb4zGHJveR5QAsD
         vtB8bm1Y5zxkDZ/Zp5I/MFE13Ys+SctOM2xdTKmEMmD18qks7SSF0jzC+FoBs755pR
         ie6bED8WYI8nuGde8eefM2U4V7b4WH0slBpm3og0FzqMbYUPA0lFf98bmtcgjngY+8
         RdEiIDpeS0rgab9a6TDcc3JNhe62J5qALiM6rRmUv8Kv8AB/Fm5XvvfE0emsuwDNgb
         xLYzJLEDltISA==
Date:   Sun, 20 Jun 2021 23:12:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in
 cp2615_i2c_recv()
Message-ID: <YM+vUsFRWiGOqGVN@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YJuosd6rew91vlyX@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="okIF8e36h8BpM+kW"
Content-Disposition: inline
In-Reply-To: <YJuosd6rew91vlyX@mwanda>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--okIF8e36h8BpM+kW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 01:06:41PM +0300, Dan Carpenter wrote:
> We need to add a check for if the kzalloc() fails.
>=20
> Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP261=
5 Digital Audio Bridge")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-current, thanks!


--okIF8e36h8BpM+kW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPr04ACgkQFA3kzBSg
KbYxTA/9E1vfdqgGn1HCNHaXW0Oy7WPWUVowANRpEqEFaImyQRBF/VRIkbOuhgrA
zPijdyJu9EL1bYGDm7q7xNbDcMqvYXKSgBpd2ex1f7uzASAGlNmpyS5zoeRnucul
pIBugO74fZsqTueP65gGvJH7OpVyRpBup/u2qqvzepIT7RqFonvgZ7beOe1mwT5C
n0+EnpYm9qCsBfGhDKiwM4bJbyhs67a7mreD4xhfuS+wifUuEV50o2/+xndN2PS7
kScFrHrRYI6orSOfj4Vb085ZjlQV7ZTZS/bP0QyODf07jczvyaapXkFSi3c/pn3z
SjX06sM+VJuZEVTXmJ2hQj2yeBuU+ODHtyweqpqeab6jPLuNZoZn525MVeE+clzr
EZr+NjgPLAeWvxf2yW3Rs8U3d2bToB67HiD9iIhMkN89w3FHCvOtQQP6z5K8bXF1
tAGgxHsuoajC/cVGjrLMQul1NZAgcB0pw+KCZrgkmMmfXJpMpZZyiWrdiGlbYDbe
ZPg0BaWpvU5xr4GExoStfEeZHhX6z9xE9FxCc/5k19CKMpB162Ekib87Av0QcY8e
lM/YWOzbGCZgh5BjiaKj69sPDvbdaCqhNuCouWWuztlpq2yneCEfYTedrLcCxXy/
/19oFmOYEAg/47IbrmhY28ci8ilnZXmzXTOcRpgChpKgZo5vmNc=
=RV3R
-----END PGP SIGNATURE-----

--okIF8e36h8BpM+kW--
