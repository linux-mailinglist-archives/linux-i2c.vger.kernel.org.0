Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00B280E4D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Oct 2020 09:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgJBHyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Oct 2020 03:54:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBHyN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Oct 2020 03:54:13 -0400
Received: from localhost (p5486cf7b.dip0.t-ipconnect.de [84.134.207.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2FF220719;
        Fri,  2 Oct 2020 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601625252;
        bh=kYucc3T7U4p+TWca+41ZGJzFgzS1RhhyPZ8f6KeoQrI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XmV7jwNjr+6e0VF35rnpenExz9vmZs4hFL6JY5VxAVShWMcK4PZVCT45/2hxcmDDD
         /FAFJwOJZ0tMR736qQiXbjhB2xzfLr+X6iFqq6S5jpQuWCiz+b23RIDpSvcEwHifQN
         GaA5WbfMIC2VQdoHcLnAcm3Adj3EEaIYl7ZGq+eY=
Date:   Fri, 2 Oct 2020 09:54:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Balbir Singh <sblbir@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] docs: i2c: index.rst: add slave-testunit-backend.rst
Message-ID: <20201002075404.GA2495@ninjato>
References: <cover.1601616399.git.mchehab+huawei@kernel.org>
 <2ac6bd9d96cc4ff248d1c2e26a99f51a785eb271.1601616399.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <2ac6bd9d96cc4ff248d1c2e26a99f51a785eb271.1601616399.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

> index 8a2ad3845191..9b8df313902c 100644
> --- a/Documentation/i2c/index.rst
> +++ b/Documentation/i2c/index.rst
> @@ -38,6 +38,7 @@ Debugging
> =20
>     gpio-fault-injection
>     i2c-stub
> +   slave-testunit-backend

Yeah, it is missing, but this is the wrong paragraph to add it. For
consistency, I'd like to create a seperate patch to fix it and merge it
via I2C. Do you mind dropping this hunk? I'd credit you with
Reported-by, of course.

Thanks,

   Wolfram


--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl923JgACgkQFA3kzBSg
KbYV7Q/+LUckODVWc0P/YxAZCx2wMN6M1FVt4l7ZC6oPATwoX6E7nSiQX7wO/nQ7
VWWvfqitD0zY8I5Dlswekq8olCG10YGKZI02nQNpHG19adYZHyWl9xEFK3dcZJaJ
Xh1ArqWymD48OHHtvpmEHJH8s9IjIQyIa26EcSKK27uBTLfl+gidOXnF+AHbPo/H
AzqzO7RMm2jEoY+4fhExykWTrrnQ57Z0GqG/VqgS/4qtpFG+G8iOah3wZz9dDGwC
cVwJkGaTDGFzo+YREKyH5Mfa3E67WuJiJ70cMbyXO4WXY+0hTYiS4Xmj+WUSScTs
FQhrqB7jmsAjKV2iefHXOMwtuBAzKV34eF+YDtBSOAZUXprC4OKW/YtdhIJJUJzZ
WCbK/UVxzPzryoeN5U2MouEtG4mjLBFVDa+abeO9kb5j6Gho5Q7UbAhMKeIBnMuV
NtgAefWvR/P7fRFuOpIXkTDf4NHmEeE+LyIgC+2bcPEEcuG0XF0pw2Dyxb+VKwp6
Y2T9XBxcOfRQnnlyd+vPzc4LA6RaMiPbnO0lWldxyaChoNK9+BR8qrImHBZN5zRo
0wubK+R/U+9Xi5kc8cFq2A15smJhwBREatqifWQb0HGT1DsZoFZinoXJW2aOGfew
/HopizQ1at8vW99lgPv2nOQlm5Ld9Z/XWLH3rYXmgEoFKkg7sLM=
=Nb0B
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
