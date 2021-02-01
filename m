Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9139230B297
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 23:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBAWIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 17:08:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:56380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhBAWED (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 17:04:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6182264E50;
        Mon,  1 Feb 2021 22:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612217003;
        bh=C6JpGzEAogAr353T5ploJ1gquPlKs4LZ7ydyIN7E5Mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OrUopDtkxDfmFL1K6JcKrJtx/KQ7Hkzfzaa8ZJxFVYFp0mU8rzuVB9HBgfnslJs8L
         aT52tutNpCf3YqcXAzl7JXmzwaAs7TLH2Pfq0TWmXBr0vFJ5eNv7qUVXJDm/nbZAKw
         eSaKJAlcfOTFF4hhTwLkYlT9kuBVd9Ta3MjYBsrBkScC2YjLbEEk7h+RGTDEHh+5Rj
         pBRGBKA/s/bFVHrPk/WbqjAR1afwD17h/4Yg0e4jj5yY9N3WzfcAHFd/UlqiJUi7ck
         qSyBOBdECt5e4BZOzSeAnpT+lmuMGrNrIA7gd1YhtDjeXo965tiIUuyvElXkhNTb2K
         qoYRbq08yh/fQ==
Date:   Mon, 1 Feb 2021 23:03:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Richard Neumann <mail@richard-neumann.de>
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: i2c-amd-mp2: Remove unused macro
Message-ID: <20210201220320.GE24315@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Richard Neumann <mail@richard-neumann.de>, syniurge@gmail.com,
        nehal-bakulchandra.shah@amd.com, shyam-sundar.s-k@amd.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210201175138.8986-1-mail@richard-neumann.de>
 <20210201175138.8986-3-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
In-Reply-To: <20210201175138.8986-3-mail@richard-neumann.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 06:51:38PM +0100, Richard Neumann wrote:
> Remove unused work_amd_i2c_common() macro.
>=20
> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAYeqgACgkQFA3kzBSg
KbYoeA/+LrYSZO52b1a0sEcO+Q9l7GktJ2S2lX8lDO4YOPgkuAimCMPCg/IlX8VS
4dO3ee66Q79HSoo9HDVF47mka3nt+NBhIw6jqZcSH0kY0im9YYRYEm84TqwEXMqh
pPyM4+X0QG5NrCqIBpSZLlTtJ6QwjghBVivjSwUO/9Us/3/A/KNn6JIET5HlHwrC
K47T9HJq5eg0OJD/2sRstfOnG7NR0dwN3f0JCoEwA3q3WmONYBAACnXo0h3aF/Jp
jj4AaKGZcSLWb4GTvuwZOsTVEQeYKTpRPFW9xaBQpzZKbOKr6dIkzSNPe7eyXN4r
Zdf+MJ3LXUw63OoZppORhjq1sUJZd0OWOx9MOUlXVUGzqQ6PNM/cpdso9xEmzWuZ
c7QY4D0dz21KhtTv/EFlRPSAUI++d0dL7KOkIXzh/NGAGLB6kFob0q/twp14o+R8
Jc78E5JNcAPhIQ0nnrBUDAxQgJtJ+bFT9hHTmXaYWZmWY9c6uTAJGer4kZBiheY1
tXNTUIvR8vOYUCs/eLLMhgF7307yG/arLeLbZkhnVuY2kQ68Jejk00ysuCS7twup
qG2eKhqThUv0pWRx5gi5CObXylQ3luD+IivI/IesNBeprMkT243aFTu2q7y/A+2+
B1N++qHQ6wMU8gDEWE4uMre/oiOCsB0xtYBsfbHrPTsASuPaczQ=
=9FAJ
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
