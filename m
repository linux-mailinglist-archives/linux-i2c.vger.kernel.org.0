Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D40622DEFF
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 14:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgGZMbE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 08:31:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:38860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgGZMbE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 08:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0JEtMtN9kTaYeMH58+bFtuMWbZFY
        WQp8wGFE/7cVTbQ=; b=fJIlkWY9HWboO2Zwhj9uWNc6bimkmn0ClWJW/eDxEIwb
        wOln5FTkGysiolcppterXf0dRO8XCKHOEQB4Wvfsy2h4PvVkRVBxiBZ2uz951UJX
        6dR0TcZC7KeX7NacT3CsVLy2PJi0Uu/uZ7fIF0LyuU74Q1UidbNCn92suQmN0xQ=
Received: (qmail 39530 invoked from network); 26 Jul 2020 14:31:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2020 14:31:01 +0200
X-UD-Smtp-Session: l3s3148p1@OocDYVerkI8gAwDPXy27AOM4pzPBFrIA
Date:   Sun, 26 Jul 2020 14:30:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: rcar: slave: only send STOP event when we have
 been addressed
Message-ID: <20200726123058.GA2484@ninjato>
References: <20200629161506.20617-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20200629161506.20617-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 06:15:06PM +0200, Wolfram Sang wrote:
> When the SSR interrupt is activated, it will detect every STOP condition
> on the bus, not only the ones after we have been addressed. So, enable
> this interrupt only after we have been addressed, and disable it
> otherwise.
>=20
> Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Change since v1: It is probably cleaner to clear the SSR flag before we
> enable the SSR interrupt.

I am going to apply v1 of this patch. The above is not cleaner. It is
cleaner to clear SAR only when we are done with everything to make sure
SCL is stretched long enough. Clearing SSR a tad later is still good
enough.


--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8dd34ACgkQFA3kzBSg
KbYprQ//RND6q39bLuiWy6FpbE2EDX5aRtnfd7V7AmEaq7vJ037clmm617j4TJPl
7XVIZWq5dhYAzVIJVfmXBWeG7AnyIStG1qaQiUVaYojH5oij34nBZRU7luIl9SYp
h8z+MudPdn8FjD+fGI7QW8JJt6vZiGarOj1k+e2fVj6rY56YNKS87uAtc/csi9Rn
YakDOc8qhtFf5DpG6trGBubFki4dI8cU3XzPkn5Hg1Iiowi309qPlmWDFfuB/1qp
q0E11vrVhFifcC5emP11p46GsCVWzl6cp3u5o+s6AuZzNG/9Sa7jic4szVTajHlf
ZfEkmm3yFB5o8rq1ZwvtvnB6bfsVd5CXn+gGbKHIVSGX9pPj2DYHhhaS87hOIH56
QZqwFwBH1tDQ/H1XlByrDzk1Uog3ANbhpOwskb4eSCKXtAMbU64AVYzC/JOhil5m
rsf/ZLul7Vs7EJiVzenQ4PqbX0OEBCXzchG8/v+MKUTM5SDLe21IiSps0bLR3LGA
Mn/dVFDZoPDowSsbqByI+BfLtgHZA7l6hC2CvagYiEu+Jq+cF8LAAm6URl7gEiC+
C5OSNmUc2RYlx6sEio8XoaqPC1x7QoxljQY4U8O4cbMseEXnLKkbJ8vDoknmes1j
tfpdTkK+jjYAgWBHr3Sd+7nvy4LgkJ7xLYRyYE3+zumL0vNRHpQ=
=1n+N
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
