Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B62E362BCD
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 01:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhDPXJF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Apr 2021 19:09:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234996AbhDPXJF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Apr 2021 19:09:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FCCA610C8;
        Fri, 16 Apr 2021 23:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618614520;
        bh=Vi/TG3yQw5A6sVb4yA6VVY7VuQA+iy3+beGZiX8Q2kA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j9xqs18Yc2BYubbjoUKemczlz5u6Rl9HVVMCM3qG7lH1fHw6GbVKxOdTXAM03l8ha
         6nK6sK1KVOLt9kc/k7NDDvDDxT3IKweDU+H2vAQQRfmcCxNglHUOSi+dhk1uetAKPM
         5twrsF3WYR9Hm+wqslMl3X+YPJjA1cs4exGXdfJs7nKu/dhVcz2milaQZan+cs95Y5
         M1OiIYPYUL/BwdFbv52K5c9hxdHJHgAryVHNaFyc8dtzhDRYu4qn9OqF0yhmCg0Rlz
         hv+JpzrJNv6fCY65TEBsucc2xP5EZzOacADDfQnNGNdXlFHLVcJmmuqhvqKersFDBq
         0TJyS6BB2IMzQ==
Date:   Sat, 17 Apr 2021 01:08:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix spacing error by checkpatch
Message-ID: <20210416230837.GC2680@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-i2c@vger.kernel.org
References: <1617610722-11498-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <1617610722-11498-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 04:18:42PM +0800, Tian Tao wrote:
> Fix the following checkpatch error:
>  #614: FILE: drivers/i2c/i2c-core-base.c:614:
>  +	len =3D acpi_device_modalias(dev, buf, PAGE_SIZE -1);
>  	                                               ^
> No functional changes.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to for-next, thanks!


--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB6GPEACgkQFA3kzBSg
KbaOTw/9ERRjMWhrwaURPtdWOjjkb2csIsCSSMEVlCiKUc6wmPOKv3lwSKWzhhq7
LbKQNwt46S0kFpxg/sWpjRzIPlwlqIOFdorWTU+O8l+iwl81FfPQ/9RLs2HKJQdU
Ikk19X5k+yQRNiZ+h1TNraHCn0Aw8GErDuQIyX+6VGKAo2Zgox/PZDmVPhm/WcXp
ga8BnEhsuqm3jQAtXPsC28UCOIPZ31yqvkn1Tr/Dg+90QKC5QAVisjsLNNwGNMNP
6ryDcP8TW8VySHPEffaB/x4yHCbRucRvWddfhaDasFFqQv1zMKi5UK9AQc594k/A
DZf4Cea1Z1N707V3Z6cSPCGm21hcdfhpE6dJeBx83W/6Huw1f1RFkOc4RD1h6ngt
OHsxvAxQkzQi7ZZq893HIdKbTnzE+6rq4hxftcphOFcQ3WO0uFDEwRNhCW5RgBki
Ftbj7ymAUzRzq7Cac4fdP9wYD85CMP80k6iS+sU4AVYZMqTQpBes0v4+YJAua7G7
P61icNLfpwcmT1DufPCR37uDPSJ/IWPZlQQ+Ep9dSzeRoorpLVVdwe+lze1BtaZt
NTyPGcLMNmmZAo4DBhD8ykEzKViUDiYliZFq3dUbVcVoT3OCzMqagq1knE4GPhur
S7pL3j+/pxQhaMZUa8KCPJCvxuossKr6i5kjGyrcUFm0cUrNKYI=
=vM8O
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
