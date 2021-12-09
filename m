Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E064446E258
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 07:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbhLIGUe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 01:20:34 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49410 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhLIGUe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 01:20:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 242ECB8232A;
        Thu,  9 Dec 2021 06:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2B3C004DD;
        Thu,  9 Dec 2021 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639030618;
        bh=Cq+3OJI1kLQhfW131LTEYbsPOKIEOhN77IZTOJ6if8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YB2UhdGlOfP9JTTaKe/jNZVyPYB1rUG45ppODSBxPDIEJDXvHNTatD326InO+HeQ8
         SRcUuChJYqpKxXzB9ySPwZ5JiTdCpB/mhASxAE/a4DYK6DaMYTjyMOtOPeZ/cWBokE
         VFZEw5GC1fpTIgYIZJ+73rsL4rJLS0y0aTDT9iL93yDx7OA8msrbRYydhTYQUDAI66
         NwiSqjvnfAECRVQdjajIKGrRd4naYV37+cslVkxqDezqns1aLoHw07RY36kbicjgYX
         QAMxy+N459/3RQ3O6g36sYilBQZH9yDNLqfAMQ5Iwa6eDnUicJxbcEdgKKJQ84VmOP
         BR9sgYYNiVGOA==
Date:   Thu, 9 Dec 2021 07:16:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, kernel@axis.com,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: virtio: fix completion handling
Message-ID: <YbGfVNZHEdCFFPQK@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, kernel@axis.com,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20211202153215.31796-1-vincent.whitchurch@axis.com>
 <20211208150710-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NkWEbCaeLpfUlPDg"
Content-Disposition: inline
In-Reply-To: <20211208150710-mutt-send-email-mst@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NkWEbCaeLpfUlPDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Fixes: 3cfc88380413d20f ("i2c: virtio: add a virtio i2c frontend driver=
")
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> who's queueing this?

It's drivers/i2c, so I will pick it up. I was just waiting for your ack
because you always had valuable input. Thanks!


--NkWEbCaeLpfUlPDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxn0wACgkQFA3kzBSg
KbYOPhAAg4opGCgQ/6dKym2D9jBobdgtM0mlli7jgwSPkNrjm6PyVqJzurpRtwM4
rmWKBdRHZRoxCHCnu3T0+BmzmZRsuHFuYnrqN18vTzYtRA2m72ztlgJwhiaQMJJq
Q09VqV9q4ox1qxD7oWn/OCqql3N9Q0DwKuVRyT895AFJ2ssYXkUwvCwJLRjx9x8+
eNxNA4KOa2u39XBBRT+jjKeTifBAQF52aWrT0hxqfu4koEDyBKJGdsEH5sQlSCzd
z7QNsCiGfkwoTHduVjtt3m3NUF7iWTLPVO9698mTzUKxPVqj9/oY8xjfIdLkfK2E
gGfZWHvE1sKpC07+lzBgSuJF8NW5VKO8iwHdKpAkBzRlNT2YoFYcV1u0VCBaf59i
0jiJL7YGWk6qqOHmfFt364nNU79vYGLtgq8VVlCMxfy0iU/VP2HAAMqhm4emypOI
SD9hdBVLtSErr2W2anweBegD4igcrb1Y4aqV7WVQWs0qT1j5hrLY3gjrT13FIyCd
fCzg4oMFNEd0bDXj8UtQ8Y5vIqN60zcKtGfpNd1QTXwVeSBbR6a3Xbr7t4xJMxBh
W/DU8HVPYpxIGAJZQwENglIDS0axOx8FF+NO+7Gnl1lmqEJNyLxU64nzd8/uFjvk
TW19xg8DwhHSmGyQr1zv8TQbFzCj38CK8ClWcIjSbouRRHlJGmQ=
=bUA4
-----END PGP SIGNATURE-----

--NkWEbCaeLpfUlPDg--
