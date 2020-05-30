Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4662E1E93E6
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 23:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgE3VNl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 17:13:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:39596 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbgE3VNl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 17:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=l3wSe449LJqjhr8w9qAtPWGjxAgV
        J8/DsclP43rphw4=; b=y/YJgMexW0JQL9VVlaEAntLkg+ZCOcEBicWK4h428XV/
        GiNIOPuxIggXprgWosm7rAcZKLlJM4TtIqpMyG515z9S9UrCR1+ouAlDhP19UGpb
        CHOR9monZ94Gxgr7S5KYFZAza86Er7/VfY00cX3OoWGb7lFy9DsiZDRMdMgYedM=
Received: (qmail 140111 invoked from network); 30 May 2020 23:13:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2020 23:13:39 +0200
X-UD-Smtp-Session: l3s3148p1@9T0bCeSmltEgAwDPXyFsAGqyoj3buoO8
Date:   Sat, 30 May 2020 23:13:38 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Subject: Re: [PATCH] i2c: add 'single-master' property to generic bindings
Message-ID: <20200530211338.GC15682@ninjato>
References: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline
In-Reply-To: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 01:30:39PM +0200, Wolfram Sang wrote:
> It is useful to know if we are the only master on a given bus. Because
> this is a HW description of the bus, add it to the generic bindings.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>

Applied to for-next, thanks!


--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SzIIACgkQFA3kzBSg
Kbar8w//UjuIcw/yZmIx74KGKPiQQxeRB0bf1GTDvaPW4K7Zmog+l4Aw2jx6nCKP
AzWrl2Hl0assVMuNvnFAekw4HvdaOJ/Gj221/vkSTlmLCLcQffvQWnS7Khqyt+Bl
W3QPI35GnwfJMGAsGLLEQjdoIY3sVi2Xyera0jW1MjmoLWCwBFYcsJ6H5H0w5EoQ
+4Fjx6hD5EXpuvnIkco23pVeb1G51W0DxZdPBiunPLbFM/0QsSoB7ARrEM0LMGtd
uk7+5DnxOU0stUKiwKcXvx+vXU38gzRbEu+6meW23U9t2+vDEXwPNd2yh7jCxGZM
eQ0HKzxl4T3T6Q1C4o60JO0tKVehD2OBOPqM0GoD0A2IgL5aFCOQ0B0EKOzqdpoQ
51DBRxqYCEp2M5INgaSfom/cYreb3MbQFWBI5yHeKs6pi/kOCj+YSgpFRvU5nSGp
ifun68CSUlJEsp2fFHXR0Pa3PcqCsIL9QeR5DD+LU6OVdDFvvkDDmll4sKCd2sxV
nsXeFmgmc8MgiVcbhBFPCnI23jcCQtEClj/NnVS0tfwCMPg/CfRdRwJcW02rp9xD
ItemIY1cSfZPiQjP4QB+D3iPzQv6bDm70jg1ndiwYm/kmCL9SYQqqjLu/FzQpyoC
KvvtosXFkLznm+8ZWs7UKIcybt4GXN2OAMArU+NO2K6bvq8uUFw=
=A6xp
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
