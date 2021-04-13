Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D93135E793
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 22:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhDMUZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 16:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:49580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232014AbhDMUZd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 16:25:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02608613C7;
        Tue, 13 Apr 2021 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618345513;
        bh=BnHFaN98HC+CL19YfI1WOcczJ1j+DxoFEqLvR369Cdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=th9jq2jOaXz+IcA1Q4x1kLwwvceAsKsomEcWByE06mdcwLqAVEa/BLUKpCcXal+72
         Xi0P4058/LILcYtbeABS4hOMy1+vWveX8ccjEn9g2iWT3A6zem2ak6PwBuYQUQMo3U
         raXCkGLycXXKSkTlNiJc6I5vccQjEGu9bVUxwkvRFiQtOhbdv7kqQMXzvSRfXTfNEG
         0KFR9M7fOsQTxa4/OVVIeGX0crYOkEGl1Fp74w+So9Y9vhztzSzIBoZwxGHyCu+Uue
         tXeEbX2JuzcYejfpFCd5kaEfZGyrJgrANZ+t93FWZR4xly4Scsrsqxz7d/h//Ignmb
         tm6LPshks8wvQ==
Date:   Tue, 13 Apr 2021 22:25:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH drivers/i2c 1/3] i2c: amd8111: Fix coding style issues
Message-ID: <20210413202503.GD2751@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617613430-11921-1-git-send-email-tiantao6@hisilicon.com>
 <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline
In-Reply-To: <1617613430-11921-2-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 05:03:48PM +0800, Tian Tao wrote:
> Fix the following checkpatch errors:
>=20
>   ERROR: "foo * bar" should be "foo *bar"
>   #189: FILE: drivers/i2c/busses/i2c-amd8111.c:189:
>=20
>   ERROR: "foo * bar" should be "foo *bar"
>   #191: FILE: drivers/i2c/busses/i2c-amd8111.c:191:
>=20
>   ERROR: switch and case should be at the same indent
>   #201: FILE: drivers/i2c/busses/i2c-amd8111.c:201:
>=20
>   ERROR: switch and case should be at the same indent
>   #359: FILE: drivers/i2c/busses/i2c-amd8111.c:359:
>=20
> No functional changes.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Cc: Jean Delvare <jdelvare@suse.com>

Is the binary after the patch applied equal to the binary before your
patch? Same question for patch 2.


--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1/h8ACgkQFA3kzBSg
KbaADA/9FZz6hGS7gMAf4VOPRfyJQIOUDM/PI+ccpG0EeGEyBClxhHLND3j7FGPG
XD+S+ncNSkhozkC5DDhCfo1p6jNQ0374YR/HErZQK58MttzObP1ksRdf4+f1Rau4
OWWxTVHTRCZootmO13+72wuxwiUYLZ4XkZ1bB3VIGd71Makeyy9xVDZ3A9KJMm3R
JwSMF4wBxth7nOcUAmRL+7LXqawc2O8mIGPkPoQRM569QmEamQj4okBuIau0MfwN
iU1P341SLPaPKMIsnLY4ffaEsYmyr5PM6IIvfSAH5yaJPYmTbmbNsZA/vi6Mu8UJ
KfBQIPVpGTQP7X1Tbmcln0kkkRCDk2gZSYm/lezwx/rfip3vDRmFpu6UpopJIn0m
SJ06/bLihA4pJVazVZSS7vZviYMRPgiQ8AH3862jFO29flb7rGMGYJcvE4QgFNht
i1BOiBOD7X9xx8pgv5d2W7NoY7nZ5EmAX5uefSiY3mt/DYgkutIYaHPGn4tGPgxk
zRn0jjcjmvpBKebfSnMGW0jLG+en8HGTCAeXlVMrbKCzWDCj9r7sQETlxyUTYNuF
+GmWtWKN2uIn0QP75O0gWW4SUUUJKRZlSjQ+vrVfOLqGHSbGmDie9p+KNI49OB9o
rikzTJjbLm4+CgGhiZhUAuAsB3iDvhSj0qahXenz3NuDofmpHxU=
=3lVz
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
