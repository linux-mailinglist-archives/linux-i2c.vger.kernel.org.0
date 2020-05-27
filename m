Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6C71E3EA7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 12:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgE0KJN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 06:09:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729758AbgE0KJM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 06:09:12 -0400
Received: from localhost (p54b33011.dip0.t-ipconnect.de [84.179.48.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D963820890;
        Wed, 27 May 2020 10:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590574152;
        bh=yHPxx5r9WV3zA/SmpY1Eg7WTbX8X43s++csgc5GvexY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJ5e/s/B4XUN5LSz4MlcKt499k4rM5l5FOI9Ke3mIEMyDFBS4YWpN1XfOLC5LLhTO
         VFzRvdnHzWKp0rWsKXIphYwsRV/RCE1T2VLBn/Qh+FCIXbih4wGjoWOUNCw8MiRxNy
         /9UdcGijtqyFCYtwF1F4IKz1sNcBSsq7tcC6VlHo=
Date:   Wed, 27 May 2020 12:09:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     ajayg@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify
 code
Message-ID: <20200527100909.GD1161@ninjato>
References: <1588755670-38476-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline
In-Reply-To: <1588755670-38476-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 05:01:10PM +0800, Samuel Zou wrote:
> Fixes coccicheck warning:
>=20
> drivers/i2c/busses/i2c-nvidia-gpu.c:280:1-3: WARNING: PTR_ERR_OR_ZERO can=
 be used
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>

Thanks, but has been fixed already with

http://patchwork.ozlabs.org/project/linux-i2c/patch/20200505145230.17251-1-=
aishwaryarj100@gmail.com/


--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7OPEUACgkQFA3kzBSg
KbY4Uw//bqrBvtas5lI1W3btxS5KD7yTOENLR7QT2TTN8C7zeVgUwFifV2FNeMl3
JmzN8r6XJ9ptwnHCFx4R+oufVdPFr4IIFRyJU1NDnOaRAisYdNy5YDiTGIsu5iil
jI9wpVsnCZt5Fev9D7IaBMe/pPxewqogzwPP00qnSYvJmFzcMoFItBMA8WomjvoG
tFqqbYfO3z7j4y7SbdM+GUytAjoymi/fgsvl3+1M/AKvCq75b0RtcIawClLvm1dN
W3tshRGMPgtxi9jsivLcpzhPzYib1bGMC5fyW9iPKgIyyEeJtbQvAiybRbqYRL3O
pMZnCpvFKF87dHZRU/iuaeVOCewXCfi63w0KDGSOseVlckViGsIq4eRXkcRBxKaE
NZmcuObiKMwW768hPuVudz1yqSre7oF+E177JiohBiauV+ShHNYnI+cl5FVABcWo
trUBjEYR8rQCq+SQft6ih9q81t2Jws6iOUYOg60mLIt1tO5tCDl9AkCsOW3gWDQW
0BYEE9B6CMDqCzljmOiVlU1YaZPNNqG1vWe/mYj7umvb4q9eZ26aJ1D7eLLJVTZH
mfOh/vGbpedUV3/z2b+QtsezCi/8wtOsrl1GtLQJOHyU23JUGXtzn8bkwi10Nvjo
P4esZq37OJeud5l63vJJ3MaxuuWZToTzOxzqGh3itv5DPaFyQDk=
=bBbu
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
