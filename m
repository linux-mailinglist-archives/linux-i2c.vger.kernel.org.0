Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE2474A46C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 21:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbjGFTdK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 15:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjGFTdJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 15:33:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6384919B7;
        Thu,  6 Jul 2023 12:33:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE6ED61208;
        Thu,  6 Jul 2023 19:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890C9C433C7;
        Thu,  6 Jul 2023 19:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688671987;
        bh=CsnSC10RfjKdYlfvukRrKP9eKP+HKwk939lx6aN6Jgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dL9GpivXua1v5uWI99SysNTnNW4AmQXeElqgdamMMWH+BFB+U4MJ4KswDe4vWhbCY
         x/eOENNXfhGvfO7fu60lAnsBA9IzyxYa6SXOi1fXgIneN/8bbx1SKonepGxAG9A5Xi
         F+SmfLD6FrDWd6R7yHdru/qSou339rajf/gI0hJ+id33C7HXQHVuvPPHa6fX5opwP/
         c2qRsITI3tuVSHrD+BMEDFiKKKQ6W4I7q9nJcShigZVoUfM4oV2vjBD5JipIxws/JP
         4NE7LoAwEsXE+wLp8FfDFckuVNDDOP2lKgXQnZMhuzc3bJkvjHGU8Ow4tBhwZ3gbVO
         T0OFqTv2/wqnw==
Date:   Thu, 6 Jul 2023 21:33:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Marek Vasut <marex@denx.de>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <ZKcW7yh4gGKUCRvS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606182558.1301413-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BSnkPnJjlpCTHXsL"
Content-Disposition: inline
In-Reply-To: <20230606182558.1301413-1-robert.hancock@calian.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BSnkPnJjlpCTHXsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 12:25:58PM -0600, Robert Hancock wrote:
> In xiic_process, it is possible that error events such as arbitration
> lost or TX error can be raised in conjunction with other interrupt flags
> such as TX FIFO empty or bus not busy. Error events result in the
> controller being reset and the error returned to the calling request,
> but the function could potentially try to keep handling the other
> events, such as by writing more messages into the TX FIFO. Since the
> transaction has already failed, this is not helpful and will just cause
> issues.
>=20
> This problem has been present ever since:
>=20
> commit 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
>=20
> which allowed non-error events to be handled after errors, but became
> more obvious after:
>=20
> commit 743e227a8959 ("i2c: xiic: Defer xiic_wakeup() and
> __xiic_start_xfer() in xiic_process()")
>=20
> which reworked the code to add a WARN_ON which triggers if both the
> xfer_more and wakeup_req flags were set, since this combination is
> not supposed to happen, but was occurring in this scenario.
>=20
> Skip further interrupt handling after error flags are detected to avoid
> this problem.
>=20
> Fixes: 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>

Applied to for-current, thanks!


--BSnkPnJjlpCTHXsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSnFu8ACgkQFA3kzBSg
Kba2xQ/+Pcz6zeU2cFQLSMQdjPWm8UwIcw3uONyWvVmSjN9pLX4T3iHkIYrmb/1W
3VGeySIlKSc1YVNOIf/qKjsyVjfuWeCRTtNoV5rU/MOrNbrFWFE9OOWYmp5oHmNm
5LKq933bX/WGvAPg5CZ+uBp9O/yHTnvcEDKjJYR/1MIel/9maAedsEVksLGlN6zW
zQPdCbrK58Q78JwhD+fWN4ts+uEnzOuGJYLz7id0E+WpXn/jB+5mNEtP3//eqbDs
C/RUXgfO3B33TgplWlFnedvF6Mskmt0pgrKIp42CgNw2WkYQmebouZDndy01ySih
dHgJoAUpX8tLgt04D1R0WFAeH3bxmnh9WWHnJo+9etBFENDTj30OEiGlUq9OLMkx
/OhltH48LGqeV5MCYSA0ZNIgyE8HvfEUhlMg9H2yEL1d5GhZF7p5jnknrRGgV4s7
3iH7l49GSsVUUcDjCOTV8zCeOcDSxtQQw+1RiN8k40bv+flmF8IN1olJIruiggX8
J01z48dMY/dvpqkweqSoJlKEOwMLTmgTz0zCw0rwqrrp5JId422ZcyKVGGms38AM
JQQ8ep7aUGQHL+T2UuRE2Xa+kMAgB8FJebt09NWDE+s+YRk0mqMX6nX/aNSJy6ry
XRmRQqJW9kmkigTDDdGFp4421m7AZUzC/mB8nP3TVCJGShwz4gE=
=QO/L
-----END PGP SIGNATURE-----

--BSnkPnJjlpCTHXsL--
