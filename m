Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F84D358EF9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhDHVJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:09:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHVJl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:09:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED8B461179;
        Thu,  8 Apr 2021 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617916169;
        bh=jmmiAQ3/3Nld0eIHxTzasEdhZ36acaoEhxQzJnc9POg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iV/JZfQvh74ceIcn5MbbNOF/9HqyICfi0zHPNMnwZg/uqrIKKxikLf+o85/lHlS9P
         jYUHHN5/J30jvpCsxyRmjIECW1pD6dXC7gcZpc7pvT8XoVjEOlC7b+pxNqOJV3J5Y8
         6RCDhgPZ1seOsF4ma6raY3dCCmKNVOTkcUduZM1ndzqF8htpNMm+gyg8Ns6DYZg70B
         swxjVqLM8KJKi/RQqy1H4q+jBfD852o8uZYdu9yyGvaFHcmiUCbDzKdwIukDpciCfR
         QHhmjrKEZeS2lXs7BKIq6qBX6C9SgjqEvGj/Ma0WcNDS2D6h4xfMcWCe0ePVFXe/U+
         uYQl243BZGZ3A==
Date:   Thu, 8 Apr 2021 23:09:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: xgene-slimpro: remove unused including
 <linux/version.h>
Message-ID: <20210408210927.GI1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617326273-51659-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Az4VpBrmI9+OyhK/"
Content-Disposition: inline
In-Reply-To: <1617326273-51659-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Az4VpBrmI9+OyhK/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 09:17:53AM +0800, Tian Tao wrote:
> Remove including <linux/version.h> that don't need it.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>

Applied to for-next (squashed), thanks!


--Az4VpBrmI9+OyhK/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvcQYACgkQFA3kzBSg
KbZFVA//YWPPjTVc9e8dKA0ZWwqCXm2sK/KjB4u51BjW0gnFfa3+wMaSdKIFtJ8L
qZfp0o/CHdwTaCSG2oRVIpmNXjIdx9K64bU3fO8zaMfFtanE2FUc5JCQctACQa+o
vFpawxp2JorhHAnWiKo6AERKHTdoaC0kn8yDIwxi3vVemO+/lfeMUvMAIcs+dmQH
dIlRrLlCqwSoYUfWazJWIZQ6NojVozZtp32odZXOxW1I7Bx7SWyO4t3/oJAd5NDZ
yl6W5vKFkqa8H2g6WYdmlaocLSdGlc4p36tFOC+FuxLycDurBiZ0JwmywSwWCHQM
jyw/CrKewpjXzjx8TjdMOL8JFkMY1hs5NEl8/0j0jwjsp6L0+wu6o5Xla1G70K2k
9cTZ/gqAX3HSlpw+DWGvN0T/4mZtdLoycX5HRdiMaTLuhG7K/5IQThewNQ/iYUF6
rjxaui7QJV+6vCjJzy+BmL63xLGKLTLg6fY6nXXbQYURhIEx7+7O3JCTrNdkdaXG
X3ZuM6hl+v0FALbF7JUJWzjH8tW7MRTkFrIkRzL6Q+KKKAZf0xpbCGnCw5A/JjwM
VfJokISbso8OgRLMYOuAy/ic2IYI7f5RL2nbS0MpiRgARnX350C3Q1qMkrUgWXh2
mIpWbJxwq32EzBVNO5OfziU20IsSDKUqeqMZreuRb1O9IeZo2P4=
=DMLO
-----END PGP SIGNATURE-----

--Az4VpBrmI9+OyhK/--
