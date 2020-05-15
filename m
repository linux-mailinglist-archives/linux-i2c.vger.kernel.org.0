Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2BD1D4A4E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 12:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgEOKAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 06:00:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:51926 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727977AbgEOKAh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 06:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fYUVPs++nmdMEYCgzvedZ83aAnzf
        x/lKJ984o8rMT9s=; b=Rv18VFVJZrSecu/ZAbNawLJ+e4c4WfWuxdN7NGlW+Qlu
        Y21iDaK212/rP4tJrw4K1mX6yKzP2yeeH8hcKrLwLsDFlkaGovLX1FuTFUiNzqcU
        /W0364yRE7uj40Vt4DNYtJYGZBYBc0loFCTsEPAxS3+kaVvawCrTEHf44GAULZA=
Received: (qmail 4131671 invoked from network); 15 May 2020 12:00:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 May 2020 12:00:34 +0200
X-UD-Smtp-Session: l3s3148p1@lKVe4qylJqYgAwDPXwnHAMSqtBM6FBGP
Date:   Fri, 15 May 2020 12:00:34 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH] i2c: slave-eeprom: add support for 24c512 EEPROMs
Message-ID: <20200515100033.GH2077@ninjato>
References: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="poemUeGtc2GQvHuH"
Content-Disposition: inline
In-Reply-To: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--poemUeGtc2GQvHuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 04:20:46PM +0200, Wolfram Sang wrote:
> I don't plan to support every EEPROM type, but the 24c512 ones need a
> tiny code update, so let's have that upstream.
>=20
> Reported-by: Patrick Williams <patrick@stwcx.xyz>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--poemUeGtc2GQvHuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+aD4ACgkQFA3kzBSg
KbaIDg//ZfNDzlwK2oONEW9OH/V5qRtl2bBx5haW6rLnat0tq6QOHqMZaRYtbbUB
18KdGDfgM5z8e71ZFKZhNFFonFumto+Sy8dphhKbA71qDl7ACqTagrqdzhyfFCkZ
pmjQO7KUaCzU6JV78rPhkFdsJofD6FmNIp3CWW2DwoSOyfiq6J0tQNTu4kNfM5We
YehbTmBKYTAfogh5v7x0HBP1TbdZd4n9z9rsxFyvsiCm92StsYKk1I+WbY+Q3OFr
OTryFhtAfdnBEoKtk94hGuCyC9OzzmpSpj6xG6zU9Ssy8i1fOe9382woK8Y/zAyZ
UmeMdJEkWwNoJU1QV8IVOQGnX9Nlh9Uc916K2KgbtO4ii4C2dzZyT/BH0xNp1HR4
LzNSiCIP2Pf1NuylYaoVeHMgrjhYab62ryTC1+QpGui0g0OEI3GuZ+zoT4zPW60l
1bCPu3oOvM7XZ30w7u8+IUgpLbgJ26tBvyzJBNPOUoU7n3cXIQHCqDf+K8dLG+Hy
KpFtpa/pomjsHgUmmBTKzIcXal/zD2q/YWQzkJ6EzoShl8adpViOdr0V5OqZY5Do
7v73Z6qsmSj4wTRzDklf5Q02p50PdO7/zoG2P0GTuhPHcS+5AtjvVnL1It5kAR4P
6kTscVDq2FrowlkqkX0KJ8vy+SypOtReqUn4wk13b60dwUJl8sg=
=IuFi
-----END PGP SIGNATURE-----

--poemUeGtc2GQvHuH--
