Return-Path: <linux-i2c+bounces-7791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C59BD3BE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E6A1C228F9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBAD3BBC9;
	Tue,  5 Nov 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HLBC5Clx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E61E379E
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829005; cv=none; b=M2WAGoE6nOsmmYM1VrjCuKFXRLqXLZAGWEj7GHNodJv5RRVgJzTb99Ngvf5jg26kfgLIU52X9sSNBS8O23FdTXlUQf+FuTMdu99RvInmVqn2efDfnYEoz8Jr+FGpMHRbkktGCXmwQdnYv+oxtXUbczl8ZMFQmmcIicNNBBR/PQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829005; c=relaxed/simple;
	bh=GuRtLQX0w35B+7iyiCsfc80tAitLYzA6mWRqJChq9Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGgtOmLMv5VWJdYsnOr5idEv73PLZ2oTwypKYfSZyLD5ebJH2PFOjKZU38t34cSzIQ1KURlEuS29nCe5Cx2V8cEhULJRj2QcFvFIN9/VhRUJu3K4vVWQb1ZLAcgIem2v3x9N8s4kwiAu33fw5b9x2ut9AgatZUuBT5bNVsMyXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HLBC5Clx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GuRt
	LQX0w35B+7iyiCsfc80tAitLYzA6mWRqJChq9Tc=; b=HLBC5ClxH28OEptQ5S57
	UjTzdWANrQHstfH4YKSaM01hB3nOl+VPJXBnXyBEug3+wbkdCbDQwJDvpgKuR/VS
	vruwH7sXiYIMvBsFokwLAopGyOm0B8Btbh7TlnG585jMQaQaQEvnfBi2tIpThBYd
	DeTe/ddq/0o9pfSSM8oMaTpgHPS8tdMri1nZlCXSfDDl1l/8bRY/B06QyglafV6O
	LWQid0HnEvPuNFfl7SjJXJtZdRREmtiJ80Q3GDnyRqPzYTnQIcJmfTy6HjRlH0uw
	5MeXp4DGBy20GxFKMuhGp2rROdxMw0lptZzmqYVw3VoTAS4ooRibaKN7+fqa+vSr
	aA==
Received: (qmail 301786 invoked from network); 5 Nov 2024 18:49:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2024 18:49:52 +0100
X-UD-Smtp-Session: l3s3148p1@a4c9By4mwNMgAQnoAED5AK0EWvxUs/K/
Date: Tue, 5 Nov 2024 18:49:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc6
Message-ID: <ZypawIGLsS1oeddJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
References: <nqnhd2eb26lxm4ho5czgkjgnvorugixpzyvbw7pmle24wdn56f@a63bfcrj52k6>
 <Zyio0JvARbWwoFoK@shikoro>
 <dz4u6osmrrubq42kgrg5wtnwm5tcjn4igzekozkdw5borowk2e@oj57frbfyuka>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kYPPwKugasGWNleJ"
Content-Disposition: inline
In-Reply-To: <dz4u6osmrrubq42kgrg5wtnwm5tcjn4igzekozkdw5borowk2e@oj57frbfyuka>


--kYPPwKugasGWNleJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is it clear now? After Farouk's reply?

Yes, my mileage varies, but it is ok.

> I can hold on this for the next "fixes" pull request.

That sounds reasonable

Thanks!


--kYPPwKugasGWNleJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcqWrwACgkQFA3kzBSg
KbaVXBAArwM0msMdYwXf4HAeXo3oveJkf8GOSkWylCDgfWUQB+Tyq3gbE+abgaDo
MRjlYMF+i2m0ubDF9uo7lHSq/+jNdn3shK9XWsD5QkrUTPO569JHw8a9dJHiD2U6
OIE0iNxtjNeF7YVvjHUM0SBsqGo2ySbS6PGia8x2LiswVuWj3q0T58Hcl3ClCVFf
C2KJygUSckjLrQZmJ9f5jRMqMRFDbyqykogMDLP3HNAL2zv0VfD/19EFdx2j0kxj
cj6ObHKZX8pyprqIVxTUu4dXs4rQtg9+KRYBUOGOn2w8rBhcl6Rh8qWumWyerEky
kOFedA2ytzl0QPQP9PKGu56BfELBc3nxXf0F9S5xKjPQJVo8gs8LctXuwzIjifX+
Jzdo0r/TGymn+Wx0jNqzVvSjr/n/7bImFa8mkzCd3LVN3+cWv1rFKPQE9OvnqtB/
0UwV1rngraYXHvQxhwgSkcVx6jpTVKtXsprAdqJTWAJpUnRx/7p28lvDhPbY4/wo
BENu5nJiMAxTFGoFegVecfN4h/FkbOpyzXmk71AGsBTAjayh8W6chW3Lzi5PNq/t
vAKzvSS4buPIUblBQLhDQnHd8ZH8wgasZ1Ih0OmxF570hIHA9qQtRzjFbLvnU6q+
WElMy5Yyx4GVud6d9f61MCQf++wu3aVeUpqEhMlFjYiUoAw8jK8=
=xOtZ
-----END PGP SIGNATURE-----

--kYPPwKugasGWNleJ--

