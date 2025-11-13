Return-Path: <linux-i2c+bounces-14080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8FC5A491
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 23:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 130033A99C7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 22:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F1631D380;
	Thu, 13 Nov 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="tJauWlZb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15635957;
	Thu, 13 Nov 2025 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071712; cv=none; b=EDIBNLC4OHQwTbWd4zMZT0D81RXXlY/sR4MfckFW94lDOBo1nO0IcHbyXXazGAlFppNi6VoxdidCqcNjpFPPFEHQCKInZcfHkvN8hIn68Toh9atv2VF6JqgCYL7yRHUJ0m+c0kS/d45/8g4TgG4bBnQfnizuFUn+z8PguRa/ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071712; c=relaxed/simple;
	bh=rnEYJoU5tEI+G14fwTs8H5vdlRAVrNfeziF1qiSRUaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/uygQskbzRJdThZZuHk8lvxDLVo2RnKuk68dwOjmcZ++FIH3MjwEewr1Jv7pCIiLVamngPX7+mesCaRbN21IZsFvem9IW8ZUuUotWkH3yz+3dA0wpDCfXl/OdGcUxbdHYmrbyHwCZKLp/IzyJf1ZMuUw/8338gC4zJsJ+Kpjrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=tJauWlZb; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6Q+eQ0jQq4j3cE3OQzV7WwPST+vm1AuIfNIfB6ulnWs=; b=tJauWlZbkPmWRDcbqq+7FVfW2g
	tn5sMzpqX8dB33N7WzoWj5n7HsjBc/M8RwNGBtSTV5k5z8jKEZDfIeoH5ytmdJojflllCqRbyd1Nf
	Sl4nLCykpangvKs6sYLFcMlYwQ8s3foCQy6aKbQTTPwF8dQijUlMvE8TElZw7wvw4nK5nIgcQz9qE
	pQnWhLLPBSQEs+1/c3GjnBNEF+NMbCz2mlqB+xEVyqB/yfzAUwGI5BJ6SlfDwjqYLFzBFZMFp2D78
	J19ursYXrzLjWwhTSvsNM2tWLAwU/Xrr8cA0f+HkPAHZIDvCIfc5akhL4ESuG995ji8bsRDltVY0O
	v7haPHjw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vJf4A-00000002tEH-3gkL;
	Thu, 13 Nov 2025 22:41:18 +0100
Date: Thu, 13 Nov 2025 22:41:18 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <aRZQfqFjDNds19by@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-11-13 21:21, Troy Mitchell wrote:
> This commit addresses two issues causing i2c detect to fail.
>=20
> The identified issues are:
>=20
> 1. Incorrect error handling for BED (Bus Error No ACK/NAK):
>    Before this commit, Both ALD (Arbitration Loss Detected) and
>    BED returned -EAGAIN.
> 2. Missing interrupt status clear after initialization in xfer():
>    On the K1 SoC, simply fixing the first issue changed the error
>    from -EAGAIN to -ETIMEOUT. Through tracing, it was determined that
>    this is likely due to MSD (Master Stop Detected) latency issues.
>=20
>    That means the MSD bit in the ISR may still be set on the next transfe=
r.
>    As a result, the controller won't work =E2=80=94 we can see from the s=
cope that
>    it doesn't issue any signal.
>    (This only occurs during rapid consecutive I2C transfers.
>    That explains why the issue only shows up with i2cdetect.)
>=20
> With these two fixes, i2c device detection now functions correctly on the=
 K1 SoC.
>=20
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v2:
> - handle ALD and BED errors separately in spacemit_i2c_handle_err()
> - move clear_int_status() above spacemit_i2c_init()
> - move clear_int_status() from xfer() into spacemit_i2c_init()
> - Link to v1: https://lore.kernel.org/all/20251103-fix-k1-detect-failure-=
v1-1-bb07a8d7de7c@linux.spacemit.com/
> ---
>  drivers/i2c/busses/i2c-k1.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

