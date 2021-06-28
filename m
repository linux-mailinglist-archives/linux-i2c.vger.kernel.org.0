Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF8A3B5A8F
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 10:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhF1ImQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 04:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232427AbhF1ImP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Jun 2021 04:42:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A64F46144B;
        Mon, 28 Jun 2021 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624869590;
        bh=THO6tfXSTEF7UsaWjKejI9nBZFIYuak1uBvRa1XTghU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PPYWRZLYttYNfF7bxfK4EL/+55kI/OLHwreamOdv8sW9luRUGmK/ymzM60YzWW1wB
         1vPQWBWppnEJUIIYV1VHrLLSg6PLQTqFpNI6u6cjXeVSc4pmQ0PMEiGplaFMNhUVxz
         jK865aNaKuCJdK/QxN815wYPtlSAGvQE7ie0efpu5q4AaWt1Esm11Sx7AzEl1Sd5Li
         t2cKH/Vb8pmjjMp2PsOMku49MhRFZUGg/LDVZvs12hEigzH1nR6hKm8eR+RSyX7UcM
         FtxZwizmkaQ/P2CjA60qPYxMQqbYVKuB/rS91UfksnsB1e9L4d6Bmy4Prz1khhlvJY
         eueVO9LuaD+8Q==
Date:   Mon, 28 Jun 2021 10:39:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNmK0MP5ffQpiipt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com, pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qSoO7NsOskj/CTgw"
Content-Disposition: inline
In-Reply-To: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qSoO7NsOskj/CTgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

sorry for the long delay. I am not familiar with VFIO, so I had to dive
into the topic a little first. I am still not seeing through it
completely, so I have very high-level questions first.

> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.

I think we need to start here:

===

If ``length of \field{read_buf}''=0 and ``length of \field{write_buf}''>0,
the request is called write request.

If ``length of \field{read_buf}''>0 and ``length of \field{write_buf}''=0,
the request is called read request.

If ``length of \field{read_buf}''>0 and ``length of \field{write_buf}''>0,
the request is called write-read request. It means an I2C write segment followed
by a read segment. Usually, the write segment provides the number of an I2C
controlled device register to be read.

===

I2C transactions can have an arbitrary number of messages which can
arbitrarily be read or write. As I understand the above, only one read,
write or read-write transaction is supported. If that is the case, it
would be not very much I2C but more SMBus. If my assumptions are true,
we first need to decide if you want to go the I2C way or SMBus subset.

But maybe I need to undestand the following paragraph first:

===

A driver may send one request or multiple requests to the device at a time.
The requests in the virtqueue are both queued and processed in order.

===

What happens if those multiple requests are sent out to the I2C bus
master driver on the host? Is there one transaction with N messages or
are there N transfers with 1 message each. This is a difference in I2C
world (REP_START vs. STOP/START) and some devices really need this
properly handled or they won't work.

===

The case when ``length of \field{write_buf}''=0, and at the same time,
``length of \field{read_buf}''=0 doesn't make any sense.

===

Oh, it does. That's a legal transfer, both in SMBus and I2C. It is used
to e.g. discover devices. I think it should be supported, even though
not all bus master drivers on the host can support it. Is it possible?

Also, as I read it, a whole bus is para-virtualized to the guest, or?
Wouldn't it be better to allow just specific devices on a bus? Again, I
am kinda new to this, so I may have overlooked things.

Thanks and happy hacking,

   Wolfram


--qSoO7NsOskj/CTgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDZiswACgkQFA3kzBSg
KbYbXA/+KSKzXE7s7bq3L7tzpkMR2Dsra4ZFO9RRcu1nHxKOxA6sTNHfC08aPyk7
8wn8SbkDjo5V+MPCr20aILLiAiW2AaUbtTy7vC/WUcmMgml/aDhwP/bYczzcpHgd
9OW5Gd9otvxovWd3/1MK+IvDjdfI54ip5ItUX0KbW7/wmpJf1VlaMEYkZlY2G2o/
MulO2lklg1uiiV55jW72INVWJchSTxNlh9ZRJVzM5uESm7C58GIG5okNjxshVgup
1aKFXPlr+zrgHGh4HCZItSAN3m2Bxoss4Mz+fBbL1RAZUt/KvlmMyl5B+GSwQXrB
vBTfsjWukF+YpQk1s9WqouKlkIPgkKWJnBRq12U4BhUcXJzlt/u1TilJ5XxWSAu6
pZ4GMNZpmOaHx1fZf9M33eRtALZm4K5j0g5yhX+KahS3TuX0IssqVICkldrXUuFm
K7ZX/gTGMMgFj4lB7k8oUHbphjl1FAyMbHAlRbvyI+JRtoyIHegck8A5HnWS4urI
93oRlWiLMdns18mfCnwOd7AfKB8RphAjDGXReGbamNi7RnnnCsEEAqRAl2eb0F5c
EFNNVcWfH7UFfDhPJUFN95OTo49JdfhfhXG5K8yZ+NMVrF1HkGRJQ7TXbfU/C2WE
QNn4ZWlQ/d8VtQE6bUehICy7VLW9bO88lkUf49zZnp5HnXuiyTg=
=T+Ay
-----END PGP SIGNATURE-----

--qSoO7NsOskj/CTgw--
