Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E411B16D8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 22:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgDTUYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 16:24:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44085 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgDTUYC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 16:24:02 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 4E3BE5C0183;
        Mon, 20 Apr 2020 16:24:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 20 Apr 2020 16:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=q5Eo8wlEaimHxQiBLieNf+d4Xet
        oPY+IBXSA3sy6gmg=; b=TzjElGG3ajkbnkn5XWss52v6//CrJH9X0Xs8/qQsfDQ
        Et+C0Jd47RJ4DDo0Pmkk/PJ/dJPRrlhYc2shjZS6mWTjx2AQpxYyzFQlqCAatLaO
        KJHuuLXnriPOcn1rnZf78dJwHsEZPZnhms0s9PENJysO58vHL7W7PT+qCt7Swi7n
        ZQwjZoHyldN6vznEi9S7vHGv6J0Wl6U+EvubmXC+yh8akDwfVr4zbZTYyockKVLx
        QSO6qVbSREqv4VkgQFOi3l0GiTcSTwgfJGPbKIp0ES2jXVoDDmcDy5seK43kRfq5
        jnizsg87H1QdLqd+qcmBBeMSUEb1NqaYn0ksoJvBb/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q5Eo8w
        lEaimHxQiBLieNf+d4XetoPY+IBXSA3sy6gmg=; b=dr52y4FfVHSCnHfCNkQhUK
        gIVityk5JuuAsG/z4RvsXoEu3BQCJZcl91z8Rsc4UOSi0KzRmZJmO7Is/dqq4snn
        D9mbWIiE+IDHj4PYzLtRcUDFik5cn8hwjkHyUjOQzh2rG4HIofTqLuqIznHE7eTA
        PtLEEmAIPnt+7bQaQBvIeGUoN4e9IAyCfVjvvlJ0lXjLOsHIaU9NhNniVW5Y7Wok
        o4bZxT/MjDHfbRXIT6fSU6+IJX0wj7Oi11xlYzGYxigtuTdfVcHzehQlS85fmt7z
        IzSQTLoR6pWkSHoibgIPydR0GucRguAYfgtQiTIfwsY3PCPb2XJryvOnrIFo95+w
        ==
X-ME-Sender: <xms:4QSeXsUA9dWknaxRYus0ugVuMs4mfN297Jm8VP8z5hE2G8uxP48h6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecukfhppedutdejrddutdejrddukeejrdduuddtnecuvehluhhs
    thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihii
X-ME-Proxy: <xmx:4QSeXsFYdhoOfqOJnHNkt_qphz3_YrvJjNPSh9gy9kGWHVDSN0LctA>
    <xmx:4QSeXmbnva9btIrtBLsbbkMEVKhmskyp0BjBVs4LYhMLaf7MrB_QFQ>
    <xmx:4QSeXpH_UG7fJ1v_6wqKiZTxBjxHFBLQ05QYJ9c-6bPDTuoaD5Mg7A>
    <xmx:4QSeXiIwdzOK6imJ_gh2AEWjocku91Tro2pX_m825JFpJPWMdSV2yA>
Received: from localhost (mobile-107-107-187-110.mycingular.net [107.107.187.110])
        by mail.messagingengine.com (Postfix) with ESMTPA id E38AA3280059;
        Mon, 20 Apr 2020 16:24:00 -0400 (EDT)
Date:   Mon, 20 Apr 2020 15:24:00 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bjorn Ardo <bjorn.ardo@axis.com>,
        Patrick Williams <alpawi@amazon.com>,
        =?iso-8859-1?Q?Bj=F6rn_Ard=F6?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200420202400.GB95151@heinlein.lan.stwcx.xyz>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <20200420164349.GD3721@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 06:43:49PM +0200, Wolfram Sang wrote:
> On Wed, Oct 02, 2019 at 08:20:53AM +0200, Bjorn Ardo wrote:
> > Hi,
> >=20
> >=20
> > I sent in another patch earlier that added support for specifying a fil=
e in
> > devicetree to initilize the eeprom from, corresponding to the case of
> > pre-flashed eeprom. Maybe these two patches should be merged so this
> > initialization is only done if no file is specified?
>=20
> Yes, I agree.
>=20

I've been meaning to get back to this...  I'll rebase the
commit on the latest tree.

--=20
Patrick Williams

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6eBN8ACgkQqwNHzC0A
wRnprhAAlpCNaK/xA84QR8ov/NEGutk8t0EGpqE9vhkr8gSFeQ217w5ThV/o6wzM
EOF1LjY/K1bUTlgnF9a9pAB9vIAVY5L26LD6p1wEV6ySLWoJwRb3JwESAgsYVSeq
q5PYqJ+ok/ARwMRXumP4sPjX1JpLdf6bk+IOOn2W+23y8r8JIVWIPO+taf/reWIp
R+xV4k4jJLjfQoLdL9xMv067sE7/hKLqmaFuAjLueh2mvuBZwyxfKLUFH4Q+xtXp
9bgIy2gkP8n6uQHS/uTvnNklxdTNvbpAOKCCD9daJpct5QjGFr9zdS9bxfrvEWQy
8JD5vjcFBmxEFW3+Kw/HC0pA6YTdN0PS7cKnKdEc+OCxOFEthG1YtqDTa86baARS
t1k5cX+rYPrzBXTQyNaJJylYN+EDRmm6yqbvoca+76q48wU3pL7Du8hFZRxbAXTg
45xu34p1W5RnJ8aYdWqEFrQy1YWeqHr20MNmSnr78WjdIgIgFjmndc9v1Z63TaZR
41LrsHpY0eGqMCh5ZMUQzQE8OcPZw5yMDTaG5BBqhOA7+iOkRYgTXf1cXT8C1ID8
o93PFsSlxJFMM3NkcdAV+75t6Hlj3uVbzXrWgTrtDL48Dr7G/try6TzUIzn5I/Ko
V11NXoo3lKKmtxr/xKtld+92SxSqqnQnXrNpSe8jSFmcPrnI12g=
=06zP
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
