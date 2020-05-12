Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1C51CFFB3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 22:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELUpb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 16:45:31 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39301 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726324AbgELUpb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 16:45:31 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id D7753918;
        Tue, 12 May 2020 16:45:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 12 May 2020 16:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=rwySqcNWW214fMmD+gPzxtUUUzq
        ZWRFkdLuVb/x80ow=; b=u9NtAq6IcVdG1GhdUCPqYaHRhSKfclU6guc9iMo3Xig
        aQ0AoUXR8Ffc/HSjjFFda2RvO0B9axbyTBG9Y2mOFSCpwSWHyqIpcYDYHM/eFpL8
        wPgj7hBm4au7ekEWScafo8xQDaqIyTij6wV00nCV/lNrmRCXwjijuhMEkiSARbFa
        GCupP0y8igyYSUqgXAMrquU9EfgcFy4M6hxLj2fgf3eFBjGe6aqciRdx0TqfkJDY
        Gk6xBdAxjvOftuC5ORiZs5DWMVN/srWsb7ruoF65L4My/RGxX2nwHpIK1w1DTVEA
        aP6a65QvMe1Lb96kkagGupoUUeTHUJIdqrNEMTxZRCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rwySqc
        NWW214fMmD+gPzxtUUUzqZWRFkdLuVb/x80ow=; b=gDFQoTyzY9Udfvh1Bfv9lN
        QhRkd1VF3ezh8FDnLSp7ObJN3Ipee/N79HzU7Mlhdfkm8vbucm5ETZ+GtfeaYday
        4+QmQZrukYbPgawljgs+j9SogXyuIZ5RtbEuNh+ENmC19GdyRA2Z5w7VWt/cZ0hB
        mTxYndagf5vAoQfuOB8iEZNay8nJxSutcWrl39JTfbxKXN9N64yi0X/j8EzM8Fhv
        GGSMRuC84LJdVNuqXUkZFqNRJ7bg4TMVYJyAdo0lFRkAX9rsNVfAgcwdP+q14f7H
        OHyqyQRL8ZcsP39ClHCMxlfa5erpIUk8ah1d4xQSWGjH7PufhLS6/mv1p++7qfmA
        ==
X-ME-Sender: <xms:6Aq7XgKZb8S-rmaINdmMCVKUAx8_PZDAoMXtqFkl86gURjkjt1dt_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgddugeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
    kfhppeduieeirddujeeirdduvddtrddutdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:6Aq7XgIOyvha1yS8OmGL0X-W_zElq0EJQxmrx998kc2Y8KuGVmahgw>
    <xmx:6Aq7Xgsb1hMnvE3PL2As5yNfrw0cpkAHr3O3bLiHV7q19FUruAgqkQ>
    <xmx:6Aq7XtbRfIt8jVPhdesH4TDacSaWzW44SqP_9t2cKgev-7aPsp8fng>
    <xmx:6Qq7Xh0_zUR_T72_E_eT5QU4_MUM9Vx2loxXa_CeHlUDvQhdYg6vFA>
Received: from localhost (mobile-166-176-120-106.mycingular.net [166.176.120.106])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8961A30662A2;
        Tue, 12 May 2020 16:45:28 -0400 (EDT)
Date:   Tue, 12 May 2020 15:45:27 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: slave-eeprom: add support for 24c512 EEPROMs
Message-ID: <20200512204527.GH10214@heinlein>
References: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uJrvpPjGB3z5kYrA"
Content-Disposition: inline
In-Reply-To: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uJrvpPjGB3z5kYrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 04:20:46PM +0200, Wolfram Sang wrote:
> I don't plan to support every EEPROM type, but the 24c512 ones need a
> tiny code update, so let's have that upstream.
>=20
> Reported-by: Patrick Williams <patrick@stwcx.xyz>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Tested on a Renesas Lager board (R-Car H2).
>=20
>  drivers/i2c/i2c-slave-eeprom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--uJrvpPjGB3z5kYrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl67CuUACgkQqwNHzC0A
wRniOg//Zy8gjrBZLzidTDldIl8VJcWXd0+j2vTOzL3rn1oermQbnVK1J1HenKgy
ElR/I0wbMAEaTbBdhjeNkJoOr4w5WgtpC+oVf+YtDcfyBj7V+9pTDsLroeAlUVaG
ovqsE6k4HjozEPit2b1Nv/umcn+eW06yS3YUQBbrmXoNLPYmMvjPOb6IbC9W+5qO
MPAOwLLK4s8iVLcqTnX8l/vyk+MaJij3ydl1KRPepbU2LWdg7332SYPBCU0IF9GB
uIscrnG3AM9Gd445Kt2hCYyhegsWSE60BvGojrGX5OARupZK9CUXbtStWXL/uA4s
TnrrmdYMMMan0WNEpQx7FSJvnU+MW67U12bS0l+Ts/VfIJ/UgkfmmMmOK/IHBS87
ii++obnoT2sVzuR69//Q+pMyLyI/D3mrrMG9MrCapNnuOwlNYP+ykbhAyHIcsKG/
lSRabl7PZUap0rNYSeFfH2BQw8yiopDvuPt/4tr+5/U8Zwmzu4R0w8Nuo3ThtNhD
YY5rmjVi7fLiBppxirWdK25wGr/aNyHL2MpoFwUzxVOTBm43fZiiq/wh638F10Ci
6FVQpEWapDeRtUv63d29Dd5Ax3AgYxFL5P/t4bwcvNTCb3QVYdQT9lAQg+B3da1r
eVRFFKSJ5neRDzMHkY2J/SQw2fOFuWHc3K6y646PQCbYIWa1fBE=
=T4F3
-----END PGP SIGNATURE-----

--uJrvpPjGB3z5kYrA--
