Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1AB35DF7B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhDMMzO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:55:14 -0400
Received: from www.zeus03.de ([194.117.254.33]:34860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345974AbhDMMy4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZLoIUc/VJj4tIEfO9c9oO0foIDsS
        2ZQvnhQFyKBaY2s=; b=Bd7qjvxX+uL43MrerDHO+jXLge5/z/BR6Novapu+Neu/
        329li5yLb8T8QYfyPXIi81BWZLBq3aHsPKjQ+PFAJ2De8P89YInorlcVhr5uCQEl
        RmHaUPld/bKJjCtK+o3IJw3qgKJZj/i51bihwwq4tERXAgyO6QTnyi1ysfcke4k=
Received: (qmail 969714 invoked from network); 13 Apr 2021 14:54:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Apr 2021 14:54:35 +0200
X-UD-Smtp-Session: l3s3148p1@dg7VIdq/sLMgAwDPXxBXAHZ7k2jwKqUG
Date:   Tue, 13 Apr 2021 14:54:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Peter Korsgaard <peter@korsgaard.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210413125433.GA9879@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
 <20210226174337.63a9c2a6@endymion>
 <20210310204648.GA332643@ninjato>
 <87tuoe5zfc.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <87tuoe5zfc.fsf@dell.be.48ers.dk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  > I added a section now for the 4.2 release. And (finally!) started
>  > cleaning up the wiki a little.
>=20
> Thanks! As a packager, I must say that this way of handling bugfixes
> isn't great - I only just noticed this now by accident.
>=20
> What is the issue with making bugfix releases?

Instead of a minor 4.2.1 we could maybe also simply do a 4.3?


--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1lIUACgkQFA3kzBSg
KbZDnA//RdR0gA9yqpiiv9fD7VkV0NcswetgwSvK4lNzAPVkZ89AOrr4EvNf/9NX
oEEDrd1IfezNqzrA4CacpZJ2k+xf9BiPfFaHVp9EVn86OjIHCLBmHWgV4IfxDL4h
nN9BXGIBmySyxeeEdgaLVvkkACOs1yEogTWcQE4XfIOaeKhFAbdx4i77luBx+NAW
OU8WweDWqcr+IiJzkbec3CA0OvmQ0ctrUm2UwIGFNIFSYL2W0p8xquj4Pn3zuK9h
seYNRT0y43eQhsPoxrG9MU1mzXnY2MjDuoNRI+1nZPG4i544Lp52rcIxBHXTAV0L
mybZyGi/Y0I42A/ISdwM3EqVV1xrNwKOZ1+QBLBI/dmk7AYCZGKHZWFQPLfuM5ls
TdPJ0M1O5SnlCO1ZKYFlJ9iLAeFCdu6a3H9l0cauPOCikd6kWKj7yovGu9ZZruCM
uG3ux4yYCxkW2Y2649AjADgi6w06cEIyU5KlAZI/8YIAKa7qlSI3pGML6Amvau70
/lKF93yIJWSdutfDa+ghGfeAyqZfHxVAwBPWU8DjCofaBFlKf01Zj4U3fSm3hDtB
bmaJHjIt5uPgn+u/83NYg/V8JybmFzbsNjApRsW+4WOhkmKUtoCOBxYxtyQjj1lj
WXVy8YpoRU0JY2xrz5W4j5N6XV3MQyueXmjOt1fMyGQhqxdK2EU=
=myYE
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
