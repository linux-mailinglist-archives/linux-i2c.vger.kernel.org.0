Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA06F4470AA
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Nov 2021 22:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhKFVbV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Nov 2021 17:31:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235154AbhKFVbV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Nov 2021 17:31:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC43861037;
        Sat,  6 Nov 2021 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636234119;
        bh=OP4Wa+1ZQUXWnQpArSQsCS6ZDONWdHL3JC19tpFhe6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BcRMbxFtdl40tG+X0jUbTelRUrVIlooaTmMEeN26xnQbuLY29i9m59UO/Oz2sYQQp
         6slFSAC7TfbWkz0KS18a+9Ol4RTr6cTAS6uscJW9Zta0ZvvDROc/dI6jGyeHdmPIL4
         0CVnqJtdb+LlppOcELgdAgr+CEIbywEH+V243sykFaXgzHRfT47LQ67hyuq9uNveWk
         SWHVgQl5LqiM6cbMYLiuHIyt8GzfgGjhr9jJQVlQGRvwE7swdg0yX/JlwFSvSJztKT
         h0m6Q0q2y+sJ863DR6JJoTW9gYddKj/XHnbceJviRJJ3ouP5PW0BtPatzN4fPWwMRe
         kestQdIHS5ODw==
Date:   Sat, 6 Nov 2021 22:28:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Zhiqi Song <songzhiqi1@huawei.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] i2c: xgene-slimpro: Fix wrong pointer passed to
 PTR_ERR()
Message-ID: <YYbzfoAwjyDve+49@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Zhiqi Song <songzhiqi1@huawei.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20211101140235.777322-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eVMr30etY4TWRuqn"
Content-Disposition: inline
In-Reply-To: <20211101140235.777322-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eVMr30etY4TWRuqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 02:02:35PM +0000, Wei Yongjun wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>=20
> Fixes: 7b6da7fe7bba ("mailbox: pcc: Use PCC mailbox channel pointer inste=
ad of standard")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to for-current, thanks!


--eVMr30etY4TWRuqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGG83oACgkQFA3kzBSg
Kbb0Ow//aBmJXN5IIkbAiX+grjkJLXo7SLj7fl8R+NzwlboVXkVfnx/I9sy83W7J
GXzN4wOGWBwbVZZuPqF6m2EVGKl5o+SSv6985mH8TXiwW/YsP6VdiQasoxvhCrMI
e/MSgErr+1Jubbq8h4YPickEMnXMLdqAGnPfy4ZkxriMHxib1r1Z5iE/EoHB184t
22WhEtKtMjtuMKRSFhzyFplVg5AUZienvu0tCFScyncGGPZVAyWOpJQP79e5reUm
2xICafEYlBWVzfGOcyD7AkPUIBHkvxF5xfArSBd8hnJK1kWFoNKrQSl9afFOH5si
HlXn2vxe/bDjlZKoHUnV7jNAxMulTlvanezIXKWlHNyUPgZBx5P4FFDv5tM0TGnN
b4zdHCeBCts5B/8A6AQcNq8dyXLQIbVXKBNGPhstlCHEfl+QKYgeqLwfXu+grZ5J
/wPOexBPik4iAhVFWMhCyoTK9293xjTG5oI6kmF2Me21V2B8VxBDILE8hITXRerk
lSWpsDtTQAJnoGOA0wITsaEOSgmoedON/4knC4sjCSwr3y7UZNAsS3IiLbAn3rQB
vE/4VwxfP9uG9AC6x7nRIgFuYEOH3wRQvz41fG8xm2MRL1FOwbyOMsc0eySc1xIO
X9VoW2C5fCpzTFtc73iIqPHud6lR2myirrSBDaXdwbNRC15C/9w=
=+fUl
-----END PGP SIGNATURE-----

--eVMr30etY4TWRuqn--
