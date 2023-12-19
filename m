Return-Path: <linux-i2c+bounces-882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EC818DCD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D831286175
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48257286A6;
	Tue, 19 Dec 2023 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzdQPjoA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725C249F8;
	Tue, 19 Dec 2023 17:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDDAC433C9;
	Tue, 19 Dec 2023 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006359;
	bh=SYX9p4gi9+/zBHEK/mikAFU01h6uY5iOIkUyj8418Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzdQPjoA8VJRjFK/J/ijbwQbl+1YZusNVbJGMESqfmz6i4K8ARaId/cPS7xp8H7hX
	 yycH8QMD9Q0/1VlvSkCzEntfmHLqfXjUnEHT60n/I/+TRAGEr8p8qyl1LV5sggL3xS
	 y7HV2oTyR2QcBsFypQWndXdTmfnNKz5BtF/b6BwtcwurpRtK22NGSKi5s3tP8znhaB
	 6tXNVENf/fpCX3YwE5pxp+q1W7jBvJLNMLZeO0SJPkoQrO7vtqXB533qDdL3vbdaKB
	 uUl+EgjDvyidVnEiXNOS2XQc+wzRv5lYumPDOXl1Kf/fYolCZkREZ5WScGvWsTau0r
	 dbaPW36yjizgw==
Date: Tue, 19 Dec 2023 18:19:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jochen Friedrich <jochen@scram.de>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Message-ID: <ZYHQlAVMEnkXHwtb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMQaoeTeSrN0+RF5"
Content-Disposition: inline
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>


--AMQaoeTeSrN0+RF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 11:24:03PM +0100, Christophe Leroy wrote:
> sparse reports an error on some data that gets converted from be32.
>=20
> That's because that data is typed u32 instead of __be32.
>=20
> The type is correct, the be32_to_cpu() conversion is not.
>=20
> Remove the conversion.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@i=
ntel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied to for-next, thanks!


--AMQaoeTeSrN0+RF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWB0JQACgkQFA3kzBSg
KbZWhA//bbjGBdyZHdVcVAiA7PwvcpVpxon0nuv8UUlQw4f7YcS2Gr8bTlc4woz2
pw+1L5kBKNoi7qWriqTYKqbrVJC3wH7/5sgrqA/IwnrEK9RljFheI9SxchAkxmdT
noTN6/DJkHCkGMpA4fW9pictdQXqx3CDH4rWccdR0qUfxmEgEqF4B2NakG9UOzSZ
EmKg9mRDTxq/2AFJbjVYrDtSib0ZCzjoOXgrbgFgvqg4nVwgiXBL8g/R4gPw6p6U
eRPo1D8HN8mTAsEutx3ZfPbQCjxnNLKNbipzviFMCBli2ZdtnxoGDpSSCFzAVpG6
FQK+Sc702ZE+kiGRSQczvTsrAinv0JCDObNG8jFJxgtlk2ddzW29ECl36gw76lYJ
5oKF83Qk91r5b5ZovnOhTTFAPJPw0pUCKCpnnH7ryP1/t0OSj5VB9z2cJz90tw87
Pudw4Ev/HG9XyCg1DPDTsD26fdixVVUmQs1dPBd7iItCNhKqL6mVXJv08hOemp2l
7f4N/6nB3ovObXkkgTKTzEFuAssj9Iko10S7AHxmbUeTTVRhUcbj8YlYBQ3EotQB
O4KJNAjGU4hiJrRZEuJ542zjkPvCd/xSpDC8KTGHCOwV7UVua5RT76D2UizpQ9Jf
ncmuWJb10e9gzMPAvudOao7rZdrMJsGFfugi6CEXeRxa+7Ol0QQ=
=BGje
-----END PGP SIGNATURE-----

--AMQaoeTeSrN0+RF5--

