Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C972231CFB
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jul 2020 12:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgG2Kxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 06:53:47 -0400
Received: from www.zeus03.de ([194.117.254.33]:35812 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgG2Kxq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jul 2020 06:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2x2QfEfBC4l443FmjTL98MfufmM7
        oJEQtQHZVT5tIeU=; b=clzv82HV9z8lTH9DetDYed3c/nycp3qCd4Wa2ZuySQgU
        9dpO4ubWCo0meb3GzxE+DiBzWOLkUPWJl/OclXeVzKAmxKGM5fXRzW3HUZ0DUoIH
        JCJP2+g1mej07kRe1ATqWRvpUEbZnl06XS0fhDU9wJV2hI7RQPIcO5xgRxkq/4c=
Received: (qmail 944506 invoked from network); 29 Jul 2020 12:53:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2020 12:53:44 +0200
X-UD-Smtp-Session: l3s3148p1@ovGjXpKr9qogAwDPXwaWALqNWIsV+hH3
Date:   Wed, 29 Jul 2020 12:53:44 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200729105344.GB1015@ninjato>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
 <20200715203843.GA776042@bogus>
 <20200724193635.GC1227@ninjato>
 <20200725120700.GA1734@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20200725120700.GA1734@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > SMBus is largely compatible with I2C but there are some specifics. =
In
> > > > case we need them on a bus, we can now use this new binding.
> > > >=20
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c.txt
> > > > index 438ae123107e..d1f8cf3bd236 100644
> > > > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > > > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > > > @@ -77,6 +77,11 @@ wants to support one of the below features, it s=
hould adapt these bindings.
> > > >  	this information to detect a stalled bus more reliably, for examp=
le.
> > > >  	Can not be combined with 'multi-master'.
> > > > =20
> > > > +- smbus
> > >=20
> > > This is a boolean?
> >=20
> > Yes.
> >=20
> > >=20
> > > > +	states that additional SMBus restrictions and features apply to t=
his bus.
> > > > +	Examples of features are SMBusHostNotify and SMBusAlert. Examples=
 of
> > >=20
> > > Do features need to be enumerated separately?
> >=20
> > They could be, do you think this is of advantage? For now, we would then
> > need "host-notify" and "smbus-alert". Maybe later things like "timeout"
> > could show up.
>=20
> I also recall now that I thought that "smbus" fits better the
> "describing hardware" aspect, i.e. "this bus is an SMBus and not I2C".
> Enumerating features felt more like configuration to me.

Rob, if you have a minute to comment on it, I would much appreciate it.
I'd love to get this into 5.9.

Thanks and all the best!


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8hVTgACgkQFA3kzBSg
KbZf4Q//YpI7C6M7BhCIOjq6cUGrnn3TfAConMoT/bZKmdiMa6fCVirZuym4fFJy
j37oeQkypBDQDdH/UMthLeaNRS2nkP9znzFxDWJqxvESdbsZpzgt21RzkFGvd5yK
+LXpLhn3e3XjgEwj+LnYF31Oetq7MkSfQCViR9KpNBMOvT7NgnSxvWf5DaEQpLRc
S+WlLxBRKuT7Ws0Eyp4a9LxQ6ov6eEW3XGzgwVhNam55yf0gbJrY52PO20Jztymj
4qhNNMuxF1wbThx42FqpNRnahxtWwVTOV51nQANX2DAxrMFWTVKNf4T6wvTcX9Ua
B4y7bg32ySq9aYfNPIKrIXkZqLPhQ/JIGvhCxs18F1AzlvJakVsJ3jOCL2sTLMLZ
IoH7QK07YqaAGd0LjhTgzuvUuF3VRtsLEGXha07Esu7nhAQEj1tmmlTSG5m5Mcd1
oZzIJk3QOD+ttdhfk9vjXREMwLYtDTsD9IgsXQ07NQkdRbbk01A5exjOry96Mr3K
D0cZnWovP5i+HskesH3XXxfH84wtNs0nbVXdzX/onoldk34fZR5fzcO4hjGN8pwq
RLK0/ZWLPgHsgR9o+L/WiFGNDzjtIfXYi+Ux1sRvUStCTRF/1obqI2CRJTP5C/6B
CYzIo6ukuTS6czZmppiLhiStExX2ahWcubADVB2QfbiNXF12fWE=
=d8/d
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
