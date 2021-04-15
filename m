Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1019361361
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 22:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbhDOUUD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 16:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235326AbhDOUUB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 16:20:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B3AF6101C;
        Thu, 15 Apr 2021 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618517978;
        bh=yAbWbMoOThDBMD78Afb1Hhb0xzAEM3MhGqdKoiAqF9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASGiOXybLGBN9jky71hzUL63CN23ZTbqiyqPyd7trogRfIBbUJ94NZUfXaGzL3qao
         M22ns77dO0DGQjlD4aSJrUDrnJRA5gvGnMlQAXV88TLRUB7QaKqK3LQohhS1AZgQZK
         TWIeT3cURYQ1AebYCwegPMUw8vj7eH/Ag1EDVr6i4/rXjU+GQVZuDRvvn0YBeZcuMI
         f0h/1rH+4I3rzaTYoIjy79kIkyVe/908IujhGGDfKmY/Ur32F0bMv22FpyLV86oE39
         VZwEhKAfDER1L+AMqUA4MOxzFOn0W4HaAn8i/Yt7VA9LIqdqHLxEUQZJoAELU6qsna
         WzbspCNRt7GqQ==
Date:   Thu, 15 Apr 2021 22:19:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix 'assignment to __be16' warning
Message-ID: <20210415201926.GE2360@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210412115302.95686-1-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline
In-Reply-To: <20210412115302.95686-1-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bence,

On Mon, Apr 12, 2021 at 11:53:02AM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> While the preamble field _is_ technically big-endian, its value is always=
 0x2A2A,
> which is the same in either endianness, therefore it should be u16 instea=
d.

Why should it be u16? I don't see it.

I thought the fix would be to add the suffix 'U' to 0x2A2A when it is
assigned to preamble?

Also, please use "i2c: cp2615: <patch header>" in the $subject

Happy hacking,

   Wolfram


--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB4n80ACgkQFA3kzBSg
KbaIyw//QJqkdQCzK2VDX58T2MDqDK7YvdjmX1PpBnj4ioPj9LVkr4ewykmliTRS
m+CkGtxNplY3jila/8m4GDmqepAfZKRTGkS2rh2ndYKIJ8IYDlPhMEtDGoQeF2Ya
1GMVo++AMcdxMZ6FuXXT55YDqZsknpZnFXUhDRzorexfhqL4rjA9tmXu69bC9Vzb
mtlY+Ge6gNyL0PFupPUm0s6vZtfQ5GYo6rv3VMHk9SG0GBMLdeL+3BrGZWILDOIs
LOhFeqCFz6UMGoFW28qj3lERRVZ63p3+1qnqZ5opU591oDoGcvFqKjormGSuimd2
5TnCMXr9iLa3J7JJRfg763OAzkC2oWuzLO+IPkl60UVprzkenbkpxUGE/qwqpmwp
aLzyngu5t77NJK7SMg4e0XkcRVheB76Yn5GroxEAF8UaVchFdaT6xhaQ7EqMPXVP
AYUyGZ9GMZNvcWJxcsZpwqcCe/3/VB1XXvuNBh/UIo1iqk8ZtLAWvVDhWqGv8ge0
mti9N79lDbkYI0Cgij/jtmyUGIjCUghWKgY7mr73L9R/AFdNibuP1wnpGc3zZ4W2
1u5mNerAxtRbesbAC/hqjLQSan47/oEqAP464V1xD83UbKpnUk7H4TBpxcWpxYlf
1JMAL5NJbetQMs6jTUA3Zl2hXO/a0KokHVEHxShHIkhv/IuJEbk=
=WjyG
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
