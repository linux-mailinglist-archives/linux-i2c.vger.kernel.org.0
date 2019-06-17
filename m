Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77DF47F32
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 12:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfFQKFQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 06:05:16 -0400
Received: from sauhun.de ([88.99.104.3]:55436 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727877AbfFQKFP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 06:05:15 -0400
Received: from localhost (p5486CE69.dip0.t-ipconnect.de [84.134.206.105])
        by pokefinder.org (Postfix) with ESMTPSA id 341EC2C35BF;
        Mon, 17 Jun 2019 12:05:14 +0200 (CEST)
Date:   Mon, 17 Jun 2019 12:05:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Add Block Write-Block Read Process Call
 support
Message-ID: <20190617100513.GA3502@kunai>
References: <20180829161810.2147-1-alexander.sverdlin@nokia.com>
 <20190613111310.3be13499@endymion>
 <877aef82-eab1-dc0e-a0d3-d7aab3135c14@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <877aef82-eab1-dc0e-a0d3-d7aab3135c14@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Please let me know if I should update the documentation and re-spin or th=
is is
> not of the maintainer's interest at all.=20

Despite your device being non-public, it exists so I think it is a valid us=
er.

I have a vague memory of seeing a TPM device using a block process call
a few years ago, yet I couldn't find it again right now.


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZdUACgkQFA3kzBSg
KbZyZA/+LfLev9kE1FUeipdSsKeuB9sy5y2o0sps2lYSNvYhFMYYk3bG/IGti9C2
gky/kTMKivqeTbG+AeR4GV5vRDE+ihvTKimRyg9zq4xmVK1cGJD/qIJ91EKbfTEq
2sUsfYvstUga3xCZeTc8HkRCKE8uW45iOt9C+ELwwxa23bp3z7hJMaI1I804FT+c
uMim4fkUjtqc6U3O4pPKwDLb24VxYEd3fyxzMskQoMP1jEV7/bHRCoIuefzqAs1H
/OOz/COeM2jXypnOxI4HAN/eIPJTRCtn7hRiUrWkZLRdBlm4lGyak6hcgLc57+Su
W3E3v4bUGtr0RKrXwNxZ1FVxCwrdeIydasE4R+T8ND7Gt4Ccd76af8BYNPY09c4a
GpuayMKXf+pWah+q55PaVKIZQPyupPoHQyExHNjPvy0OT82Ui+aL/hKXmfslJhHA
aBng6uF5AyIDlV16ZKs/0zGMFJCgUuiuWm2u78kkiGH9zBfToX+1NEMyG4qLVt8e
fIfX6YmayPQZVo2OXKYyes0MlY7BXpyI0XjGXLk7EnWTaLrfJ7DwxaB2RUt59p4S
0I/Ri9u/MFL0Gd7FJ743v0ere7HtFhj+gWi13eN1pOdjTPVKBxuLLMSoDfxbc4+U
r0Xso+f4O4nRUQxAyNocALzfgd9Z1WYXhExYhyUXlsyAApMNU1w=
=2kT7
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
