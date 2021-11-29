Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C967B46109E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244421AbhK2I6o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241213AbhK2I4n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:56:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02083C06179E;
        Mon, 29 Nov 2021 00:41:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6F27B80933;
        Mon, 29 Nov 2021 08:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88EFC004E1;
        Mon, 29 Nov 2021 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638175315;
        bh=Mj7X1l1gdYa1BrDv7xW5CTAYeo/8ZoHro5zWrCtQfS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bWPFZ95lyp63A1gGOC+Esl2VtWEQ+pmcM1sHVtoMW7W9OEmKrRd2w1pmjXIW4woJw
         gfVqQKgSIEFKBG+mNjX+pYdi2EtBXWwA3zSsu4PpZRdCA0451kDdslP+IwqpObKQ3z
         PG9w8lhi71WWpP0X36nTMlqA0Czqq1orJXyPlHdRuIhbFC3eMIsC2LTFPa9Dqh5Hud
         I6uez9ZrrUPRWYmaNWdQtUCR8FOVbk+mwlm4cJDzxHWbLE3/JKQ03XS9j0fE3/rYrx
         LcurGcStuFLkw0rx2j36f4dodIhoBzK0gfkGt5AmV2nEJX+QjEpjv7xhB/5QC9mjDw
         Zyy+4DI4HXqiw==
Date:   Mon, 29 Nov 2021 09:41:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 11/12] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL
 compatible match
Message-ID: <YaSSUHH2e9mHxhtx@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-12-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DOW3NFxjw4Y5rvlF"
Content-Disposition: inline
In-Reply-To: <1636566415-22750-12-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DOW3NFxjw4Y5rvlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 07:46:54PM +0200, Abel Vesa wrote:
> Add i.MX8DXL lpi2c compatible to the bindings documentation.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Applied to for-next, thanks!


--DOW3NFxjw4Y5rvlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkklAACgkQFA3kzBSg
KbafeA/8CuvjQGEPMI9aeqCJabLH5w3PdiM3Jxbt5FxwFcHpcPZEqbOPxQWWjCQ2
gKwxwCmf0ZrZx3+AxMYkNx3B5iL4E0E3ArecwVJavz/SG+kq0NoIhX6YvVGYJV8r
j8qKyP934FsPOsJlwuULcjmwT4eZQPTjc++oCslYvYMY6Z1DJEPL3BGILab38kQy
S30YPaxpTsJEWfqGhUixUjCh5LhglzXoe4sHKKfhViPeeHzMFX78gZwwIwr7UyDc
cvGHFsbF5f0kItFkcchyQRuSEkok5pXzzyzq8fYjAKTdaPMzhGVtsOLj6f3sUl7q
KtZnUI3PvLryFP/IjuHhbs23dEjfU9EH8xuYVxfBYriBHQPct6GmogEaSkw0WqVs
UqmR/olx/CPTYBhw+XkiDb+lgglb21yIHeaQ3LHO4+gBGTcWPY5ieiqt3xZXKKdl
C5KoE3gB2NoaX1gYBObJb+txyXpMYJJynmzzruQKA7hwK3wwsEMaZqffBzfwwk8p
7xUQ/qPoa+/+hB0xb1lvcv9W0lujSe+z5QbFMQ8rkvKZqtst0hQelmO1PCVbcfG+
xFkAz6afeMaUAW8M28hBuFbQlAvHqNqT+tQn0BCEhgZBVe5L+YOxSJ7PuJMCLBPB
eFolg3Anrbfp2UMonwjNlFKvxx/9XpkXy0I2HO7Swb2DZ7s6dt0=
=tzkd
-----END PGP SIGNATURE-----

--DOW3NFxjw4Y5rvlF--
