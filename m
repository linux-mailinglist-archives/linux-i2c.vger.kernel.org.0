Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB31467B94
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 17:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382087AbhLCQlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 11:41:14 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:49484 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382116AbhLCQlD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 11:41:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8237B62C22;
        Fri,  3 Dec 2021 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44260C53FCD;
        Fri,  3 Dec 2021 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638549457;
        bh=RaQUeM5FjKYkPEE/kCPfxJNphXuR9R0Uk5864sf6S2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ArLkupHjT5pr4EvSwZ2qdKt0GL4gc7v7rXuPWG6a5Fb9+jjIQpKKkCiOHcBLBBIcZ
         oCnb76jPjqlqzYFsFgLQwGb54TrcL6UmNpnqtTqDok2ph0aDpzA+Jm3lhMeO8wIyF9
         LVD0bfQhTY2eDl008epTwItD8C+F0qFbGS3gkXdQyWNqJY42ZkY/ED8pZ71nLwTM2K
         uaJaEyGo3s7Y+9ERKN37+m2lEIUdNmQVNQKiwzTixlkUjx2vlV2j8QPnUeD4jamwfm
         mhIfQdC9rDcf6CBr3iC8xcwjLHDFAyOV1fErsDd3M9yJFteAfAjfG/g2IrhC59pocr
         oldKQ2sS13dZA==
Date:   Fri, 3 Dec 2021 17:37:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sui Chen <suichen@google.com>
Cc:     linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        tali.perry1@gmail.com, benjaminfair@google.com, krellan@google.com,
        joe@perches.com
Subject: Re: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
Message-ID: <YapHznDoqJ+wjx8m@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, joel@jms.id.au,
        andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com,
        krellan@google.com, joe@perches.com
References: <20211203023728.3699610-1-suichen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LHJ0t05wcta78tCq"
Content-Disposition: inline
In-Reply-To: <20211203023728.3699610-1-suichen@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LHJ0t05wcta78tCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 06:37:25PM -0800, Sui Chen wrote:
> Add I2C statistics such as Bus Error counts and NACK counts as sysfs
> attributes so they don't need to live in debugfs.

What has changed since v1?

=46rom a glimpse, none of my questions to v1 have been answered or
addressed?


--LHJ0t05wcta78tCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGqR8oACgkQFA3kzBSg
KbbJUQ/9FR9iFKVBIJx91SD9MXVjmtU8xgFUs8hXfXmN6gNe9QnzRtcO4qas2tKI
Flxo3yz9ocPpH/Gb3SG1Kwdv9Jze5gOL1nLrml8zVUiJa3JsrnQmqQVSZOpPLcpE
H/yKLGu1FH4ALjSAsg6tJKyc1JJqdbhBqqhWCQXTjB1RNN7FpNzy1RlxwsKUNF47
ZKMJ3A7ADX+wNpRAQg/k3UFkN5kNcGyuRhHg+4hQyySjrxaraaAZBOhjLiiAtTuj
ahkNbwvUHnZeO694UMK/0/xQAEGzgan4ryrNo32I8nautczhk9DWPLTxVJIfOh4a
3bhjhtBVo7EQ1wM64jH0cp2lvJ6588syqk7+rI207YBa9zIkZTjuH4w/9678pinX
Rpbwpn1M/nQpdjds55QGYaSVMbzGoQRh25PN4xHkyynRAd37aOdUp2JCMgqcqLoC
s9fTyXDEzwDiZEKKM5uG9+JmQQjiMZ4dhdk9D/DY+36mfQ10Rw3W9QeJ0JGqYTCW
h7aswLDb1Q+PuwEKnlAC2pe1g6bIA5igjcPGdMBi6B7zpQXGyKJP12TlPpTex4s8
GTGqHx2zIP0mGgrLzfRl0M2RZddiDPSAhGVMoa0lq/EXRN4Qqse59VdJZCB814tC
TCG9sBXqMFbuFvwQOzOfiyjQoyN/6Fs850U4EJfTjMMAohnn9iY=
=LdTx
-----END PGP SIGNATURE-----

--LHJ0t05wcta78tCq--
