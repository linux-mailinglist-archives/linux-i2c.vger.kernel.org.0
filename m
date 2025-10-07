Return-Path: <linux-i2c+bounces-13407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E887BC2B1F
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 22:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084193C82FF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 20:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E2F23BD1A;
	Tue,  7 Oct 2025 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi2TbDiq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35065227;
	Tue,  7 Oct 2025 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870151; cv=none; b=Te1DCw4DjCUDmXBWFoXaiQO8N/0O5IQxIHNKHexehRk3X+vI/dmaglt8kv+RB3So5A1T/lLKX5TG3QwrNGDRNLD7r5fSb0Ze3ukuNqxaW1fQh6KMD8Lo2UWU3Q5Z2pdODvcjXHK7CeDCThcyNzHv2wvzWUPUggcCekBKL6TJsuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870151; c=relaxed/simple;
	bh=EaFww+AteBs9x5Mdj1PZzJJPkX0MNrmJtb/x/NBSKZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpHAtvdcVUI57VCEdfMlBfojxxWGU5q7pWqoSR+GcMMFndyAI5e0pizjHni8NMTNlXCPin5Hp29fIH2zd6gs9AvmLRrutnD17c/kKpeEpklYoaY3a7Sm8RDjmvav+I7CCqPpc3CEws9nzFAMbkpR4qr/eDxutBSZj/M1UM1LgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi2TbDiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B4EC4CEF1;
	Tue,  7 Oct 2025 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759870151;
	bh=EaFww+AteBs9x5Mdj1PZzJJPkX0MNrmJtb/x/NBSKZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi2TbDiqMuL8Bq2TxziXjd29Otc0Zha88N7bLPetAmnkzdDzvgsQQ5Ks8vKB9s5Z9
	 OhYLg7UCPTQeOVaaVEqMDKeKNSBS4e69VdXEIlMigvsr13EzPLfQqE/S4kNmC5W8Q5
	 ByHeBoifqfxmOAp6GMONrjW6FBl5MQV7/2Qnw7CZaXt+XCrgx9HOKw043HbhybNSfM
	 8KlBYEPTedUYwQC4rLEKJyW83FWkz+ltVyFpDcqwXYvHzPMKZ1XQ474b/JbNf2J8pT
	 JhOseYrGTnCkC5iouTM/k4JlzKaDrf7n5g8EsvYNhBtuYgjT6a/ZiK8ByzdFeMaZ4s
	 uG+aMm2RxSaZA==
Date: Tue, 7 Oct 2025 21:49:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Kael D'Alcamo <dev@kael-k.io>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT
 schema
Message-ID: <20251007-computer-animation-b7e6322f234b@spud>
References: <20251004154808.116143-2-dev@kael-k.io>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lCP7PNDosPoQdFe7"
Content-Disposition: inline
In-Reply-To: <20251004154808.116143-2-dev@kael-k.io>


--lCP7PNDosPoQdFe7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 04, 2025 at 05:48:02PM +0200, Kael D'Alcamo wrote:
> Signed-off-by: Kael D'Alcamo <dev@kael-k.io>

With a commit body,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--lCP7PNDosPoQdFe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOV8wwAKCRB4tDGHoIJi
0h5nAP9XALoblx3krFyNWX9eAG/scYhcUYk9v+kb5EzKKUngkgD/Qg32WQX7zjGx
R4P46EDr5c4tN3b3xqr5XJBfbB4ojwQ=
=Ceti
-----END PGP SIGNATURE-----

--lCP7PNDosPoQdFe7--

