Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D032EC063
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 16:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbhAFP2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 10:28:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:40894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbhAFP2l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Jan 2021 10:28:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FD5322BF5;
        Wed,  6 Jan 2021 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609946879;
        bh=HZu5jtU50/uZ3D891X6a49EHSAr2Mcir7dE+hYsRtLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a4YSWET9hVZBjhJqWdraynC58gl8HfrIX4uXTN05bnmf6YsOxCdqkCyxLg1s8pfWW
         RedkwSvy1XSNx3xnggJ/gtLxzFb0j8D/+oGdcgvRQ64zahQLLBnJA15j0Yh6+XUfFS
         dDNlXcd2uKBhBA8jjHUBvpnHL77T99fFyImOuKup0lwHUNKWTouxZBxIjyKBqSzkba
         41rnsLqw7gNz57tn3+ont7HJoCYZkqoG8jHfFS4ZrNpvia2o/2Db80tozCx8OfzBOb
         t63iEYFY1KzPLXnnRIr+2JChNgwVQnSJ0gHJ4sen18GsmBZc5k7vRjI3jPr62YhWiK
         Zx5xH4FJvAswg==
Date:   Wed, 6 Jan 2021 16:27:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     daniel.stodden@gmail.com
Cc:     linux-i2c@vger.kernel.org, dns@arista.com, jdelvare@suse.de
Subject: Re: [RFC PATCH v2] i2c: Support Smbus 3.0 block sizes up to 255
 bytes.
Message-ID: <20210106152757.GB997@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, daniel.stodden@gmail.com,
        linux-i2c@vger.kernel.org, dns@arista.com, jdelvare@suse.de
References: <20200729203658.411-1-daniel.stodden@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20200729203658.411-1-daniel.stodden@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 08:36:58PM +0000, daniel.stodden@gmail.com wrote:
> From: Daniel Stodden <dns@arista.com>
>=20
> WIP, v2. (And still haven't had an opportunity to verify, but rsn.)
>=20
> Updates since v1:
>=20
>  * Prefer stack storage for user_len[] in i2cdev_ioctl_rdwr. Sized 84
>    bytes, small enough to not kmalloc.
>=20
>  * Keep original transfer type values around. For reference, and
>    possibly for reverse compatibility (new code on old kernels).
>=20
>  * Renames old transfer types to I2C_SMBUS1_*, assigns new transfer
>    type values to old names.
>=20
>  * Promotes new transfer types via source compatibility. This is not
>    necessarily the agreed solution, just a proposed one.
>=20
>  * Define I2C_FUNC_SMBUS3_BLOCKSIZE 0x20000000.  No use yet, assuming
>    only adapter implementations will employ it.
>=20
> Ongoing:
>=20
>  * Like v1, I2C_SMBUS and I2C_RDWR return -EMSGSIZE to legacy clients,
>    if the client buffer is 32 bytes but the device produced > 32
>    bytes.
>=20
>    Like the -EFAULT case, code will truncate data, but copy what can
>    be copied before returning. Not 100% sure if this is really useful,
>    or if truncated data should return 0 and rely on the client to
>    figure it out.
>=20
>    PS: I didn't notice the 'while (res >=3D 0..' in I2C_RDWR when I
>        wrote that. But one could make it so...? (Or give up.)
>=20
>    PPS: The old behavior was driver dependent. Some would fail
>    	(e.g. piix4, -EPROTO), some would truncate (e.g. viapro).
>=20
>    I'm starting to lean toward silent truncate, return 0.
>    Most permissive.

I am sorry, this has been a while... :(

But now I reserved some time and I am eager to get some SMBus3 blocklen
support into 5.12. My suggested roadmap looks like this:


1) enable 256 block length in the kernel

I will right now start to work on this. Add support to the I2C core and
audit the existing drivers because quite some get block length or
RECV_LEN wrong. This ensures we have working platforms for testing and
in-kernel users (TPM) can benefit already. I'd like to have that in 5.12
upstream.

2) expose this to userspace

Once I send out my first RFC-patches, we can build on top of those by
adding userspace support preserving backwards compatibility. If we have
this ready for 5.12, awesome! If not, we can still modify the kernel
interface to fit the needs. 5.13 would be great to have, I think.


I hope you guys are still with me. Especially for the userspace
backwards compatibility, I'd much appreciate if Daniel and Jean could
spend some time/thoughts on it. And everyone else interested, too, of
course. The more eyes the better.

Thanks everyone, happy hacking and a healthy 2021 for you all!

   Wolfram


--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/11vkACgkQFA3kzBSg
Kba/qA//eklqLhoMJwC9OPRchV9mNpWXcO96LG6orOeFZGy5J1RETgu5OM1Q9YPQ
SFzS9pCFJaf46u+kstGlW+3e7iNto8F0ObHK6Sm0vAMJBqpfZUkHYfhko8vDcIsN
4GXIit/b5cRoU8At7Oa/Kx+VNR3MEliBhUtOWOBK4/1M5yiJa0mhCvYL4nHGihSF
H55/CE68obc8Smv5gjzwjs/v2AxjUTlYUWmlB1xwWop6M+vSj4uwdBHq95/xnOQ/
sY1tIVjskd4+NjavVurC9NIdt0eaMftn3bwKNheeg1zYd9ZZv19wtbG+RRETZIx2
P1/phgjJzfNlYTO4ecuEWqBEmi3nmD+i2S82VBOmeWLmrwH7jiaW+7UVd7Pi0DvL
l2evVHT9FxN6Q0DYaUbctPLVLaDcvE5dd78eMBC2eHp1ivaJBfgJVdq9LJX9TxF3
oLbAYa64K7k8UhX0VkQIrD1loAot/wrQ/q6xes3T9FiYmvuKCx6hx4aZ4APaGZ4c
gFh68564/BmSC118Ox8AH1AIH8nVoQkavGz9zXGc+r8CcZxXXZJaeAUJhGmQ2rY1
DkhjuUlXncuwhmBR3I5PrL20c40LhHEGbCXaS4bOBHFrM8JbxQGezQZrXWSxUO/o
jWbQ6LH1OHLqWZZYjUU6ULjnAYTU4/xbGsQdD4UvVPaJT0ufCCM=
=KvKS
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
