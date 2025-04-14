Return-Path: <linux-i2c+bounces-10321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A95A87B51
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 11:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE491729A5
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 09:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238B025D21B;
	Mon, 14 Apr 2025 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xhc4bTJc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1240E25DAE8
	for <linux-i2c@vger.kernel.org>; Mon, 14 Apr 2025 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621351; cv=none; b=p3ERyeH1zpLSlhra4+xPQEWBOx91L2MYi4LEA8u8+rUO91VkMrjWDfw3Lodlmk6LVqTSyfaj7kngXiNHf0YQW7d6cyGzyJUCrbbNDKS3vtw+2D/qpAzaYo0v6iagRY4fmLqi83bh2mqTlijRg1XXeYY8m/s8lF0FsUBi0+PgSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621351; c=relaxed/simple;
	bh=4cdmsK/uKkETSIQWqBZBqK8Pu/M5h3AKl5Q2xtRimGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHBSqHyLRgtgqFNwwss9LEj1FIpdLksLbaIzk59zHzoJdhz+7VckPqT/46osVl7pmVtxWxViSR/NzUyL7TTg02kYEMGRW3SJeXmrPTYND/AsjFwxzThKo1aH4ASW2MqzaslZg+XXiSo4z8hzNMmgF7RJtzszECLQ9A2izyM+eDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xhc4bTJc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W7tY
	p7DaFnPYvh9NFhMVf7+0v1O7F86Kuk3J1L7NfeM=; b=Xhc4bTJcWnmY0cOrfGvD
	tH17PA18r1buEb60Jf91fChtWchhxpfuQypXHtJ3Vzrwrx/4KRxdPw0OIyWUud8b
	wkC6ztt3L8XKvBbBysHbV5ubvcZb9jo/rT3V507PD8vIJS4+92nWEh3qiHTEZtNK
	mTIeF8yFvkziIWxddpVxuXpMaEzrOMR435jI6KYsMoh+FSk0qUMnRdI7imRhn2lq
	lHTLrS1EtFhoMtAfXzfcHnD4pt88FFcMCnlSSd88+pgxU7d9xTVkj9YncVPF7SYY
	MSQ8fm491SU9eJXW1So226CfPiDf1FUCTeLqOIvW05mpRKuMuHN6iQ6TbLEkk0Kh
	6Q==
Received: (qmail 2217783 invoked from network); 14 Apr 2025 11:02:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2025 11:02:27 +0200
X-UD-Smtp-Session: l3s3148p1@JauqT7kyUsIujnth
Date: Mon, 14 Apr 2025 11:02:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: ende.tan@starfivetech.com
Cc: linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org,
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com,
	endeneer@gmail.com
Subject: Re: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Message-ID: <Z_zPIoqbC3cdITBh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	ende.tan@starfivetech.com, linux-i2c@vger.kernel.org,
	jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, endeneer@gmail.com
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cAFb+b2Ay2PJZQ6f"
Content-Disposition: inline
In-Reply-To: <20250412093414.39351-1-ende.tan@starfivetech.com>


--cAFb+b2Ay2PJZQ6f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define DW_IC_TAR_SMBUS_QUICK_CMD		BIT(16)

This bit does not exist on the instance in the Renesas RZ/N1D SoC. So,
this patch needs some versioning which HW can do this and which can't.


--cAFb+b2Ay2PJZQ6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf8zyIACgkQFA3kzBSg
KbbELA//TTYJN4MKwx8+ExUBG89h5ugoycN6+mPOqUPssOX7Skq32IaWN0t6Lvj1
qF7bHlbPbg6hb3S1pK/Igbs1rTXh09zwTabACAzrY76tli3VM7n/qrETXO8Y7xz7
X5lUGnFbqjQP+ZWVObIcaABvR+hHoJTvgcYRktGmGebe8Qxflf39S0mK742MPzV/
pRqVHnvK5+ZbQWcv/yFl1Gj72DKAE/pyNxCkESZMRSTEte/Y15DekTZqTGrHWugY
edYcrHaW3cPkf6+4GEFzItz4hc00VK3Z7sXM8Izd5UW3br78mEWlXdYtSVGwFjp9
0lTu99UbCZShDbQDN9YVuUaD7d36KsVWMPYokUllrgbdhJQhEmBmyd6VUk1EuJTQ
D2/OHJcQCJGPndqdQ+/W6g/lifug66ADp1prwDnJ46s1zugz0rtXduSJEr0jS5zy
qlTUBMzP+C8WjiNlmeguhRlnqhr4rpBcTQYmVMYUW7WGSdAOO92x9uVeaL3o6wJ3
xxXGKUvKZG5eC/uVPMI9ARK2XEiu1I/JjOExKVZbWY7w8RfOYNJP1Snwtub7ScRe
E4KnVAsBwCxTrsYZNu8IBCfpQ0mWiZgM2MFKsVJhMvFFNFHXWj2J/VksHBQnaDtA
I0yhZQBjz1aZKar8DEwL31vMtqVzhFgWa/Vo/or/LydPB6VHcNU=
=JMav
-----END PGP SIGNATURE-----

--cAFb+b2Ay2PJZQ6f--

