Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C239567FB8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 09:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiGFHVH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 03:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiGFHVH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 03:21:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C8B13E0A;
        Wed,  6 Jul 2022 00:21:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B81861DD2;
        Wed,  6 Jul 2022 07:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A213C3411C;
        Wed,  6 Jul 2022 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657092065;
        bh=qzMpWlHvnneyzml1ICOgakHTc1rJSym0t9u8nI7Z5ZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7IROoZSTm6WIg49hLLQAQkYt/TUXHvya+Z0lY9XwbPwqkCPAEcNCfqqXjn5LQPjE
         ltXdslACUiGtUviKOH/vS7S1LfTPiy2skw/3qejnrFS1u669aZLs1OAoODYqe/1L2s
         jp4kSbUgY4YYVEiuXOgTGQFBVv2fCGnaEbDGuNfxqtmJ9NQJe8SKcGmIa2ofVwOBPc
         D7FU45+7jGZsBKildd4SPCKsGKl/JWxDTFaEFlOCUmvcXQx4onu37eiyokOUuGkiND
         ZaRBbOLGYXz3AD6VLMWfkQ6fsg9Jvxv2oZChARsI1iguOD92J3BSgC5naNCKketeCJ
         TddgY140Rdx0w==
Date:   Wed, 6 Jul 2022 09:21:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
Subject: Re: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Message-ID: <YsU33mo+8MwmgPr4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <20220621074238.957177-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RlT7hi3kxpfgCUPI"
Content-Disposition: inline
In-Reply-To: <20220621074238.957177-2-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RlT7hi3kxpfgCUPI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 08:42:39AM +0100, Conor Dooley wrote:
> Add the newly added i2c controller driver to the existing entry for
> PolarFire SoC.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> New in v6.
> FYI: I have several maintainers updates in flight - usb, pwm, spi
> of which some will be in 5.20 & clk/hwrng/pci that are likely to
> go into 5.19-rcN.

Then, I'd suggest you collect all of them and send them as one patch at
the end of the next merge window?

For that case:

Acked-by: Wolfram Sang <wsa@kernel.org>


--RlT7hi3kxpfgCUPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFN94ACgkQFA3kzBSg
Kbbz2RAAoC8RtqHoaDsrcvvgA8X46nr34vTXQoDfO+mnNvMQqcK0ynxX75NrLXL1
y28340cjgp9nKa3wriOF7xRWsv42z3WrwaegvyBTVg5W9CGEvvXa1QXAyESNS7IR
azYrpm7qnYmbv/OExLGZr+nlvyHv9RfysxPeS3e5cmaUOkwVTzavug4dy9IbLltO
JtVNaZMRVgd9lc+ILvPF6q1hMxmnJ3fIViVptf/HQbXxCZfpkw0Zyn88Z3k2kI2a
UJ2z2U2Xtzs5WbYdHep0rvay/8zx/mYBYPGhnnIAXg4Pyh7iOJeyt30Va3FPuJZH
LnxI8Ir2ETnb6BLn/vK9thTa/ml+sIxPSJMJQ7ZtQzI7mjFNBA/O0vxhGW7d2R8j
/w5RDelYs1kSzjMdpnYlJx8MoJu+5ifCnsWXR46SlT5jxVC1rPe9Dgijf1Khkgie
vQP/39idrz1P7PRzeDhyjtoODpAgKPR1YL0FhxszwHwppiSfn18t4bn9aYl2VwKu
8EYcD4h/95VFOX++Cps4Nk76oXrQP0OTbdLa7LiKER8IHQ/yLCNEBSsPYsVbbWs9
C8CnMV0ri0Pp0yyyJ+i0LDDTrHUsZLERQREjvb5J6XR5pkXx5OREpwWDMO1gOj7o
A4bNOaxyFJXFmwVqEIrkGaHGjrWJ6l8Nypa24BL7vMjsxv/MaK8=
=sxFt
-----END PGP SIGNATURE-----

--RlT7hi3kxpfgCUPI--
