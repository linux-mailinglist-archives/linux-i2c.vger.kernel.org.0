Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E7223E32F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 22:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgHFUa3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 16:30:29 -0400
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:54377 "EHLO
        2.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgHFUa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 16:30:29 -0400
X-Greylist: delayed 8267 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 16:30:28 EDT
Received: from player695.ha.ovh.net (unknown [10.108.42.170])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 943511E3AD3
        for <linux-i2c@vger.kernel.org>; Thu,  6 Aug 2020 18:13:22 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player695.ha.ovh.net (Postfix) with ESMTPSA id 41BAC14F12692;
        Thu,  6 Aug 2020 16:13:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-96R0017a5c1c93-e9a5-4fdb-9f0b-f187a326bc09,
                    9D5F4B8471F7AF6BEF45141B8B52B4DEEC6DEFE4) smtp.auth=steve@sk2.org
Date:   Thu, 6 Aug 2020 18:13:05 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200806181305.26777f7c@heffalump.sk2.org>
In-Reply-To: <20200806083339.GA1549@kunai>
References: <20200805183149.21647-1-steve@sk2.org>
        <20200805215351.GB2182@kunai>
        <20200806090800.08b77d4a@heffalump.sk2.org>
        <20200806083339.GA1549@kunai>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/GpoHHLK2k0P4x+Ck5RFNKd7"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 3179822812265467244
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevledvueefvdeivefftdeugeekveethefftdffteelheejkeejjeduffeiudetkeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/GpoHHLK2k0P4x+Ck5RFNKd7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jon,

You=E2=80=99ll see v2 of this patch show up soon, see the context below =E2=
=80=94 this is a
patch on top of Mauro=E2=80=99s conversion of the i2c docs to .rst.

Regards,

Stephen


On Thu, 6 Aug 2020 10:33:56 +0200, Wolfram Sang <wsa@the-dreams.de> wrote:

> > > Maybe because I don't have the commit in my tree? Can you rebase on t=
op
> > > of 5.8? =20
> >=20
> > Ah, yes, the commit is on top of Linus=E2=80=99 current master, followi=
ng the
> > merge of docs-5.9 from Jon=E2=80=99s tree. In 5.8 the file is a .txt fi=
le, but
> > Mauro converted it to .rst for 5.9, and this patch removes the latter
> > file (to avoid a merge conflict later on...). If you prefer, I can subm=
it
> > it to the docs tree instead! =20
>=20
> I see. Thanks for the heads up!
>=20
> > > And please also remove the reference in Documentation/i2c/index.rst =
=20
> >=20
> > Oops, yes, I=E2=80=99ll do that in v2 once we decide where it should go=
. =20
>=20
> I am fine with either it going via the doc-tree or you sending me v2
> again after 5.9-rc1. For the first case:
>=20
> Acked-by: Wolfram Sang <wsa@kernel.org>
>=20

--Sig_/GpoHHLK2k0P4x+Ck5RFNKd7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8sLBEACgkQgNMC9Yht
g5yRgg/9Epmyf8KbpXV7TBXzcezJGcky3j9GSC4cj7bQQxeV5Nlf8K0lvLQbSv7A
tU5Ry0vhSJih1GbWvh9eL+UXmW8Lg/wKzl8mKP7Ni08MzUxsE77TD577zClaxk8R
4bsWosh/J2gm0xiM7GobnDfiWaM0OwECb7i69x5Yg9NVJ6HVz+jvAlURCp1YzASP
knLFewEVpVbbEEx0a8KewRMIXf1XzKT7DIOCb22zaEPlXKdgBjjfKfHpLmc0Mmoo
sL95ukBOURiO7fePThg6OpxgkfE9rPyQy0kKmLhIkAbNXZeN/DLgfiFfm/S6ZLJA
iwqbZPh6M8fP1ulJfPLUX+xY66YAILH3lA9ets8pISmExp08UFX8P3ngGDNClmgv
p2l1u7VMH8X9zbIV5Q4y50r86/OJnBjAzBoIycuxsuIT78qCZ1pq0dD3lK09PrnG
hQ9HRe6t0HB1hDGNlkGwv3ej1AcpzNkox8meqT49FWBSfDa2lobr8kbLgACyjFoa
uhKJGjVb93d3E4PRZPFHxWiwhdf5X8mt4+MQ3mbJA/GRAZ+X74ZGeVbyIkHj4bx8
HCLdoi8MuJBxhyH5/o2FSUVxkx9EmALhwS+oUOcT72owAG4+qIBtoQ3cySIA6LCw
C5ZCU7mKw/9oMTkPR5VuPnLCQMcSeIyMYjdXsHcR8cxgvAsUvlw=
=S2+b
-----END PGP SIGNATURE-----

--Sig_/GpoHHLK2k0P4x+Ck5RFNKd7--
