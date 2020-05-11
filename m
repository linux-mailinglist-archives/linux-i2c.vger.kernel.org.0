Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FD81CE468
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 21:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731376AbgEKT2O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 15:28:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731041AbgEKT2O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 15:28:14 -0400
Received: from localhost (p54B33735.dip0.t-ipconnect.de [84.179.55.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72E8720736;
        Mon, 11 May 2020 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589225294;
        bh=FMwzC3cALZ1gMh74zM2EdN04monzRvOqcDXsP/XMYfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UrKMbmSv5YAwrVOtA8tfs2ILIeXJZz/MQMTYqXgwWoH7UYeSZseBS/qE7WrwVB40G
         GMzJwTAqgg4xYqQvlMNQBCkdgCd9SbBoLkgB5BAi/27uJlQt13m+0pDAZarmyAyNZX
         bQbr9ASBhxN41RwGwwY42o/5gwQhFjthIb/NOh2g=
Date:   Mon, 11 May 2020 21:28:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: algo-pca: update contact email
Message-ID: <20200511192810.GB8724@ninjato>
References: <20200502142650.19089-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <20200502142650.19089-1-wsa@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2020 at 04:26:49PM +0200, Wolfram Sang wrote:
> The 'pengutronix' address is defunct for years. Use the proper contact
> address.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl65p0oACgkQFA3kzBSg
KbYuJQ//ZJOhNkugBIt2mTUQ5fqsVlAk5C17ICHev/VWCnnHBBt8ikztnUS9oRRF
/zcYWLpuPsehIthFFEfVNRUIGyq6yKrLAFBd3Njw4U1WKf6okjLl5jyEiVwNsh7d
6Gh95AQiXg5rKxbrzBT83qzP1BQszxevsvCUGkcTE+wwHphA1ghnNb/3P/acV94G
4o7g/FreFNXzOldohVlMTKjNjCc/35PSAUvBIol6kZQnE5EoGPEoMtgBD7LaDRHv
5HUgEv/EMv9tobc/+RSCCHZ470ociwg/NX+ay+GyBAvXC3aoSwvIzvHB1E1daRyG
yy7RetqWN2AU+t3DB5pdM4R5iXuuL9jgfYQJ0iX1Y1Rj8q0RnuMG/ziZPx3IP+YW
J4jw6Wv16q0yORj1N+/2PA7WEgr8G6F5mf5BQBld0wQewuXl9Y4ROOQueGDdodJe
xzn2j5VXba3sLgBY3/oWNDb/4nFPgZwm1tgcLS+tBaH9xbUImcPUJN5AwfDe8Xwn
ImI2aZnRjQ5E3YjgSTTofCvHUICQDfBhJWO9NG7XWnLGf9HJ6QMGnudfBcZ2O2+u
b77q69D8Btg1Byx9aiwPJ0GGEdyw2+BQm6cNdUm4vFxkDgofPB2TNtfs9+oMJfr9
anzWj7HJ93Whqr64jo3YwzUTElPIm7KSMZ6aRywCSYfy7Br65lU=
=tZcz
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
