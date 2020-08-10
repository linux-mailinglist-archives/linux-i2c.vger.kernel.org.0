Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3D0240457
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHJJ5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:57:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:57084 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbgHJJ5N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6Gf52yMOeu/44c16QGIqJUtKLRRv
        91leeJDy8jP7Gc0=; b=bjCHQdW3IrGXWj6d5H56vyrhHcXeLUv/BCpcG+h6MXu4
        jHFqf5PmeOENcq2Mn0wKAiaEF1SVPwVCKNCMChd6gRwOuRDT0WuCOHkBKwCn/x7h
        i2eacCJtLfxP61h4LfOflAo6ho7AN82lOEculx5codgOHr5jsWcEk/Xucj1n7KI=
Received: (qmail 245491 invoked from network); 10 Aug 2020 11:57:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2020 11:57:11 +0200
X-UD-Smtp-Session: l3s3148p1@60l++oKsYowgAwDPXwSPAL7JJknG4hOy
Date:   Mon, 10 Aug 2020 11:57:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools] add BUGS section to manpages
Message-ID: <20200810095710.GG1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Content-Disposition: inline
In-Reply-To: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 04:54:21PM +0200, Wolfram Sang wrote:
> For all manpages installed on my Debian system, add a BUGS section, so
> people can easily find whom to contact.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xGfYACgkQFA3kzBSg
KbY8wg//cceCjjBqQJBxRNI4nxoD8vuhbWUGrGmiWZTTTQdNKAzCPfFCKu8mJChI
A4v4nMn5E17L7//Lvdn21y1gYW5F8aM3Jjb6asVDkez9NATlPMerVpkGELr3bmJB
UJjA3Qkcn2erV8HOmHtlusZ3Pg1uaYvgJ5Ss56XdsH4F36+FUHSux8ebChz7uOOm
A20feZWDamDonUKLIQT46nbPWdxE9YYUv4wcfHG+QCwQu4+0ypLjrkfRM5V+Dve+
ALFjfavU60WoKNoe6qqcaqGz4apk7m7fooiHKulB1q9wcdrVsjNksxjuUdhwalvZ
mk6wvRn1VIDvInGaV032ib19bQdTndO/3eIVI1g8YfpRzbBhD8X3ZfwNPjJVwGhA
AwddeqmKncLZumCjXtwuabu6f6m7QbnAtobjWH17i4TEErAfoQhaZxTCj8EcVv1S
OOriPM8Y7HSxGpj+VvXuTY3CKo9xjyQDE+DhBuYCu+yKRwfl8/IGb5xb6P/gm5x5
6lMRJMACNRhpYwABmxBbt1ZgshBXL+NBkvcpK0jR0WwEGhsNY4zan928bMyG5Pub
RpCNddl8GwwArnAZh62fTyiIZ8L9wKLV5vXfVyEovDPWl9WmQf4RsbGPRQCdsCQO
ZDp5Aae6Qu2+PrxXJ3vwZML/ycD9wuTwvj+tfFEY39Yu3U5cUW0=
=lVi6
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--
