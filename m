Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72E1B16D1
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 22:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgDTUXQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 16:23:16 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45275 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgDTUXO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 16:23:14 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 3E4D45C00A5;
        Mon, 20 Apr 2020 16:23:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 20 Apr 2020 16:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=j+rtBs4i+LTG85XDMivqbYA15v9
        KeFIawbkmfnjtAW0=; b=lQv7Xo3FCSWwpKQtFtW/07XH376+sJrM1WB5Vgoq13t
        rRW/yCevF+1Zuuvw9RRDm1iRGAC3Qy4oSd8oKI66+5uQC1Mxa7R9rQeVlFKoKUIB
        +FrLzTUdjv+MdNfJ6RcbFdyZIx8UFaRIBtK4k8pDgUt13ocMB0jiQ5+kaQllJ1tT
        bYEYXpO6+1IjYV+DJSIz4sBGpcOlxg+vuosNUyw/PmK1Utv7MaSNv/Dymv+R5UU7
        oomw7BO89pCPg33s2r++0rsGnrezOnMViVsoGh/zouSjM3wN9i43N2i75hNArewv
        PO86lMXoIm6gd5ViYaiP8ZfcmRQFqcYopNddIkV1D6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=j+rtBs
        4i+LTG85XDMivqbYA15v9KeFIawbkmfnjtAW0=; b=Hf3f9tYbUGtFb3r2BtNy/Q
        lSzNPUf4XcRFeGfsMJND+HzETGV+Jdzoko52w07d0nhO4Gt5Xfqiqw7eGi9Io1zY
        R6wWH8NGw6Sw4Kr5arjjzcUMMke262OfwB86KOvGZdoKfjoSnqO7p/iMdVRwpMHn
        qDvkrGQHOOxPSS4VtduzDS5pUJAA65dvqvkVc6LqRPbSZqHmY8WWfpRqBP1nBL8j
        Mrq1FsJIy1tsj8PBnoNOlEaCbF5PXRO8EFVyXhzbJvAPzWaP00XlalzHm/pgqsdk
        7zh6LGfZ2TIQCgnzW4Bpcyhq3v99dgycIntr9WIi2BLZs47nVjsW9LbRCQ+m6bTg
        ==
X-ME-Sender: <xms:sASeXlRwLyiPGlyFfP_6Nd1II9Uq4Izyi55V8eB0t3o4PojH4Jrzog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecukfhppedutdejrddutdejrddukeejrdduuddtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihii
X-ME-Proxy: <xmx:sASeXslZrvlhfwekb1JCjs2zhYROfTKePadJWyyVG1khsPFdeX_CGA>
    <xmx:sASeXlQGdLTwj57G2fP5rfvq3VxP0wpFHM8e3XtMArUJUdPwgglIFA>
    <xmx:sASeXqN3HA9-Y8exD5U7MfkbXs6ypu0JZVZSgbrbx2Dk6Fl9fyvzFw>
    <xmx:sQSeXi7xIRZNJoJVxNJ0M7VPbtXyZbxobguIKPTpcVRN0bmxTFsZdw>
Received: from localhost (mobile-107-107-187-110.mycingular.net [107.107.187.110])
        by mail.messagingengine.com (Postfix) with ESMTPA id BBD7B328005D;
        Mon, 20 Apr 2020 16:23:11 -0400 (EDT)
Date:   Mon, 20 Apr 2020 15:23:10 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Patrick Williams <alpawi@amazon.com>,
        =?iso-8859-1?Q?Bj=F6rn_Ard=F6?= <bjorn.ardo@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: slave-eeprom: support additional models
Message-ID: <20200420202310.GA95151@heinlein.lan.stwcx.xyz>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <20191001164009.21610-2-alpawi@amazon.com>
 <20200420164619.GE3721@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20200420164619.GE3721@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 06:46:19PM +0200, Wolfram Sang wrote:
> On Tue, Oct 01, 2019 at 11:40:06AM -0500, Patrick Williams wrote:
> > Add support for emulating the following EEPROMs:
> >     * 24c01  - 1024 bit
> >     * 24c128 - 128k bit
> >     * 24c256 - 256k bit
> >     * 24c512 - 512k bit
> >=20
> > The flag bits in the device id were shifted up 1 bit to make
> > room for saving the 24c512's size.  24c512 uses the full 16-bit
> > address space of a 2-byte addressable EEPROM.
> >=20
> > Signed-off-by: Patrick Williams <alpawi@amazon.com>
>=20
> Do you really need them or is it just nice to have?
>=20
> I am undecided. I definately don't want all the EEPROM types which
> exist, but the full 16 bit address range makes sense...
>=20
> More opinions welcome.
>=20

I don't remember exactly which ones we needed (and I am no longer at
Amazon), but it was pretty trivial to add them all to the table so I
went ahead and did it.  As long as we had one of the 2-byte addressable
EEPROMs, anything else necessary could be handleded as a small
out-of-tree patch.

--=20
Patrick Williams

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6eBKwACgkQqwNHzC0A
wRm+3w/+LxsR2vMn880CT3tcUun6w0nwd9uLyu8glBEEBgpOOLFe8X89BXGNPeJP
Kll58XbbYuOVxLG2jJwrz7K5KRW2tU+7R/hYtOV31jXDldxmEF23IbyJewxghmri
YF4HB33xVDW2Jp9DWzwbgOjOgny6fJwUZ4Fi1OJ+xYNBIi1BRoG1url8qyVugka8
zKumoV2Cn28E/XnSl2w/qMFSA7mqfYZlzo5ChXZMuuNDx9CiZaBmDDv3ymegmD7r
2zvZRIweqex1xsVFWO7HJ0dAryQAez+giAkGS0b8u1pfa1m1ysNyspamJ6+ZRFtL
Xyw2JxlEbdEHSZ+hiinUidOwv52TP8C5Zk8yirzDsVFM+ODCB8Noj3omFoFAgdLS
sRvmzjYCZr31BlznVnF65L6e4O9+kVSU57Olu5FYZb5Wb6cEoJF+NhMxWizT6s5D
Qym/vqSGtcU2jSzHBCTL9qkp6fZuqxdgmZ2TPMOhlgVibhnx6k1hnlnIVbbYuRUl
EsuiTj9GQ9pGRfkpttrUuZd74mHrw8le63LOmmNJvRsEipReH0rcwqMCdQP0vy58
/BnTDpaONj90J2IWtwLwoO1LvGUugTkx4/HiZmHfPFnih+dLjsOVAAunraDd+f8g
0Hdjzg1CilbUJ5hECb4L+IO07K0hc+mBqpAhDUcQMDahdKOJo84=
=6TW6
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
