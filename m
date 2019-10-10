Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2687AD20D7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2019 08:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732882AbfJJGhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Oct 2019 02:37:38 -0400
Received: from sauhun.de ([88.99.104.3]:44328 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729045AbfJJGhi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Oct 2019 02:37:38 -0400
Received: from localhost (p54B33257.dip0.t-ipconnect.de [84.179.50.87])
        by pokefinder.org (Postfix) with ESMTPSA id E00F42C01E8;
        Thu, 10 Oct 2019 08:37:35 +0200 (CEST)
Date:   Thu, 10 Oct 2019 08:37:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Message-ID: <20191010063735.GA893@kunai>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <20191010003234.GA12710@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20191010003234.GA12710@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, since this is a bugfix, can we get this in 5.4?

Of course! Just giving Tao Ren some time for the Tested-by.


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2e0asACgkQFA3kzBSg
KbZEfA//eG2wIit8ZvHICrI4HHDAD/xgrOjZcCQHKy+PB5uNFMnEVdGy0ifN2Oml
NIZvvWUp0hjhw7ZkPI0uJQ/MLGO47R02T9s9IXx5s0OaxYjB3MINRr1r/8SHvY2h
4CeHFuMbAOdGx6h0vCACwXVpAvjewebvO45bX80AOXq88b8bRtS4Dx9sWIWRS8Fy
5wpSWP0fFbPCimwIkW8SZE6KZcKy4AenP95Jjxyv7YXGFXDRHgV9xAp5eXDw0ZZR
lhfsSkIWsQkNqOCDzwXO6IKX+GMu2UMzX8ipsXi0S2u03/HUGnhlxMg04AwH28x5
iQv7tO0Boj1/OMJ2jfz/QAk0A+C04lo20/z+heHJoBz6BbhFnbXX+tMUzdn070EB
AHN1pcLMlpPufqEcCBPj0Ky0RP2WH48vFqY+uJnTwAWAFx5quO1/DOYBRyzc4kPW
FnDv6cgFtQKIbO6UWyGs4dHOttBFs2KSpNWcFaRxUHqUDpR7BBw0Bt8V7f6irsql
lVPjyAQj5kDm3eA621uZR3/hFP4Ud1hLF1HzF+j9LX/1lA2+PMB/L7E2Yt6Dv+Ba
1vX55ITdwFTyQ1MKpVileOYL1IY62EcFvUdhi5ahyjQNQtHaslKwa/l4Q/WDpMNu
7AjPGDDcjnmNTW2DAcdxbHMeN3so766ZPr08ujZezcXZX7BBT14=
=ApV2
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
