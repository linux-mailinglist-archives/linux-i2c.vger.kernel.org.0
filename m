Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC3549F763
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 11:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243945AbiA1Khp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 05:37:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47404 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiA1Khl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 05:37:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71CF9B82500
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 10:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1E5C340E0;
        Fri, 28 Jan 2022 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643366259;
        bh=Uy+++PWtPa7zd1qw+wNw6uYGotVQJL/yndlPtdBNAKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PQkofFD8DV9FsWWisPsOGCebQWLmXohOa6g5KLqDjfD/kM3agoP5q9+pUnf1JDK5k
         r3cQeKDzXXLXEVNL5UYeQFwdQeCnkl1nELVsDPnXcOPLJEfiisq58Btqvevnt+8d07
         oR+qKMSGb+4PRVht+IWSGXnkDFtj0RfQwgZ2/LLW95FERP5XXiUvsUkzJKZLc8F9o5
         w/HBTEvJ7A+kXJ9AZn/eW8mseIO3vo4e9Z51OZAml9PR1T9/OBqOSPkUbAlvz0Mw5A
         NwSgiV7MZCQKo452jqnctnVbEqnAWQK8xlrz0DUZJmGBzmHkANur5t3hAxm8rQSPGH
         JN+q7gKk8C9xg==
Date:   Fri, 28 Jan 2022 11:37:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Ivan T. Ivanov" <iivanov@suse.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
Message-ID: <YfPHawUXJRPDHPmM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
References: <20220117102504.90585-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tNNl2xM7+YgU3NMO"
Content-Disposition: inline
In-Reply-To: <20220117102504.90585-1-iivanov@suse.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tNNl2xM7+YgU3NMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ivan,

> The BCM2835 I2C blocks have a register to set the clock-stretch
> timeout - how long the device is allowed to hold SCL low - in bus
> cycles. The current driver doesn't write to the register, therefore
> the default value of 64 cycles is being used for all devices.
>=20
> Set the timeout to the value recommended for SMBus - 35ms.

By default, busses are I2C and not SMBus, so it looks like we should
finally apply this patch which disables CLKT:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1519422151-6218-1-git-s=
end-email-stefan.wahren@i2se.com/

If you really want the SMBus timeout applied, you can check for a
"smbus" property in DT and then set CLKT accordingly in a seperate
patch.

Kind regards,

   Wolfram


--tNNl2xM7+YgU3NMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHzx2cACgkQFA3kzBSg
KbbiUhAAibR16ghawqi+04Dq+II/mrR+2C1nKSZduVNKyzZOtw93Z5X4LS213VTU
geHA1RE+OoWG4sIMRijjvMGuYoyF/3F/czyoMBUGFyJZpWtQCz/iRj+nNmJBG3l3
Bqd1SeAAWc0ePewgTe3j4024Yn/v1RddUAgXsZ7JFmgQqy3APMdTo5WzfXoTAa4X
S+hh52VN1+hlIx3bqlfna29JrQPU1aH+fggqHJkC2L7TZQs0NVFzq0kkAcQqn3gO
VHEHFTlXDQPLe1Wncha7fs1ADx8pNdmd55YFer/FCPEqtvxn5RCJltDzojWhG11P
vWjJCmmJAy4uqeYjx8QE6jGnKW6rZWCTalru5A2NB8hci+vuoxqEBpzM9QtESdIJ
CFpSLtg9lJx29s0rrG6ixu+3YJ5j85TEwGTHrtBi2J+GjFYdDnCl9/Yhl6gjgrwI
IETqYZLCv4vAflVzc8zbo4gzthdcB4CHRiD8FfHRP5iqT+JAg6a9i4mT82cLVX6y
zUyhWJAPV2QlVUN6rHR1zU4bTcCqymkyxbl7KRZNUuE0O+/1k2AIBzeHLXq4292u
5baiB0EJ0xs7z24OOhkReAuXbsWo4x8HY9dSLgrkTZGkfRyioS+SU/h3P7Hzf7IO
L8IaGZgUEzxRvspuFFuQfcvkiQStWiLcoiJW8mjdCe03sF2MKOQ=
=SuZW
-----END PGP SIGNATURE-----

--tNNl2xM7+YgU3NMO--
