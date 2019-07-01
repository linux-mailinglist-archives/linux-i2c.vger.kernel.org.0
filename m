Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B085BC2E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2019 14:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfGAM4W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jul 2019 08:56:22 -0400
Received: from sauhun.de ([88.99.104.3]:55766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727249AbfGAM4W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jul 2019 08:56:22 -0400
Received: from localhost (p54B3346F.dip0.t-ipconnect.de [84.179.52.111])
        by pokefinder.org (Postfix) with ESMTPSA id 486CD2C360B;
        Mon,  1 Jul 2019 14:56:19 +0200 (CEST)
Date:   Mon, 1 Jul 2019 14:56:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Haiyue Wang <haiyue.wang@linux.intel.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@intel.com,
        brendanhiggins@google.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv7 2/3] i2c: slave-mqueue: add a slave backend to receive
 and queue messages
Message-ID: <20190701125619.GC4399@kunai>
References: <20190605164651.15991-1-eduval@amazon.com>
 <20190605164651.15991-3-eduval@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline
In-Reply-To: <20190605164651.15991-3-eduval@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

thanks for stepping up and pushing this further!

On Wed, Jun 05, 2019 at 09:46:50AM -0700, Eduardo Valentin wrote:
> From: Haiyue Wang <haiyue.wang@linux.intel.com>
>=20
> Some protocols over I2C are designed for bi-directional transferring
> messages by using I2C Master Write protocol. Like the MCTP (Management
> Component Transport Protocol) and IPMB (Intelligent Platform Management
> Bus), they both require that the userspace can receive messages from
> I2C dirvers under slave mode.
>=20
> This new slave mqueue backend is used to receive and queue messages, it
> will exposes these messages to userspace by sysfs bin file.

So, this is a read-only bin file. Sending is done via the standard
i2c-dev driver? Or not needed at all?

Regarding, IPMB, how does this related to the recently merged IPMB slave
driver?

http://patchwork.ozlabs.org/patch/1113278/

>=20
> Note: DT interface and a couple of minor fixes here and there
> by Eduardo, so I kept the original authorship here.
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Signed-off-by: Eduardo Valentin <eduval@amazon.com>

> +I2C SLAVE MQUEUE DRIVER
> +M:	Eduardo Valentin <eduval@amazon.com>

Cool, thanks!

> +config I2C_SLAVE_MQUEUE_MESSAGE_SIZE
> +	int "The message size of I2C mqueue slave"
> +	depends on I2C_SLAVE_MQUEUE
> +	default 120
> +
> +config I2C_SLAVE_MQUEUE_QUEUE_SIZE
> +	int "The queue size of I2C mqueue slave"
> +	depends on I2C_SLAVE_MQUEUE
> +	default 32
> +	help
> +	  This number MUST be power of 2.

I am not happy with this being a Kconfig option. Best would be a
per-instance configuration, so we could have differently sized mqueues
at runtime. I could think of another sysfs-file like
"mqueue-slave-config" which would appear after writing to 'new_device'.
And only after writing to 'mqueue-slave-config', the bin file to read
=66rom would show up. But it is just a quick brainstorming, maybe you have
a better idea?

> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 - 2018, Intel Corporation.

A short description what this driver does would be nice.

Rest looks decent from a glimpse. I haven't looked into the gory details
yet, though, because I want to get the high level things straight first.

Kind regards,

   Wolfram


--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0aAvIACgkQFA3kzBSg
KbZHHBAAhj0zApTWfO1ifL64ykk+MUyKkgwwOboj5C4k8bbUZIapXHN0VaWbceJD
icCv9zkojTLNkUf1f1RTdiY/gFZvpIsLOAuWLhrLZi/2BhUi82BVzuqo/KO6LQc/
I6DDCHohHYX4CgqGNCou81bir0LZ9QEBUp8QzEWKmnbcE0IVQmnT18HHXUW6D7Qn
qiKB8kuZGLv6M/AjBlrfhkKphafmk27PMN3dL1W2n/6SqKYdTUwPKM05W2FiP0ZR
pWIPpcsWcQSeRUw+uEqpkohZbNgv67crjjFQAofm7bVCgxMVI8SwZ1qHZWAJtMgX
d2ySWt0cwDpoTD795j0LR1txKOVZ/4ZdXMFTQUKyofEZacfkLOUQjK33HywAnlz8
6Uw6WIbfhgYOJhGqzXUZmZD/QQhM2VpFqx5/5H/kjNInlHlz4F80Oacyt6D2oVT5
WHnM37F48jdBqFXEkQtRX6ZPnuX4+mXMqHzoM/6yjo41xY+Ed44MI2g/nmde22lf
B+46ujovmiE48YPw7bJOhXLOHAqbML4ZCTa58s4lzpCN4QgtVv7VWw/xfyOgP0mx
jLZWX0M5oIyFlyo3D2jUZmSISRDLoy+OHndWSz6qgf6XWJfUU82bi/y9zz5Y5yLu
f0lYrIUzrF1k5OWpxSYaFUzaPZB2RVb9CkvZau68B3i35eF+e+0=
=eaxR
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
