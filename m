Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B553E9F84
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 09:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbhHLHkU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 03:40:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231496AbhHLHkT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Aug 2021 03:40:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E56360E78;
        Thu, 12 Aug 2021 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628753995;
        bh=irX84ooBnsiAdoz0s5VmTLIdLA7xUv8R2abt2xDslt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cfS0KONckKE6S/yS1AUqL5MrF3jPpcJBiUIqHzeR7N07C2hRV9SfUfhixPcUuOKJf
         uL2V21XEwzGBvqfvdUMWTvXter/LPnHaUSv9PTPX4uabffL595ltUTRZ9JtP7gIOtj
         lEXzV5M9kwQzAzeTdpCEoQtsxCzBqKy6cEt8DPNZNqIFOgaC1US/vbWSvYDXy/vFk/
         O33qc4pB7hwzS3+U+dC7dPPuipH4fLongGgfpq1pnzCixNcwn8oub/4LRRBbs+4SQf
         Y8zAR2lxYZ8bwIcrszU9diSsnPH3ShW8nj7K3uleAqbPyJZzlQcdpa1T113/iVtotz
         R2EsLaCodzjIQ==
Date:   Thu, 12 Aug 2021 09:39:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v5 1/3] i2c: aspeed: Add slave_enable() to toggle slave
 mode
Message-ID: <YRTQP9sX0hkTJMTx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GwGWc7OEMm4Wptga"
Content-Disposition: inline
In-Reply-To: <20210714033833.11640-2-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GwGWc7OEMm4Wptga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, Jul 14, 2021 at 10:38:31AM +0700, Quan Nguyen wrote:
> Slave needs time to prepare the response data before Master could
> enquiry via read transaction. However, there is no mechanism for
> i2c-aspeed Slave to notify Master that it needs more time to process
> and this make Master side to time out when trying to get the response.
>=20
> This commit introduces the slave_enable() callback in struct
> i2c_algorithm for Slave to temporary stop the Slave mode while working
> on the response and re-enable the Slave when response data ready.

Sorry that I couldn't chime in earlier, but NAK!

>  include/linux/i2c.h             |  2 ++

@Corey: Please do not change this file without my ACK. It is not a
trivial change but an API extenstion and that should really be acked by
the subsystem maintainer, in this case me. I was really surprised to see
this in linux-next already.

@all: Plus, I neither like the API (because it doesn't look generic to
me but mostly handling one issue needed here) nor do I fully understand
the use case. Normally, when a read is requested and the backend needs
time to deliver the data, the hardware should stretch the SCL clock
until some data register is finally written to. If it doesn't do it for
whatever reason, this is a quirky hardware in my book and needs handling
in the driver only. So, what is special with this HW? Can't we solve it
differently?

All the best,

   Wolfram


--GwGWc7OEMm4Wptga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEU0DsACgkQFA3kzBSg
KbY9lg//WuQBcK9qC8p75mupHENCaWqvbTpqZARXpEbhlHtaxT2SqoADaOlbbFX8
A2hu9n0efOSGZs1mEfLKL/y9BSBy0XLMLikoQgZw76ole8RWFjYJjJT1Oqqlk4p2
LpVhrGj+g54IuMLo+vD0R5V9GeK6iXfFMwCJP5pi/AZ5p71DmyHDq/O7yDHvR5Cq
m0e7SFKxyYt8oEUYFzqdi/EEx5ndMeIycipVFdNPRhAARJHixYprG4wmyqRBUhDM
Mm43mGSsalicQggJ6vhVBj1JloOAN7Of7p4TsElFEX7uRig8Pgv35ODmMxNGfv81
QCu1gV7gggqyt+V6dRl8TQoXb0bWcCZ3f7fodcRDdOWIHZhqq7IBURRoiVSGKZ7X
UVVwNTt1X55FBxKAkj1Coxu1JZnp5LPa6bIpA4o2NSd4hj/smutrDVGVsQRnNLEK
+sQ4ovJGK2YPjuOKxHyN+gZ4fO9Tj2nHlzm3AVWpalkd89qcclqDMRIaFdR9Wi3c
t1mtXjMjqKOj99+yYacMMSnI4EfqsuTD2NxEMEQCGjlU27rcfXagxeif7RJZeSWq
3tuvG7lGRNMKk59dC7/Rn9yl9vUUx5n1fiK4sNEaVvAK1lbXng8G4bxMgUW/EFN3
0kln133baUn8BIfoaHBRjGSQ+npxyGS84OsJfjg1bzxZViBDA74=
=05a4
-----END PGP SIGNATURE-----

--GwGWc7OEMm4Wptga--
