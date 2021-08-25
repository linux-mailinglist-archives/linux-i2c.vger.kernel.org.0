Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1113F7D83
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Aug 2021 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhHYVK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Aug 2021 17:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233928AbhHYVK5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Aug 2021 17:10:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1BDC610D1;
        Wed, 25 Aug 2021 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629925811;
        bh=3fxQsM8jTDoVZY+kIl31I1WMOgxI+nNNgoj5Dkcoy8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AqCiZagHkRFH+e6bcQThjUjsmkSe30NDH23HQQjgNnScSytTUNavQmxg66zGAjPqm
         AEmc8OHTtm65XMj7R9m7vNHVsSlY/V9SBF/7PEJOVa0A/dJ+qmfW+CjXlPOBER6dQA
         udono6MlOanX3xDFMj/OlxGTGignvWMFjyI1Nsi5GWtXpgV/8BwU8JdzZRSZfrnbb2
         tZd/lwFqaanxWXfqRKBlFU0qGGXg1Du4ycrZzQcsbRxMlNJLamcdrv6iNCE4ql8Q8N
         zNYqgY3a4Gm9cQitZKH3k4cC4Xhkpz5crz4/cw3q+LHz/jAJT7XuVtt3l/aIAftdbd
         IzQEPSJ6bo+qg==
Date:   Wed, 25 Aug 2021 23:10:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     git@xilinx.com, linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com
Subject: Re: [PATCH] i2c: cadence: Implement save restore
Message-ID: <YSaxr5SNwELgXe6V@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, git@xilinx.com,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com
References: <20210713070011.28254-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TaT9jZDY9HVPVPQU"
Content-Disposition: inline
In-Reply-To: <20210713070011.28254-1-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TaT9jZDY9HVPVPQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 12:30:11PM +0530, Shubhrajyoti Datta wrote:
> The zynqmp platform now supports chip-off so the registers can
> lose context.
> Implement save restore for i2c module.
> Since we have only a couple of registers
> an unconditional restore is done.
>=20
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--TaT9jZDY9HVPVPQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEmsa8ACgkQFA3kzBSg
KbYECBAAiCnXYkELkXs6w/0pwehQfZrXjnJlsNY+Cgvy1jmzFWqq4sGReHTxfKZR
DdZaE3Fawd6QmUybtt9o7MKrZV4s3RD/kP1jKfMdU0LHUfOwxjWP17ipH3DdUGN/
JjqAI7cvNkouOx0y22ff0LS0UxxLtfv/gVXORcokCRjdQTer1v+5a3wX6ttP0ZEj
YrH5reMcTIvfwoAwLi7k4SYfVPTcke5f6iEymW4KkotLZ/CdpzT2qC9IBnMEEQqC
EDwnI5KcKpoEgx0qoBVF3Y8wM2x6NXpHaY9LMOWvui93gf8z3sMY+uO+mki3+t78
I5EpRfE5hYlfKqwqjwtU7EZ8eGRYaGMpr8VMlm7QqbrN9xEVBnI66TcOS36oDaeV
uUCA8ML4WvP2T/eEscKEyjt7io0l9ZYVfsfk0KZy46e7mE8FiP4mE/SBZ1cJnAvn
6heLA8uWdDfRY38olfCNPAEDhlqIEsywMHuuRwMenI0plcOtjNQWTF1GNhYCuc6M
WCRAEwDsMs731MShgbW4pViwiX/8b/1utiPx29mYp2Ch2JTXokHZerrQAGmVfrnI
o3AwW7hHBE8gUeItdwa6t/qKuHd3yXGE0WGGd7Ujy6UHvYlr+qEdc8aHT7wlGT53
NCRwmIhELPLgc7AY3B7/slu/4lq6OAIixqmocRTpFvUMNEF8HxI=
=UUog
-----END PGP SIGNATURE-----

--TaT9jZDY9HVPVPQU--
