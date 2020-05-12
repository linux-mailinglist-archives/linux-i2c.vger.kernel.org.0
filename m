Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501AB1CF299
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 12:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgELKfM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 06:35:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729416AbgELKfL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 06:35:11 -0400
Received: from localhost (p54B332DE.dip0.t-ipconnect.de [84.179.50.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D796A20722;
        Tue, 12 May 2020 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589279711;
        bh=FdH1+LBHIPgrxtx0eK/CIUngbfDoPHGxaAbF7tZQQRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kix6jyq8/aWERPkjOLwc9SEckJfASZPBQS93QzlfcAONGB7cpNu+ywq+SDK/ppfKG
         LkaNjHESlGvfHzwb2u0IwLmWVzNZJwirQndEHWTdpCYeYKvdmTRRQ488CTEM/cW0NI
         3MuvjZLSEqSPJN0QVPdmMA4y3BOUUiMqPcLe9ehM=
Date:   Tue, 12 May 2020 12:35:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i2c: pxa: consolidate i2c_pxa_*xfer()
 implementations
Message-ID: <20200512103507.GB1393@ninjato>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
 <E1jYFgx-0007Jy-9p@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <E1jYFgx-0007Jy-9p@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 10:10:27PM +0100, Russell King wrote:
> Most of i2c_pxa_pio_xfer() and i2c_pxa_xfer() are identical; the only
> differences are that i2c_pxa_pio_xfer() may reset the bus, and they
> use different underlying transfer functions. The retry loop is the
> same. Consolidate these two functions.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-next, thanks!


--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66e9sACgkQFA3kzBSg
KbblIxAAmmtEclzcO8PbtwbWGW7luB0euVjgMQ6FXtYTrhia5bHt5MCjsEvNLafp
SqfLMbSeuoqqKRh9hblUpcEvk/t+67jVXaVaUbnVoOdoXctZ3B3sx4btMiA5d6ry
JGB/ffrqmZXSAdJpiyHuPpQuHdzFuQRo1EvEihdPTXkb1YxRCwWer9OAuQFQyxO5
5TrpWjFXQpylhwBjoGklNwzLl4g42eCYoX0k5LSAT5/azL1T8hZhRKoLYQnV4fwg
40olIF8TqaLBj8gBmz1684zaLKBOCAeCREovthHiPwc0R+L7NOVSgYavWkdKWz39
esOPx5C2uZBOGY70JQ7busR5XxaM3uSM1h+7FZxDkySCqWUNKs1eSYbonZ8DU+1G
OsV3UryZyC+WLJFgldmfq+6kkbl+ZQ0fkx9DfDic3pZSH0Y/j7hgV5jcSKpx8qwT
jQDCcxl5Gx8WElVgvW38tx8EFulpTKQroh/cGk/rWzEnD7v5nocAILpVgJUaKfUO
CfYNhmOdOTxWqlmoh4s9cM3JDLyzcdmvReXX2ZfZJHrp6kdyedOMOhCmSjkDkswV
x0MXmXjBtaPG/0GltHLCTsdHAZRaiGs/bZVS/6BxjgLCibt1mlfAcCBXJpVorjAx
TglxJD4Yh96QopiTuAHYbl6P/Z7PZlglBEJIX0No8I4UDL36FRc=
=11HL
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
