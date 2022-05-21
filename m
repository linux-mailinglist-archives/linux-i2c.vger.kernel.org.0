Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5D352FBFC
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 13:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbiEULct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 07:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355761AbiEULcQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 07:32:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4DF2FE7A;
        Sat, 21 May 2022 04:28:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 087966121D;
        Sat, 21 May 2022 11:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D549BC385A5;
        Sat, 21 May 2022 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653132532;
        bh=irdHG4XDhujs78rGcOOT8dP4dOtrCFTYOdf9CAfk39w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sgOZAHYxmYyEB7Uo+QAfXe2IdQ7Mk4lnm8Aj6IoqXaqRqOUlM7rqnO81DQr4r+zyW
         NzK6j5Z4bcp+i/0krDKekWYmFp8DM4gsOP/GByRecd1RYU/NPu6ELtunFV4pynLXzs
         cpPXzct4JGtPkgJ9tpTrLUz7TBhkY9U0dLEYS7HdX1zhlRRgzOEsE8RT22uUCu1O2A
         xgeZdPYApXG9n/s5IcBA+cP6V5Lpt2BLVC4Z6e9AuQyJib47iEOhqGPFl4P1sQNNSS
         IINt1sR1M0KkKJrXP1g9dlagRr5DrOny7C6riyIxhFnNAPvhhJYrmwFDq3A6ai5Snp
         cU0kCXW6PeOHQ==
Date:   Sat, 21 May 2022 13:28:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Message-ID: <YojM8KiGJneGh16D@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220516073331.3508505-1-conor.dooley@microchip.com>
 <Yoi1bV95l7+thgS5@shikoro>
 <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="afvwLyDuav/fPEU/"
Content-Disposition: inline
In-Reply-To: <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--afvwLyDuav/fPEU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +	ret =3D devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SH=
ARED,
> > > +			       pdev->name, idev);
> >=20
> > Really SHARED?
>=20
> Yeah, this driver supports both the hard peripherals & soft FPGA cores.
> The hard peripherals do not have shared IRQs, but we don't really have
> any control over what way the interrupts are wired for the soft cores.
> Worth adding a comment to explain the reason for it being shared?

Yes. Such information never hurst, I'd say.

Thanks, have a nice weekend,

   Wolfram


--afvwLyDuav/fPEU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIzO0ACgkQFA3kzBSg
KbaIyg//ZJ9OqPwDGI8q+886yLcIadgterwgro/F5vVGHPWu3Bh4v2KRijTQGoq1
7dHVT3oy8UM+4BIRtn43zNq43g6ZmZykrOrnkcCrDrZinU+XLgd8d0O/DwnaVnlX
eppOrkrgO7x/eTSUZxngbi0t3MyGbFxHeM7seOVZ3wxIEA3UZ2Dr39U9ZQh8enRB
w9aZ7rJ8VrYx0wMDoHcoO3Gn6aHguRxN4y5xnRIeYjiPek9OuQNBA3DES7x+CXq1
ZHiU3pQW1CW3+kPyJf/sY57YhMXTEOPQrloYISzWiBuETQJdAGFP2PBmduEKlO6h
Nw5V/mJK9DUU9aUsqLW3+7Sw/QPVKL6Xkf11WUX5NzFv8BBYpIK2m68hjY1ZVYKx
Gcelmi/Z8skWHCGhIiDwjXN2YSaxnCoTTer983CHBjqAL0M8oPURTv9NkjzOqCxx
Pn3h/wfWjdmOa3z7DaquKFSH54lmzuZwJEx3F1Q+GFKdgbPYLVI26za2ahGFkSMj
ptW7ZWtKsTXBaLnMRRteaEZTqHfbpuy4vxGhhK1fAqMsIwhsLBxmgTBmDrxDoGRr
zJmHAEzWtEssWAEnqvBLPGndkA/g5HkXW6fo9HuFxVnBlBa0GrbfGEBXki/cqpVX
XwBY9PL+xaDMlmRNrvn4iI6JPPyAkTQd+Vc6gBfyjXMFLbqX/jU=
=4rJa
-----END PGP SIGNATURE-----

--afvwLyDuav/fPEU/--
