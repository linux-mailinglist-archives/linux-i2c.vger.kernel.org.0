Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24471340E22
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 20:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhCRTW7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 15:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232680AbhCRTWb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 15:22:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F53064F30;
        Thu, 18 Mar 2021 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616095351;
        bh=BHUAanqwOsbASIOKCYywfRr2tc5rTzcdgHq4z9RDxy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIj9uyZBoYnvbeLn3l5xKmC5HSYSHwu6gYDdWGz7GxhOfai1tYiEsApnvm9Bz3tLL
         XoiDVH3GIAoJu/xKSBX9+Ij/j+9AtzCA4b/v2HQrZG7TFX8wy8pi0L7h4alixEyuk4
         jO2gyc7qeEbJ6XLDSGDsvhL0rMzWI80ee+GyeLI1C7Yr8O62ZbuBD4FgrdFriAOgAM
         KS2/icrNgr/8k6YfaOLH4qJrKenGiPW/NEmPAG9eLUhIJppr4W1oW0kkfiCzo3SQi9
         sRoa6Xukc2AsmmR8HKcpypf9ATGLjhDz2EZcE5m/taih17azlhntzrB4zQV0ps8Rob
         qMoS/P/t5wNug==
Date:   Thu, 18 Mar 2021 20:22:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] powerpc/embedded6xx: Remove CONFIG_MV64X60
Message-ID: <20210318192227.GA2317@ninjato>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 05:25:07PM +0000, Christophe Leroy wrote:
> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> moved the last selector of CONFIG_MV64X60.
>=20
> As it is not a user selectable config, it can be removed.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTqG8ACgkQFA3kzBSg
KbbmohAArNDcM8jsah4nKuj2dEoibVzEc+TeWQIgUpiB4KO9oGcBdkjORA/Su7//
GfQEAxIJAGVfqLRWHEMdZx7B91GNzIfAPm6uMajK8kNShfY5W19gzDVD1tKBRyuY
Q5xjwI5Ln2RJAVdYYXc3uYAG5ViJeQXug5JBIAlIj0ekVIWaNk3146cuT1p2d9S+
Awvu7AnrE2+5LwIUzuJURfbNYNmF7OqJIpDU0Wo7CV/7pcy96WCEVTYQYbt8jlyY
/pS6RddvhTmI3fcLZbXM1u+57ySH4xhLtq5lkqXa5l8xw+8Z7IYaOCVV+upxG6Tc
J8kf9DAIo1jyOgmfhsLusXiMPrXAlP/GeNRxG3m0Kx9eg31CLn0jCA7u5LddXlSy
aQ4vWQc/PJ/XGASymVFwONX4cAN/lJiX6SrU/7c59IookElOI9vYKnZw2dfu+xHZ
PnajCmQPIbugZNnf6JadbSJTyu/AsFOHtCX8ezNPm8rx+Dis3o04Y3SMBiSDto9x
be+WUqupXtQJAw+zVcgJzqeO/NvzdwUu7Z7vV5GWQPCFnKoD9F8LUQ6Xjmha41uQ
aOjYlWHsSH8uqXIVD3tjc6n+Ln5g4VyOcj2yqwINd3rFZtPCis0SlCqx0GeDajl/
IKZ9olgyGT/Zx58AubDDV4K1iQUg77xoo+PP4uk1m6C0EP1ItiE=
=fzcK
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
