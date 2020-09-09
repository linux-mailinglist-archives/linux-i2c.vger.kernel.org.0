Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C098A262A8D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIIjy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:39:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgIIIjx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:39:53 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79E3B215A4;
        Wed,  9 Sep 2020 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599640793;
        bh=8XEwCJdH8trsu8T/gd+RIVCXaoeI6Ibj6+vvgipWRxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=woc2gl+8Zg8c/9HA+Wat8GGHtledWTXvxjTv7NNC9uAThk6RzMNPqN3xfKtFj9rGu
         BBkFOqf5ZRa6AQxXLUODCMfsXH8k6nox45Fc4Vcgm4aMnXMeLP8t2XXKMvFBdv7J9t
         JbVmPWWYEbIzvuy+b2hUicWkq0fqqgyPm+Kj57v8=
Date:   Wed, 9 Sep 2020 10:39:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v3 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200909083950.GF2272@ninjato>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
 <1596431876-24115-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <1596431876-24115-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 07:17:55AM +0200, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
>=20
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
>=20
> This commit introduces two new core functions
>   * i2c_new_slave_host_notify_device
>   * i2c_free_slave_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YlNUACgkQFA3kzBSg
KbargA/+Mx0jnagcE3Z5BZha8at8CzPwiC7r5rtL8V3E4h2lUgCjOzXnDoLgpWZu
u6VY2U7RO1n86oOlzzT6yQ/SDT5LouaGfs5ytpMn20A8P5H0zORi5vHERmTHeJ/J
JjLuhD+2UrnFAVGLhylRNl66/qSMyV22aSSKMWVDvBbj7X9bktLg70QhimmJWFf+
YW9HY2N3eot8+KgqiB6asAACGdNbCUMy/gYWv5ZmvTE7f9fPUdxFVcxKr0Eueg8e
a7o9tXRMf6Wpa/Vz4U/KXCX+Kqwz6cdWwWLqNWKkoFXR52AWML+hQ1eo4y3G7lJK
JqQ+kR2FwaH3t0xuc4tjtAcI2sPWZEjcMFJ9Bvje3ms/NcX/KHtlzPlXO/OJcC6b
omu0QLVcgeDmIVn3d9LM45nSkOqwt+ZQKYdu6ZzlR0l9DhVDVz2ma//4iZpQ3wBL
5euK8TGjlA1I8KkKOEfvV9xoZrazaUj3EUf38ujAtV8RPkglluKxQIkpDitNSvAB
SCD5UbcFYDtLLXNCGuxF6zAgc5OlIxDCxTDlyWt26WgSFY+DKUP+ZDfbdbyU2gol
83CZMVihVcfsTFbDFSvznACXuQS1X8ziVZ/Pn3mfWCMBkmH3Aosca7T+iDXogV2l
w7zQxNCJI9VY1913TCeHU4SHSJ/I8YFBYmKqlgLs6zxrsRI4UPg=
=i7Ml
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
