Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C383A83AAB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfHFUv0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:51:26 -0400
Received: from sauhun.de ([88.99.104.3]:36696 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfHFUv0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:51:26 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id BD04B2C290E;
        Tue,  6 Aug 2019 22:51:24 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:51:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] i2c-axxia: support slave mode
Message-ID: <20190806205124.GG911@ninjato>
References: <20190801132129.GA5550@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <20190801132129.GA5550@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> This device contains both master and slave controllers which can be
> enabled simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has separate control and status registers.
> Controllers also works in loopback mode - slave device can communicate
> with its own master controller internally. The controller can handle up

Cool, I never got this to work with my hardware. I always had to wire
two controllers together,

> to two addresses, both of which may be 10 bit. Most of the logic
> (sending (N)ACK, handling repeated start or switching between
> write/read) is handled automatically which makes working with this
> controller quite easy.

Yes, looks pretty straightforward. Nice!

> For simplicity, this patch adds basic support, limiting to only one
> slave address. Support for the 2nd device may be added in the future.

Fine with me. Incremental additions are easier to review.

> Note that checkpatch shows warnings about "line over 80 characters" for
> some of those register definitions added but I personally think
> splitting those comments would decrease readability, not increase it. I
> can do that, however, if you think otherwise.

I am fine with that, too.

> +	if (fifo_status & SLV_FIFO_DV1) {
> +		if (fifo_status & SLV_FIFO_STRC) {
> +			dev_dbg(dev, "First data byte sent\n");

I think, however, these debug messages could go. They were surely
helpful during development but assuming things work now, they will not
help backend authors. Can you agree?

Rest looks good from what I can tell without knowing the hardware.

Thanks,

   Wolfram


--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J6EsACgkQFA3kzBSg
Kbbq6xAAsL/J4J/S0eXzPMPhBJn0Zf2YEbLiMzoa3ilDx2SKjfhO3UVe7TRCGmDg
Y4o4iTzOLYbp10m2xTbPizw0X78JxMyJVTFpMrIAlPaGQzbXE9ab3JWrPZI6AKgg
PgZ9pof38vktr3mb9YxnPMwbyaTzq8B0QhVJdUVwuhuaeQta186HePaIYeEzUUgM
V6P06fNoKdJKu012HeMDfvvYxlXDPEOAnyqcxHlcMkxgg0LMlhXK72JlCkH+lNTe
gipWPRG1Ym9m3kw6oIB3udjRccmU7EE321ywMhIy5f2R5b54ScINpAuqe35UisGg
ZDhzVh6tkjrGq/LYzkwNtqqef2UTBmUi/88GsufcbBVBv2T2M7bJu41yvLL4c6HS
NXohdnl3uexH0DUnc9XpjOoFkBH4MB9hIS/YN4gvqs+bxDvw5c7E4ZwFK/TDjUeC
kQKv5FvyhDuFKOFHiRqEcjTrx8+P/7UVZjs4jrraI8lkW1cerQrEPNqZsSeWUDln
J0M+3eWrgmsiCK3ezEzF8wVa8Y5Zak5V9Vq9z2SuJNAKj53zlOZ3ff2u9gtIsdmr
u8xsgFCu15jL7/JLSmNrv6Tw2JQjvWsf2HfqIKBaRuf3U9n4b8TB7M22itmADhjy
4FZDl0bc7n/udQgDLKJ6DckyeopfnMmgRAloBT6PMuTiqelaHmQ=
=CcfW
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
