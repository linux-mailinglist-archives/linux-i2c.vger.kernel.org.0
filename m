Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880403547C5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhDEUqo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:46:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235691AbhDEUqo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:46:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 873A6613C6;
        Mon,  5 Apr 2021 20:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617655597;
        bh=VXB8zcLzBuhYCNZnsEDXzsGeFF9fwirsrMWTzxsfM/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=up7TTddvURufbxq1GqQpc6UJSHkI9aqWn+l/QDDrtc0Xku7EpMZQPd0h2t6henwWo
         JBSpUiU8x+mDWhpCpYDVK1V+DhU970jsMbjjGo4i9Pf/3xc2zcbh/hnPx4mnRoYrxS
         0otVuP7IBx0R0kcXZfVplqaderuSwOhBTs40uYnXWiQ6NLtpzv9NcHsu/9o9f17l18
         JO4SsKLRxbKh6Ekw3c3gvMI3T8QOipAt94pXLbi0kAl4kG0BgsAhe6pA94NBujq7Nj
         uxZy6QSZGkGtIxeRcH+pQro/GJsoK5vNRC4Tu9SJWh/QXvJ0LWNKCJtqhcgV/Jt9s5
         g4uBC6ZUvIVag==
Date:   Mon, 5 Apr 2021 22:46:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210405204632.GB3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210331191921.1066172-1-bence98@sch.bme.hu>
 <20210331191921.1066172-3-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20210331191921.1066172-3-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 07:19:21PM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> Create an i2c_adapter for CP2615's I2C master interface
>=20
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

Switched to '__packed', add some more 'static', added <module.h>, and
applied to for-next, thanks!


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBrdygACgkQFA3kzBSg
KbbbEhAAmnHWFjXh3DefYK7/coiLCZ0fhmKGrBFNKeXmdh/JAKyWogYz2WJFTVJZ
snkXzL1R5CQSRlkOwyco2VobU3spd2K++uWCHI3XvN6+jLtPwoFUjvGUgJqG2do+
99SBy5K1kklWhxIq6RruiFca5PCAZSiW0YGg1tMJhqcb5mHUKFFhqT/dTE8e6yKs
CSBpYGMdPKw745NYD/nM87H9wW6Bvm2yG/eiwb+1AwMaL5NZZYu6p+ypbYdR1MO0
Hre9Pee1a/gOMXmyyp2NwAKMmHFAvAjG4PnwDfYQCzjFgOYnl3ywItX9wvah0MjF
Io99/O9WOpIPUX74MPyfJDwL8OnVjRDMajJgqsSmcf5AJVbN5hxNP81ty/DaQyxD
GUHfzkTcncjUbJW0zGvRZFkmnQx/seq2hV2Trr9y/Q8GNJz//2EMkM8wGtokaOPn
qujv1sxzvoHT3HSoecNq6tSYtG9q5aUfT0KYRo93XS7//Hw7addApVwp9Cv4AbX6
d1S+fzkuoRf5UP7WtKLf/Yvn4235x6b2UIskngh6V8sMBhwJMKuTOJsMWGsGuTMs
8H3HBj/nOuGdpJuMZlGYyAIcBZOazb3FB02fleS575UiJiMFi4U3HHzxHAy0vT/P
duHnEWC+hikYaf6oKlHsTf9GmXerwzUfrQG0DuRTvS0rMuf0rkc=
=5tXx
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
