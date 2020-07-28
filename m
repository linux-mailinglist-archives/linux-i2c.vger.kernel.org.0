Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB0D230F70
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731538AbgG1QeB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:34:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731191AbgG1QeB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:34:01 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B62992074F;
        Tue, 28 Jul 2020 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954040;
        bh=+nEE1xIioQfCbgb0qMAtEDGKeaIXra2otKXz0yVDHIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U1PNn2IVQt4tVtpx7I6hZMvjSm6kC4EcJkW3CCwa1GFTLJ3gB8OcUzNu67TSBvorn
         gEqPigpCWw75+4tDzQtjMG7SnpXZugRLd5mLKTG4nIuNN+mFJKB1/MXQ2C3nGcMAB1
         GHMFSjyq56as16r5x2dX2Ur4Ol7KtiRWqPGmpiUM=
Date:   Tue, 28 Jul 2020 18:33:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v5 04/14] i2c: tegra: Fix runtime resume to re-init
 VI I2C
Message-ID: <20200728163357.GD3736@ninjato>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-5-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline
In-Reply-To: <1595883452-17343-5-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:57:22PM -0700, Sowjanya Komatineni wrote:
> VI I2C is on host1x bus and is part of VE power domain.
>=20
> During suspend/resume VE power domain goes through power off/on.
>=20
> So, controller reset followed by i2c re-initialization is required
> after the domain power up.
>=20
> This patch fixes it.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gU3UACgkQFA3kzBSg
KbYTJRAAhdQwnIp8gw7dd2pcCGwr7IXa9OWhMQZFscpJfVXzmtDIZWfhg7TymamC
VmmeBanrT/UWGVFHgO8nBO7AQVA3vIHxv+A9MqlaQXyuDhQ8s7TNkSWpiK4yI/l0
0fnwWYqRap1AdwUOQ5ivEk2aPnXk0PeLWDW0QCUmnANf1XEh+OWd9vk3qO73NFsB
xihqQUqJj/BOytr6Ua7zuvatx66m5S3Gmg+yf0ekiiUHPhGmH5dV9jSJGzkAXLdY
c2emPAg5TXGxF8m6YX8JEEd7OoWb3x3xjIHILk7v67a35YqDTcffVtvb35I7oii1
yYWK0F9qX6Z0l874RfGbZk5GSbLq4ucVlL9AqFnSBQ6XMrVea/SPW413HU5dq9QB
A1vZQENQTs6u2uRM1ZIyADyzB1LvOI5sT6S/yNXNDo4AS+PLZIYU+erF4QAyfpoM
gPVw2c9a/8N1AoUyJxv16MU3uEICSacwogrCegBhyK07nUUzoXqCVPbTBJmXukp+
boECXzuN3NF7H2JTfcMdGueax9nQo+Lq9pRmrKsBYs8eYxqLAjVBIzUpq0dsH1LU
1g4Yax9HRNxcHlEcr4eNMY7jAAEyTgY1/cboK5U3Z8BQkLgj/I5ju6ezTJ6yhvug
QCN4eLMCQ2daZw68IdFclND72LFKNmQOsczhkOxldzk0/OXW4is=
=aciO
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
