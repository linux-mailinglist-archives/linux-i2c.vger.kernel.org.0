Return-Path: <linux-i2c+bounces-9326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4FA2AE4A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 17:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAD4188BC87
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 16:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A577522F3B2;
	Thu,  6 Feb 2025 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="En63QP+t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80C1F416A
	for <linux-i2c@vger.kernel.org>; Thu,  6 Feb 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861163; cv=none; b=BzW1cBU9wCXQRKGQlyiefkC/jDF7VNlQ6QmV5zTwn2rs3qE/QWgTCCYBMTXXUFVrub7xjoqChuSpe7TWjm4l3AWiX+CD9Uhpy90+s18Un0Cz+fNbEyl68iA4X1pQcbEFASbxgxwS7HpRpBQ7u3tsmqIU7iuJLjgiIE1dtk37cGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861163; c=relaxed/simple;
	bh=Apx60P0LvBsdt/onPnjsn8S3kHAtcKf5FZN6n5RfSBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHVlpXvMsjpazdFO/m4K/2ryAyGu4f4eyTq/dM5nvWa8W9vvGcpFM4c6F/e13FxA9rysrBmNiif4/s+9c8gp9zFZwkKs+ujbU+u5dFocbhOxWfRzMTBhOXnswEWpYVv1OIpLYR9+TFuUTawrd2Qw+7Vbs/seTOwDGtzEvG5J/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=En63QP+t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jkjg
	Givi1rvjpRlcA2YiPM6fIezOTe8fvsGmux0RmEI=; b=En63QP+tnFGxkMkCs/9m
	h+rAVSEDwle71w8n0DzlOWf65KmT+Ry4YjeGbl8iHrZ1Z4SQQ/YhHPYRinwcFWoB
	bauMiu9kr7509xSO4/+2mNLhIi/94g6Biw1HecR4DJGSe9jpwpE/LqI13PSKGwuZ
	tfGMjnrrR54jzEmrXwcSoNj9kEfKu/qqANB/I/d8E5D+UYnxLfJfeiXDVXr37f0g
	SkPDWzyB2gGkST806+qRcF2eFXaFGgzodLLjwi92Cn21DSXACkOYZ5RUledcJJt+
	YJqaOWB/o9TGWEM/jYJRwSDXO9gIZLBuHFy3zms5L/VUEizT2jMyxMatozjaEEZO
	vg==
Received: (qmail 3798681 invoked from network); 6 Feb 2025 17:59:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Feb 2025 17:59:10 +0100
X-UD-Smtp-Session: l3s3148p1@jr8mKXwtKONehh99
Date: Thu, 6 Feb 2025 17:59:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: revert flag based client handling
Message-ID: <Z6TqXGYIBUjhWtDH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
 <87c4716f-d6bd-4a4e-91dc-70f73b9109dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XpUa3pQ9q62QmFWE"
Content-Disposition: inline
In-Reply-To: <87c4716f-d6bd-4a4e-91dc-70f73b9109dc@gmail.com>


--XpUa3pQ9q62QmFWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

> With RFC fix (v2) sent, the issue should be solved.
> Would be good to have your feedback on the fix approach.

I had a glimpse, and the patch was too intrusive for a quick fix with
changing the locking everywhere. So, I will still revert the original
changes to buy us more time. In addition, as we overlooked one code
path, we should double check that we didn't overlook another one in that
regard, i.e. muxes. We should develop better test cases, too.

Happy hacking,

   Wolfram


--XpUa3pQ9q62QmFWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmek6lgACgkQFA3kzBSg
KbYneQ//RbXmHUlaRqWeojp7dOjRm1DAIe0ZZQJfVxk/xP5ol+nJtly4qeVac4d0
m8wTMfcMa6DGkBaWsV5e/IDaKy21GOxZmSu6XwotByozMGDoZhWwzSfgyBPLAr+0
0FpjM6z5yDNpDvJTx5hGjOc89mbO6oEOx1GIYSFgtgza7Nq93sR1m1fQ43Xq1uMu
gaMVVG+CivS1Q+XVIH5DnHUUT3WIJiuFWxrThD0CXHn8FEWxPunQP83IuAColqdt
gNoJkGT46zm/VSWXw/brdVpFcsIEactYBI+da6UvZRC1AyMsCcTHHLMb10et6jn2
+f17MB1DWXrQ6l5tYRIHj/dhDq0bzIiED6MaqFBGuS1BP2+1fSZrxvGVJrcXxKPW
M7SF8/lPBG5nBMbjS3UEYG1ciCPxPZqPvX8x4TG8YKbpXkpjniPcYprhnJ49s37z
o60lnPBmba2X8W8ZmI/i1DASot0vu3UtBt41OADhCsXMQNTKfJgLB9+kXYvsNz8B
J2f9iren41cx1OrnRPv00XfIi6Sp2TFn5NFv3j0Dr/caTQfxo4jKlF0yfVNCHheE
agL4lN3g9EQyAwVhXNvnfHnqmIICJciXaJgBSxLJfp58APcQj+8R3qydXdrWxxJO
C3YRCIKap8zu2oJTLHsdAIlAIE9wI+RgD/SlxokDeOC2jWUgwLM=
=ojow
-----END PGP SIGNATURE-----

--XpUa3pQ9q62QmFWE--

