Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AC33D033C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jul 2021 22:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhGTUEg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jul 2021 16:04:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237651AbhGTTw4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Jul 2021 15:52:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AAF96100C;
        Tue, 20 Jul 2021 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626813214;
        bh=zVdiQvS/fdjdUflraJ6E4hUkVNri5BfXKfYiwpln1oE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=crglTabymW20c+v5BkHyYt/KuCyCVllyr7RaszpU4Q851Elt1omqlmbvSCdqro/g6
         efRxeVWGsfI8Tc+mewAWww2XjV9PCcqYksVtekIYerYMLQLH1qS6CVDU4LvDphLALV
         yBCHEcehJy417I//AE5kuuldOHvwxjJEOVPT6nLKd6sBvCMiEUtgZyNVyvbBMahMlF
         OPp9KeghOCSFr+lOIjCgjcO7o2oR9kCmiWJTpw0b5AUSVyEask8+li0Djhq4ym0M3k
         V8Pa+kiHegHSw41l98iQH5PM5cF0jzXKND+T2pu9VS0h0tOsgXyI/872xRean40wBS
         XjxuiKeWjnoow==
Date:   Tue, 20 Jul 2021 22:33:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mpc: Poll for MCF
Message-ID: <YPczGp5FcxWjzo60@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210715205832.17879-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6dPGcqBfGDZPN4Aa"
Content-Disposition: inline
In-Reply-To: <20210715205832.17879-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6dPGcqBfGDZPN4Aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2021 at 08:58:32AM +1200, Chris Packham wrote:
> During some transfers the bus can still be busy when an interrupt is
> received. Commit 763778cd7926 ("i2c: mpc: Restore reread of I2C status
> register") attempted to address this by re-reading MPC_I2C_SR once but
> that just made it less likely to happen without actually preventing it.
> Instead of a single re-read, poll with a timeout so that the bus is given
> enough time to settle but a genuine stuck SCL is still noticed.
>=20
> Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-current, thanks!


--6dPGcqBfGDZPN4Aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD3MxoACgkQFA3kzBSg
KbaFIA//TtIkQBNdFqO6Wjttl//ZIg26ib0UEyfYR2oNpbKa6uQ3/IEP+4wLoOZk
sF5FvP+21Y8eNGKHJPYJuLHEBl0Mfm/UumGAP/p+waAIkCc+aOm/hhJmrbh+kL7s
lz4m1LdF+h4sZMnA2m9sT/XebqX/Ujcq5Ydnx+GmU3rVMERhBOLXkQ7xl5GJK8Xy
+s9JrK7hDuD3Fyxz+3NUyXXm5TJZr0FEg31Ahwe2rOSnZ2nBJ+u46Hb3yphLNuOl
AyPzSwWamMCTzA2MfEJjFsI7x7h4gwRu4bzBi6NPFlXRdJsiOOF6CAEfeYzRgMiQ
mbEbqX1jM9mxVI/8a/zGDNTvR2Ji6TjBKRVutz38Tm6uodNqXHeU9ooGbW8k94Sf
ogdHOzf/7J9LYF8hFsJ4KkabQ7IDwUxBanpYrpcokRZkqDZxbQ8E//cwN2jUuHO4
vuVjoFGPx4FAWw8dFIiFnYkigu/X5ha5IpkjZXRQ393FCcItErSv46wTU36O6FtD
/A3F0Jp7T3Jy+jsVeWP8wxDWIoPpvBq8qgN0W8owKQAUUHxqJcrXmUVbwQDbcUWJ
Via8JopdIHYIUZZqQT2Y5bFryEflj432++XkImemlXOegZrwD46lAIJOmrZmF/jQ
zOpeXMMR45sqpA8F79IH4psJrS8hNbXaoUooZEflHk206UXwwYM=
=MG5b
-----END PGP SIGNATURE-----

--6dPGcqBfGDZPN4Aa--
