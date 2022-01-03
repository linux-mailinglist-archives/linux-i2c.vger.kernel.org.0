Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4633C482F8F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 10:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiACJoY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 04:44:24 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55750 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbiACJoY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jan 2022 04:44:24 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9AD5560FF2;
        Mon,  3 Jan 2022 09:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4581AC36AEE;
        Mon,  3 Jan 2022 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641203063;
        bh=ihGRiJtMqi1KackPQURTxGDLqipQgGwaNxDqfKCAvuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fcCLtTz7COwnFHF8HDOkCo76M0jaDy9+tnLxfu+o7qoBh/ocL9b4cCQ7AkjGy4RSf
         3fmAjZAcWDTkXglGrMalXzTA7rx9iiRTAu1dWCESgndBkn9HLghNOvJiU9C6eJ2J9r
         UE/lzm25TfjR/0FErn78a1+rjr4ALpJMUeZj4ubo01wX6esqmDsHLBlfqJu1dMVWPl
         IfiC511QnvkiJ1/1KXGHgC+TEgxJDhDV3xdyQ3ce8rozk73MBLuXj7ToI1Qd8aMgk3
         NvVt98gbNOoDe6xGCrQWgYuJleqiayC6Be6mw7dzDce6ZHD5IP+HxRs8oCwTV7jnhL
         7u67Wgt+Ln2bw==
Date:   Mon, 3 Jan 2022 10:44:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sui Chen <suichen@google.com>
Cc:     linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        tali.perry1@gmail.com, benjaminfair@google.com, krellan@google.com,
        joe@perches.com
Subject: Re: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
Message-ID: <YdLFc/sJDf8rrPQ6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, joel@jms.id.au,
        andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com,
        krellan@google.com, joe@perches.com
References: <20211203023728.3699610-1-suichen@google.com>
 <YapHznDoqJ+wjx8m@kunai>
 <CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SG3y9r3TeWn5kgv3"
Content-Disposition: inline
In-Reply-To: <CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SG3y9r3TeWn5kgv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> - Because we're targeting at-scale monitoring of fleets of machines
>    in large numbers with identical hardware configuration, the
>    I2C counters (including NACK) can be used for apples-to-apples
>    comparison, for detecting anomaly, etc., while this may not be
>    applicable to a single machine.

Okay, I buy this argument. Let's work on this during the next cycle.
=46rom a glimpse, we need some refactoring, like moving stuff away from
i2c-dev into the core and probably add a generic stats-struct which can
be attached to i2c_adapter. But I'll respond to that in more detail to
v3 when I have a better picture.


--SG3y9r3TeWn5kgv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSxXMACgkQFA3kzBSg
Kbadew//YJJjHVOZvJkbqH10fwSHXbLcfLmRWbC7F3u0BLstTzPTXvm0ESE+4wQS
nMPzxnZHMzfTDfFObBwzkIVcdoY9msPlCxqgAXfBFDbLVBlca1ANtZbom8t26EYS
eqWtWtJ09qxIpbjMcecvF0SOcZzSA5CpCGKlpV0gXl5RXD09c9mw1HsB+zZoaKEE
/58mOG6Evjf0oAUO0oqbi6km3AmYDb74REXcgeL2npsbSkK0vO2vinwSgEOybIUE
G51tKqW6ESYGS7s2ZlYniaFhcNagy5J9HuXgbvRurX1ebsMsbJ7444qHPbmGP2uf
ZSu8E2IF9qsCGA1nQGhSsLXGY7OVXSISP3sKyfE7UFTHwTWVV/zebAZZPPfwD9py
yrokc66kBpWWwV6KLTPt+DJcEwPlVCsyo4vcjAz5+zglIFy9XmidsjZSjPgluAPV
EkPqx6n6ftylYIJeeKMquqmjKC3oZzNy6rhneVJ0moZRoZXeOF9/UO95qJgiikol
qYhzD7SW87ceiKFxLYhnj/SH149CxJighnfnMCOlfL4+zKuIKfDeHURRcW+ablyG
hcfaewyz+MbWhllgAmOmrBfJLCNzKvZCj3I504uLnQ22KYwiangvNOwuLRjSRSJ+
af1+YoVXg+pY9IcQy+7lP3uXUHWpu3aZq1hfPcn01MHffyQX+A0=
=RbAX
-----END PGP SIGNATURE-----

--SG3y9r3TeWn5kgv3--
