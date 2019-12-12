Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB6611D25E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 17:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbfLLQd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 11:33:27 -0500
Received: from sauhun.de ([88.99.104.3]:37048 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729591AbfLLQd1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Dec 2019 11:33:27 -0500
Received: from localhost (p54B331D1.dip0.t-ipconnect.de [84.179.49.209])
        by pokefinder.org (Postfix) with ESMTPSA id 7C6252C04D8;
        Thu, 12 Dec 2019 17:33:23 +0100 (CET)
Date:   Thu, 12 Dec 2019 17:33:15 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
        lee.jones@linaro.org, lars@metafoo.de, pascal.huerst@gmail.com
Subject: Re: [PATCH 07/10] i2c: Add driver for AD242x bus controller
Message-ID: <20191212163315.GA3932@kunai>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
 <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luca,

thanks for the review!

> good, but I think there's a problem in this function. A "normal"
> master_xfer function issues a repeated start between one msg and the
> next one, at least in the typical case where all msgs have the same
> slave address. Your implementation breaks repeated start. At first sight
> we might need more complex code here to coalesce all consecutive msgs
> with the same address into a single i2c_transfer() call.

Note that it is by far the standard case that all messages in a transfer
have the same client address (99,999%?). But technically, this is not a
requirement and the repeated start on the bus is totally independent of
the addresses used. It is just a master wanting to send without being
interrupted by another master.

   Wolfram


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3ya8cACgkQFA3kzBSg
KbZBdQ/6ApPjJEPmloupECtcOPxRdHIBMJSbDi9HpBk6QSvFwtknvv6ybcJHJ3Dc
2GkbUK4EAcDvvDx4mTqhw7t8JPay3Bu3O13a/wXP5PDb7DeHJ5xDaBsEYVLC9id2
E1I5aEfdrrxsL1HFUZn86BmmthMuupvelZAyfL7pXDT3AU5oNkPipfKzoiC0EiBP
MPu2HN8BIX7l1ECvOL9j0pZYCfz00UHA4PtWHwz7zjiCG7RmY3qlm6xw5l6XFeq3
wbcmTXcLr8OIG/8sw0PMJjJFqHfH9Vlj8aYcRrsgjDEHQbSTKAQ/RTDw9rcmAktW
/1u6RUea0ckwX6rhKWZSXVktPzCV5LWaywD6lsMGXxhF/0T2tvKRqV6+xIngUY3n
8KnzpK2i3gvLmP9BYYxa/BM8qiuR4SimZi35lmofttUzXUs/5fgJwxFg2UuJqpPD
Ex/lyLc1AUbRRp8mDsSMsGg7Ku6WUt5T7OxmVjzvIYPLJ84GlTvZLA4WIskzWFVw
aZ2+E4YZq35snfMfawdrDmTOOmNOEPfVuT5Cm2ul1HVTprAgF/DVkQHVWPzNtOo9
xxwPgX9lrN0I+Ek2F1kSJguphMzVjIFRvFCl77TJUQ7qvBEWYDLQs1hBdmXieBxA
bNZoxeVI6DmFF5qTxkQ3Qh9NUGWkPKuslRF2Fh7dWQIoS9FauJo=
=Gmcp
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
