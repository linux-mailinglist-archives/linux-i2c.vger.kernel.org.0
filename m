Return-Path: <linux-i2c+bounces-3575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5618C89DB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 18:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984C52814F3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 16:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EDC12FB2C;
	Fri, 17 May 2024 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGBhi2/R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653D12F590;
	Fri, 17 May 2024 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715962503; cv=none; b=K1CP2cwRk2krucczot/xB9b78Yne4zqlxIN/tl4II/vWadfIXWNfqmdOYIPSgRqWEJx3XdEeDmT65ZLRhNDxN4nx6KL1WzIK1T/vQ9Wgw3DtIAI00aQQFOltcDfI7AYdiWIWNx6RcjqDcg7Wp0r2U9fA+SqMyecp9xrRA3F4/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715962503; c=relaxed/simple;
	bh=0f3VHO7RMXtFaZP126+RB4mZ3zyGDNwOOkBNFAvaZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEB7qCQJAAdVoPIF7sIkLTimtDotUybEGLgsvoL9kt4hf7CvsrFaUTU5RqW0Gg0QImCCrebeIrnlPg77Jj3yMRzqsFF+CfiZZJ5Wc94wpRHTnGiQD+eZcfAiyrLCAmrYm18GGGOlOleHSbvlWWhbEkhUXbZx2pHSL6L9Xcu3djQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGBhi2/R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE84EC2BD10;
	Fri, 17 May 2024 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715962502;
	bh=0f3VHO7RMXtFaZP126+RB4mZ3zyGDNwOOkBNFAvaZv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGBhi2/R7jd5bbFZeGp93256IL1NfP37VfriCxbtPRXXBM/UO46rHwSnkq9GwlT7q
	 1/WifOsWUEVrtOv9GvCbaan5KIZUTW2zbkqnR3CzZ2ArvVQ/eXxBibJ1Icsfoji45y
	 BLUczPx09k4B1wDNUELj2utnlqphZu+y2aPFhhVwlAeDdcEqHmqbJFeQfVvAFz6J6a
	 5jqZvhaJXFfqXcs3skFv/wyRkIIjoAJfroTVgvOzMRj1StYwDRGUG/ef62SqONbrGV
	 KzVvPlmpXiGtlLJbU4BXpV5m5xFcci1jkUfOMgHdzt5VZgTh03xNbEHmntBd0zQWN7
	 yhCFadwIohJTQ==
Date: Fri, 17 May 2024 17:14:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
Message-ID: <20240517-mummified-judicial-3e25bf4b760f@spud>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
 <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="71HbPEXGH1oiwxL1"
Content-Disposition: inline
In-Reply-To: <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>


--71HbPEXGH1oiwxL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 11:09:53AM +0200, Thomas Bonnefille wrote:
> Add documentation for compatible string thead,th1520-i2c which can be
> used specifically for the TH1520 SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--71HbPEXGH1oiwxL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkeCgAAKCRB4tDGHoIJi
0gf6AQCpyToQ+uzYUl89vhM5TD0TeV1Wj/3Dy1R7kpdK3ljLMwEAl/QQkdxlsEzs
53qFdL5/5XDkqkdArBN22iyImZG/1gs=
=1DWo
-----END PGP SIGNATURE-----

--71HbPEXGH1oiwxL1--

