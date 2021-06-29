Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2BA3B7024
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 11:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhF2Jin (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 05:38:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232614AbhF2Jil (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 05:38:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAE6261D6E;
        Tue, 29 Jun 2021 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624959374;
        bh=FP4n22znVkA+WYCZZjus98RLDIntH8V4xhbo0jILbZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CZLUlghZFylJzzLoaf9N92q4+Mxudkc2I5sr0kJOuTAIaeG17EARxHRlAsnRJzT46
         udxP8PGzdE4sEeMn7DWcjAWiPwup5ALqzVnVKBcQC2lsvC96H9nAYWTJZECP5RRuWQ
         AnovxhfVyqMww/79q1WvEyJJ1WIYGj0p5elSx/lUsY0QqMvMgHDbvjPDc/eTXEpe7H
         tbJRB4nU84tvnuc3UgQoih2zOzNTTEb8+raWbSTGB4upCHobEzgUA3kvIYwaBLsXcH
         075RHyOTEkHfLCjv7M/Pa1FUQmvRSGQSLJDt1njCRZWOtEwQbjAjCV3SB7U+2u/pDL
         TK/G8kdnkyUWg==
Date:   Tue, 29 Jun 2021 11:36:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNrpij3WERiUXIJB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, yu1.wang@intel.com,
        shuo.a.liu@intel.com, Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <4c7f0989-305b-fe4c-63d1-966043c5d2f2@intel.com>
 <YNraQMl3yJyZ6d5+@kunai>
 <20210629091337.bcerprdyupvgr6gf@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AlAklJ1Wyl7hd2Sd"
Content-Disposition: inline
In-Reply-To: <20210629091337.bcerprdyupvgr6gf@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AlAklJ1Wyl7hd2Sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So do you want Jie to send V11 now after fixing these three issues, or
> you have more concerns ?

Let me have another more low level look later.


--AlAklJ1Wyl7hd2Sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa6YoACgkQFA3kzBSg
KbaLjxAAkSPL/SjcfliLWvFpA3GiWJz4YiKI5JayZroMnyvJhvj5TG9AXrOKhpl7
iAoi1Cqa2cinsiW87x7b6nuuWZSTaYaJaCNK/kyGNL0NQtCmEYoK2k1Cd0ovNRYh
sU65K8zvOCs2UL/EmYX5pbTOyTT0jPlq2MqsU1Q2Fy8AvNoo3xjo+s48qbOZYKfA
a1w94r9oVaGbi0Zuf7+kAOHc+zx+kpUcztDyCuElAhrj6GPg5YInosaP3mC+q3iq
sW58qiGtNDiVIQT8rrzmSJYV1ewHHM/AGVkQs5rdOmMy24DJioiUTJLcTx2192Z7
9/yuhCehrqb2d2U2jdb/v9AIj0Mpi6djcENyvJGiEWheOcfJWlYIDq6M+IX4ht0U
TXzXb/jAmqbrIRuG1mALb4e9/tAaZzOqrh+kldlI+5lSxUvbqFyv1YJFnH3SQw+G
4tuAelI3i8/SJiwO0dbEbsO9SbrjXvNBu+huKIuG9Jl+el4PFdK23J8cwt+9uuKj
3GRn8vAMBASlxTE7HOJEm681oKb0hVtTaXNvY1vwiR5D/DLnLqFkLRdoSOX5EEAX
u7M88bC2a3KPCBfnjyL8DDKixm4An1LJOVGAJQrYZ0Uje7uKpoaCgrkWNYDeCo/b
iGIawNH/trdHtsb8HEBBhptKa1bf6MPhTLmpFegfXDCJWsF7MY4=
=aB1K
-----END PGP SIGNATURE-----

--AlAklJ1Wyl7hd2Sd--
