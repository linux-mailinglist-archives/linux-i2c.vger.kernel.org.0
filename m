Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C7154D29B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 22:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbiFOUc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 16:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiFOUc6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 16:32:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C223DB7EF;
        Wed, 15 Jun 2022 13:32:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 50A796174B;
        Wed, 15 Jun 2022 20:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E81C3411A;
        Wed, 15 Jun 2022 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655325175;
        bh=xweyU4/oqSOwHkI/hoomOugSz3ECvQLAuoo5JQYmEfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TaEB3qqtKQ7sFL15nSzdXBJU4cC65s35LLseLFBizPWZY6R0fkh1UNU118TVUYK1o
         +RgR2Kb7+JUTTRc6tXQLDV5Yr04FvNjjexnZN+hnW90VBWcBBSmrbQ/DXQNlArTmrO
         88eeDrMzneYDF4mE5yZwMpYmHLHbGZJzvBkYY1WhFONh3L/S7j8pbx+i3oaleJ/16y
         srDQGXS6Uj5dnKWP+vtWmZ2wEE+3fMfy6S0WYzEs60VGbb09bKpzasdEvB9av9Kcsp
         1a9AufleimVC0Yf7ajnDauhN/ir1rOjEJDExZ/LCrCN22uG968pCcUBS8atRmknu0U
         syD3CL+ZAGM4Q==
Date:   Wed, 15 Jun 2022 22:32:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <YqpB8A2uBi+4epHM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
 <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ic1hM2GHeE5Hfcvc"
Content-Disposition: inline
In-Reply-To: <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ic1hM2GHeE5Hfcvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quan,

> When tested with ast2500, it is observed that there's always a
> I2C_SLAVE_WRITE_REQUESTED comes first then other I2C_SLAVE_WRITE_RECEIVED=
's
> follow for all transactions.

Yes, that's the design of the interface :)

> In case slave is busy, the NAK will be asserted on the first occurrence of
> I2C_SLAVE_WRITE_REQUESTED make host to stop the current transaction (host
> later will retry with other transaction) until slave ready.
>=20
> This behavior is expected as we want host to drop all transactions while
> slave is busy on working on the response. That is why we choose to assert
> NAK on the first I2C_SLAVE_WRITE_REQUESTED of the transaction instead of
> I2C_SLAVE_WRITE_RECEIVED.

=46rom Documentation/i2c/slave-interface.rst:

=3D=3D=3D

About ACK/NACK
--------------

It is good behaviour to always ACK the address phase, so the master knows i=
f a
device is basically present or if it mysteriously disappeared. Using NACK to
state being busy is troublesome. SMBus demands to always ACK the address ph=
ase,
while the I2C specification is more loose on that. Most I2C controllers also
automatically ACK when detecting their slave addresses, so there is no opti=
on
to NACK them. For those reasons, this API does not support NACK in the addr=
ess
phase.

=3D=3D=3D

So, the proper design is to NACK on the first received byte. All EEPROMs
do it this way when they are busy because of erasing a page.

All the best,

   Wolfram


--ic1hM2GHeE5Hfcvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKqQewACgkQFA3kzBSg
KbaRvBAAhGHBikwxwBVjvxYQ3WkD53anNZCb8H7DLS+EBHUqZUhE3sB1E0xjhLw9
/D56GGMOC0z26eO0epBcCjharkSDE5kolGFghi/5ymiKkHoS/wGCHuTr6nJVt0xO
CXf1YVkIb4I3bHHxgiAPrOc+N6jw5e+Ujao7nOXjpaTuJ84RNT4hHPNKUcJIqZNR
ciM/xRqC0CslNEW4RH2fapeCw97/HksITYb/1Ix3DabxRnLj6obVmAtuokUr7Tmd
Aro8RsCKMzkJmknyhX4A/cbVuRKXGiWLthW3srmUKPCgu9dndoBsIoTty+E3vJXY
QZO0uNLBRydxJOBXT/+skne0wB3xo4RNuAzYXov/RMVkTGO2r3n3Q99wjSyHv7Zh
BWIy/QnYni2FguU4NtjgBXurWfvqguvLr37+5QMcruMLFsRKkeifb1zfOlVV9RVU
whpoeJrrFrxE3wI/L4Ol3eBokDneI4Ldo4dUvFv+CQ2GNQgj1qLfZcUnqE/SKNKj
JhcvsMNszDV7QXk8jIbzdkWbL5zxijQ4y+q+vOou/b3BZTVJ+d+wXXH72LeIxxPY
JqQD9F2vzrULR55rbXw+ZBU0jESxcBrx3aC54ksz1vIPM7gsuOldNICk00eBI8tD
HmatAjq9W/yS0VpX7XlTsBwk8w8MXJc2/VXzlJaO4M8yLddwLW0=
=SfIi
-----END PGP SIGNATURE-----

--ic1hM2GHeE5Hfcvc--
