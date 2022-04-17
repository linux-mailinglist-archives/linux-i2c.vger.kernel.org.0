Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88E0504620
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 04:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiDQCaN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Apr 2022 22:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbiDQCaM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Apr 2022 22:30:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35D840909
        for <linux-i2c@vger.kernel.org>; Sat, 16 Apr 2022 19:27:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C96461027
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 02:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA21C385A3;
        Sun, 17 Apr 2022 02:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650162456;
        bh=tpD+Tr6/Z7h3kNVI5ow60huxqpFBnXzy98WYzHD92mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3de4zEojVr4xa1ziBtVZZ6AA1a4A+aQbebg/vk6pobBYqF18meZm2wKT/PrQcu7f
         LxJFKoYnZ+UbwH6LB677tw79r7y2FH6Rx+tMtoVFdGnIrknlLNFwfKHi3pCWO2sxUw
         JDVaxfKmaGg3QdtZpDcX41CWRCI7iNUyY5PeS4T3xMDtxtXX3oMlVZf149pdbo56WY
         ZNCYQ6cnVjgYdvEDMzM8128X0JEfk0JMmLkXiJszRRxJY0XevNZnfa/TOjD4Fwylqn
         Z3W34f/BrdYBeAT63NWdWGYzn2vk35lhjzMfPz9ZIZR665uvwVwLo89qjwU5LJ1vKs
         10RQM217UXZ0g==
Date:   Sun, 17 Apr 2022 04:27:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: i801: I2C block read should be usable also on
 ICH/ICH0/ICH2/ICH3/ICH4
Message-ID: <Ylt7FU/3TTvvcNx7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5PbVUHGuYLJWDvrX"
Content-Disposition: inline
In-Reply-To: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5PbVUHGuYLJWDvrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 10:18:49PM +0100, Heiner Kallweit wrote:
> Currently we use the following feature definitions. However, according to
> the respective datasheets, also ICH/ICH0/ICH2/ICH3/ICH4 support I2C block
> read. The implementation we have should work also on these chip versions.
>=20
> The commit message of 6342064cad7a ("i2c-i801: Implement I2C block read
> support") states that i2c block read is supported from ICH5 only.
> This doesn't seem to be true. Or is this feature broken on older chip
> versions?=20
>=20
> To me it seems we could remove FEATURE_I2C_BLOCK_READ because all chip
> versions support this feature. Below is an experimental patch, for the
> ones with test hw. A test case could be to use decode-dimms that
> uses i2c block read to read the EEPROM content.
>=20
> * Supports the following Intel I/O Controller Hubs (ICH):
>  *
>  *					I/O			Block	I2C
>  *					region	SMBus	Block	proc.	block
>  * Chip name			PCI ID	size	PEC	buffer	call	read
>  * ----------------------------------------------------------------------=
-----
>  * 82801AA (ICH)		0x2413	16	no	no	no	no
>  * 82801AB (ICH0)		0x2423	16	no	no	no	no
>  * 82801BA (ICH2)		0x2443	16	no	no	no	no
>  * 82801CA (ICH3)		0x2483	32	soft	no	no	no
>  * 82801DB (ICH4)		0x24c3	32	hard	yes	no	no
>  * 82801E (ICH5)		0x24d3	32	hard	yes	yes	yes

Any reason you skipped this patch in your latest series?


--5PbVUHGuYLJWDvrX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbexUACgkQFA3kzBSg
KbaQJA/8DGTTuHvIW9Eq4giPkDEjLgmcTnZAVuWHagPyiAkhgW/4ykcJ1sEt85Yh
zw+Qc9oDehg1niOV8VAnhBZmz/5Nqq+Q4m0/ZrGqDaPpaJO4bxp0r7tHFyOCLyW+
wY8RBRWpeAEj2O3er9onROAsXXaIpz4Vv6rlUhrtYjikB0EjMJiJqO8iIZpex/WE
K0WxuBCOqNjuNN9IWTS3ypVB6TtDCkPcOWQP6cQ3rvHW4ZaawX5hWU6MCJu1apIs
Z17QqD3LvpjdoARJaE9hGRXyf+2mbOk5za+uCaddTgz7SpE5B0AUix1VTwQTDP6J
8C2hmTU2ez8ImdW8gX1cFy6vlo1tQcn6izguLya/hXJ35+1YYpMfKeY6dIip0fou
H1z97zSjtfgN320pIwY87PRXszy0kOCp0BZXma+tH1jqXz7qJFN879NrkblUAwLp
d6UVb4L85Tych52qRK7lNEofNy08il5i0D4Z451QlcQSnbIzYaKbTJ79M4ieVKgP
4kEr/9iY0ZlhMx7wf4LWfZeewZhWm+FMCMXpMex0fFS4lavgrLYB1aIY46ccAqcy
q4y+RDCOhj1AMylCvE8Cdad//c1yHDUulxoQkF5HJqd1lMcIY0GhzMtU5AbjqU+A
Tmbd2Syo75vDdud/i5K/asEfMplPgTXe5Dk5Sai16heQdfQuv8Y=
=D8Gy
-----END PGP SIGNATURE-----

--5PbVUHGuYLJWDvrX--
