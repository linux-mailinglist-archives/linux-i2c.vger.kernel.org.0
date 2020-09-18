Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4152707D8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 23:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIRVJO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 17:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:59548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgIRVJO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 17:09:14 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAFB5221EC;
        Fri, 18 Sep 2020 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600463354;
        bh=n+UT4elTACp2IyAPY5k4F56sxpMOmMeqNATaIpgcUiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ip9ZYawjZiW5uoDp8jXiLb7vGAyYziChgrnjK2lVFim9AferHupYdO6NEwqaXYDN4
         C+FC/Aya22BvO7MJ/sgSJJbVRRMsx1S18An9wup2tgf1iwfxTsJYpRBQHSCO6i/4PN
         yjEEE/m7xb6ZN8W8jtNqJFKDiF6P8L/XD6DY6V/c=
Date:   Fri, 18 Sep 2020 23:09:11 +0200
From:   <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: Switch to using the new API kobj_to_dev()
Message-ID: <20200918210911.GF52206@kunai>
Mail-Followup-To: <wsa@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FoLtEtfbNGMjfgrs"
Content-Disposition: inline
In-Reply-To: <1600133898-35883-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FoLtEtfbNGMjfgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static inline struct i2c_client *kobj_to_i2c_client(struct kobject *kobj)
>  {
> -	struct device * const dev = container_of(kobj, struct device, kobj);
> +	struct device * const dev = kobj_to_dev(kobj);
>  	return to_i2c_client(dev);

Can't we make this a oneliner then merging the last two lines?


--FoLtEtfbNGMjfgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lIfcACgkQFA3kzBSg
KbaX6xAAr7U/NRpiINPvIny3+Pb11V70zfEwH9bMfj4/zLrgmI/+JS+GMAeJOajs
SxksyEPhbYTZFwSv7NOH7GhcIaB3DPHazF8JlTiBaBeqPOTdxVzbDJdR5tipEROD
Lp2a+AuPGqMUPwlRBW3z/JKYz9oLHiXTUEHxW+M+l8HrUTidtt2lQnvAoZ1OVrz4
fn1fL+o/fcCcHo/8WEW9kgnQlm1KiIoh9eM/pWGZcgLaQthusAvyeeCsbNqgtiMp
wjp206qmF314VABAJNBZqqPUAiyfJJptmfXVUyszSRSAFtA+iVBNz7mpW2++ZvZg
u6TZcCSfHpKouU8y6NKBnUFfWqGPjdy8DhyROhmz9JgnAMlZAsys1AlBaivsHH0x
bDK0wNFdK4VLxHiKlRqy6so855X+ry2dzo5BgMVNIidqxKz/zHvneyring4jTHZ+
YTVSMJhFatfChMtFqbz6PsWglrvro+oUs0S2Ksy8DUQoOaJOBu4J4Vf4oizgRQQy
Gxqdn/tD2iOjE/TDv2WUFwc6tt+aRaEDKp1YfyXS2jyw8pEcI4DPlYsLun6yUnzN
e9ZJaig7RKasRWJ8nK6EeYw8vYDpVmsaByiy3D3PzksbLmPnhTC34g2pflWGYNhu
jNI8XutVMTjOHdPrhu2hZBbSKqFC0gfEbP39uKLkWcEDPFaqLaA=
=VJ2C
-----END PGP SIGNATURE-----

--FoLtEtfbNGMjfgrs--
