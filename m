Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553011CFAC1
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 18:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELQcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 12:32:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:43334 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELQcZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 12:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8LVJQP0EnT94m/Mbpmbo2jidt/S/
        RrHEDO/dAbZ+1cs=; b=AuuR08w9s26ROhN3pP7eNek15XbATKdZKhHzcKKjMD5Y
        AGGbsHLt/2w/yVKEZwAvVmAnTSiWyOPA8qbTdG/K2BklqGmwH99h7JHcjAkHQuv3
        7YYW6WAQ4oilsrcyj/AJwLtMSc5mf31InG9awbZRHZeUG71heBcdHkHgdQnYoSo=
Received: (qmail 3011521 invoked from network); 12 May 2020 18:32:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 18:32:23 +0200
X-UD-Smtp-Session: l3s3148p1@LfIUAnalbMggAwDPXw2aAE67cgFBY+HL
Date:   Tue, 12 May 2020 18:32:22 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] x86/platform/intel-mid: convert to use
 i2c_new_client_device()
Message-ID: <20200512163222.GL13516@ninjato>
References: <20200326211015.13654-1-wsa+renesas@sang-engineering.com>
 <20200326211015.13654-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c8JyeaiReRNoiMDS"
Content-Disposition: inline
In-Reply-To: <20200326211015.13654-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c8JyeaiReRNoiMDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 10:10:15PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Can we have this now so I can remove the old API in the next merge
window? Andy already reviewed it. Thanks!

>  arch/x86/platform/intel-mid/sfi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/platform/intel-mid/sfi.c b/arch/x86/platform/intel-=
mid/sfi.c
> index b8f7f193f383..30bd5714a3d4 100644
> --- a/arch/x86/platform/intel-mid/sfi.c
> +++ b/arch/x86/platform/intel-mid/sfi.c
> @@ -287,8 +287,8 @@ void intel_scu_devices_create(void)
> =20
>  		adapter =3D i2c_get_adapter(i2c_bus[i]);
>  		if (adapter) {
> -			client =3D i2c_new_device(adapter, i2c_devs[i]);
> -			if (!client)
> +			client =3D i2c_new_client_device(adapter, i2c_devs[i]);
> +			if (IS_ERR(client))
>  				pr_err("can't create i2c device %s\n",
>  					i2c_devs[i]->type);
>  		} else
> --=20
> 2.20.1
>=20

--c8JyeaiReRNoiMDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66z5YACgkQFA3kzBSg
Kbbj/g/9FuU+f6nINdnCcLn6Gl6KSTzeEqAp+Bwn2S7ZfUZXJbij8C3FyJg/ATaz
SUU1LyRzZ8nG2TgT8g4//6PnAH/9UXLuepbrr2PDnSne2WiGVrR7SZRLunN4hiHF
UzI5mh1kUV9/Zd0uLGtZmoIyx3HOjAq5MULX/mV7HCdFBhXQwcPGW6c8NEdwPW9c
axT+ndOvFHzUv0wWN8KmFc6wwisz5XJ15QqZQkUK44zt+byG0vLQMgOA4NtXGlyx
+MufwoKqb9BH+LgFZpYuANX866D7By86Ozpc5geGRKeKyUVjgm2hm7urNzT97Gze
opbMM6R49WIqg+O6NVzYkvwdk/JlBjjxFPFDxD3VSH34EoCvVs07/S/YTBDIS+0G
Q5ogbNiGUETYYx+B0lBcJTzEF6iNXz4b872eCtK5NYM28icqfUt5Q61+X3y1eYOF
MJv5quOOfa21F7tk0l5UDPFke7eqbG5WgIKuHA31PANhqBRszLUgSmjJUxp6QdAJ
P2oMG0z9h5lHW6dMDdNIPXhB9uamu1H7zUx6benKwRG6Hu7RJNNOPfQOB4Yitk29
g9I1BYsKXehrrIeM9QDfE5WMJP6fUbDvN3Nkn/08U4Bpipydwoxg1W7hHiCuKGOj
Kgj7d6JsIuvbb8qpv1ndJ7n4rTEJi2ZupAx0Oypv3qnWRqIceK8=
=auP+
-----END PGP SIGNATURE-----

--c8JyeaiReRNoiMDS--
