Return-Path: <linux-i2c+bounces-14078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4867C59CB0
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 20:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C413A87E2
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 19:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AE12FB0AD;
	Thu, 13 Nov 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEQAPJkc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A8319879;
	Thu, 13 Nov 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062605; cv=none; b=M3tY2/PgvbYHWWwMIUoFvP9FPmHeMweOk5pgiEK6CAeic38YyGNM1jpnZ+Tky7gsSxVqqwvC3mM7jfSwqJrhC/vyA9TAPS45H2hbf42lRls07ERssirZiKEtEySOcZSOMLLkuFeE4SpJzPNL0RHNWRsCyKpUh3ivGuq6HWhVuN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062605; c=relaxed/simple;
	bh=LwV1U6Cq5cEu+tSpRxXgRX2MHT6VLD5wV+cjhY8i3yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8qMxZrkXHdkfaMlwkMeubHeHOM6LUZvCws5nR2lWaeQAAhCm3NDiCusuqweYyh4y+Lism7AI59qHEFzOTMMLFlEJHIPugZc+My9rEkcfvzAjgvumZUIp8JDnslaA/tF4EpDsUhe2Y6D/Qr/n2fIzfmhgk8Edf5r4HKXBr1vu0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEQAPJkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79014C4CEF7;
	Thu, 13 Nov 2025 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062604;
	bh=LwV1U6Cq5cEu+tSpRxXgRX2MHT6VLD5wV+cjhY8i3yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEQAPJkct/DFPHMCGZE/tTEZrMl33vAfNdSvZBbFcLt57tqkUxIltVnkFH280xpjJ
	 lS1NPtMLYSSO5kvF5Et/AVIOIZpthQEdaSdtZWSUe3eViGUvu5l7UkYxeKkprbu0iC
	 LuafCxkfdpEq6iPOka5zLmd9MRSUniAK0rHyVV0aeYBICrTwoU2JsCvBFZRSM6WOyP
	 +M4149rtgdigLaHrp3t41U7WWmhqfRPFslzlKXll6sJpfQuELEEWEBSdshktyVO73I
	 B8JHcpcKFIwM8xopN4VIsiQfhqcnkFwSYSZNKxM4X/UftoYTfTmSA2vlPP1uIg+CMl
	 jwpcoUY9W5VDw==
Date: Thu, 13 Nov 2025 19:36:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c
 compatible
Message-ID: <20251113-zeppelin-parasite-64916707f9ab@spud>
References: <cover.1763018288.git.zhoubinbin@loongson.cn>
 <75ff6d9ecb23082cb656da5936a5c4ac0a98074f.1763018288.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nKXF8pIjq4Op37EP"
Content-Disposition: inline
In-Reply-To: <75ff6d9ecb23082cb656da5936a5c4ac0a98074f.1763018288.git.zhoubinbin@loongson.cn>


--nKXF8pIjq4Op37EP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nKXF8pIjq4Op37EP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYzSAAKCRB4tDGHoIJi
0mZXAQDd3RrI00A5vVFloAvephXoJ1I28x1MhBR0hjnC8t1SfQD9FMx5WSVRmP4V
61FrNSIUiyQCVaYIgmW4+r89Sk9EwA0=
=/hpM
-----END PGP SIGNATURE-----

--nKXF8pIjq4Op37EP--

