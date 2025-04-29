Return-Path: <linux-i2c+bounces-10672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091FAA01E4
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 07:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07D3A7ACA3B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 05:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8226C25E819;
	Tue, 29 Apr 2025 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jI3gB2HA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F221ABC8
	for <linux-i2c@vger.kernel.org>; Tue, 29 Apr 2025 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905312; cv=none; b=OlJE/Fm9tKBvXd1ZX8xVk06oYCl1pQdkNjJkFl3qzZAM4zVgrR68yCWvp4WqigW9ODgY9PYTxJyJm4qtybobI7pqP2gB3BGM9oqAxP3rvLEZcrw/+1tOS4fvlrdxtJZGFAWrmhL8Bdb9siFaghCOFKBFqRQyQMCcibzJYtB3y2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905312; c=relaxed/simple;
	bh=LDGEy6BgXcLzexaYRIXjqYYouqaIk/CmA7XWdbGlmjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFMS7wT2Lg7DTA1OnWcA+DjKA5V41VZBqADUR6qdo2xVBlFeqVNtDe2OB8A3F5XEXpY9t4HflKy6n586MYtX7l+FJd942BU7ztGcmejjuW8JDnOXOBcPwBBvsgmBcGWYXCgN0NvSmsurYq8/QnoDuQWwpbcy08rvAtOobdgemeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jI3gB2HA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G96w
	HknFvMDYs9Me2VS4zcAoceHRxCX4C1FN4jhCjms=; b=jI3gB2HAzkOIzAXdfgGl
	33CBhnQRcgr6MTIAw422tJwPkuKCftn8g/G1kt2/im1vO537D2UTdtIdbP8rFegk
	TiG7xoNytx8chHE/vwJ22D/AQcr/WrXOLm0P3MmeB/ZwFy+RVRTeoNISNF12OIbM
	fUH290VXsdQ8bOalrr0iwEjBpFLcYmFA+bN4QK92DRiCdma1s6FzASvPbwEdB02H
	cfnS3igiEQuT5ZpHT/sW0aSC1Mm5fBjswjJHel1WyzRXFZcG9lZw6WBHjx/D77ST
	UYYoLgsQY9l23RqYHuWsqVPUbV0b8AYxSHwR5BqkIrrroINUJDkxPW3f3sCDCagX
	MQ==
Received: (qmail 127660 invoked from network); 29 Apr 2025 07:41:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2025 07:41:45 +0200
X-UD-Smtp-Session: l3s3148p1@wKKHQeQz2Ocujnsd
Date: Tue, 29 Apr 2025 07:41:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	"digetx@gmail.com" <digetx@gmail.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	"wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Message-ID: <aBBmmNlM3_zjNMC3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	"digetx@gmail.com" <digetx@gmail.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	"wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>
References: <20250424053320.19211-1-akhilrajeev@nvidia.com>
 <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>
 <aBBE5mgqGk0yXQWN@shikoro>
 <PH7PR12MB8178416B09D217B77CC43C04C0802@PH7PR12MB8178.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKcIhL0cHU9e9mjD"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB8178416B09D217B77CC43C04C0802@PH7PR12MB8178.namprd12.prod.outlook.com>


--LKcIhL0cHU9e9mjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Akhil,

> Yes. We have had issues where the client device sends '0' as length if the

Can you reveal which client that is?

> transfer is terminated abruptly at the client's side. The actual fix is in the client's
> driver, but this check here would ensure that the master does not run into
> trouble either.

Correct.

Happy hacking!

   Wolfram


--LKcIhL0cHU9e9mjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgQZpQACgkQFA3kzBSg
KbYwVg/+Ls0ETpDPvjbXAvPTPGrLr4B1aAcdbJxiAEbIpx2BoU1NlrNi1muKcM9u
9Cj+Xb+69BqlTuo8O4yup6pfd1aCe5MMejxLFkaoYxCbXRFSiFEbRHrPN7Le+LE9
YrWR92ER5yy+XOKMWikfdHEcvGHy+emvurGfcmrrtykvl2lJ6ux1MoMbC7os7ky5
P4UM7RFBuVVAhH8RCQHkhvE8ZJKGI8rA3HWGIMDIch+iiczzYaHPfuC9odYkRzZb
RJSXaQFx/x4MQQ9MnbKwym96z6REcjXBIVMBssLexbQbP8odf76QomTO+wPegjts
4GYKTgAi4mpTFeJ2mXk3A2hUuM8fF00szDhWc7obNLZdQtDe/wkxnsdWeQlbrMqP
yo0f5nlhxP5guGV/Ofi5V7hkjDZ4iOY8ArACXqViUjRtV7ePJXr/PMRTnVKuz64T
4j2pacdY7uazHVCesI867Zc37dB7pVbwbORnNnO4L6n+8x9sriO5Bvms96AdSs7W
/kID7Gn1RnHc8L3vjnDTMKh+TY7pW/SRATQ+P8qIF8ewtuYBoiIvHMs7IaJq1uv+
H/lrZ9Z3ysabkr09nqQS9k+ZZTfE7S6+878a2GGD5/T+/b4OyedD2uMvnDyf3pLK
nEyy26Lwz1h8qj1cpSFRNkmd5ZIJu8ugW6rxtBt3Y7XqgK6G7wE=
=JRhs
-----END PGP SIGNATURE-----

--LKcIhL0cHU9e9mjD--

