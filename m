Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A117B48208F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 23:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240669AbhL3WUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 17:20:07 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45158 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhL3WUH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 17:20:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 250DD61703;
        Thu, 30 Dec 2021 22:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCCAC36AEA;
        Thu, 30 Dec 2021 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640902806;
        bh=lmiOwZGX0S5uzJNGEkrULtDPBP7D6YIQ3tUGzVHwFdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ULroPsqYhYo8PMhsHFouUdixZhSsaUI4lFYN+IqFQYJBprftZR4zWonuHUMrj8+BL
         8n6kEQD3st2nZGNL4x/+j4JcjkCI1R32oKFHbovKKTxidyd++h8fR9M5o9iQu/gQ/L
         hFfSJY85mx1TiV+souQKwDcsX+oHngqif81s+lmou9VGfaOSp8Iz0PbQbaQ+0n/Kb3
         I9XH9WZ2IesKdeKSz3q/u0MJSw3/axTiI1At55Pa1WRPNMUfYvvTR5J+dEas1IraYR
         6tTGoBWqnbXZrVLd1qzFyE85Ma/hZQZqEDiuCatP03uRqiOXCAJQF1x7KhrXXvWkkA
         9FgfjGmU+nSMA==
Date:   Thu, 30 Dec 2021 23:20:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     viro@zeniv.linux.org.uk, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] i2c: don't pass 0 nmsgs to i2c_transfer
Message-ID: <Yc4wkyr7QTs8ao5x@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Pavel Skripkin <paskripkin@gmail.com>, viro@zeniv.linux.org.uk,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
References: <20211225142816.6255-1-paskripkin@gmail.com>
 <20211225182418.26839-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t9M6b8CoV9TIEXl3"
Content-Disposition: inline
In-Reply-To: <20211225182418.26839-1-paskripkin@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t9M6b8CoV9TIEXl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> -		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
> +		if (!rdwr_arg.nmsgs || rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
>  			return -EINVAL;

Shouldn't we check the msgs pointer as well while we are here? Like in
the non-compat IOCTL code:

443  if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
444          return -EINVAL;



--t9M6b8CoV9TIEXl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHOMI4ACgkQFA3kzBSg
KbbnOw/9FKQb28c62rtFMey5yxWwtChc6G/FQc/W4CuFrz+7JciVgplXBsLKGn5G
BaSg4sRotUoPu+WevXU3YQzu80cAGEfSy9R60wSjcDV/9AwShOtA8m2lik5do2LB
D1Y86mPz0SxUimCgudN/pEkOcx73AeqHVJY6tKR7oG+sY0b0iNF28Yit+zfa9Y/B
QbM8XWSfU2yrYEMh+hUoIQKMdp2qFeIK0VD4St8Xe6O22J9snu/TT5/8Y+l84SSJ
KUuO2QwewIa+sXX4LThm/zpRlPF4PTNmedAhgCE1mIkySw3ywQxS4OwnZU9YlWkW
qQtUOUXyI8lMJyvV0CJQowiaYk9H7myvU2ZXh3QlaEVbS80roWNP5WKxIS/4vvDa
Avq29ecYEhshFQMVwi2XtvvGZyFz7LjWjVz+zzvbyZnWvbze36+z2fwuKjjrif+v
bIuPTBbceLJ5oXqTautRMQg+tB9NsIWMQEXHOiUB0wt3Gh+gXAb04ZPcPxcNZXnw
wsPi0rx1v+6n9Lfn98ZUO3HiJapku1VtmsVc3LUMqpYnBNphzVGjwXOeynibqMHK
NTYDiDNw96t/JRagbH8bQ69mKrTP8n9iloBAqioWSIt8VicnI0wPVUAREo9pnHQr
Be2u75LZA/oEM2HCLAKS1mRwEyiPn5NVfzVYt+Nyim+WH7PZmDc=
=pDJU
-----END PGP SIGNATURE-----

--t9M6b8CoV9TIEXl3--
