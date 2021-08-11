Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAAD63E929A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbhHKN0p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:26:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:37108 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231240AbhHKN0n (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fHSX0vPbRfacShDGjzOH0plzFkRt
        V9grWotu/WWmi8g=; b=Z3JiJRLSL7RHQwKo7bizR3HPrr81Az5pOeg7P9xG9LHy
        c9/dnOj5sTEX3OwEbXKB2yCxE0oBCR7L9XivHiMXQ9I8CNJn5O/qfPvcWswJQgk0
        oVAfqrTM8C/puxROBoYKb8gkwescEiK/0Ej2d8mOmjWRWTFivrjgqiQ8/PQCZvY=
Received: (qmail 2665231 invoked from network); 11 Aug 2021 15:26:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 15:26:18 +0200
X-UD-Smtp-Session: l3s3148p1@w9kzkEjJ+p0gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 15:26:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 0/7] i2c: use proper DMAENGINE API for termination
Message-ID: <YRPP+f1tZXVSJ0Tb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TcI5yjMXB98ejYbA"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TcI5yjMXB98ejYbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 23, 2021 at 11:59:34AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Update the drivers I audited.

I applied the patches now, except for i2c-rcar and i2c-stm32f7 where
this approach can't be used because of interrupt context. I will check
for i2c-rcar how to do this properly and Alain for i2c-stm32f7 and we
will resend then.


--TcI5yjMXB98ejYbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz/kACgkQFA3kzBSg
Kbb/LA/+IwP6xJ0aVBJFXMzV4oywUhWP+AtDF9TkLjiZuZKyoSvx/oJtJbeskjkT
6/Bz6ASA6rnltX0Nfu8K0YICSjGpUp1N7Nl/KeLNIRtlKDJDxzG5p8YF+gJ+Sket
uMD4x2W0Wend8ifHBk5DOxrGX2wjnIiPzhZBnukZdkx1TuRjGpS4/k2at6jK/Bvr
W3+jK4ydWsYSe6tzAYK0fa9ZY8+6RjVN3HFcY53qzYerVVNIb8LzlUIOC6DgW4g2
xD8qkddxWzD25pveh3RnJgwAlOwrfKaz+yj6dxR6BMjxD9vEM2NdIBLHIPGMqPfs
9Rf7koS4MO2H4GAQoWp6zPPChEczk1cpjmGpLstj/woS80EEMG9EYvyRw62BBPkL
HZJ0RbYxjG5ckJIXkWtEDA/S65uoMnSm1j3nJPMbfsWSspuqY9hR2YkGJzLcnO3A
HfXVCg3OyjMhQYZulQ7ynlNRltxhp25fk7JTKPo66MV0DJuO+6lJXtMAaO63GALO
l7uc4JopNWGK8QBkCtACyNnpXAsO/BnsE0KmSrjSsK+QM1Q/qmKHj4CyV0PYj/hX
k8z4EjR88vVYSxzBIdqDJq/368behrlBa2kafUqrfLM9QSLgYmWhHUkOWXo+AzWV
EMJ7EUSxuMO2vo93QNmb8Zwn89z33m1HUBl5o5Zd0+qjy5d3T98=
=JYQZ
-----END PGP SIGNATURE-----

--TcI5yjMXB98ejYbA--
