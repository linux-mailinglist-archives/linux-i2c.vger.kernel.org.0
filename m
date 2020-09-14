Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2680F26874D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 10:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgINIhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 04:37:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:49678 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgINIhA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 04:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qAXJ2q2zrUjiF1S7odbZUQnIo/0V
        jFXOWDG4EsWruKc=; b=WMiq6lY8tQajxSs9r1KK6UvdtU0k9MJujis42m+F3HOF
        12LBFbfYEXC7H/ZbSUusRlgBMUpen2F+LdAI8fpvBK25hSgQABYkBDRZLAWqo8f7
        vKiEamdov+Se+PBlTABGeGLsF34Ydz76OeB208TF7WnfEa1uqPw9Ww7pV8tn6jE=
Received: (qmail 1792916 invoked from network); 14 Sep 2020 10:36:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2020 10:36:57 +0200
X-UD-Smtp-Session: l3s3148p1@htn370GvhuEgAwDPXwXYAPlEQEA0NVnc
Date:   Mon, 14 Sep 2020 10:36:57 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH v2 1/1] i2c: add slave testunit driver
Message-ID: <20200914083657.GA8570@ninjato>
References: <20200914071737.6354-1-wsa+renesas@sang-engineering.com>
 <20200914071737.6354-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20200914071737.6354-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 09:17:37AM +0200, Wolfram Sang wrote:
> Here is an I2C slave backend driver which allows to test some uncommon
> functionalities of the I2C and SMBus world. Usually, you need specific
> devices to test e.g. SMBus Host Notify and such. With this driver you
> just need the slave interface of another I2C controller.
>=20
> This initial version has testcases for multi-master and SMBus Host
> Notify. Already planned but not yet implemented are SMBus Alert and
> messages with I2C_M_RECV_LEN.
>=20
> Please read the documentation for further details.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I forgot a tag. Because changes were small, this is still:

Tested-by: Alain Volmat <alain.volmat@st.com>


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9fK6UACgkQFA3kzBSg
Kbb7RRAAoXo/8zbsGlCxxYukNtz9AgnhDWy0qS7WksmZc8wfU3KVx6Y/bI2DBTM5
O2ly6PCb1Wn+h9oDzlqg7fi5KZ3fdH3SA4u3TXH1XS/3Tez1Hn6nGWlwME4/xq51
Luh8mX0m8VqGBVyIZneGxe09L1SIGM5EdjcwEHBgSVyedDMOtv1Jn0cvxZdF9roq
4V8zjoAWw9R4UJ5CipuJ/aLMDzJH9kKU6vjTItPvveazAYC2VmEIxx3hYUvv6GK6
LxN27fDzs3Gg5EbPkbR+0WOD0rS0oGtsS+9SNzUpNo4kOJMATrHw1v0BgDsr6A9P
pDlm9CTLdQEh6XHVNXMMrIMOVt/4pr8bKr2HWR835HbOktpKdLGMoouVIsRaYwWH
xqrARE2OwiibK+xYqhwcDKhNvaejSwR+GKaVX+1WCAllNhU4mzfCxBujP90icMnl
g2Gh48MAmFwizZ+bg8jAPiu6+dAb/p6yOzUjFpYV99aXBUm460by0ojIUyjbWYiM
tZqGl6ZL7ebPQ0lHfMUGU+IjtkD/0GI4qTOSe/tDuq5+wausFnQ5FuWIYdOeqqjD
HoZLomYJykepfI9I3pH37KbEU3ooxKq29zGPO8ZQb2JCcX8Orzq4Td1XGZPMNdIM
Hoyt+BsdVUE+kEDx7vpaQ4k5mhKVnRm95b0LxIlDboWpHlgOwpY=
=TZZ9
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
