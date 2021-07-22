Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D5E3D260F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhGVOEe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 10:04:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:49254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232462AbhGVOEe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 10:04:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7735B6100C;
        Thu, 22 Jul 2021 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626965109;
        bh=5YAppYJPEKAzx4A/4tuph3i/y703F1sjr2cLE9hDsq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i2i6FchJo4uyiJLkvGEa+UlcAaWG2V2yseO3DuLFEDKkzEmPm7Hs/vzKxi09hU1Y0
         5g1LUK2FP0K+0Mjvv/EK+WcsLc7fLLOQd44Vyco/rKgkBsqdKGmv7X0jWniCZqU7WI
         GncYzk9GoFvIO2fx71rgJXPusB5q/QmnXozVW4qycAlVuQIrDZ2/WmVIxmUYfhbroO
         GLz55OT0Sx8PXcINV70b6FMSBlye2bLKgaaC2ou9BJUod1/UFqlPxWyHmpeFfS3Rc2
         h/wb/aX5Z+CZd7zQR4Agf3+I/pkGcBNcFLxnARdnTK3LPIF+4rNBLszBofwNyzUt1e
         Z+h9j2I/sWtcA==
Date:   Thu, 22 Jul 2021 16:45:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH V2 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
Message-ID: <YPmEbpzQ2O+2PXXc@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org
References: <cover.1626947324.git.viresh.kumar@linaro.org>
 <705f4426a17a395bf190ee6ed6c341ac25550f6b.1626947324.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P57eMTZiYrBrOmDx"
Content-Disposition: inline
In-Reply-To: <705f4426a17a395bf190ee6ed6c341ac25550f6b.1626947324.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P57eMTZiYrBrOmDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 03:26:40PM +0530, Viresh Kumar wrote:
> This patch adds binding for virtio I2C device, it is based on
> virtio-device bindings.
>=20
> Cc: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

I'll leave the review for Rob. I suppose the series should go in via
some other tree, so for that:

Acked-by: Wolfram Sang <wsa@kernel.org>


--P57eMTZiYrBrOmDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD5hGoACgkQFA3kzBSg
KbZfsRAAiu0fM+UhVoc1lA20zfto1sfhNHCW39AHxQjWBHcI5yP0oXxSyxLYpLLR
iONatxuXBXlSILxycYFD/Hymgo2Jp92YLN3UiyTkuPXd5h5zn3rMO+0lfNfzN0aQ
zobQ7C0HvGRw3MtUQvtIQKRKpLiSEXwKELaN4tUJBlQUlEX57u/7VSpz+YOu1Blj
yblZztOpQF97XCMZsggDT+fU7+zYgPVbGJCkWswXNjBTmDEYVpxN4cIs8/+Ikuvm
RYHEfGD9vFtznYVhAM9ARnS3LM6Rnda5ErYdu3iKuQoghq5F4HgF8Tgj8Kxf7ZCD
14XpWpu0+lcEtDcJ37Q0gOgJ+OrAqR4hWr+sm0cGT9ycQ6PPfYINVFENFBYW4vER
sEquSSIKXs3pvvG06QY0wq8zANjiF8I79U9WaBgMYpilNSrCgYLdMTwCu325ap0r
32IoFaQbtNNM2iENhYBNmZZF25LDJTvxKSBeZ41XSFANxccnKbufLqlnGRmLRPvF
BbcZ2mfVDKQ9SYonUdNdH7qoOAtVUgBnp+eN73pFtfZK0nu4TcTeakJI5ZMUllo7
8KnrM5bA9goU43SbBUjrLUXXwYALsef7aLzENJjPfHCGpAkb7OGcuvHCV5z/Gjj4
H2zSR4dqyS0EZ54zoOjL4EP1IITTWQe9dvFLwt3Z2Z3SmsUw/es=
=ne8g
-----END PGP SIGNATURE-----

--P57eMTZiYrBrOmDx--
