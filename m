Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55DC5A0A7D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 09:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbiHYHmc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 03:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbiHYHmb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 03:42:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75DA9D12A;
        Thu, 25 Aug 2022 00:42:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B481B81DF1;
        Thu, 25 Aug 2022 07:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0334C433D6;
        Thu, 25 Aug 2022 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661413348;
        bh=BlgLxKmIT4QPPBxJ5YUHCx8cNJzu9DoDL1suLVrdLI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oiiDinIVKtvQ1WgZzCQpJrY9+PylZavVQnKWWQ4XRTegcVO8CkWAUfDKe9WDRYNIY
         5+aPmyIXaE0jIuIHs4h5y+Zb63z1tCDmP1a3xb67PCkUZQNnDrBDnYrWyMDGMFWRLt
         dsqxjb3HLmpNq9FKtjYS2LTl4BYSusQKjF5CgBne//o1bTsIulmUXSc1/s7CzMSbqP
         Pi0U8+XApT1arW8RAcQgke3o5Zpq7KmZC3bpve+OrTcEc32l1ryQM2JMyBtTQ3sKZX
         cgnuFt0y6F+zthkFgh3TUgMu2FnxfoiG0DyAkriEKO3Ng7tMMcjmwFjG/uAkQB84IO
         RcEdOjIhJsHEA==
Date:   Thu, 25 Aug 2022 09:42:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3 1/3] docs: i2c: i2c-topology: fix typo
Message-ID: <Ywcn4FXHHWgpFNJb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
 <20220824083104.2267000-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2Gx47C+VnbLzclG"
Content-Disposition: inline
In-Reply-To: <20220824083104.2267000-2-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w2Gx47C+VnbLzclG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:31:02AM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> "intension" should have probably been "intention", however "intent" seems
> even better.
>=20
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>
>=20

Applied to for-current, thanks!


--w2Gx47C+VnbLzclG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMHJ+AACgkQFA3kzBSg
KbbKWQ//fMp1V4PsO9D3P/FwaIJtQyHCV6/HF4dpEsXBJp0a5VqqBqarHCtUMJcY
6v8sw6AksE/B0+atP9MBqYhb85toADVqbFvxn1Qz8xfgIsWSKb4L3oIwyZyAQ+ZA
LmBg4TRKVl0Duj2Y2a2AK9CYw1exA5j83isaK3EM3NYxgrYhuhH7egr4D7fLXgyB
2W7q2rtQpN7ROZSFoUFe7Zmz4XXvuQhiLbhccsaCViVQ9g/FMAyAkKOyXi4tRUag
KMSvtDNxM/5zoBdE1vuu5f9RI21Ix657VqeRGKsABGvAeKa+L4YjfiS+sJV7WH6/
0dz8THySLbf863Q+9I8a3gDg4RmDlaZ9raZqDsSGgqs+bDFALeP6QDDnAHRE+zmg
3R9ca5ECyClZqWjP2sgBlzx0UtUwj96vQvk6f70ro2uCa4clCh38zEt+C4wUrI8s
sngmTdjMhTOvKHV6EA5PArhKsMBHhN3ffnfTcQPfo/H8b01TvuXdvqFGNBC8gEdQ
z8ODIkelxPIz0MdiJWzKrRtk0ZZW5+uytppjla40pxxJXdJ1asmRsARdQOCa1rV7
OUiqHGrUZr4Y9igpf9HO5Gkrie+DOB27lqZ/waflWmuLNFE1PHhtbpEoFehnALa2
gdDxrI67HT1bD4blBRjzaS2axTaPDJoIC1eo9HVF8PoESWJZHMQ=
=hFj4
-----END PGP SIGNATURE-----

--w2Gx47C+VnbLzclG--
