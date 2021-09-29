Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3195A41CDA2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 22:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346791AbhI2Uza (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 16:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346776AbhI2Uza (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 16:55:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFF1F613D1;
        Wed, 29 Sep 2021 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632948828;
        bh=sXPiZJApgWTPby5kfu7tesuhTT5pOFH3fPxxvZTww+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cYU/3ZTSOWhZSMKhKtxd6WJij/X5VHWHGkANadNDZRdTuR4iOt1CJo1dE4jpPAqV2
         RhsDe8mT9GrG1tCEL1XPy7cbdnmTQtvE4H2R4C+owWf7vN6w0ApeabXDEQmJDLZs2j
         4IlC74l/VJ8mW6k5wC6NYzRLxOTSBvFr9Pb1oj9mCvOkcxNVOhiZv/wa/IzEto3ebg
         C5oh+PILfr/ZIa8HhdG/N1gaCzUqWj2j+lqActjp9Z5+pc0Y42iXb7FK8nIfPYB/+t
         NRlUCe1J6WFmxMCIxZRabDRM+hCZ6Q2CQyZjSt3kWAKIufM1wpcMcYwxpm3lu6tgbl
         PnY+U0MQ9eBRw==
Date:   Wed, 29 Sep 2021 22:53:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v4] dt-bindings: net: New binding mctp-i2c-controller
Message-ID: <YVTSWa3Nw3XF5o48@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matt Johnston <matt@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>
References: <20210923033406.3166902-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WiWswZ2GucEUIAmB"
Content-Disposition: inline
In-Reply-To: <20210923033406.3166902-1-matt@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WiWswZ2GucEUIAmB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 11:34:06AM +0800, Matt Johnston wrote:
> Used to define a local endpoint to communicate with MCTP peripherals
> attached to an I2C bus. This I2C endpoint can communicate with remote
> MCTP devices on the I2C bus.
>=20
> In the example I2C topology below (matching the second yaml example) we
> have MCTP devices on busses i2c1 and i2c6. MCTP-supporting busses are
> indicated by the 'mctp-controller' DT property on an I2C bus node.
>=20
> A mctp-i2c-controller I2C client DT node is placed at the top of the
> mux topology, since only the root I2C adapter will support I2C slave
> functionality.
>                                                .-------.
>                                                |eeprom |
>     .------------.     .------.               /'-------'
>     | adapter    |     | mux  --@0,i2c5------'
>     | i2c1       ----.*|      --@1,i2c6--.--.
>     |............|    \'------'           \  \  .........
>     | mctp-i2c-  |     \                   \  \ .mctpB  .
>     | controller |      \                   \  '.0x30   .
>     |            |       \  .........        \  '.......'
>     | 0x50       |        \ .mctpA  .         \ .........
>     '------------'         '.0x1d   .          '.mctpC  .
>                             '.......'          '.0x31   .
>                                                 '.......'
> (mctpX boxes above are remote MCTP devices not included in the DT at
> present, they can be hotplugged/probed at runtime. A DT binding for
> specific fixed MCTP devices could be added later if required)
>=20
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Acked-by: Wolfram Sang <wsa@kernel.org> # for the I2C part


--WiWswZ2GucEUIAmB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFU0lUACgkQFA3kzBSg
KbbYoRAApea6QKmxC55pBcMds2GA4s+x1kNnL+6mkIl5O73Y/E42ywh7TnE5TFjN
yiPRakjTP82dPi+jSHNaPrQlCpkyFtsJiOc5iuniCXTWQN9OzQCSuvhBzwUarwqu
ZkfPha2eRxzaOniuNooLLcDB6uq2ueLlVThtt8kSpNRsPuyMvIrUpg+W3gD5Ai+Y
x0oD0zJh6EvVnNzNDc4NdEkddOtdLjrXDgmNW4BJ49iRHZTfzJRbLM+AmnvkIiNa
4oY6OcJjdLUriNHWFww7oJIbVtnt9DkRFi8nAGIOxFc99gnuGTnUAEfk9DJ2Er7d
f7oBzmOqKpVjaRraHq4qQzci2rWGE1n29gfcuJapQDh982jjFZK6R67vbjlNsxM5
ITSw6t/WmDqGMBHGvK0KOx+rdANgiHrlUQ4dGv6YWTezcEavLt4gRGoe2mU93Ddu
jj/2Y5wCTausF3/4RKdDuMsJWLYxsfIIk+lpCxpbS17vayMPMR301TXdmhOT1/rb
abJqvscrUCWvDGQ1zYCMRyk1vfXMvbI/5CiN7H9QVMIiUhpU+bhux/t0tcWfGFyN
JX358+G1N2RDuSUtUvyDPn1IOuCZUMvktv9LCSiKogqM3FKrx3R0pqZcblzT1jRz
PnArkjzNjuyDoU5nEv3pOFC7urrWa6K/qPqj5JGW3UiaXbWQyCM=
=030o
-----END PGP SIGNATURE-----

--WiWswZ2GucEUIAmB--
