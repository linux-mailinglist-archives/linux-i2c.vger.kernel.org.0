Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF64669851E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 21:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjBOUAn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 15:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjBOUAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 15:00:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626F63D0B8;
        Wed, 15 Feb 2023 12:00:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFFFE61D51;
        Wed, 15 Feb 2023 20:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6838C433EF;
        Wed, 15 Feb 2023 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676491236;
        bh=Xln6iGBmP770dXFchMmkn2PZmyfxrJuVgoWG9JXqhbA=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Le+hZW2sUCfceyXmH0mOs0vMFjJZa19NN3k+H6RbDebrHldcjFk2yRooOkSSM4t1N
         bFt13pbriF9tPEaVCUYc62ofruS/9kAqFrAf/+HBghRy00jzBZL4UqLyFDDcNC4WXj
         CShwtXOV3lhX6GnGILZIIUZZt4c5Dy6CxxPFbebbKGYyk5G9qKlQXDDNvfJzPjul2i
         kpdrgpHQZBJ1xP/xiwjgHVqAu0xZPdVI7vzaPK+bfW6dl7GqmyNITAXh2MGXFF073l
         Iv9e6px9ObA96xAzugpt+AAgwUjb5AOZzigmWzm2htVwpS94T/nRRMtU18MYUmG6Md
         uw7z4tRT4vRdw==
Date:   Wed, 15 Feb 2023 21:00:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/35 v2] Documentation: i2c: correct spelling
Message-ID: <Y+054S65nqG5hVJK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20230128192109.31127-1-rdunlap@infradead.org>
 <Y9wrDdgxIfig0oI6@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ta8wbo0HMeFWlYEw"
Content-Disposition: inline
In-Reply-To: <Y9wrDdgxIfig0oI6@ninjato>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ta8wbo0HMeFWlYEw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 10:28:45PM +0100, Wolfram Sang wrote:
> On Sat, Jan 28, 2023 at 11:21:09AM -0800, Randy Dunlap wrote:
> > Correct spelling problems for Documentation/i2c/ as reported
> > by codespell.
> >=20
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Wolfram Sang <wsa@kernel.org>
> > Cc: linux-i2c@vger.kernel.org
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
>=20
> Applied to for-current, thanks!

Moved to for-next because there was (surprisingly) no other for-current
patch since this was applied.



--Ta8wbo0HMeFWlYEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPtOeAACgkQFA3kzBSg
KbZrAQ//SswpxHXd7JD/ddz6L0N9VYgdl0BW0R/4jrncJaR+N0n/vWoxsP6L3Zcv
V3nwUMhn2g8LYatBSOQhSmAM1oK6PvVHOOSJuvn5XvzCkEhI1Ur7e523jrs6491K
jGkGybyErY3esmcbVKXU1dfibyGe7Dqea0TivjUq0gB4hBJGHTc/29cpXbhZzLGz
670PW0yI+bgwxmENej8FwngWNXyfV66gmU8viQJsFo/19XDUA4Zn9Nw3oiinqe0D
FyOxoxBhsgLWZY/oCGNyZfjK9FZ0QiCb+CSMJ/Bk+/vzPsuty1ef/rO4XtGsZXL+
wNEVoM8rGaiD8je/Dd9MsIPXSh3ZIHiQIBV8FNpa3OQKutLW8V2xzIde4gI3nEX4
QxV7C7GT+j+0q/QDOwt+TbfTD/+6AqdgAEftBeOprid6NsLICPPiCXK5e0vR/wlV
Pseed4+BaiYR7ZTAzzM9emdzn4NLAsrR9cMEAyfoNO/Yl3q11GNDDqF3tz1xEnom
OiDF+J+xb5IBY015F0XymPvQvR5KU65xAq7UbcfWrnwV/KS0mGZ2ppgn4cidNXFm
k4QWZaeANYCLyrDs/b6UPdqNjD/WyOulmLz46fXk5IxQbg3hGGzMkbCV/Ukzxc75
yDEpw5yw5iUpNfuLSa2xWNZDZYck6XJkcYaza/JuPZikXgkFydM=
=8ICv
-----END PGP SIGNATURE-----

--Ta8wbo0HMeFWlYEw--
