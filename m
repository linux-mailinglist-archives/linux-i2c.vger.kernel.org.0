Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C62A4278EF
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Oct 2021 12:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhJIKLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 06:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244943AbhJIKL0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Oct 2021 06:11:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 799EC60F39;
        Sat,  9 Oct 2021 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633774170;
        bh=PcZTlVUoRO0v3fStCWDQqZx4WjGTWewJvWPfxDSAalw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QReHgQapG5OhgfbWPC+FKVCF3a9U0ZXtcr7MUtnFFWVTNQh29/iVk1ZE4L2F1Bl3i
         GTYKYJebQTMMk3FNCMEEHtQphyCxWYpVMyJ2ElykrGSc77rcFc0JkcUCMe7j2VBMnH
         knmNyLS2i8cdEsF64vCmQDBlSLZ61hCkwuR6SLQlAbuBsx2sP8wWj/P/BRs9UbTO/Y
         92VXel5rjvGO9QfTTmh1F0hKWgbod61mlMPiCbkQh17KUkvOoK1jyIr1JluEBJx1xE
         d8aJTmEH3PnvAxFkAExewiB4KnzMg+L9OiivEv1/r+8DdS/KhqDsk/69Kh417aGx1m
         wwsciSQRkoJYg==
Date:   Sat, 9 Oct 2021 12:09:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] i2c: pasemi: Add Apple platform driver
Message-ID: <YWFqUuc7I5Dh8+w6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <20211008163532.75569-11-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pa4zh0vK2aQo9jrs"
Content-Disposition: inline
In-Reply-To: <20211008163532.75569-11-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pa4zh0vK2aQo9jrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  F:	arch/arm64/boot/dts/apple/
> +F:	drivers/i2c/busses/i2c-pasemi-platform.c

We have no dedicated maintainer for PASEMI. Are maybe you or your
project interested in maintaining the pasemi-core, too? I guess not many
patches will show up and they will likely be for M1 anyhow.

If so, then no need to resend, I could add the extra line while
applying.


--pa4zh0vK2aQo9jrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFhak4ACgkQFA3kzBSg
KbYkgA//WnhdZAP6wNE36K9Ir6Rvq+uGigwqqIc9f4+xhws03fLc9VetKwYDmi7j
KuMzz8LOP7WmN+FoW5W9tXxFLyV6bDx2r9y4owf/gITy8tlNfxcGAfXLXeLbv5yk
Km1BZUxerGidAdDMQGT7dc2PHP/3mr2cpdemRyss8/nfvBq7vJ9yPDLE4rQyEp+1
6c6s3ZqLfK0JmYjpynn8zNPlX9uNAY2sNBFtUklFXDCJnexUBF+dZwFgfTJWl9zy
RVgJu66nY5gqJxOc6ihHU2hh7C1IYvv8tsbAzSuS13lID9youf51HC3YIU58xRau
WUWuBoEXIqdEKkhCG0qp/lRWqJiZseKE7sXDFV4stE1k7PvvT94BtPO5zasR+D7h
U4XikNjTBS0K6RNAtj0AkEf+PLjX50kTDcwhDI3LjDT7Skrh+KROGDvXL9oYZr5T
iIe2h6fG3cl2o7ntTdtdWxAF1+FWvP7ouPVsU3BGqn1fZd6Tu6K8dZKL1DQeWTgx
Mg+3cAO9mEWQfYkYA11bCUTzFYq3tjkOCE17cHRe2yHD/S27OdWlYI2C1GXQ7CnU
oBFA7leBisLY2Jdacpjufjjkc1Vz/h0wDeB13l24HTzJOx+QOrbOp3xc1zkUUcWs
BYdsnydMoMz+r6tGEsDX+ur0ON72SZqqHhT+nOSnKdvTSHvku+4=
=2OAs
-----END PGP SIGNATURE-----

--pa4zh0vK2aQo9jrs--
