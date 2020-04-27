Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246441B9A94
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 10:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgD0Ioi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 04:44:38 -0400
Received: from sauhun.de ([88.99.104.3]:55736 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgD0Ioi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Apr 2020 04:44:38 -0400
Received: from localhost (p54B330D3.dip0.t-ipconnect.de [84.179.48.211])
        by pokefinder.org (Postfix) with ESMTPSA id 7BB3B2C1F66;
        Mon, 27 Apr 2020 10:44:30 +0200 (CEST)
Date:   Mon, 27 Apr 2020 10:44:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200427084424.GA28817@kunai>
References: <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200427074837.GC3451400@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Wolfram, can you revert the following two patches for v5.7, please?
>=20
> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> 	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a lon=
g time

Sure, will do!


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6mm2QACgkQFA3kzBSg
KbZKvA//T8VF+I+iFRYvMUP35zvYy0e2X+hF4RVng1lOryMdvyvXMYsvHyGwfSUo
7sENz8AbjNMJs1fXWCR/foCEzIEBcg6XX9S1DJSVHXi+v+7P8sZ+ND0FyVo/W54F
CzLXFEsty3RcBEOTKIycIe3p5tGz4Wb66cGJgMgJG1t6Mvn9/drjySdAUiosHH7O
hKiKV1x1EiQJR0r9s6drkUgVv2hSq2SzW5yoQUn6Hm9vRqoawOO+ruVWBDETZOCz
6A+9Ctxmo5oqhDXOI5otUK43ueuDDIZPmxhz3Piaq8BRCwqz2ej1gZq9hNky8/NY
3UxIs9/Iw7TCyeAhLfdFNE+jSKzVlcrPK3nIHL+HhXnrSakYdt4DuWf0emTIMaoJ
D2a7BC78rYF+znZgUMhXEssiKVx0g9KdG6MKVW4X+LU+pqYc0a3LVse8R6T8vU62
Mom3ztoB1NQ0VFffwgq3i+Nx03N0l6u3P+sqOEa6iJcvnjqypB3BNYT12Vb9v0zc
bb0NBYgzEAz7PnpP3ZxrdCu/AGHel25WbcAo3/erIphDJUHcl7te/WpEKig+HUob
3asgO/41xAEB9LfogMNndxT+XnG1qS/fy4UJ2e1Un+JVI0iJ93PCew0LB2EZ/FN5
L1q1bUi+wtPqY/leZydAvVrlGuIgPQBmtyybiTYRQAbhlVeyFvc=
=gV9r
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
