Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41CE1D9048
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 08:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgESGrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 02:47:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:54894 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgESGrW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 02:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=AtVPyH5oNfMe3VrfRPB9qsIzp04J
        Du3wrHBnH6/dpYA=; b=YMZBJbtu5kjlq96TlqWEwbydeDTSro/e/fYmQKVZ5VQj
        A72ZvYG1m+iolIphgoEEe+X5Y5Fy/eCyQYYI1w7hUVRqNNpCsT+Q6414ZidHgwIl
        CU7gGLbIlc9PEvc7HdZd3SVZSwy8wqat0z5acyc3UVlOPxbNuchdSEIrdE9/hIw=
Received: (qmail 141895 invoked from network); 19 May 2020 08:47:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2020 08:47:21 +0200
X-UD-Smtp-Session: l3s3148p1@08e3pvql8OEgAwDPXxCmAFNwG0mTH/5q
Date:   Tue, 19 May 2020 08:47:20 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH] i2c: reword explanation about atomic transfers
Message-ID: <20200519064720.GB1094@ninjato>
References: <20200505160101.12399-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20200505160101.12399-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 06:01:01PM +0200, Wolfram Sang wrote:
> Atomic transfers are not only about sending messages like the original
> wording suggested. Speak of 'accessing' now like in i2c.h.
>=20
> Reported-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7DgPgACgkQFA3kzBSg
KbaKsw//f0uxfa1Z3GS3HCyoaAXSgd2F2VwlWZkOXItXkSmAoZJl17YdgRWZSlOw
F6AUWOYJiaXryQYKC8rqg5N4gWO6Pc39TcigulgWAs6Aap8O+rNwBZxyyCIBTb8v
sRZ6EvR5bxPMRICIWfJn1uysL20kV9aMugSPobUt00smQ6xOF2IL6CoFHmX+APud
eC/J6XjMFOxwDPXNj1bI4Yo+QjDsUUwg0WF/cB/2DHkjGYmL6WgSrhJYbvNilZvv
8HWg5LjNq1lkOIkjdvyzWgQkbeQJ/VnA/LlBcKYgxaOfaVxqEH3mmHV228uV8sNp
GyEJmocCPPCpuDTByk77d5vZXrGiprqzuqmbfc0Cb+gAHXTCctSjbK6bvJcTC9bV
XWn3u85IlanTYhYT+8gjJEMuvSS8tj78TW2v3S3SMw7A/Z6PCBPynZkRjxxiqGv0
Oce92BTL5XIJTvB2ybEvo6KE7rpUsmUDwyDh382InTtSN2kgIGOJSZ22sZ/LN6i1
n+fdI8bIGBcMo3RDpvoQPltz6CjpZxOKycDc0fPWuJhsj5HuHe0wBpoOP5GjSkDG
HOV6/CHq4OzJm+cFpb2l3Rs5g4HRaw6aPPeXt1fSmU75yfuqSKsdQ+G3esgVBnr0
bXN+zh+zDR9EU+uSnbleYS9uf5pD6cgWa8xQj5XAwy48z386Wts=
=NNP5
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
