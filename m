Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAAF23E18D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 20:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgHFSz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 14:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725272AbgHFSz5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 14:55:57 -0400
Received: from localhost (p54b33091.dip0.t-ipconnect.de [84.179.48.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58974206A2;
        Thu,  6 Aug 2020 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596740156;
        bh=A0RxuMBDs8YVZ68KVpgmTmoB35If8tRF1d4VGb8zb70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=09QoYIxV7sEUaDz4GsSiL0vorlrVWhWyDOPrF4Cxidv44UbOjegA0FneH8kR4WEV3
         f/h/Sm5ZF+3XAVx0xxkhpIdNlmvCuBptiqCP9AU1va7zweZEu4gTV3ZznT4XnTsE6f
         ycBSXkOMZc81ES9BCE9XHlegnWXeDhT5dRERCyVA=
Date:   Thu, 6 Aug 2020 20:55:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200806185550.GA1065@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200806161456.8680-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20200806161456.8680-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 06:14:56PM +0200, Stephen Kitt wrote:
> All the drivers have long since been upgraded, and all the important
> information here is also included in the "Implementing I2C device
> drivers" guide.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8sUjIACgkQFA3kzBSg
Kbad+xAAnDMozlGctjClliBlAElwnj4gKRUJNQQWuAiC0Xs24iecO6NRqSHUpeDb
k0KK6wR8pSadhl+R3vbceP7pLOBqqDrnY0TDg1oOwroV1+HQqKatzelCpqaaz34X
s+AtjNVZNWrXPlksQmNXzMx+miyKVFnlL6Cfd3jyNaVKyqmCXzH57XUwvaw5SBAU
1Dq2vwzMYxx8pBuh+Ju4Z7q67jNfbHuc3AyKQqXLGKqyHE4cIVveWGDEp+UMt0Y+
B6DEsv0cQ4IZPc+G8M7deGdTAU/OnlQciOw8YQYwUmXkSt1laU7DYTGJUmpEu56Q
nMjzkmwFyAb50D30pIwPf5mP5oEbNG0kCtWWhNEmiztF2ogqNC7C3gDjjyfjW360
e4v5haxJf9oNGpQacVDq4mxcVQ6kn+BKvTLscFKrr5KFVfgh53fOTLpQjzTeRUOC
pPJUQQJqYU66MDp1LUwir/pJpYSy2bmkbaVDRAeX2EEj18rh/LaDLkfGPb1Y1YqI
76waUzuuOxTY7mDm9XLnwEbGXJBEkeaBGSa0G19imGrZc+e2TrL1wTy01/FyEdp3
NEyXW27wGWAHO9JXWsea83P+VnxydiZiy1TU7TYzXC9DGthjUsG71j72o5m5NZiz
5qAPV7AXnIc+UfbQ6w4rvSRmbqZ6sPpTYI2DTrzy0EvvnO/oGeE=
=2ShD
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
