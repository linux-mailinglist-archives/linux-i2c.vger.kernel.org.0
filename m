Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5CF227E7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 19:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbfESRmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 13:42:18 -0400
Received: from sauhun.de ([88.99.104.3]:44874 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728499AbfESRmS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 May 2019 13:42:18 -0400
Received: from localhost (p5486CF3F.dip0.t-ipconnect.de [84.134.207.63])
        by pokefinder.org (Postfix) with ESMTPSA id A6F142C3740;
        Sun, 19 May 2019 16:02:31 +0200 (CEST)
Date:   Sun, 19 May 2019 16:02:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     minyard@acm.org, vadimp@mellanox.com, michaelsh@mellanox.com,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 1/1] Add support for IPMB driver
Message-ID: <20190519140231.GA7291@kunai>
References: <cover.1557322882.git.Asmaa@mellanox.com>
 <a4d9fe418013b604e7224bf3038c294da42d5534.1557322882.git.Asmaa@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <a4d9fe418013b604e7224bf3038c294da42d5534.1557322882.git.Asmaa@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static int receive_ipmb_request(struct ipmb_dev *ipmb_dev,
> +				bool non_blocking,
> +				struct ipmb_msg *ipmb_request)
> +{
> +	struct ipmb_request_elem *queue_elem;
> +	unsigned long flags;
> +	int res;
> +
> +	spin_lock_irqsave(&ipmb_dev->lock, flags);
> +
> +	while (!atomic_read(&ipmb_dev->request_queue_len)) {

Am I overlooking something? Why are you protecting an atomic_read with a
spinlock?

> +		spin_unlock_irqrestore(&ipmb_dev->lock, flags);
> +
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		res = wait_event_interruptible(ipmb_dev->wait_queue,
> +				atomic_read(&ipmb_dev->request_queue_len));
> +		if (res)
> +			return res;
> +
> +		spin_lock_irqsave(&ipmb_dev->lock, flags);
> +	}

...

> +	rq_sa = msg[RQ_SA_8BIT_IDX] >> 1;
> +	netf_rq_lun = msg[NETFN_LUN_IDX];
> +	/*
> +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> +	 * i2c_smbus_write_block_data_local
> +	 */
> +	msg_len = msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> +
> +	strcpy(rq_client.name, "ipmb_requester");
> +	rq_client.adapter = ipmb_dev->client->adapter;
> +	rq_client.flags = ipmb_dev->client->flags;
> +	rq_client.addr = rq_sa;

Is it possible to determine in a race-free way if rq_sa (which came from
userspace AFAIU) is really the address from which the request came in
(again if I understood all this correctly)?


--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzhYfMACgkQFA3kzBSg
KbaUFBAAhYsyH1aaRJTDSRpDGGcd3ZnZ3zTzRUjf4prl/rhXfBIaroHb3Mrp1aYX
ZGScerkOwHtVFSat1vAn3xsrzkHL/X5ADObbm3Jdx3ofZhLrP1pKT3mL3ah7xJ7H
zXuLF5F/8xc6sd5BEsdh/Iazw/v+Q8rkfgZZ6ExZV+cueh8R5M5PxyaFKXj6327k
qRePyE64zjfzzCL1rupNLzmegvp2qnXE7ZO0+vWuhVpw3PWO1kBh4mTmPxl3TkAk
onbXPgqWJgg56Kh7ZMm1BfiIaUGYeiDR1DI8IHzTWJVBmOMpPItgvMaVqKBDU2M5
ZmFXzm6o8ADuqM1+xLTXTgUJC92pDtzEpu/OP8neMbiqsZUvJlZ2R9AMEPf6XDbU
d+nYOivm1KLkK5iZR7DsZwi+ZsSWM1VVeQ1huagrJ9AM5QN+nlxdxv30+Wff86BP
aGfSuNqw0mwA/ZLp59jv6QeqKa/C21bPdUUZklZ28cEXHOOfVZFtTl4tfG62VV/0
HQW4fxqk9yZue6Lh7PoW9f/eDHRi6/8FXLRieNdxjhjl4vH5My48znKij5XE3WKj
uzI2qHHHRMno5AAoo42n97KAvxAdMGAdjkmnzkn1sRq36SfA5YRPFL5EcFbxQC0K
edcChltpC+mULAVOc2Le6pgXeCJ5fGVNNY64iGNxIvtWSx9p9t0=
=N/9+
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
