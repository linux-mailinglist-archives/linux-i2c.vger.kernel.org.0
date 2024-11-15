Return-Path: <linux-i2c+bounces-8003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB79CDB0E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 10:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D14DB23189
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 09:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B9418CC08;
	Fri, 15 Nov 2024 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ht1magxP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2818C910
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731661491; cv=none; b=TDvB5AOvDBVe+6e5D5mclCOKCmAAloG1dG3W395X2334B5tcSnCimvuI6sMQVD29GqEbvnuFH5vYE054N/yJbRBsFk0z97rIFzGRdooJ8iOjTf6JknYp2Tvf0HQpjq2NngkK8a5egO66Vr71QtFZ3XzRCDOmiTq4xpUsJrZL108=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731661491; c=relaxed/simple;
	bh=Zfwl+Qgf37kQCyi1bLs3fRckyJB3hQpgBQ1vdmRdkx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozL9PPQB9ePHlOej452ZFXEnMSeNRrov5Ftm3nba6/Kp6fQkxeYsRVOqts3RKNI7GQWRIGIADIy2tfKpE9kX5U+EQxR5P8q71NlXjkACOjE/VzcBYuv5BUqOjGzy95/pJ1fzdfwQ1H2OISG175G4321HerIxtfu0JuNijG4RMww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ht1magxP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zfwl
	+Qgf37kQCyi1bLs3fRckyJB3hQpgBQ1vdmRdkx8=; b=Ht1magxPjR1dZ0IchAiT
	gmM609O2erLV84qmEqCGWv2RPbXFYZKcCn2ZOKw0wGhLqiudcbjnfnHUdqbW1245
	ISlFZOlYk4Rf9jAPqMJ7PQ+TJclK33g+i49PDt1ImHBPGcc3RJZuEmTQktcZkoP5
	5wE+0JL3lsB8HrZ34viGtkUFKywx2mMVflFAjjL1kAvHvokD1MGpW206Zf4phBZp
	qXz40aX1B2F8B8Q726G7zFP9zTX0g1WWE9wWE+uib7GJbfI7q0z8IG2U6sjSF9ft
	swIvXaaMq7WqCYaYwLzzNjlhoeA+z1MuLYx/3PdRqwv2NClngnW8ZBoNxxns3X7L
	GQ==
Received: (qmail 3418442 invoked from network); 15 Nov 2024 10:04:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2024 10:04:44 +0100
X-UD-Smtp-Session: l3s3148p1@qIej2+8m7sFehhtH
Date: Fri, 15 Nov 2024 10:04:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
Message-ID: <ZzcOrGPa91rMKc-Y@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241008160947.81045-1-brgl@bgdev.pl>
 <173151232541.92239.8233789832026323394.b4-ty@linaro.org>
 <yce7vswjat2bhda2l4c4ji4idtozo24c7tbmpahz56tmedmpw7@fn2h2t4hv7dd>
 <CAMRc=Mdt0D4L17St06nn=mCuObG=e3btf42NHfsuTEOQepB6bQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SPkMVcExYw2Wv2/l"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdt0D4L17St06nn=mCuObG=e3btf42NHfsuTEOQepB6bQ@mail.gmail.com>


--SPkMVcExYw2Wv2/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Greg: Can you take it instead?

I pinged Andi also. If not, I will take it. Don't take it personally.
Simply patches overload.


--SPkMVcExYw2Wv2/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc3DqgACgkQFA3kzBSg
KbZc7BAAqvobVO139fseUhLVQjKqLdCAR9/jF7O0OMAnfLQ/ngMigNs6YWQW2Jz+
LyhLqQ1rMDsTR2DXiEULk8tMpKj+P1yTNHrI4fwDn8d2i3FhuHR0Z1TnJKrXMRSl
0j5BbS6vDu6iVypRIDXTPCo1z1GeRcM2SZSzQPNfeWi+2u0mpuGJigZn1KTH0zFL
gcFsX3gnIA45KF3OxANrnoczAkdZhbsJQSdIy0WTWBY0C28ukmb5JKM1cJq2kq4+
lzmGhhx/4PxwFb/X3saeCOK27VyCpSjsm4J1Ee7OjKq6qTJOaLc2FiIQqq7EWfEq
4X9GQEJegKhrwFF4CXX/dNXmJX6qxLBh0fCyaH3IVXHDyoCwkPC+19ZHxpzrqNWl
Y0qomTDqHUrengAnrJs9BxPaNgm6b7BkZ8dcOPl+n+5BxCBvXnwZrryqGP+8780x
5b+HNSk2tjfzUotQYPUOVzLI/kdjJn4owdgo40CcZAlNTJ5TL/I9wG7oiLVJjpLu
nkJlMDDIgLykvpiYJvEuEbcC+nkyUd4F9GHmbgq8BMX5zz6+Lw965KLfVPOkdZYj
HQxK/A05qGHLpbH8+DebjgobuG9kY3f/dZ9qp4DA2STaF3rGZqnRoXTLdO7Pj7p7
EkM/NSYXXuVk7cRF3L06yq10lJqBxJgS3rlrOy3WfOCGM4ZGge0=
=m0GM
-----END PGP SIGNATURE-----

--SPkMVcExYw2Wv2/l--

