Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC062629EE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgIIIPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:15:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:49482 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgIIIPQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xceAgulUCJFdhnQtzS+YsMb4KCK8
        Pw7VeatTHMborXA=; b=V0iytMUzFPShRmuI9k4NWjwz5uGWv7VGCmwHho6S4hJz
        fxjFewZtk1+VA9RxVQx8PxwODqtMvlNAT81eVHZiABuN1fRp9Cbkx8CWuT8+TFa6
        uxu96mhirulhlbMKvfv21HxkhKmzSYT2EL5gcagh+AT136MkfiHGYKIJcq415jk=
Received: (qmail 226205 invoked from network); 9 Sep 2020 10:15:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2020 10:15:13 +0200
X-UD-Smtp-Session: l3s3148p1@lOkLDd2utIMgAwDPXwesAAPl1NpCEY8B
Date:   Wed, 9 Sep 2020 10:15:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200909081510.GA2272@ninjato>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 11:48:30PM +0200, Wolfram Sang wrote:
> SMBus is largely compatible with I2C but there are some specifics. In
> case we need them on a bus, we can now use this new binding.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

So, I am going to apply this now. We have this cycle and the next one to
fix up things if we find something to improve.


--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YjwoACgkQFA3kzBSg
KbZKYxAAk9ihU/GTqkcE9/h7I2CnGa3gpQWDCT5d2HUThmUxLuGVZjNpJpUDpOdm
+KrJZgRmzwyU/B2FKOwOW3I7FEgF51Tvjfwjbh7du9JElTBa7NsS6pWPeBocWCNh
ytDVwcDBc3ri8IOys/Xshf3TteyjDJyazipxEelc93JQ7z+61ZstUu9ng1WAHXZE
fnovARzS4JoIJT/c/1e1aHjscwXrotkbxGZ67SwS8OmjJ71hu0vFRV5UvrnXllQC
GHKQGAeJVhAvdQP3eHJg3yT+LBIRt1to3igbOyxfg30eAc1lcqr1bGbpUkcWqEcN
o2HfovvlNCIfKuFfitRGa6MSp35qm1LoY3gV9DI3xTFn6RFBLTbdG/otlln6bqW/
wADX2uTctm2JmWi9m3maMNCxSn3MXdqvzSs3tRUuX7FOVgNClWtWgPdqXyUYyIDI
VtlHQqFGRzG+95xoHnVwjlF/6RoRh0cVOA2Mk0wxKUTSSz9zwKpV+8tDZL6LIbL3
MBs4AsPq9UDT53aXeUA1viAvtIsv2O1++VpyhmGRL77oZ1Fxkm3KthLsRt1hcVxI
mcR1YWK0L8FnedOe5datZr7hucTlxzHQneOG2khVLpuBtloICUfQ5Wj3q052vwts
lEj+Oi/8S/DB46jUWic27vZRxg8XfZVuHvYddqX9yIYJeuTv7NQ=
=YXOG
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
