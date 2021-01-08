Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41DC2EF2E1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 14:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAHNMf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 08:12:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:32960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbhAHNMf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 Jan 2021 08:12:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BE5E235FC;
        Fri,  8 Jan 2021 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610111514;
        bh=M9Atlx8u08z9YMgRfE9vtBIVYvGIpxRGTC2fZnn2N28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LwY3wZ/KS0BAJWVts75/9teMst30/2ejrz5I1eST1ah9dQJ1m0y3smwxcAh038wAg
         iu0HuohtdaYPFZaexyS/L5bAJ4YVP6pyhyY6JOMIhrWLfy1vsfckctfFJHbvPHf57/
         dO95uhm3hwmcfE0wAwAu1clcb9pkXLkvDoAS65CC/kT1gHnIVU7qK0HQJB0i1X47C9
         ldNQaiScJZLbL0GtwtIZU1NadIbDPx+FT2Yhw+fzl1RDkZhm/ZPcJd37xsp5VeqKKu
         HfztmR/J15d4+nMr+z2qSRDfMP2UId3ULjaXFDmypFc5MBRVAvjmUJ7mzouVHMjFJh
         vmGh5anRuZnww==
Date:   Fri, 8 Jan 2021 14:11:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Subject: Re: [RFC PATCH v2] i2c: Support Smbus 3.0 block sizes up to 255
 bytes.
Message-ID: <20210108131147.GA1023@ninjato>
References: <20200729203658.411-1-daniel.stodden@gmail.com>
 <20210106152757.GB997@kunai>
 <78317552-E485-46B4-84EA-625E6E0CBF54@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <78317552-E485-46B4-84EA-625E6E0CBF54@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

thanks for your response!

> Don=E2=80=99t be, I=E2=80=99m sorry. This came out of a SONiC-related pro=
ject at work. Work
> got fixed and moved on. I was originally going to keep this an upstream p=
roject
> after hours, then fell off the rails.

I understand, happened to me as well. Is it okay to CC you on patches?
Or are you too far away from it meanwhile?

> As for v2 =E2=80=94 I still believe the direction is good. The main issue=
 I
> had was that I lacked insight into one or more popular-enough
> commodity bus drivers (amd? nvidia? intel?), for further verification,
> as opposed to our proprietary accels around here.

Real HW setups for testing are a problem, yes. I noticed this, too, when
I said I fix the existing drivers. I reconsidered. Fixing them would
result in non-trivial changes which need testing SMBUS_BLOCK_DATA
transfers. This is too rare, so I'll just focus on the systems I have at
hand. Digging in deeper, I found there is enough to fix at the core
level anyhow. I won't be bored.

> That 1->2 succession you outline below, starting with kernel and kernel-c=
lients,
> sounds a lot like what I was missing.

Yeah, I hope it grows the pool of interested people.

All the best,

   Wolfram


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/4Wg8ACgkQFA3kzBSg
KbbN2BAAk2JXzWAkA5Fgl2hug4N4N62mS/4Lj39AHsneZNb2/pOzwrI1bz+XuY2Z
WMXmaQyXK6qtOgd+/T8J+MyR0k9K3bcQLZMY2EhSG71YoMsZi6/AZn1yABl5Kh/U
7WOG5Hv0gWL5bV11JQA2Trwz/MbyZQmp3rme8XPbINCfmg9wUgGo7Wd8AdcKaUii
mkb0v+Jx+c52j0unwxgRJ61VkX/1EEW3Q7MIezFh7kXBKDZgtaASAbUW6j1JpMYI
01LPHB1pA3hVcv/KTTokGlYexptcjfId1HMr+Goj7K8jXNnFv16pBSJF4ceqVPeW
ynJ7SAgbbqlj1an91TXceJ8C+n5rHg+4NvCb4v32iqtqZlIVNjK+G0RceZbEu4Ip
3nE6kQx0BodtMg6K3ZV09ta0VtbvGtxpgmKDqCHoMd8sD1dClsz6nPziKPft6D8I
97N0jchE0QU7cpb0FiHYfDZiM3t9jGOi8dT+PfyurGwqYNmeCy0u8UvyxhvtBrmX
mVR4WQ607ri0UfPcSIqIEsPi2KRjM+jwg3qGTppJC7TuiTtcm90KMPjFFZ2VREL1
Tlb2So+8wAbRDBHIEjMHPmYbtiFJ67GCqAptEGq7uW+j4G9bjz+a3FwSv95OYlrG
g0Iy3nb8yfz7D6NPVdG7ipdZP2+y0mxKlGY1/vVUP1DEG76rTvA=
=WAyJ
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
