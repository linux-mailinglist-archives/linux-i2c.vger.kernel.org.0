Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF5D1C5852
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgEEONU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 10:13:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:33604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729292AbgEEONU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 10:13:20 -0400
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D8D420735;
        Tue,  5 May 2020 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588688000;
        bh=R+70PJ9vucGn241Y2Cqa7rgwicdjK9Vs/+6SMmkQ9rA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLcOyPVXax4walL2ONgDDGm3H9TAh64RPOsmQNypepd9HqsoSBONz+ZzlsIDQ5vD5
         YHgBECF+mKdfrretnacbW9YNrIHo84HsBZXGZITataDIOYcqrhrgueLdEdcIRKvjT6
         Bgo9XVwRjgwp7Tv78kNCktWKQfVJYUTzZCZbKjmw=
Date:   Tue, 5 May 2020 16:13:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: drivers: Remove superfluous error message
Message-ID: <20200505141316.GB2468@ninjato>
References: <20200503120847.13528-1-aishwaryarj100@gmail.com>
 <20200504114408.9128-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <20200504114408.9128-1-aishwaryarj100@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2020 at 05:14:06PM +0530, Aishwarya Ramakrishnan wrote:
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.
>=20
> Suggested by Coccinelle.
>=20
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>

Sorry, I forgot that these are already fixed with
e42688ed5cf5936fb55c78cc365dbe0944af7c63 in i2c/for-next.


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xdHgACgkQFA3kzBSg
KbbwRA/+LGyt1I9I1ywJp0ulKpglf4waJU/2Fay5kC0dKFkixtjarMsChvsIcpJJ
eJlTxUY6krLo7eUh223GmX5Y313bXl5uFIvEC4HCEbcxSVLOL81jvdVkDZcVG9u3
CMBCXMCchPdGZnbPL7Yzvpshuj87+UtHNnS/a293LwO3exDR5eVZEGi/aICrRum/
uf273Fx8g0pzh5h7J5erA4dgbrxP20PNt4BYUlfe9sdWft7yW1OS/kd3gaGxBnQp
LCTk0q9f85vYTzrUX1bk2jvpls0n1kAnD5F1+73kvFq+DsnZD0t1C3FDv/GpRcc3
TuC+rl4mcAVIoOtErmfT38xRW4PIAu0qzWJDNbnZrd12fZKH/kw20L7Yq5nmIjvi
mXSpg+JKua+e69VuEsxSTuoDxxEVyWTo/yKc1rbDJNWKwngiR8bldUZDQDtOoSqA
aWskPYf2kqarsWXYGeaXB8n4CXjD6fyufGjr+SsOD7tcd9ULOOzhfN6GUENw1t9L
tI03I7owU1+hShjx/pBDpFlqzJQExHLFjMgoMD9aB5XxA7nY82ny4bcpjdy34qqW
GF88XiojrHftpqtvEfq/qc22l89lvm9Yts8sNg0Axc+jp2/jiKLgY2rgfnZJ+e0r
MdN0pEl1GRcD3e4WK+16qHy0BViPHmBqCreipeNddURCEXYezmo=
=Q1Hw
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
