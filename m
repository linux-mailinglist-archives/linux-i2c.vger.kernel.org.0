Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2475E5F5A47
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 20:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiJES7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 14:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbiJES7F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 14:59:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973A87FF90;
        Wed,  5 Oct 2022 11:59:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12E666179A;
        Wed,  5 Oct 2022 18:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04CEC433C1;
        Wed,  5 Oct 2022 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996343;
        bh=fShVYGORz+pxKk3l5e/CAy7Op7CsutLFdVOiaLOeDWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aY1NRKK/N+TvuM+qny2SBgt4iFfZ7NtMcdjreWNPbKY4LPsN4dii05qD3xS39Cpik
         j6RPuRGmsO4b3OoGXZbaU1Zt1CLh7hY5DKkYV80+VutV6Ms2HveZ4ZiNOfiFaAlywY
         41d6cBiCuQulJpv+pVP3zPiCwBtqjTvrOTxGPUfQkjguW1acaaGQzHolRCKB7YteU4
         FNYcV2EJgGWCc+3TVlrS8N2biRjEDYUhEoWtnCznRIuWMydSTyeDsSCpU09ZpBgekU
         QlZKzxrtL4hJsprReNdiz93YrK4sQpgpm5Iv4wWiYM4cxKpMLKxgQXWdzQmfhVLZC2
         R5PUC7L+Kyzww==
Date:   Wed, 5 Oct 2022 20:58:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rayyan Ansari <rayyan@ansari.sh>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] i2c: qcom-cci: Add MSM8226 compatible
Message-ID: <Yz3T8reZDbtUMjAh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rayyan Ansari <rayyan@ansari.sh>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
 <20221002122859.75525-5-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q1IH0lgTUIi7laTL"
Content-Disposition: inline
In-Reply-To: <20221002122859.75525-5-matti.lehtimaki@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q1IH0lgTUIi7laTL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 02, 2022 at 03:28:56PM +0300, Matti Lehtim=C3=A4ki wrote:
> From: Rayyan Ansari <rayyan@ansari.sh>
>=20
> Add a compatible for MSM8226's Camera Control Interface, which is
> similar to the one used on MSM8916.
>=20
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Applied to for-current, thanks!


--Q1IH0lgTUIi7laTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM90/IACgkQFA3kzBSg
KbYpRg/9FRx053pd4b8VtJn3spyzHu1e76JJAECwAZeJ3XgQSmsSY6XRL3scWjJe
qwioy1bGODQExTU7ac272yc5QplSnn87VkKu+w0DAJsQlg+61kqk7AXG63apiPDJ
alBjL4RonMasU4tdyh9D0yyIwpI9HE4a5IBczCkOwwYcs1LIEfI9VX1iWiRkfY7M
myKF35nXCHAB8KMkNr3BtFZZbkS5gb34Z+CMXF5uZrtSOR65Oijn9WYc/hSFU062
3R+S2CGkepbGekTbYYxKhsYj5XDLFvI1hw8ao6UpaPK5EklKNk/pzgE0lhlxXZmB
CTxPMYDdOJ273ZGOTYcpVwsx6Inwlbn0aJd7wCEt7stjykKKkuRqSHqswHBEm+4P
9v3h1FgAZ3QU4sX11tRa3IleYyJbRLXepsohkiNmw/WilgVeUwvM5pgQKZPH52cJ
4KPedd8FIXtr8dU+GQ8YS2I4AQfsweyzpc+EGWVMpKKKdVMCC4CILzupaf9LYlIo
mz7DFJqVWO7byHMqYpN8MAq9mHDRprKhLiYJkChtGUsg2A2OVbi08OcJGCx8SMV8
GV/qOPD6vxUUruko9J9MkSj0ztmPNM4NC5wJoXr+Juj4roUUaVQjrzWWjQlp1UIN
gYIw+QKzVBIWlnsvFAf2u4UIe13jNlNL8qji3lmlrLFV97bL2KM=
=0wmN
-----END PGP SIGNATURE-----

--Q1IH0lgTUIi7laTL--
