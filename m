Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518DE1CF2A0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 12:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbgELKfb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 06:35:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:40278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729534AbgELKfa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 06:35:30 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 976CE206DD;
        Tue, 12 May 2020 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589279730;
        bh=jwAkOojInYiNloz1TiBWLL5PixUR8TZzdE0jTLC4BpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ghpYQpApkXK6tRH6nMwUjHR1XUKZOQpRg6jPcBO/Gwx5JBf72LMBvHD65kHWi4LCZ
         Rdkm3nsHREbGVdeV39mXk+GixgFeK+42SCpbH9YuGtVA0aSnaFnzwi7HcQBKqovVBS
         Jw7ZQBKxQF2Sm16Xxv/CvgC9R71cMo7e+62YHpHQ=
Date:   Tue, 12 May 2020 12:35:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i2c: pxa: remove some unnecessary debug
Message-ID: <20200512103527.GE1393@ninjato>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
 <E1jYFhC-0007KN-Ll@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline
In-Reply-To: <E1jYFhC-0007KN-Ll@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 10:10:42PM +0100, Russell King wrote:
> Remove unnecessary show_state() in the loop inside
> i2c_pxa_pio_set_master(), which can be unnecessarily verbose.
>=20
> Remove the i2c_pxa_scream_blue_murder() in i2c_pxa_pio_xfer(), which
> will trigger if we are probing the I2C bus and a slave does not
> respond; this is a normal event, and not something to report.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-next, thanks!


--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66e+8ACgkQFA3kzBSg
KbZavw/8ChZJ4d/zYBidzUeWf+E9QC5GvgoW513DogAgyKN58XpGXGBAozztYlq7
7LA3GMBxxBPPopQOQNfytZbf+OwlS47uTBgtiIzumBTuJiGQDw9xH7i8/n9KhXu8
kA3C09HyoQQVFFeIjW9cxhpWZX26WbvhsSZEPyhFS6QEU2EJ2ygD3pkmRcl3aXqz
lQwZC5v0LDVYl9rKawSTzxH3cSSgXOpHZkg6aOVem4zdWzIFRllGf9BnlYGkvoDq
OgDdXa5hItEJkDknloD78x2dSJOTmLpiLPHcZSoxhlei/viLuHo7YhmEkXYgv09/
0nmy7TGl0MRfWMpoUm1ah21sOZnzLrEosC6WfWNjVyOI4XIOggvKnTn8Wkd0+YHS
uWS4Q6ScpRfrMwN+DlCEHUh6QqkSPl3Dbm2air48/lF6hZ3vrEDw6d5bUlysKRRB
5LvZ6prkiDTfwhtI3ZMvtXmLrA6GQsj+6jHX9ssd8YexWW+20ExfuBVUy2acI5aC
QPZHjnoY1DjiAGSpnguIFwvA13ikUblP3mRG9wUBDo+qAeyQHlZ/iKP38DfGYTso
KVjmhC645/ADLaHFAyeoGae3+hpdlWlB7i3DXRyUWB1/HWjBCx7wTK5iMDVgIqPt
TPX2uo4tZ6DT3qa34Q831yjlGslHXQLay8+EIJ9tsk9Pnoez0xU=
=qj2B
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
