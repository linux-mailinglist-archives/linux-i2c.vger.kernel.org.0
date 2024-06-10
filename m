Return-Path: <linux-i2c+bounces-3962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 493169029FA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 22:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9F3FB222DA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 20:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAE24F211;
	Mon, 10 Jun 2024 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DCJkbT7Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C34D8AF
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718051356; cv=none; b=qH6mkUMRKLcz/A68P1lhMjfr9sJrRjKdzcAcEYXIUTw3Ibeip4zyapBXgVb1LgohOVwBkYl11Z/kulGbTMSHHYAalJaEhVd4WmiRy2BJQ2tvLeQI9bk5mDDlxNtV3CRd3ExeTZfjtOVgAXkf0lQuU1TNtuRk9QmN9OjYrKgYDVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718051356; c=relaxed/simple;
	bh=fVop4aIlx6mrvq1ysauXvYv0FV33yNQ/rCYHRiVgX1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itSyztZMygC/vt/pL8S29GZ19v79HoiW6AX9BZ2xi4jkCX2DgYzJw8luiBW4vlvwNVP81GpVm1EIAa72xXqyofJ/+yYIPkqympGy71jz9x0b+5RrsmeVdqD65ZtbhXNBniJJj3ct/pZwxGcAzndXQLwpDjkFISDNETaMfElOmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DCJkbT7Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ADph
	lcGm4Uy8/tlm7p1WJXFkJK4iGhbEVCI+Xpk5uRI=; b=DCJkbT7Qic2CL2qkYjsD
	mIFxIVmf5dTNMKCb9NJ0z5NHRu0/UblXeaBwu+iKMquTTBYDnOvBkI5Y9Zye9cay
	BiKnrRQVeC5IRLqMLU4C/cHQdPjsG0Q/Ugb+IvJhAuxSin4/c1L2DWheV9jNQdlw
	Ue4nfwzsbo5xJcvww3uTllewxOU9heuEW4aPXqubZmEJTRVHWh7KO3fGLjlbKNx0
	zVj0C6QUFCqRyGNY3NvXYdhdjbn8Ocv6WC28+8vZbBoxttWre1ReFzy9CmtAW2N5
	tDP0zbqBjXmN69To9eOf+Od6hB6lv+YMTXh24wEFLID1JILyo8a/07mOSyc4lxP9
	xQ==
Received: (qmail 187867 invoked from network); 10 Jun 2024 22:29:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 22:29:09 +0200
X-UD-Smtp-Session: l3s3148p1@rt9iAI8a5tpehhrL
Date: Mon, 10 Jun 2024 22:29:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] docs: i2c: summary: document use of inclusive
 language
Message-ID: <iizkptuud2bcqnfvyvfomdbsakywyszzfmyawgsymsdvkatyyz@eze75wfqoczl>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
 <20240610081023.8118-5-wsa+renesas@sang-engineering.com>
 <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhg3pbewrmu342gc"
Content-Disposition: inline
In-Reply-To: <8e051ecf-a355-4aef-bc40-007f9b709ba6@linux.microsoft.com>


--hhg3pbewrmu342gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Easwar,

> What's the combined effect of this documentation update in terms of the
> recommendation for switching over the Linux kernel? Are we to use
> controller/client or controller/target?

I am not sure I understand the question properly?

"controller/target" as in the specs, and "adapter/client" when it comes
to the Linux implementation (which has been like this forever). I'd
think it is too much churn to change this as well.

> Confused,

Heh, me too now...

All the best,

   Wolfram


--hhg3pbewrmu342gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZnYhAACgkQFA3kzBSg
KbZpig//QP4nnffFi5xZr8sS7bIwHi5bgHj63xKiiZPo9phX50JZDc08N9DqQq1t
JgwARucKUI8SnDiz014YSRK7qo7rgrsHeOvFQCA4CrJqT7g/J4OthDXA8UeXtjFC
PBWtJXvHWxDD3EuA7IxeokvbuyEnpW3f83f67sagPsOgz6dqlOF9Kr2dpHJNOEum
PCkZidzKkELrxq7mCNn+4Z+Lwl2j/CymkOOl+Wa/4A+nYkh7rM62ZLj+b5ac25mT
BGZQTl+50o+gmkvZdQdh/kUh/4fwCbQ2rl/xrVyFvU0ZeHB5Qp9qGEuTFQ1ExecO
tbvwC9DhJrLk0QUt7nbZGYhbq1fComVTQzx/aLVww45MOJaFEGgi1Vi1WQ/mc7se
W3vR5EOPxx4p7naEkF25wTsyTSrd576i8tYttGnH6eEDOKQVv6p5wv2xfF2Ztqe+
l8VCVreh9gDeBIqilFsTq4YXhxeWGdoSqeC01pzTaxcQckjJPDyjjJ6R1O0LEUwc
ak5MTP907y1Z3FPUtzPioGBhDMoJ/zWRVHq18MU2hj11/2p4YOfqCrjbq9ZwJB8j
aOfrcydevr8OAK+v40pCvYw7tVrjG5oqC01HBWCaj2zc1Tlof3VVNPNjq2A5vHnk
xA+X89zhDcuRhdQRCNcRD8x24qHAbqJTlyUSFNV6TRR2tnYikLo=
=Oyu4
-----END PGP SIGNATURE-----

--hhg3pbewrmu342gc--

