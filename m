Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86CEE560A91
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 21:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiF2Tqh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 15:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiF2Tqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 15:46:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E882137A82;
        Wed, 29 Jun 2022 12:46:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9DF7B826BE;
        Wed, 29 Jun 2022 19:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50A9C34114;
        Wed, 29 Jun 2022 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656531993;
        bh=I3rRA2ivIk2lSakF7rm0zAlvjPJfLVr51rUs2HmOnfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NptgRT1U3j1lvqVyA+erDG4RqOSE/A+Y48K25gloXmSMky7zZ1Al1NCrCW363wG8P
         X+1oYkgOfmD884iexn9uX9ee8a0QmNurTrWHOMrL1lcZfoQLbw93OhftHrEAtEVwtg
         p7imWVOtTkoyjJaZwgJ0dRVIipRcBGR+pWvGa33OlTv1DL7LhdI1x6dOeTMlFU7aKx
         QTl9x3IM0FRrB83YAOudUOpyfx1o3GQqzBhlVDVjZdDpZU7CZBq0q70/2AfPeyf7k3
         Xaz8dx7rUaTV8mfO6A0qW3YAUeiozxwIMm0mQ80iuFf52D5KCT1KfMFm6pZ0cI6097
         24pcD2i4MiTiQ==
Date:   Wed, 29 Jun 2022 21:46:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org,
        peda@axentia.se
Subject: Re: [RESEND 0/3] i2c: at91: Fixes and updates
Message-ID: <YrysFU0fP7X1wkBd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org,
        peda@axentia.se
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PO1fX2YbNUKV/P3U"
Content-Disposition: inline
In-Reply-To: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PO1fX2YbNUKV/P3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 01:13:44PM +0300, Codrin Ciubotariu wrote:
> Resend due to the fact that the i2c list no longer accepts replys on the
> old patch-set. Comments not addressed yet.
>=20
> The first patch is mostly a prerequisite for the second one. It only
> moves the i2c_recover_bus() out of the actual transfer function. This
> helps the second patch disable the controller before using GPIO
> recovery. The second patch will keep the controller enabled when a
> transfer occurs. Before using GPIO recovery, the controller must be
> disabled, to ignore potential glitches. However, the controller must be
> enabled for HW recovery (bus CLEAR command). The third and last patch
> adds advanced digital filtering support for SAMA5D4. The TWI IP found in
> SAMA5D4 supports advanced digital filtering, even if, at the moment of
> this patch, the SAMA5D4 datasheet does not mention it.

So, can you guys read this mail? It should be possible somehow that I
can read your remarks to my remarks, no?


--PO1fX2YbNUKV/P3U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK8rBUACgkQFA3kzBSg
Kba4jQ//ZOvHvEFqvfQQSpnokDAdiAwhM5eD3J2oFwTCIQb9iCt0lVxXranvIHpX
wxX06lTnl1drrUQdKanseT2hylhqPeam0pJi6LHi9Q1l9n0EHaPpctJJ46ovtXEG
frGuV8tIHdr9/H7G/nW+PtJpDcSxpOmOR0KsLSVSTn6el7LOA8EjhOHMRCMBeFfg
UeHnmfGCI5GZrGcFqkxHRX/CwFFZCAsCyW3+1Kkk/WMVK1ims8IZpgRD01mvQERf
X4LbSexcyC702lvgyGGKNsph83J/qT3EAUHQvzc2+LtkmQkYk12yFXqzzI67QQDu
uDd8w7qKi0/r56hXP9DSSoPDvzt1edj9xlj3jdaFQL/9lxlx4+OYeeAsaUo2qOJT
wko7aadFMPG49N5Qp5s/Je0vu+uCf7rLg1J6WB/nSpVMuon/4dZEtP/QsBm86bi1
WG/NdwJgxPOg8T/PnbILEaRzcvYCM8yVCn3O6WBt8h2NBrjykIp0A+baHBzuN+sF
VGxYzlR7hDzzZOXz7PZoVxtt3nozGwmnknQyttRHGEiz6OrNqkZezykuU3mlzXhT
ncRpLwHXWEt4idvFPM0gkUk8StWC/6puUNF5Doy9wmVliS+7d7PQ5VE1v0/2cQn2
6pXGHbda705qIxBTZ9n1yIWqKtw1OIijv+CNNwkCOd8iQIxYFBk=
=Pigm
-----END PGP SIGNATURE-----

--PO1fX2YbNUKV/P3U--
