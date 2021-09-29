Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF8641CDC3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 23:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345693AbhI2VHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 17:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345622AbhI2VHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 17:07:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10E4E613A9;
        Wed, 29 Sep 2021 21:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632949548;
        bh=8sCsi7TyoxymnGSEmmhFlF0PCXT1AYj6AJXXSW0oxKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nyBK/CYfnjKioP3uhpui9gx1fvyTFkpC1vdmr43hE7LADGm1/MCesl24upmF45H4n
         Vhc0YSSCzJBFsDtOHt8KTj36BU2k1npeQMPs2+bzqThgBJusiESgIF4MqehDEoXXxI
         01x0NlC0vgyXRaObh+GUtwcLf0T2xrkXWEpxfceirnUZHmSrVoNyK50qWa8ONcXM0I
         mnl1qBHoKRl4OgKB4Np49sYsTjc6aY13d/cjWAuVDa3CoSe1Pok4LX6k11zaEJgLGf
         WHEAGNHW9g4KE1w2JdAMaD41miIg/iFFJ8ITaE2knOc8Mg58TOMcdFcoyxVGovzz6K
         aUwPV43Unh7QQ==
Date:   Wed, 29 Sep 2021 23:05:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     zhaoxiao <long870912@gmail.com>
Cc:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Fix return value of bcm_kona_i2c_probe()
Message-ID: <YVTVKYPXqXlbqcQa@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        zhaoxiao <long870912@gmail.com>, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210906052730.19644-1-long870912@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WlqaMbHcI9I8LDgG"
Content-Disposition: inline
In-Reply-To: <20210906052730.19644-1-long870912@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WlqaMbHcI9I8LDgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 01:27:30PM +0800, zhaoxiao wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR=
()
> to check the return value and return PTR_ERR() if failed.
>=20
> Signed-off-by: zhaoxiao <long870912@gmail.com>

Applied to for-next, thanks!


--WlqaMbHcI9I8LDgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFU1SkACgkQFA3kzBSg
KbZmOhAAqVR8fjEWZ9lqsq8bARILHauv+gqBakob4IjaoJck7Q5lr1h4z7kKfMMa
98x+xvmHxMuz7GwImXokFIYteVb4NoTGgFJvAyhkuzCYFEaieWGqf02kFSjPXb4D
r1naEvGjqShMityL/wemiFPcAvjnZ7vcUW0UJr8p03WzfosEwRshj3M5PPBHUx+q
RMqpomnt/UrP8ShBKxl/JfdoY6uz4EWSfPkehz0m3q+P4mcEL2Rd5F/4PwXvBTBD
zCQevE7nb2MqIUZMveu9jVlFYBqV/BoE2oJVjGHJIYq6sVkJZCsPvdNkkdSLQBa4
DC8bQz+SuRBPfz59Li1KLoYTiJ74NGGeWZMA/WnUQikMzT+79rFg9BycQdhUOff8
YmWiFkf2a3RNX+633Uz6WGg5xFvBhEk5K9aTTm4ZQ2RXAE3CZ7yzM81XUsIENctQ
1sfHzkK5sREsPN1hXoiIEqwzarY62LM2d/6iiXP3YO7ijyIl9+pN8+tCR8Zb7V9/
OcDnegH6WvPSPqNH6BQCzBzGyx95nhuDyWNphkHX1ZkbfKufuErhmVYDtcgpomJL
LgEHvlPIFKmCKh1/UjwbgyYx1+LVX4kuEJCACDfiNhxrYJJyqzM9d1F8DzB/N2zt
dlPEMeC2edlnunmEIiGmDZYEDkv+BuS3kc1m5tr/dd30G49+0/I=
=I7eT
-----END PGP SIGNATURE-----

--WlqaMbHcI9I8LDgG--
