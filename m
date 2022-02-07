Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF6C4AC262
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244505AbiBGPDP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442378AbiBGOtu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:49:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7F4C0401C1;
        Mon,  7 Feb 2022 06:49:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9444EB8120F;
        Mon,  7 Feb 2022 14:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AABC004E1;
        Mon,  7 Feb 2022 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644245387;
        bh=Psuk8AKsWmJK43HTQObBBI61+Rcw5PoqojA+kFWelj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SheyqPxVih7lRu98iWTPmguQH9bpZdzyFZaGuGbhPOX6dBN1acx/q81ZaN7Fy43au
         sq69Nx8eFT7NEWNktA0MA7DVMWzueVmb5TbSLEvSUKlsZ29736w2z9t2KhixH2WQjY
         XzECg5hzPUa7jegYkYsEqciQkgJWV4/C7KBa2DHx8NAAMMYSVelmDSAze/KSTbQVfW
         Klm0SyO0l7ZsCgMdGyFFYbR5gI4JwcEcTpAP5K64VFfoVrPsIR1LOjvTULk4rIomL3
         d9x017YwmYcN591K+vVlM1cwNFjVFXp5OzETt+prna76Lph07Blw/BV8bMlkmXb+wM
         BEmvWR0hzJtpQ==
Date:   Mon, 7 Feb 2022 15:49:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        f.fainelli@gmail.com
Subject: Re: [PATCH -next] i2c: bcm2835: add missing disable and put clk on
 error in bcm2835_i2c_probe()
Message-ID: <YgExiKpGzpr01Bbf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        f.fainelli@gmail.com
References: <20210601140835.3595921-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ATbTRyqtzskqR3Km"
Content-Disposition: inline
In-Reply-To: <20210601140835.3595921-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ATbTRyqtzskqR3Km
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 10:08:35PM +0800, Yang Yingliang wrote:
> Add clk_disable_unprepare() and clk_rate_exclusive_put() on error
> path in bcm2835_i2c_probe().
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Correct, but I applied another version instead which was a tad better:
http://patchwork.ozlabs.org/project/linux-i2c/patch/338008c444af4785a07fb5a=
402b60225a4964ae9.1629484876.git.christophe.jaillet@wanadoo.fr/

But thanks for working on it!


--ATbTRyqtzskqR3Km
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBMYgACgkQFA3kzBSg
Kba2Sw//RGcfdx9shYhs0YZsY75d2VgluBKQ2CTI/NRmZHAnL0Hdzk1UMjGiDT4Y
LLmUslwBk8od97Kl2rPJ6PN86TfaX06AqMYPgoWLoJnNGhDIum9xSOOZHjdX7l6F
uOfXJy6aai/rw5ssexFMmkurKovETniqg56zoDuYEXc8UTA9n2u/8dLGO/LRr17/
ix23u/aAvBpulPd51CWEQ1kasCC+Ncle+9VA6JeJlazg+YqSOeH3q1evAu68Guks
o0Va3xPpEPP0ri+FOLNm9T4zbbdvmihSbaC8ZtKizptPWr7DIs47D27wyYHzVn64
KagL1rAjA61LYng5qxPnLZ61n0esZu5FPnRBz2p44YyuWzrvY0KzpMf/0xRsNbmd
B59y7QrW2ejdwsfjMYe6v/dR3HzJBAPB8ZKPPlyuMluPzny/0EZPir1Uj4toIEGB
QPq392DO4F41J5zi0rmeEYZ5qD7GRc/5oNacT6Xjkx34t+DqlWBlyHzXviPr0K+p
zV7+FslxHiZ1eGsGIeNqcfybw+bYewZt4nnwq76zRPAvgTNBvnBHelzCfiADas8x
F36eT+MK4cTBwnTEV5ae5rtKKuY+xgDDpfKIDLmYj8NGtmQFsLVyEYRHcRcgJgEn
Y6b8+IPjsdCJ0DIntD3AxNQ4JmyaQRfwGHtlFFkyGwXdfoBoLp4=
=h19W
-----END PGP SIGNATURE-----

--ATbTRyqtzskqR3Km--
