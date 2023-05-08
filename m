Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDC86FB918
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 23:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbjEHVAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 17:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjEHVAY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 17:00:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22166E98
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 14:00:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6963962FA7
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 21:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC8EC433D2;
        Mon,  8 May 2023 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683579621;
        bh=HuZXZyIsyyrsaaFo7CxO+2hnXlQ/3Nhe97ni5qf0luo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AA/lkaDC4XXGg9p0Imm/N+MBsdmMH/iaoaQcNKv0l3zKmK6MZwG+8l4wNVTIcWLAe
         uJZ49qJmP+m1ruVQ5mM7BJJJMnPq4wcDBcuqjwCBaXri6Q405FseOcrTLmi+2DGSU0
         8BFNlPhdGO10NFLL5XmwEFuFktkgkRKjTEpOeGiQpS4+Tow8NANUBkrl4gNyE4827k
         XpoOS864vI4nLM1fF4easuILyqne1tSJei6h/OZNx/S3uPj/kHQCmXLZyZsH7RuRwD
         btlUcMfPgQ+7WTcl8cTlDvWm3lwIMA0B5cZ4EervFlFQ5vKVcjqlF8QMXYzx4Nq+pr
         dUTys+LEvfJXw==
Date:   Mon, 8 May 2023 22:00:17 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 37/89] i2c: microchip-corei2c: Convert to platform remove
 callback returning void
Message-ID: <20230508-cottage-senator-e4882fbe9010@spud>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lOjmbblZE3LZ+1uX"
Content-Disposition: inline
In-Reply-To: <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lOjmbblZE3LZ+1uX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 10:52:14PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--lOjmbblZE3LZ+1uX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFli4QAKCRB4tDGHoIJi
0mQyAP42uKbl045YUAeaLFX1GnoxoLfsqEPIBLLm24QuRYsibgEA0f9L0vL03xi4
RnHjvn+HLIB4qXCKk4B76QCeA29TbAo=
=VzIV
-----END PGP SIGNATURE-----

--lOjmbblZE3LZ+1uX--
