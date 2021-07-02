Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8EB3B9D02
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhGBHjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:39:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230109AbhGBHjX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 03:39:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B81F613F9;
        Fri,  2 Jul 2021 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625211412;
        bh=LbWH/hgbnbjb2OTs/z64gmR6Att4GMCQqki9euCDxGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lwHetjnlNUVpmlzKD2mYhE5thUYm6ESJv9teSv3Cgrzk+q3+14E89ezpjs5zatVPQ
         vR+ZbIziGSfdLM7/bUmCmDaj8cdh9AcC+yfqC4gqzmcT6eEinabO/aCJ5DMVFr/Sq0
         R3nKxnWQOGCD0j6N5CNdPRDRI1NakExxJpZBqRZQuKQFrCcPfl96shX0NmmC/ao6yT
         vTEaDH4W020ZQlX/Dr6KeTvT+fkXncMyE7EdLF958xbW1hQAJLjv05bEIYiah5t8GH
         gcRdP4xYA4kFeTBiXfFRK6hIkpcfWS2kwRPlh1/RaDh+Zj/IHaxOnRYRhUJHwM7Kn4
         +nYBQxgS8IEkg==
Date:   Fri, 2 Jul 2021 09:36:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN7CEKj9787TTcCT@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
 <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
 <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
 <bdea419c-b450-f6b1-fff3-7df077b2abfc@intel.com>
 <20210702072127.yzofc75cuuqtvzbn@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E6t5v3h0jtGnIyCK"
Content-Disposition: inline
In-Reply-To: <20210702072127.yzofc75cuuqtvzbn@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E6t5v3h0jtGnIyCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 02, 2021 at 12:51:27PM +0530, Viresh Kumar wrote:
> On 02-07-21, 15:15, Jie Deng wrote:
> > Then what is the need to design this interface as "return the number of
> > messages successfully
> > processed, or a negative value on error". Just return success or fail is
> > enough.

Let me quote a comment from the I2C core which is there since 2008:

        /* REVISIT the fault reporting model here is weak:
         *
         *  - When we get an error after receiving N bytes from a slave,
         *    there is no way to report "N".
         *
         *  - When we get a NAK after transmitting N bytes to a slave,
         *    there is no way to report "N" ... or to let the master
         *    continue executing the rest of this combined message, if
         *    that's the appropriate response.
         *
         *  - When for example "num" is two and we successfully complete
         *    the first message but get an error part way through the
         *    second, it's unclear whether that should be reported as
         *    one (discarding status on the second message) or errno
         *    (discarding status on the first one).
         */

> for 5.14-rc1/2.. So it would be better if you resend the next version as soon as
> possible :)

I won't be around for the next two weeks after today.


--E6t5v3h0jtGnIyCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDewhAACgkQFA3kzBSg
KbaDIRAAnXseiLxy+qu3lkdYbNiRZrjtUPfRyUwbFP42S/dXhCUvmpiofUTqRLKH
LiWk98Z8yX+6ITtqbs0UM4+XnUuspCXfiSec2DtIJFW9WP/MYKQRRyrMfnA5TTui
fFfVQ3HwRgRWtyB85bS0vTdpZYjO0hMDSQPaTINE4jknHUYMIiQ/HCyY2paQB77X
rb5W6UUOoRoNy7WOQu5Xrn8mHvxvTDvgoqvLpLsD2g5GqlJK4OMyirrvwCaurECz
grKUYeeRKhyezgNnL51fK6jd8rCXTpeKDQodlV51/QaPTN3orU0Kd8WHbjHFIYdx
jQo18g0ZG80b0YtTK8iz/2SUrZeBsWzcSTnkLNw4Hc1FU94Z6TOhGRUWdP0jz/O0
lz/j4tgQxgrUSO+U5n+jpFMRktqBfplJr6ksoPneST9YYrBq2IcbkDPbsYuGSA43
mlvPWC0tF/l0uOoIfEox4rF368741Evk0ypY6+ytJwql/4DRj69JisfzLyLJpOHr
fzgAow6p9fErvPq+bDSAZGQTfUrdgPFyGnrFdpPCQsBULJRSQisw4hHzXZRcA9GZ
sehwezAIQNp4OrfgdUFORmyFCsBGKlHDuMQ06ZCZxzlVOcWvBEi4m3fcDzPBz18+
bFz9wzeO4B6PUje7gAN2HU7YiHE/pBYGue6Dm3WGiEfh1qL7IUg=
=pcTi
-----END PGP SIGNATURE-----

--E6t5v3h0jtGnIyCK--
