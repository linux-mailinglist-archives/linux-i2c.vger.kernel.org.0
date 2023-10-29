Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C024F7DAD74
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 18:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjJ2RMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 13:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjJ2RMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 13:12:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4B6AF;
        Sun, 29 Oct 2023 10:11:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98838C433C7;
        Sun, 29 Oct 2023 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698599516;
        bh=PraBZzwFCJ7Cwj/1VkXk0MBu6spK3fQhhidNROag0kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FI21k8ThBaCJpHUzUYTjNWicUgyM5p/xOh1dpK1gyDSz2QRr51axyGIjtgdljCRKr
         L3PA57nJHpAavc0nqbjPT+xJ1AV4o/PXBvxjJzIGhev3FS9i76/USaBeM9wMezz6DX
         39owGGc2v+RLHoVzZ5Y18lwVdR9ZQqor75SOSoQpP26GMLfQLi1knyvupawh06H999
         rS7VpLe08vPi2G0LWh/ebM4oCWWe1o3nRwSPcIqmniprpGk81eeS+R/VBqzU9dBJui
         l4KZPePzUxOQXQIoDv1Rq5oLUGDgu1aQRozYy22Gi1gJqWKaBXqJw3Xbcw2Xnx+38g
         srZ5Irg/nCfTw==
Date:   Sun, 29 Oct 2023 18:11:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc:     rric@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris.Packham@alliedtelesis.co.nz
Subject: Re: [PATCH] i2c:thunderx:Add disabled node check
Message-ID: <ZT6SVZNUT/KPucdI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        rric@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris.Packham@alliedtelesis.co.nz
References: <20230711054147.506437-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Af+7Wv27sclYo7SW"
Content-Disposition: inline
In-Reply-To: <20230711054147.506437-1-aryan.srivastava@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Af+7Wv27sclYo7SW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 05:41:46PM +1200, Aryan Srivastava wrote:
> Add check for disabled nodes. These nodes should not be probed. Can
> result in logging for HW which is not present.
>=20
> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

I am confused. This is a PCI driver, no? Why should we deal with DT
settings here?


--Af+7Wv27sclYo7SW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU+klEACgkQFA3kzBSg
Kbb+EA//ac7/KLcvCg7NLwIGDESEirlAsLpGr4nI/zpvKUMHesKpV+JCuzAx3gi8
VET41JSYqzjyfvAdoi9E6gR39/vlEMGdvpW0wrf7yGlwCxokn3ECYJ/O4xETTouc
a3nsKRreYST5sO2OGCutGnRT3UM92iafCk4rjQ8+vAXQ+uj5C2aLxEahAK6T0fji
HRBL4tLbtfwmcmGhfksHqj5E1s1trYzd01Cjeok1ye20Hk9zoCYeej5C+QooUBFg
VwuSmzrddk7J+1UlOb8blrEJssIOi4rpWab2F/ZzN89xkpvogUCLfUhNCqpTRuXi
M77QrDpzWF4bMirGZkdt1Zlh9rZGmj/VAXWEnpyGTlHoFYyP6ojmsQC0Jofw5FrE
U4F/m+zlgiVl0BAYbmkKqXq1MJhL/IPIJ+XPw6995hluZKgrAaup33zSQ2BpGOpn
6HusiYfctkrZBDqwhK+BY5woWtB6QHHTt1OxNJA41h4iO4E1cTOn+L0kNaGkovP3
IotdIUOaSdRgB35WFJuX2lZvUk1Gc5cPeywpZIM1Wx4p6ImWKADajv5o0vDDMqSR
jpdijVwq6UfqxpdsInK6P+TP+5BQsvNNAipSylXA8KYC6VTSfDrgmoRKqgeb1U+u
krx1xI1TrRdfmJA90tDnGHsXBhz6kWrVluK1Jj7ybVwH39ugrqU=
=nmih
-----END PGP SIGNATURE-----

--Af+7Wv27sclYo7SW--
