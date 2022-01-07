Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991CD487DA8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 21:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiAGUYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 15:24:19 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44730 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbiAGUYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 15:24:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3FF8061FE6
        for <linux-i2c@vger.kernel.org>; Fri,  7 Jan 2022 20:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03700C36AED;
        Fri,  7 Jan 2022 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641587057;
        bh=UAfnoL86ZB98XRycStRMpkOz27mbd1CkSVdgWDPqoVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CxkoS7+Aruk4/7+DqCXCZLAKViPpVIKZ8uuz2N0VissXeC5dmsrNGJYQMzstfKqOI
         qx0035OhIEnWvgUoYFR7FSJohaEz7RiyTGpo5d8KCi2gCWAv7RgPx61b4LQ3CB5cAF
         Ydj5T5Y2hK7fAUOXwXTcv/byHv9SQeThwWiU8ktKIW8WH6z0Hzu99KiFJzioskuug6
         OWmXt1HANu88VFJpunrjjaoFSkz0uddR+MBM0nYjHPnxHaDzgtjPXeTvXzVc/FydaQ
         beAL6cWYZqSg3Wc2VguIik0UTma2i8LQCRBDqk2v3GIldXITLUyKLCxD2ltWpqSmY3
         +JD0M6V4P7MCQ==
Date:   Fri, 7 Jan 2022 21:24:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Konstantin Kharlamov <hi-angel@yandex.ru>
Cc:     linux-i2c@vger.kernel.org, bibby.hsieh@mediatek.com,
        amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in
 adapter"
Message-ID: <Ydihaksfmm6TiG8y@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Konstantin Kharlamov <hi-angel@yandex.ru>,
        linux-i2c@vger.kernel.org, bibby.hsieh@mediatek.com,
        amd-gfx@lists.freedesktop.org
References: <20220106122452.18719-1-wsakernel!org>
 <5849ab287df1b06e141d87bbffdbcd627e999578.camel@yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S/gKSxHGeHhRRdpK"
Content-Disposition: inline
In-Reply-To: <5849ab287df1b06e141d87bbffdbcd627e999578.camel@yandex.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S/gKSxHGeHhRRdpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> 	Tested-by: Konstantin Kharlamov <hi-angel@yandex.ru>

Thanks!

> By the way, shouldn't the patch include a field=20
>=20
> 	Cc: <stable@vger.kernel.org> # 5.14+

Yes, but I add such lines only when applying to my tree. If I add it
when sending out patches, the mail gets CCed to stable although the
patch is not upstream yet.


--S/gKSxHGeHhRRdpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHYoWYACgkQFA3kzBSg
KbbyBxAAmoMZVtND7b+hYvwEhq6vE1IWvlD+tkGACi94UWfnxie12sV1lBgFQuth
lBcs1jvh1AUyht/cgN7zJP4hYoGpAUFmITs5lxx/JKBYXGMVVqMy/UFRSEgBxfJ0
ZM0F5YjCOn811vHck+Z9rpPfJcaqv3i0Ox5sPHQtr+LoKkLWQwgcvtjcnqGje0nH
bTE+TU+GzRBXr+kDlERSrGDOLfGOLvccwhfEWrPCHlUi6SdmgoO4LI88pjuzIMYO
AMYUI+TvCyjWcSizhoyX76GDphU/zgFgUvvlkhwnzBmuWrOYIhRik0EDIyr3FEld
mQQ9scebHvrDLj9JTj22TmW6qS3MaDouSxLyb2SBvczx44kB55Vu48V1Ta1v6b9R
RD0WOP1NR5X2CUHIQN90hOF4Df/HfNa2b09nbS2x5TwUVvsGl56+Xu0N2ijWMgJt
3V8Y4h3iU6CxnIo4OihDdfaCWRMTaffA1zrbhGTvcobrZiqY5EAGGojxYZTjEySY
WTTraD1YRwBeKKu5kAbd5zN20hXyqZV5GSpd0P4lpDU6AtJ6ANf9F6Wlacp9Bxtz
67EsjrxTg/bZEsWYUwc3BNRgAZej/q8orXr/fLhirphGCLFtIecU3YL4jcALcZap
4yaJRgqinw84Z01huSBEP//sOyvIPgCuiTKQgWz2WR7FMzsQU1k=
=JJG0
-----END PGP SIGNATURE-----

--S/gKSxHGeHhRRdpK--
