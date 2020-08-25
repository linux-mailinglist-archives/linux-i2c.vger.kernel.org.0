Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7547B25138B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgHYHtG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:49:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729194AbgHYHtG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:49:06 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4004206EB;
        Tue, 25 Aug 2020 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598341745;
        bh=EAVPl8HI0qm5Z1E+GM1eitUP0eVWdhTAbiPxcjbxgeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o42hzT6XNP1akB69Gj9FKiRANr1USTDNM4eElmGuJafsirozDmR3MxvzvQsZIjqJ8
         ZD0ZSPiduI9MDF4ElIVV3LjmWJebWXvKTz7NtQPMJStU3nwXviNZvLKKZSwN6lspyI
         alNSXsB9ESLx57Q5/mhQL8Kb4u3YtpNTx6pYqWoU=
Date:   Tue, 25 Aug 2020 09:49:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: [PATCH] i2c: iproc: Fix checkpatch warnings by using 'BIT' macro
Message-ID: <20200825074902.GG1861@ninjato>
References: <20200814224008.107430-1-ray.jui@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
Content-Disposition: inline
In-Reply-To: <20200814224008.107430-1-ray.jui@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 03:40:08PM -0700, Ray Jui wrote:
> Fix additional checkpatch warnings in the iProc I2C driver by using
> 'BIT' marcro.
>=20
> Reported-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>

Changed the commit msg a little. This is not about 'checkpatch', this is
about fixing undefined C behaviour.

Applied to for-current, thanks!


--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Ewm4ACgkQFA3kzBSg
KbamgQ/7BM8jeTcEvAB4lW9JZQHtA+KGu9QgovN9T+TlFGPBzrlgrvc+0/hBk6Gy
njNOnI4R3u+0Xyssrq/ROCpw9tsSyI5H1A4okP0uC/itM4P0bQNHZsXIiZrBTIyr
L9+eXZLQddDTtYxRqnrMLtqS+BufAH1sykRTDyrPL/Z30WiGo7Gy9cs3JDbUVTOO
pLbl44oBWjns0ZSeMf7l5hWOdnM7YGpfMwhmIHT8ftHZjk1yngjLyB/SOUZ7U2AG
zYXlZXvXStMLddnUvKLf9IwDq4XHnTxukQ2eTVRDglnhMpCKylPDZLOgdRnyzrzw
4pQQjGtWvknyhY7+ePwYKEa9Hu6NSsXvcTX8C5gb0oCikOg++Y4grM9lOUVy7w5+
Z/uZCYmqfLuEW1uIvyYuELlxH3wChG5icdXpRPpCTyjFt6zRVWow3l23eJH444UL
UCxd2+oxp15YpdLRSi3JSTADzWoloQ4YPTfftieEpuxVfzLSlj2mP1xnn4KA1RHK
q6PObpQDQ78WRDyg5Zcj4scySH4v+1hiCAWGcjBTfL249cMp3h1uLE82ylBKwbeO
NyBZHAe+jCeJboFeoiunSXdLwRkFNqec0czt+GxWTsXRpg9xm9f44CfYHwrNrWhW
Yh0qnTnh25oMw++6zqTbj/v9mNOGwyG58vmUBCo9zgg7oQZLa1g=
=8zAd
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--
