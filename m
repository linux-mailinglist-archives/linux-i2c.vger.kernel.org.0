Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8437B7AAE71
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjIVJn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjIVJn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:43:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E0294
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:43:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF65C433C7;
        Fri, 22 Sep 2023 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695375832;
        bh=vWoZxFWq9xesVXkj+h767RLbCJblD/55yqUgdmGNr3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRCLQWynrFC1yGLFn55oikf+FMgl9dU3KZ0GeRr7rjbHAjnYQEMlruQpPBUFZC6Ji
         t8sgusJeAFnWXjWULYNqZwXmXcd/t8361yS2LhiuiAKKTRuD0EpkZD9XbbXko2F09w
         k2Jg0avp6xNOOyVpnixA58TS+lJKnXFZEzZ5KCJ2y8KoXO/LYst4QzI9bohBuJLPbh
         ia2oV/N/DfBXv5VM+p/K+VVLCvv9w/KbA1gwHOo4b5edZbQ9hzmGpisVJfQxFNC/3F
         AjZaSqvW0cSEA4F3xtItKQrleS+LLO0MFB/xpEapE3Co2Y58gdzAEYt/MW48OCdGi2
         ObiJr5ixd9lNg==
Date:   Fri, 22 Sep 2023 11:43:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: use i2c_mark_adapter_suspended/resumed
Message-ID: <ZQ1h0gbut5pbSzMT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pGE9FA5xFxX2SHIp"
Content-Disposition: inline
In-Reply-To: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pGE9FA5xFxX2SHIp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 09:29:28AM +0200, Heiner Kallweit wrote:
> When entering the suspend callback, at first we should ensure that
> transfers are finished and I2C core can't start further transfers.
> Use i2c_mark_adapter_suspended() for this purpose, and complement it
> with a call to i2c_mark_adapter_resumed() in the resume path.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--pGE9FA5xFxX2SHIp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNYc4ACgkQFA3kzBSg
Kbb7HxAAoKHUByH/sUZUJUNWQyqG5wE7LpWrzEm7G4zPylk3j2xbOrvktFI1/Yfp
Q6LNlSQmCOkmyaKgzonANB9sNOw0k+ss5/SCVt9p6825A0PI0KgbMCEH8MntMpzy
06tlb4hv4A/9AqtdJ80wkIwPfD7Hd4/QXnSfTm4oYaAuNWmfa+dkRL/OsXviz4aI
/SmhaPQoG5UFWGd5eg0wY66o22n5yhplizAoY+OcF/N5YKg4AiftLY5vku4ORyyZ
z2cWBDRZnFZK5/HxM+FA0UP7U4uxrWPT+YWt/5JnouakIPalqvOGPN68x2xodcMB
PBjAS+p8XXFPy5CN5DzxKs6wIopjVURzAydSRr/Dk9xJj6QWdZyPrwoY5nPIZI7P
N3064CYqh7k1ku2FEqoC2n/2ZUJyDQCuCTP80ES69e11LCrVlevRhFR81kWAXR1r
Msz0W7Mcrr6yDK1SlaaSYYIn/cRv/Q4Lhxhgo1KMyyX+gTQE1lcwLevG750vlAlW
bdhBj0iRs+LPZxxAA/WwuMRbXUoJs+sYXbbmQkAPgPoN6POZhBX20SSJ+XxWdrdg
jWYDrj+CEOs3mR4v70OTtzrIPS7CnJzYO6xuGCMJE4ar5hpAPCgFEKVA03eq78xM
gTyMAQhysmI6mpR23L0PlDRDpsTkoZYUlYyrwuOabEFd5ohbXYU=
=Rx/N
-----END PGP SIGNATURE-----

--pGE9FA5xFxX2SHIp--
