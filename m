Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E4D393E43
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbhE1H6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:58:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:48780 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234430AbhE1H6L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 03:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=4a1UWrijKizQqJvpr+0ZFECRLopE
        gw+Uj6Vi9O92d0c=; b=hP1YZ/dAaYXRIyv5tlrdlyaHf5AF/AZ7jmFBI4N1InUW
        ETf6Fn5LtRX/VQrUwK2znw/VtYtg7jLK9JtCXvSnCLJQi7Tp3cw7/8OqTSqBwBii
        UiQNHZWOFLro4N7dQYk4dxu/2dPfTtJ35iuE5sIa1+qdFEyi9XFiV+4tEJRZ1es=
Received: (qmail 2272518 invoked from network); 28 May 2021 09:56:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 09:56:35 +0200
X-UD-Smtp-Session: l3s3148p1@GJ/6Nl/Dgt4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 09:56:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: i2c: renesas,riic: Convert to
 json-schema
Message-ID: <YLCiM7La9lIKy7Bf@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <e1bb5790675b6f4a518c6a9cbc22eb7452a2f78c.1620138454.git.geert+renesas@glider.be>
 <20210506205611.GA785508@robh.at.kernel.org>
 <CAMuHMdUh=Cne==VAqv_DRXZpB7cOyRJehaq-mOWQb__DUk1Orw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NHQajp+U+fGrk2qL"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUh=Cne==VAqv_DRXZpB7cOyRJehaq-mOWQb__DUk1Orw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NHQajp+U+fGrk2qL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Don't need oneOf here with only 1 entry. Otherwise,
>=20
> Thanks, dropping for v2.

Waiting for v2 here.


--NHQajp+U+fGrk2qL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwojMACgkQFA3kzBSg
KbYApw//bLXJRANWg/cuJgdRW8B6ruGEN3TzvEj7hKhBkTOoTqQ7jevz9Pq3PQpP
iUAvUlW3c9zPHjDrKxyClF4u+yjJ5tL6fc9ugerzsegMuJEOySGNDv14rHgacfoA
4vu3Z0kB8pseaYQhmmb977bA717FHqRVnABTVsTItNkHUJUsFUs1zUB1dSnTW0J4
mI8uiHCPNhq2+mnuQqKKUl8znBMrIZBMj0nWWRbhKNpeK6aWB7uDhv5IkiQ22Ioj
cSLqafIqxOcbN5IDXW5uJtwfDdl6n1Hg+SBGiKLZ+f7+yW5qwXvQ/XuoeqAaZU8S
7looQrVkFqK7R6012KvV/VA/BQehWlRSw9qJVRRYT1SStkoizHVti0UBSX5tDELu
C50XrR4NMW54Dq5kuLh93PfT1M+or4v7j/UjT2wBKnRrH+lPFfcAj7n0XU2YafL0
Jog6S+ki3mfflISSZBIZoF2/JwBQ+WYoiaE02Nu8sNaGYFsOD+K49EJaP+4WfHg6
F79cnLml1O4B2VYTcGx0FaukKkpbmGe++hIHCDIwjtkcR5m06AVTi41LylVGTmt3
snYDrN4NYKscyNE410RJIdMF+Mc6gwYbKgWXtRjldqRSza2jRkhWVJAwSIj3FPKp
Zihi9ScGRkRyuaLPf5eYggz+lp/J2Otven0bcU+QwDWitSpBstk=
=GvxI
-----END PGP SIGNATURE-----

--NHQajp+U+fGrk2qL--
