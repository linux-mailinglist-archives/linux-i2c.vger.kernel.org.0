Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 850A5569296
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 21:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiGFT0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 15:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiGFT0K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 15:26:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A7E28E20;
        Wed,  6 Jul 2022 12:26:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F89062072;
        Wed,  6 Jul 2022 19:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDEAC3411C;
        Wed,  6 Jul 2022 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657135568;
        bh=B7KWI+zxs/Q0rPLko0afLemZyMmjeukiI8Nhzv0WVnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PoosFBY5mA6HuAoVuuVa3eADaT24dr8FOlzQ3uiq2V7JbvufXQXgc6b5DYFzXAixk
         KI0qXCYKEzhTobeEFQ7tmcVEyQjXdKE7r5EcWHYIorhqGXOXA6DI9MVSCJ5cxnklLT
         WC9jUlxO1Tg3HL5MYm2wE3XFcr4UJh4iK+bWxm1nS9q6/jHj181LOKhxaXRG+2Tx3i
         L/y+O3ngdLToGFKigz0aNi2vWNlEEkIue5UUwcA45R+30UtQwJ1CRXjT5SPtqjx3qc
         tDoip3gRLC4jlzH7xk7Wxe8w3weMb5Ndf1gERxxaQoe7GAlTN/tlpCQFW6T7zENuzb
         K2+E/hkMJGOKQ==
Date:   Wed, 6 Jul 2022 21:26:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsXhyB9GrfUQjy4n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3FVpZi6DzgGOTZib"
Content-Disposition: inline
In-Reply-To: <20220706141313.2504237-1-conor.dooley@microchip.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3FVpZi6DzgGOTZib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 03:13:13PM +0100, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
>=20
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Driver looks good, but what about the bindings? I shall not merge the
driver without these.


--3FVpZi6DzgGOTZib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLF4cQACgkQFA3kzBSg
Kbantg/7BJmcaf7bvoLocUXjekKA9gxizf3QtabqYBIeWT7MBMc7uhgMfPGAEUl0
MDuwfoopJsEdBsCV+OcCoL37T/7J+rJXFDoHbuDm6Uet7UkfMB7Am1IS+bl+EV+a
TvTdxUhGSg3fwHORjaa9xiTxdzCPxn80NjRDXvjH9T7ej33xcgKQAY+Vtg16HTNV
HMaJzrVt0cJf1P3wZQhGnKwK2mB4dYuvMB/5M18s0Lh9k847U+yWpqzJwo64Hn02
SRqAQAfEZJ/fPjWehvxOjL3gKR1d+HbSLMxE2xEn+Mt9qsncqtkIXD9BHGfyc2cZ
KkilV9WzKqsdEjWIlGav3NdLqL8eDfWbH8t3CmWxQ57+tNX2aZARqUMys7u3Elaf
gTq3uF4oysBijmwx2ngQHEORzb07B+X07NUZtisBSlV4gcGiQOQdIUpX8XE2MpV5
45nE8ymUeehSHG4rjB5Ez/fNl5pwUDmgDEn4OuJF6kCXn45PT0di96yBQBIfBefQ
rHzJ0afvMha7R8W46RcMjr90c9B5Qll4vqJIoiBXRkBwLbtvrAiQBwcArZMx1zHd
VPvy9TWx5G5+3M7MDMpni+Jy8XoxjGhLs7trtJ9Jhs5UUWkF8HPrZpInDhDlw9Hl
pQ4wxcOGb53jXtHlBqEi5xYeIz2RosRmVkQT8Si5fwW4OFe+ZUY=
=N2GO
-----END PGP SIGNATURE-----

--3FVpZi6DzgGOTZib--
