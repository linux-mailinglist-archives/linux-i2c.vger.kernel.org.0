Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00783BAC76
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jul 2021 11:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhGDJ3m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 05:29:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhGDJ3m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 4 Jul 2021 05:29:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C98FD613DD;
        Sun,  4 Jul 2021 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625390827;
        bh=Yw0hAeP3f5bvETZDCA2xmajxhNl7JWA4XH+GBZpZsu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qO+WEaiduui/pXrxhSHnBoeSnV+53LlJOwMWpyHwRGtf0XnO0U2Jq/dgpngXXM0nV
         NnMRUEQJckZpzpyLJjuKRXf4WKWJ860x/4agCwi9bJ8VHQOek/X8JNiO1jbNIxJiXb
         9OuYZoN+IaCHIazReeK2A7NkDfc7Kzl/lxRUdM5PR8BmHg92ko0uonR6XZPT2qHzoc
         sMzR1DEJkPtA2pN9tIGQLkvM5aXf8wPcK0U7cL1WatQ87MGVrVwNJpaDnXZqnKVEir
         fzhadpPSl7f4022cvy9eGICKd7mg/cSJuQg1MiH5WKU1Tsw+YWc4deoOrQHvmMbrx8
         WpvI0Uj6xmJeg==
Date:   Sun, 4 Jul 2021 11:27:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Unavailable for two weeks
Message-ID: <YOF+51kPNsFp+HD8@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org
References: <YOFlTrOWahNB2+oE@kunai>
 <YOFrJYS3IJ5bXNbi@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S+6mvyF7dspxgZSu"
Content-Disposition: inline
In-Reply-To: <YOFrJYS3IJ5bXNbi@kroah.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S+6mvyF7dspxgZSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure, would be glad to do so, just cc: me on the changes and I can queue
> them up in my driver trees.

Thanks a ton, Greg!


--S+6mvyF7dspxgZSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDhfuMACgkQFA3kzBSg
KbbeoRAAqJvFgld7e10ORfzHcG7gnXVZEhLTgIFO+yoE+EmgqF+xfirGfQXbzjpn
92auemVeMlyT/xY13uOj3bafLZ/iPQbumcOP4eBeAJ91ujZ76InZxXuLsewEd7ro
xWEgWu0kH5GHjFFlsNxdz2OLwjACNgYNKVwyQYxWeO/bW6c3XNkVxueIWUChVLks
2L6CM8z6/v1f9miXVSwNuNpA8nT1IdAL8sxDSkwrqwci+46lz0kpnhcOXPa5E3Sa
DNN13qA3hjgKqEOj4VFYv97cbunbiWd3weR5XxMl6grHojn7/JlhG9o0x3vtjhgv
W4p3h8AUFpbigbSvMA3BxX0xTFXL8sSpQvA1octbecJKNMKBjHtMNzrCARI2JztX
oGFromWEoGTZLFa9M7HNh4ZLuYRrurd04d9+yXQgbcGfN9ASb7Uz8CDKkOwB2WHf
d4tXbzaunSUPZ9+eE77wCzU15Mz4PaX1Gv3cnF7Va37YHkIcQuQZDrJ1jzHbsYHJ
4Bsvgc2silo94Uncuq5igETJ7L7l3mMu5uMZP7Uxjb7mb5Df1Lbb+RjYxf+IFbFc
4gM4KG+QxOoQMKL/zMNZfkySx/hV5eudj0t/C2ryTl7RjLMDGHLF6y2Es8rHSmD5
QsnpPNUEZcLhEGQHbxqt21B4vM5xdyJKS/GViJ7ba/egmDu8k1Q=
=WoSS
-----END PGP SIGNATURE-----

--S+6mvyF7dspxgZSu--
