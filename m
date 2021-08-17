Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E973EF3EE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhHQUXL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:23:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235959AbhHQUXC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:23:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 163E0600AA;
        Tue, 17 Aug 2021 20:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629231748;
        bh=xM8Fq7ZMWQEXCu1xpmZ+0XG+A2I9ImRmgv7hwNwGuQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hP5RveA2cBN/vePeFX/3i5KSAEeAFUEIjbdXFfpFKhN7lMOPyeqWal/bZ5Ua+arp6
         yCJtZ+ktYJlvF6o1pbjd8kRs4hp/g3CoeCjeA8RDkR2DJJrhI+pxDrvbl1gjIZi+d2
         s7LxQuMW+C/Zz1ve8NQfjPos8mBzxvhMT+bTMtuKgKAp2W6rI/9yDm1h1cweO0OJEQ
         KIwzfNQ7DP7y0BAf53xn9ceze18Kn5P66emhK5eH9iUn57S3pCfYnj4CGcpQsbujlD
         TKHYq31Lr9SIL+sQ+Bgw/GCtiZac0kGWlzly93YLr2avhtBRPwMA5cTY/mA/dKCdlI
         JhyziatJezU4Q==
Date:   Tue, 17 Aug 2021 22:22:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org, vincent.guittot@linaro.org,
        alex.bennee@linaro.org, jiedeng@alumni.sjtu.edu.cn
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YRwagcZ8SUCsncEA@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, gregkh@linuxfoundation.org,
        vincent.guittot@linaro.org, alex.bennee@linaro.org,
        jiedeng@alumni.sjtu.edu.cn
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wqGf7iqXPvdRtbI6"
Content-Disposition: inline
In-Reply-To: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wqGf7iqXPvdRtbI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 01:44:35PM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
>=20
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
>=20
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>=20
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.
>=20
> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> Signed-off-by: Jie Deng <jie.deng@intel.com>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Okay, with rc6 being released, I won't wait for an immutable branch
anymore. I applied this now and we will see if there will be a merge
conflict. If so, it will be trivial to handle, I'd think. So:

Applied to for-next, thanks!


--wqGf7iqXPvdRtbI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcGoEACgkQFA3kzBSg
Kbab5BAAj+hmjTG/rpYyTFk9GZoqqGBBlIr/k97mBENtBe9nrA3TK3zkdoZRZAur
F02VXTvcq2l/oXu5Od4wQVqMF67NRkOYKldOdN+84BQ0/9P2i7PrBhX0UrMyLk1v
tIMGdi2ObAUwL+7/9VGCx1hleQyjp2RmDOMqIwSZr5j4cGH6lMTRR1qnwS5J8Xxe
QRWLN7Qk+G/5k8ODa5aFMhbWQxijvtMx0eqna8Dn6AkMoXaU8F/hFxLMWDwpjxci
FMuhQ4qSae5F89HbHmG0CZzF8ae8clExpm9pB4lVlFCU5pVirR5mYBBeWkiqQ1ZS
JmllebetdqqUzYZVQn3bAVepxSefet9MJqGxSelFnfASJrGCqKpIOX0SXzZ1bH/h
qm4jLsqkhCsqA2XfRWA9wINpX/S+oyJ4sds3HfzaQ/daA8C683jWPYnyCWksdOWD
LlbqEm06v7MTsjGsQFQSP9tfTag0L3IHHxK9wneUfUF60CTvOlXkRscINyrVUUse
epeOFzeheiuEGCMpaTkbMcKDI+gIeeBoDSFXeo1oOXyOE1WtCZewz73H+a8X+a3+
j9SQFoq0u3WqjSiZLSMZFzrsR1hBYW2V6aSaCE4qxx7nOFRGkwazkOTNJsW76ZO0
iptjFEPzgvHUOXMQLGGSh3aoqSfo3H90AZCqkGZFYD4mYPz5w6s=
=c2a7
-----END PGP SIGNATURE-----

--wqGf7iqXPvdRtbI6--
