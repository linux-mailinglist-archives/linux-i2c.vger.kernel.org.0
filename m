Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3FE7D81B0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 13:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZLTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 07:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjJZLTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 07:19:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDA91AE;
        Thu, 26 Oct 2023 04:18:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC95C433C8;
        Thu, 26 Oct 2023 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698319137;
        bh=IWCVDeQfz80D8KxF6kheGRzPjVWrUAfuCZcpuboGmCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Iy28Uvj1JRA+FjBIpi31KjtxkmSjyeaP2x5v0hv7FqFgBiFZG02l8lVWudm+XYr/c
         o504d36X29yZPYoUxDclN7bFcxePLaufNzxJ5349nRDuKj2Ncz9mJD6tnZkJtTgGBd
         ISOA4l/+VuNis/wKkjlWFNiVX1pmZimREsnaz0OA+pfUb4HHpeOAcbdMcozv7WgBPF
         quQaJx6PZZDO4WU3Su3Zu6/Ra2cRXFoSdY+rhAshoEO0z50xWgQOf2yr7tvUqLoJnv
         dyOwkTI053yfrWznYQmR9Nu0bwEJl0E0Ii4IrKaw/W9x7SP9EJstjfWAE1EoSb7Say
         042hg67nCsDmw==
Date:   Thu, 26 Oct 2023 13:18:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZTpLHZZYtd1WgBu6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o4CF2TM7pvgzMj7x"
Content-Disposition: inline
In-Reply-To: <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o4CF2TM7pvgzMj7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 11:48:10AM +0300, Jarkko Nikula wrote:
> On 9/27/23 22:38, Wolfram Sang wrote:
> >=20
> > > So my next question, is the change to dw_reg_write something that I s=
hould
> > > write and submit, or should someone else submit something more genera=
lized,
> > > like option 2 above? I don't own the i2c driver, I'm just trying to f=
ix one
> > > issue on one processor with minimal risk of breaking something. I don=
't have
> > > the broader view of what's optimal for the whole DesignWare i2c drive=
r. I
> > > also don't have any way to test changes on other models of processors.
> >=20
> > Well, I guess this is a question for the designware maintainers: do we
> > want this one conversion from *_relaxed to non-relaxed. Or are we
> > playing safe by using non-relaxed all the time. I would suggest the
> > latter because the drivers I look after hardly write registers in a hot
> > path (and not many of them at a time). But you guys know your driver
> > better...
> >=20
> Well I don't have any preference (read enough knowledge) either here and I
> hardly think performance becomes issue in any configuration.

So, someone wants to come up with a patch to move to non-relaxed io
accessors?


--o4CF2TM7pvgzMj7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU6Sx0ACgkQFA3kzBSg
KbaEwxAAhYGFsc2Ic1zZ5TXouwBdmMiFzU4cUxRwQCghgpdhWQi56LAU9jW8xzeb
ZaAPq3k+/CARf2WdvlQ/EGIKO4SDNQudnpUWU+smJbLeLiWkRcHJVzGLfzq2q5F+
Mq5v1GNhl10Z2MSX8H+WSByGpAeYDC8/baba/zaR3KjdA/7dE5DNKHETG58aNQ7e
Uy8yaWQbrIx9mW1hGeReTW1cWk+xpOKYrYNJcxi7NkPSZDufbINiJKdKvbsAytKz
L0JBl3mo+bIut8H5SWHGkEbY5LBDAgsOSCnHVzI89pMZgmfT7ep9+mPsLSw0KGwL
XofbaKzYa/qT8JfOn/6dVedntUEHmpmhM1ZpuweGDwH5XSWcTUlt5J3nN46NI5OS
TkiWfhyHTg1Xn+Tr6ENMZRzshvnewzKimjLBQacdHgItnJ36PTuPi+FhoTxZtJ+j
2XJEz4BsPLoNJdwp6ACowQdmjYXgYl5U2bjlBlc+O/TX72tZI2okadIKb9GjcZ5Q
grp7GTB/tPblPsO4y7GdwTTBlQsWO9eHUl+3kaILpSRCuDditRR3BrJnAFCbFkCf
wQvbLWyKa8ArnKizUwEL7zv4jsI5brYkxHGkbC/oOjQXiWsNumOjaHK985taHFk3
T+xcW0ckSVjTV5x4DiL+UyfB71uqHdzpb8QB1fL2lqHgZAWYOuw=
=Kdgb
-----END PGP SIGNATURE-----

--o4CF2TM7pvgzMj7x--
