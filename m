Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699178A14E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfHLOip (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 10:38:45 -0400
Received: from sauhun.de ([88.99.104.3]:54984 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfHLOip (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Aug 2019 10:38:45 -0400
Received: from localhost (p54B33122.dip0.t-ipconnect.de [84.179.49.34])
        by pokefinder.org (Postfix) with ESMTPSA id 574D52C353A;
        Mon, 12 Aug 2019 16:38:43 +0200 (CEST)
Date:   Mon, 12 Aug 2019 16:38:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Subject: Re: Please check your unreg_slave() callbacks!
Message-ID: <20190812143842.GA5804@kunai>
References: <20190809110305.GA1143@ninjato>
 <20190812110301.GD30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20190812110301.GD30120@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm wondering if synchronize_irq() is enough. The free_irq() theoretically is
> the best option, though I dunno which one suits in which cases better.

In which scenario do you think synchronize_irq() is not enough?


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1Ree4ACgkQFA3kzBSg
Kbb1GhAAkneqQrPlBjYIDTjc8sTn0vU8Q5gfoMj9sPzrcPwGKyUxOijn0U4gi79L
t4VA1XWVcqV8cEt4ZD6nJagTmxSxSbhw6ADS/LFqR7sS7aRqLbAb20554ZTiL5Tv
EiuXaFhAYLuE88wnKElpWPP2pUaPLRvkOajnWogxt0jBC6GuSzybzN5QqFsynIgw
oeHJ+etGYmDFFz29+cmlm+eTnHZyAR5wA8+mDI/LKw8DqrK3neJoYN0HSVwnBC7D
xNtv0oSNUFpL74rig8BWeNvt2jdEMVO29bGWsQ5hZu8Fj/c8Jo7y6N5ICnNXJW7v
3A7Gt0n3UUDuJVf5mXc4QEYJm/QZl9h3FGzzVaQewOKvniQFOBHIUZZk+piUYClZ
AKSVhIk7f2r3GQgvvPigh8JR08lIOJYlVGIjr9INaPlyjDuJP2/WIhxnpOQ1LriB
0BQy6OnDeLuP+S5qOwQ6SX6s1bFz8ZtHfkZKSFBfBs4Xd36BF7ndD6iy5/y+AO98
3a84nM7y33TqdUzoN+StYQ0m6qhK1u+yvH+RaoAhW/FYrQYt8y4lDUncwu0i07ll
uPkbPKSs/NJyZ5odQ9lSa3j3eCbplTb7AvsKnyTU1zWwCd7DHXPH8QPWO4hZM3RZ
M2p8zd0ftegwPktXoqbweBjJEdDiom2vzAYk5j7Ev7stVPnHJdk=
=QXk4
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
