Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A81358EF7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhDHVJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:09:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHVJZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:09:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3187061179;
        Thu,  8 Apr 2021 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617916153;
        bh=PWSYbHRmc8H26vbQnbXDnLQbxQwv5uEOXcjyX00ZppU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T6INTWa6DvMHDBM/JmxNXDyDAPQppI+zutdHKbfnc8o5p9h2f09EN4EAO6ENAGg/9
         MFbGX/xcnnjiZiGQacoHz6nVdb2prTnVzje0TJcwF5x4dOXjT+O4v8L8FVtB+BU1xp
         6+oyx/9Am9YGx9qL9E0C3I/FCo382o+i0PRi2C3qvmaKJUuBYJcg6MShCbtIIRO7YV
         M/HaKSACyOm02B/faBGWkSTr/HxFUiCWH9h+IOlDDbXEtX7T11XrHXgsZlg/fRwJLf
         qH3+KQOU3GeCwhqBjw9HYiHEc6TMtX6Af/1KhBqmkJuCpG2sN9aFv8FhxP0jKZFW68
         TGl4RqWZzHpXg==
Date:   Thu, 8 Apr 2021 23:09:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: brcmstb: remove unused including <linux/version.h>
Message-ID: <20210408210910.GH1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org
References: <1617284267-27743-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbfcI4OLZ4XW0yH2"
Content-Disposition: inline
In-Reply-To: <1617284267-27743-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VbfcI4OLZ4XW0yH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 09:37:47PM +0800, Tian Tao wrote:
> Remove including <linux/version.h> that don't need it.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>

Squashed with the next patch and applied to for-next, thanks!


--VbfcI4OLZ4XW0yH2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvcPIACgkQFA3kzBSg
Kbbd5w//TRcaGkJdwA9JY/cWJy+qMVbzYnDNEBadWJLo4TAbO+uEV8cCGT12dA52
WGjT/BTa+xFXQNv1vg4X7NH4Z2qHNlJdPFkYqc3yVrXnKa8Kav61BFXKUpOHR753
LFHgTya2LBgaGmeOlmfoHorbmfHxqyAHG0ZDBX+s9DYc2wHwId/Aes1Bg5u8z4KY
YurNzJuejmDMkXbIJb18t6b0Z7TKrwLdWHVxgdlQPvF8p/kAlmmKmLGAmM1Yszs4
JLlS1X01IU6mhUF3hZDlE7l+QblAO24/9iE+2LqqwnLjzh6vL7k3+JWyky/pHGvn
3/7OAVKxmVyezclNGlV0Jm68kSdFJuQrBBny8Ixw4q9X030mI6aIIEtZxCHAuxUh
DFobRDhHOuqms3hwMQELUNFBAuzco4Oz5tWHWK97fg4MeQhuxNcnB2qEYE+HIRwk
cThHycplpqGJLXwwnDdM/21B2NiYgP2/FV2LC8I4ORn+BLSM3ED2aMC1bnSLGhGX
VupB7lyQTsamHZQm2KUdlJ/Niv4R3QQXPCR/mD9vcKaC4bJWv9rQD9oETPjUUsMh
mhxpnGqv7W/wLypf5IAWRfJk0NQu0Ue4UVxjyJcP7uM8T5BDq02zn9T4ebkt1xgL
OQimDeQLo5eNTno3XxXRJ3mc1ZrrlZ1HsJYw4FR7G/LMlcrTmVY=
=CmE7
-----END PGP SIGNATURE-----

--VbfcI4OLZ4XW0yH2--
