Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36141CFEF9
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 22:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731172AbgELUHz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 16:07:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:38450 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELUHy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 16:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yUF4VJEAnlfiS6JRxzh+1bzIfJxa
        yjiNdic4HEyYt+k=; b=yzpK9buRsJFEleBzux6A3e0nFIA5i/t9edRq+IxZk6RN
        VzMP/oXEubqvAkWNiYZ9Ubpn8nM7Q87Nmp2cgtPUcPl+L+R3EsiIfaG9G1/T6Qt5
        8GjkBYTqx+lxi8enBxpPXpQL8rImSvOOzoJobHFHr69PHS+THMPU3H0HBSxEg5Y=
Received: (qmail 3071369 invoked from network); 12 May 2020 22:07:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 22:07:52 +0200
X-UD-Smtp-Session: l3s3148p1@ene2BHmlEsogAwDPXw2aAE67cgFBY+HL
Date:   Tue, 12 May 2020 22:07:51 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Corey Minyard <minyard@acm.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200512200751.GA6960@ninjato>
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
 <20200512182517.GP9902@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <20200512182517.GP9902@minyard.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 01:25:17PM -0500, Corey Minyard wrote:
> On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> > Move away from the deprecated API.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Ok by me.
>=20
> Acked-by: Corey Minyard <cminyard@mvista.com>
>=20
> Do you want me to take this, or is this part of something else?  I can
> submit it if you like.

I'd prefer if you take it. But I can take it if it is easier for you.

Thanks!


--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl67AhMACgkQFA3kzBSg
KbYwCw//fDMbW7wdG4KvmjCNqawMQBB3jse+reI2CNpwfVGllfcKbL4a+KmcJRLK
Pfb+JHUj313OnkfTTmgmzsLiwrHgVDuyPP/j78ChzNY2hTLs9g8EWcmnHxYzdKWj
7ZnRYaYq9amNC2gnvyVl2mbguTU8AnpFvJGl163wb7bZ+khrUUpVSscmdVbnN/LN
9ZbPyIP+1E+kwcr27EwyktGA56lSLTnQPOgLOOIznRw7dX2vjFvyxLK5aNzrdTml
EzSaUfl41xghq8BOeo2DTCWUM3nGs12fGqPspCbDk7v+zmrWyboiNSNln4oBIhv7
1UHRm4/ABF+q5J0r9nNe08m8eps3694CuStqfZPzwx3boUAxWcF9U+q3JFLsOVuH
fBgcc/fMRX8Z9ZyRWPGlEYKkGwZzC5ug3Gs0wM3ybmSZrxdSrSces8z0ARC2j9qA
P3OL4zucLAOXyQMdYMTUAFRyYSPH2MyPTSx6i32UcjO0aQJDAv1lq3DeGkrovaOH
pTJH9fSJ/ggDul8H3YrwXWhoqxTWlr5HuhgWvhhgCFCW96YwUohWKcvPXMMD+wX1
dN5Uy7fpXZA6ZKU+F0Dq0CD65nma1CRVC6AlMHLGmeQSuMYb6RCWH+ko7ymCl9M+
hVvizVbNrJF2NZepi/5LRXHUUjvrzLXdc4cEKfiz3LeHnpMIAb4=
=ty69
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
