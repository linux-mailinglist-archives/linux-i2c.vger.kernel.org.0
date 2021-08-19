Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3413F1EFE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 19:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhHSRYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Aug 2021 13:24:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232827AbhHSRYp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Aug 2021 13:24:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D32061075;
        Thu, 19 Aug 2021 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629393849;
        bh=V2+TYaiXErkcPbcE9j+Rpr8nZGtBRaPkrXZzAokpHrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pIk4Tjnsxw+12XU9KYIV2pE9/z4eN0pabGIW9KbEWyakDpbZ4EV7Wpxc0uHKK8Goi
         MH2aCeSTarfY0vJvmTpvimin25qj3VwWmwQDkK6+uwrwiSlCA9YEmrco7jbX2B56Y4
         mZ6zxfDVzWJZpkvQGcWm3IBx2so5jKiJOR1TXR+PPG9pXnMh8cJKpJAkywhukrgiq5
         i90YACHaBcrOTS39LP47t9IuBN+61SfmEzlIHtRGySPpFjnUwt4zj06gzviHO63X0G
         4jBGUEKFvoTDlPvjjt3Y44BSMpfWO9D2BlsTuBQBbsvnLABTc8Vfok2Hu4s4ZGmPSD
         lKsAtUxaeEDdg==
Date:   Thu, 19 Aug 2021 19:24:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>,
        Vincent Guittot <vincent.guittot@linaro.org>, arnd@kernel.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: virtio: Update i2c-adapter's of_node
Message-ID: <YR6TtolgrEG9ij7q@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>,
        Vincent Guittot <vincent.guittot@linaro.org>, arnd@kernel.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <376bd0a3a34e8f0de297103dd2f711bb236a8615.1629257677.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eTY6BXmAvITqGGqC"
Content-Disposition: inline
In-Reply-To: <376bd0a3a34e8f0de297103dd2f711bb236a8615.1629257677.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eTY6BXmAvITqGGqC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 09:05:50AM +0530, Viresh Kumar wrote:
> Set of-node of the adapter to the virtio device's of-node to enable
> automatic parsing the of the I2C devices, if present in the DT.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied to for-next, thanks! Since I need to rebase for-mergewindow
anyhow, I might just squash it into the main patch.


--eTY6BXmAvITqGGqC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEek7YACgkQFA3kzBSg
KbYykg/+LIGydh+fo8PIycG0wor+wgSsJHk+zjHeFpEqHj3H/6ql8qlmiy0Jv/gd
nEFldUOPneGlUrAP/D45MLgP1p26KL9r9/cV4xJU4TeRtm5qXdYBdt+nCxfY/ogs
u/wdq3pMGVTjck7e+nzbM756P4jEAnqEwf/gkTXtJq57Vv03FVMGuiwNOoL+oTNr
OKmJMS0eOy6Hm3bs5V6Ck9S3A9SYIbcYjCDSBDn09PtrINKij04aiEABQtbhp5DR
SWsb2+K3/Jc/wIbIXxJk23gnPCJWZPz0WpplyGJvpEB777/MX/NXMqUZiYRSLMf2
n4fZu1V6dxHxk8QP00F5GSkeKSDfgR/7/IugsW1igQDHtw2zxi8QDO+IVbu7NmAt
8Ks+L/JITtPq7c8RIULcEFfkzHhR8/f1YbOyj5BYUHLnqdBV4Q7+CFnYDKfWFagA
W8BLd6SvGlJQnhUF6Dgh8FIiM5YR4Aq3GQMnocdh6vT1hS5trru23al5MycnLGTy
KO4oKnMZeZ3GP8xxVTqO/bQVK2fP5xhIthAWEo/i3YyavJLEXR0aheZo5XXKy+q0
MlfgUqj0GO2lqDFsipgeFTeZBfL55M0rHccrKzUvenWd91auZDd7biggRr8sHHDU
OgFNna0hXCYGpnM9l2QM1GOamrMK1Hk04gu6NYLhe1AtVoOJ5nE=
=zWte
-----END PGP SIGNATURE-----

--eTY6BXmAvITqGGqC--
