Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6EC1DB8DD
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgETP7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 11:59:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbgETP7L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 11:59:11 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5456820671;
        Wed, 20 May 2020 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589990351;
        bh=tfUk3WoRIXH7obfMejJ0Kq701IZ8v/+bU3yT5/sT9rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=niGJC2QXqGt0SNL5Zmr3nAhnyuh0D427ugNd5VIZ5AZizvC/5C5Bvhi+umM42Km9j
         he0fbwCsiF7JmxsmNdinFXmXTBmx1b8wCfTO2qWNLUwFBRZVTa9UmBAGRqM00iZ44r
         z4s4JQWsnzSCCz2Oz+8XIILDwXAQHQYmrSwyDBRE=
Date:   Wed, 20 May 2020 17:59:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH] i2c: pxa: implement generic i2c bus recovery
Message-ID: <20200520155907.GF5759@ninjato>
References: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline
In-Reply-To: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 10:33:12AM +0100, Russell King wrote:
> Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.
>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-next, thanks!


--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FU8sACgkQFA3kzBSg
KbZ/7hAAlQl0voEQHIbOWix4EYWfuOeOT6tsUV6hrmv8ElYXzFE0NowajifXdB0S
j0qTL5VBiHexnntoQvtUJqPxPAPKwRg/+RsOA9dYIHKQaTepdPQHYFYgq0SYYcYC
0fKz19pkHyt0/sk/CTJp/VyXdQRup+9h6jIZO9XAczDzIzKEkRaObcb2e524e9Yh
Jq06xgncVQIsnpe0YLY201j3+d44EAD0YWrvJcmqGSVSPpYJqrRP8R6ctOS/EJrx
VAg6MbAPL14UeK8UTbVo8CuBOFOpyILj7hO/IKYpID6ZX355jhbPAEER0aQFhNe8
+B/jIBzr0m6dv9OHeEsqBiOYQtMAGkSl2rLHPck8CtgAga9G1I0z/2y5h2Fiu98B
ZupxipXjnBejIrTe3xJFrDvceftD3IpFO4WCni2MxcDZk7Zwme5exslGDH3Z+4vU
9DktI7r3TMyogNEuR7orQb3HQkDNs40BYAYQu32+GpMFfnD1Su1+LUZ5tOUAPeaH
QNqkzpseDDt7ECrmIf4g4eByB3QBCJ2tbj1IAtxwH8V8/cXMs+XVLKQAwQbEaQcP
ZzuLHN9vkZ/xVPPqAp+9TOkjvg+QxVhQs92CF4ASz24OVfZcIjUv9QJr/IKS633/
yZrzU8dbpZL5dJerWB0/AZLyHI/43V9fxT3gVfJi0LvYt0yEF64=
=kiRu
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
