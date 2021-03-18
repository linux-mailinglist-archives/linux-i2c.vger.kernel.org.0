Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247E23403E9
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCRKwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:52:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:48210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230180AbhCRKv5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:51:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 661C464F3B;
        Thu, 18 Mar 2021 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616064717;
        bh=GGf+pazItb5QrmIMPrXejMNcW2SCcwiSSjwQVQ0igKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=igjAnYEme5rIKdM7p4HEBnrIMN/8EBwQpO8JuM8asxfeN5iq1v4j949z0o137IeCt
         UHLUvVc+srNricctNYHZQ77yC7qv+DaxFYi1T//+iWiM7M2mnJfSOGPhh1TwVPYKen
         ww1HfCcvdKGMVYgi7SYn/VUWV5uzvBcllSuTGAfER3fZgebU08aXThhJk/eneztw+c
         wH+Z0uO87nvxZFpbmO28KXvqPiPc0wj2El3+hyHQgBFlZcVUu8wE82RKfVHGjjej6q
         p26VvfhcHrBuahoczACeSkIr/eSzU/3VJfNVYfJ0WE8e8k7TUKiK6lQVUYZtl+O1+m
         Ys0Gass6TW0kw==
Date:   Thu, 18 Mar 2021 11:51:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc:     Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 2/5] i2c: stm32f7: support DT binding i2c-analog-filter
Message-ID: <20210318105153.GC974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
 <d39593ea-ef47-5688-202b-66458f13ecc8@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <d39593ea-ef47-5688-202b-66458f13ecc8@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Please use "Reviewed-by" or "Acked-by" next time, then I will see it
in patchwork as taken care of. Thanks!


--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMMkACgkQFA3kzBSg
Kba3Xw/+InFaMGAXyoMz6thqL08q0+4FQDDeDDx5N5sdhNeLiatAR0wv+GZaNvv/
CIJmuep7LJ6IDNRsGLHn1XK/LYs3okh7981RqvrV5qVnVhtGCpXSMmybV0SLF/7Q
pJqB3L+/2feQCwZ8TbESM/bcXpp6G9Da8xi3amZ5bpxzy/5TZVvjUTak+RqrWEK5
7CH0qpRnSbX1dIhElLuHYxosS83jOGr/YhFao+N5kXZUE1Hu5vIuCCUhb1ezV8t6
WJCTGOxh1THRVFL94kTmYzsmZVkHOY4wvStFAvBKpYK98cWJ7NNemiHgdtUBtCB3
ZWxTIUheV2tPmY9t9U2GTvYqJUsYNIloGdlIMBPa81C4xr1i2UIkiaalU7uGr5Rt
IBAFyxlPwAKxNrHLlQBiagZBFNIR5Aka/n8VJqAoEzyUl2WjQ7K3dl2A+J+F1YdK
Ahw5GbVNIhHLmtz/mJ8DerX9fhpI7vItN2+DV7ebIWMFcMuwpl357sLT0fmrdcE4
iBm52QMTWDEkVjfUPxBEBDJYW0eR/EsYj+K6zecaJi2HH6RH8AUbg2ViM7FWY1rA
S150rH4yl+wR3jQNe3hGtJMQF5NsWftnqzmcoe2EGM2pBR5d7mLcz8guJe3Vo8fm
Vj9Hsdq+qnOjixksh0u6o2SBcNjfJYj2PrtBUD8sWO4QZCIwWc4=
=AnVO
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
