Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBD13398F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 22:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfFCUN2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 16:13:28 -0400
Received: from sauhun.de ([88.99.104.3]:40334 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbfFCUN2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 16:13:28 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id 5FA242CF690;
        Mon,  3 Jun 2019 22:13:26 +0200 (CEST)
Date:   Mon, 3 Jun 2019 22:13:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>
Cc:     "minyard@acm.org" <minyard@acm.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] Add support for IPMB driver
Message-ID: <20190603201325.GC2383@kunai>
References: <cover.1557322882.git.Asmaa@mellanox.com>
 <a4d9fe418013b604e7224bf3038c294da42d5534.1557322882.git.Asmaa@mellanox.com>
 <20190519140231.GA7291@kunai>
 <VI1PR05MB623971FF6F956A091840716DDA060@VI1PR05MB6239.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline
In-Reply-To: <VI1PR05MB623971FF6F956A091840716DDA060@VI1PR05MB6239.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Asmaa,

sorry for the long wait. I missed this mail was still sitting in my
Drafts folder :(

> >> Am I overlooking something? Why are you protecting an atomic_read with=
 a spinlock?
>=20
> A thread would lock the ipmb_dev->lock spinlock (above) for all the code =
below ONLY IF the atomic_read for the request_queue_len reports a value dif=
ferent from 0:

Well, not really. The spinlock is taken _before_ the atomic read. But
the read is atomic, so there should be no need. I am asking if the code
could look like this?

+	while (!atomic_read(&ipmb_dev->request_queue_len)) {
+		if (non_blocking)
+			return -EAGAIN;
+
+		res =3D wait_event_interruptible(ipmb_dev->wait_queue,
+				atomic_read(&ipmb_dev->request_queue_len));
+		if (res)
+			return res;
+	}
+
+	spin_lock_irqsave(&ipmb_dev->lock, flags);
+	if (list_empty(&ipmb_dev->request_queue)) {

> if (list_empty(&ipmb_dev->request_queue)) {
> 260 +               dev_err(&ipmb_dev->client->dev, "request_queue is emp=
ty\n");
> 261 +               spin_unlock_irqrestore(&ipmb_dev->lock, flags);

The unlock operation could come before the dev_err. We don't need to
protect the printout and save time with the spinlock held.

> > +	rq_sa =3D msg[RQ_SA_8BIT_IDX] >> 1;
> > +	netf_rq_lun =3D msg[NETFN_LUN_IDX];
> > +	/*
> > +	 * subtract rq_sa and netf_rq_lun from the length of the msg passed to
> > +	 * i2c_smbus_write_block_data_local
> > +	 */
> > +	msg_len =3D msg[IPMB_MSG_LEN_IDX] - SMBUS_MSG_HEADER_LENGTH;
> > +
> > +	strcpy(rq_client.name, "ipmb_requester");
> > +	rq_client.adapter =3D ipmb_dev->client->adapter;
> > +	rq_client.flags =3D ipmb_dev->client->flags;
> > +	rq_client.addr =3D rq_sa;
>=20
> >> Is it possible to determine in a race-free way if rq_sa (which came
> >> from userspace AFAIU) is really the address from which the request
> >> came in (again if I understood all this correctly)?
> Yes there is. I see 2 options:
>=20
> 1) This is less explicit than option 2 but uses existing code and is
> simpler. we can use the ipmb_verify_checksum1 function since the IPMB
> response format is as follows:
> Byte 1: rq_sa
> Byte 2: netfunction/rqLUN
> Byte 3: checksum1

Hmmm, does that really prove that rq_sa is the same address the request
came from? Or does it only prove that the response packet is not
mangled?

> So if checksum1 is verified, it means rq_sa is correct.
>=20
> 2) I am not sure we want this but have a global variable which stores
> the address of the requester once the first request is received. We
> would compare that address with the one received from userspace in the
> code above.

Can there be only one requester in the system?

Thanks,

   Wolfram

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1f2UACgkQFA3kzBSg
KbZe1A//dZCx+YmQNFnYXW6fwX4hm2JFolCqtolCDfbAEKvqcqgEf7VwQ0Qoy4wm
P+RbEvYTBlnvPfk01PM8Kbe3D79xGgjGLAzfaLyVN5khGiQguK1nWND76tSxAkws
otCtiiNEcVv0z2uRGheJZWZvmANEt9nzbwqcyJzqaCDZKATQNstu1ClkWrIZLxJ4
rqXP2mPGJHAv7KzquR5dlpAmAz8yxA0uqoUzQoKbWuchg6fSKbIp7JzVePJvGI7o
7U/pNuhQ7hJ/tAPrj5fWELHjazDsDUkgu/vsQObvps1ixUuCFymFk+7l2tmPCAnX
OzFNk79jBbh3YgpSAqMLqPi9ftMrn6so7c3JzchzXzrmAvRmLvf/ChBwTIB8fGZi
f7958PVOdDr5c386w9EOLB0q9MLc5ONLDlKO96SVnvC8kLrq1iylbpRm17xmJywb
29Aao9YdsjIoijXsuskYV02XxMGh4JxgrewBOq0IcAuit/YWKsJldp1RyMuWESjM
gdptkXyp69N1Y6wVL72zkDNB2Cd6NWpoCu4mJDgb6XfX/zv2hadXIgL4yq4cZncx
61wRgMM0F0MZEiXGsC85qlryaZuBUFdlZnKj1sBbkaRdvDbSpykE1NcGvOti1fIM
UIYYy9E2Vo/VzPxXR4Gx5JO+6UTjvX2onpJgPAbGOTAiC8Yn53s=
=REap
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
