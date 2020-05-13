Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A18D1D0998
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 09:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgEMHKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 03:10:18 -0400
Received: from www.zeus03.de ([194.117.254.33]:34230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729189AbgEMHKS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 03:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=51FR2iS68gpVFLMPUwZaeNPm91Vr
        oSpSdm2ckLBIR3g=; b=TkhuX7EVt62xar3SUthDhU122JVb1YmSQZlM3qv/7fWe
        6xdcKtlfcbiowIcNaiEhs3VE+IKnf6gJM7NmLY0sq1O5zOKB1WRTUuvLV+Kjwvbz
        5m+vlHYi1XEHDBOSz/1iyOkxwukRYzk2DRqd6ep0YVjVyVzTIWtS5AvI2r7bpK0=
Received: (qmail 3238934 invoked from network); 13 May 2020 09:10:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2020 09:10:15 +0200
X-UD-Smtp-Session: l3s3148p1@GDqbRYKlbNcgAwDPXwcWAIZZjypw6UMc
Date:   Wed, 13 May 2020 09:10:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Corey Minyard <minyard@acm.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200513071004.GA1043@ninjato>
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
 <20200512211425.GQ9902@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20200512211425.GQ9902@minyard.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	addr_info->added_client =3D i2c_new_device(to_i2c_adapter(adev),
> > -						 &addr_info->binfo);
> > +	addr_info->added_client =3D i2c_new_client_device(to_i2c_adapter(adev=
),
> > +							&addr_info->binfo);
>=20
> i2c_new_client_device returns an ERR_PTR, not NULL on error.  So this

Yes, this is the main motivation for the new API.

> needs some more work.  I'll send something out soon.

Why does it need that work? 'added_client' is only used with
i2c_unregister_device() which has been fixed to handle ERR_PTR as well.
Or am I missing something?


--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl67nUgACgkQFA3kzBSg
KbYyAw//bzqA7h2uelGKYgftZCSyiEKbryeZGdgbRLc8zQ+AlFPUWRsmJLGOeW1G
uCpAq4hz87S6Jr+qt9U1eAYb57Gci6+4A1TzYPTNavShomZz3zqmXp4kVTG1K8pM
7SZOhAjOz8KmctEZYYVaxnt4OOqAWauJCALXi4828LlFg1opfvzPuJZHGUrb7RNa
PuSc6j3+LOu6uZpDQfuEVTDgHbfEkZSsgrziJzRftFH/0+DcjSgjplqufF9RrCcD
Du1DHRWzolmr7IqD/JUxI0u3eAzJpJkEFjZ8548PVqo8ToSAtQHq1H0tidRK+zk3
BUPO+JbSPSwfdnx/T8Uwplwu6pyUGCK6kxKLoCNIkGIqrhltH/tJKkS19KRHUcn6
rV1zaRQTvdNsyK7o18VrDJpjiMYGE7AwZAPaaY8SSx4HUmIwcfZSlK42WwqdDPtA
/97ie52F5W4x+RnuDYdbOeogW4oERSIIOag6X1aJuJWmzevIPc7oz1dWgUAn7w/y
sqjm+87EqYEymHMMQiHpeqWSu7K86eqHPGgjDDuIyILCKPTHoFv6Idp2ZPny/2qG
y/OfwQw+CefEUqrH8ub6wRcFvWS5XcUIXlO0q8Kf/aYAJtcK5HOdn2P7IpB8ZqvI
zmGv4UHK1vJ85XtUHr7IuXr9d8EogzAWPoO6Y3diVF86GFnAhBQ=
=HZtF
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
