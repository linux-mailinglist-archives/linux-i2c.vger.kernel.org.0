Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155D424D459
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Aug 2020 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgHULpE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Aug 2020 07:45:04 -0400
Received: from www.zeus03.de ([194.117.254.33]:42282 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgHULoC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Aug 2020 07:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YtcCCrjutEn/fojfaD2DDf8l3Ezf
        v6ANNQPCcLUJZv0=; b=XNOghQuVguxNvxcleajQiwkCcHIZLlx3ZL4F9zOEHRvL
        KnGVZbiB7W2V6bP9wlNL169qwh91gsokcIOZFVCPuPU2C57SCVaimt2HLS2NhgGK
        76Cd851vTJ8shizvwjWfRW+K9/8gqY4VClb9pFUUGBr6oQ756ktsPNllRMbL6tk=
Received: (qmail 880608 invoked from network); 21 Aug 2020 13:43:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Aug 2020 13:43:58 +0200
X-UD-Smtp-Session: l3s3148p1@J5uewGGt8q0gAwDPXweWAG48P/WlTOIM
Date:   Fri, 21 Aug 2020 13:43:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] i2c: add binding to mark a bus as SMBus
Message-ID: <20200821114357.GA29628@ninjato>
References: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
 <20200715203843.GA776042@bogus>
 <20200724193635.GC1227@ninjato>
 <20200725120700.GA1734@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20200725120700.GA1734@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2020 at 02:07:00PM +0200, Wolfram Sang wrote:
> On Fri, Jul 24, 2020 at 09:36:35PM +0200, Wolfram Sang wrote:
> > Hi Rob,
> >=20
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

Rob, if you have some time, I'd really appreciate an ack here. I think
it is a proper binding but I'd like to have it stress-tested with your
experience :)

>=20
> >=20
> > >=20
> > > > +	restrictions are more reserved addresses and timeout definitions.
> > > > +
> >=20
> > All the best,
> >=20
> >    Wolfram
> >=20
>=20
>=20



--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8/s3oACgkQFA3kzBSg
Kba9vhAAiwO/kHpYgRW5zz/G6w85eq1WPezyG1bTYXgMPTOUbfvOp21cF02ZKIs9
DbcYX/J2wVMwb23Qy5bpQhUzER9qeT/L9fJDySvbblQdp+Rf0ffCaYS4CaIifAbN
sfp9LimlM7osvktvehOhjvNhwVTyBJbcBWOZztQPDa//ukMz6kJHflvOeuQS+J8m
6j1jM06El7wpQF8aMavViWh0BcPhlPhrzXFKn/9K9cfFdVVYfLfGN0YBRsoDZfkf
etxyAHir/twItbPf0R8WFRvZmgpDuuaJ8UtaokkUXgi1ixJRbjvKc4mnxWmfexIZ
a5sCbB7aA62kGr2OqxizrEOOUJ7hiEcaIcxkLBJYJxAnNgGM0ZJRTVDWq0NLKAuz
cpfWSXnqUz7gn9wjiesC/K3uDaRp1osJf0t99tnxEllKcKJYaktlolmHnAJFH9e4
JIwqfnCdNH2zFYsZyJ1dAtDvB4xv7Q3bBprIHV/eWX1naMertqEIXIJZm+hDnBuP
337IwnUAV5WfZNBm/zs4hWxupq2VlISw+4+t7lilFdyCJGh5UG9EEgKZAxGv+69g
dir4VfEei9Te3CtI3srfg8qMhTlTPNrrzP9u5If+XmvxuqgqlEWYtNo5iX+41HcH
/ZP0zZUMXcUqzBMvqbOC2ZY1bSleTOO5dQVf3w2TcUVD49On/xI=
=FS44
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
