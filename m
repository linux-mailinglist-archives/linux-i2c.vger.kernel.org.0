Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5339746E56B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 10:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhLIJZe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 04:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbhLIJZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 04:25:32 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F942C0617A2;
        Thu,  9 Dec 2021 01:21:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 429C0CE245E;
        Thu,  9 Dec 2021 09:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8726C004DD;
        Thu,  9 Dec 2021 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639041715;
        bh=TEW0W8Vu/yqwzKooRUV6+GpDbQd/xLe/GfTkTMDyE1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aw272oV2rTjAhb/s/AjSgGQvqT0bTivpqlMMijQlv9vBUEpgiZ3V4zSSaLSMBa7Kn
         MPDZ7aSoUqYwKhZCsjOQH1Yh4bg4HREFsWsBisfTwYGQK5OIfWY8loFIOl0Qlcv5N5
         GkdcfC/rs8xr3zpAQ2tYqV3853zV2hshEWoRmFLuDzxj5WhylaSN059EsCyPQj5mLP
         BlFGOcmeAazAP3xeb7fphsTMwy8CEccjAurtnnxIDIHJOFdH/AwynnicpaOz2SPJvL
         oK2S5l3wGt9ePT55/O2AtnnSP/MxcgXk+1jGkyF4zrl4s7OwNKryO6ESEhmk4Ka6tX
         EmLchwbYVv4Pw==
Date:   Thu, 9 Dec 2021 10:21:52 +0100
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "mbizon@freebox.fr" <mbizon@freebox.fr>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mpc: Use atomic read and fix break condition
Message-ID: <YbHKsI35uHz9PjwO@ninjato>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "mbizon@freebox.fr" <mbizon@freebox.fr>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
 <ea12555e66d4dc16c5b093ac528442ed6dddf644.camel@freebox.fr>
 <bce48dba-c163-4fe7-50c4-984de41488c2@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C9A6rRvoZs0n2wPQ"
Content-Disposition: inline
In-Reply-To: <bce48dba-c163-4fe7-50c4-984de41488c2@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C9A6rRvoZs0n2wPQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> we'd hit the 100us timeout in the poll). But I see no evidence of that=20
> actually happening (and no idea what arbitration lost means w.r.t i2c).

On a bus with multiple masters, it means the other master has won the
arbitration because the address it wants to talk to contains more 0 bits.

> I don't know that there is a maximum clock stretch time (we certainly=20
> know there are misbehaving devices that hold SCL low forever). The SMBUS=
=20
> protocol adds some timeouts but as far as I know i2c says nothing about=
=20
> how long a remote device can hold SCL.

The above is all correct.

Even with the unclear situation about the 100us, I think this should go
to for-current soon, right?



--C9A6rRvoZs0n2wPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxyrAACgkQFA3kzBSg
KbZrXBAAg4dz1LsvbcnmNyLdQ66iPTmRYU4o/47hytTcVFB9SVW+gPicn1qJEBrU
5uLvqoFE8qrpOVRgXkSr3cCu4XkgX+QXGbroAI9W44l8e8806N5N9/Xv8uOgtAcE
eTs5Zlzx8b8gpHTkd2WnrNe7/0A9udZ9lNBibD5/ChFDvCpEf1lmd5AIYRZDkLJl
AqChjdMYiNg/GJHV9cwa/tuw6dPjoh/QVax1elfpcTkH3YgRZrsxgZAEiDth9otS
XdyBUendnikHV/ItwPq8z+a/9+hHyeBCKoMBLdCXEya53l/OvnyvsMLO8jSYlDMK
6/8VzMTPkYAu70DZEV9pxAA+f0bi7mvUZ1goEUfCtvvDJHybdhRjh8Hzq5xf5KJV
u9b6ty+b4k6P/9+ewLmvs7pDIbopnviyL8gh97HJD2IhfAGRNXvQwPumLfE/oWWW
Z0eEzWFOM8gqm1PMaLTL+7I3z0CodQdNvGvnKRD4iXfwJB2gD7qQ9ktdg2ps4WnS
8s9GUSV01fQ3k7hFYgRooRgD+fu5OPFsXrzvMMiy9geW0DcVrLfsPfW5UNfJ9fbL
aQyN7Zw8sB6aUZ7dCUw5mdUhifm4hf6Oftm2PZtAkA/jpq0j1AN0DWSljqT4BR94
Be64hVANbI10bPu1FxdYg/na64RUHLS4YwpeJUu/ic1rpM2NqVQ=
=t+mF
-----END PGP SIGNATURE-----

--C9A6rRvoZs0n2wPQ--
