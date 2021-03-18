Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5F83403B6
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhCRKnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:43:43 -0400
Received: from www.zeus03.de ([194.117.254.33]:35388 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229849AbhCRKnd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3SIVZ2hq1gL6XDxVTy9eQ/bM46lr
        uMYd4m2/lLmvRY4=; b=IpqgjG7Ci3XPGFQpxN05kAe0vPB1XilmnFOnMnj/01Yj
        OwtDNmkYJvE79a7CGMzIAt+3SGyKvr5Z6+gdlk3oi26iYKam43yxIQy8SqgB641I
        SEXjzTPY1TuxJZT7EIuz99hee3ZvGcQC4zAv4ekh39vO+fS2hNkHE2huhD+4IG4=
Received: (qmail 376581 invoked from network); 18 Mar 2021 11:43:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2021 11:43:31 +0100
X-UD-Smtp-Session: l3s3148p1@HNs8Rc294LogARa4RaSzAQBVtUgvoxMO
Date:   Thu, 18 Mar 2021 11:43:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: adv7511: remove open coded version of
 SMBus block read
Message-ID: <20210318104330.GB974@ninjato>
References: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
 <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
 <cadc7e6e-377f-db65-514e-7b2e6a40a0ae@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <cadc7e6e-377f-db65-514e-7b2e6a40a0ae@xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I didn't hear back from you, so I'll pick it up for 5.13.

Thank you, Hans!

Can you pick up this one as well?

[PATCH 1/3] media: i2c: adv7842: remove open coded version of SMBus block write


--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTLtIACgkQFA3kzBSg
KbYpixAAlx9R2w49N6dorvJ6jj6tZvDeUR5rT8z3wni/0lBE4hvo6liwN9qIJl7B
MXKamAzgtB9I6Se4PELshMR0IK5vgOcah9GaKfxwbLXVRpmuzuibHScee7iu/thD
iqBYSDc9c8SCH7Y8P7xJuh3/FJQ9roz188dA3BrzszorS+Y1HECtFUSXVFGwpR4z
UlvRtZG+ccTslX7rQ6XXA8QShtW2UjGGV+ZckAQkEab2BEeHwBGWObKGxwjjJ3VK
bcdz0Fs1Hul9Txn+liF5GTsd5+y3EimIdZko/Y6DQJhPHZvGWpT4//XnF8QF/4XW
COq7wPrU9JxXKtP/94KUeOgng8GMFjuKIZTe/Sspf6yhywSaXRKu0wFjqEQZdzev
NILiXDt2tT8ngXiGAriOOXsC2s21rbFQmq6DAf7Gnni+nKv5zs7eWyMcnbPqywwY
8a68u6/o+MTWr+/1i5/5YYKzrc7m96+pHw0Ua3WeJDyNn74mM+7TSx47C7OHNXAY
w30/bICi+7GveSI0dqCOAowxjN7tQ4QxIAkgaguqk7Y6fTvPH9Jey5MT/b0C4uDZ
s8/Vn+TqQ111gA0hj/TzxKPGlLi2nt9sDckWgq6ItujEwiqSq0N6X2R6Ky/VpPAJ
C6gvnWdhE5PNuPOVqGi6pGN6oR3/REBfg+KOk0pPqUWkz1S0Hxs=
=xaXy
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
