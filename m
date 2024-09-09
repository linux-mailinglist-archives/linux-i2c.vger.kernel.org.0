Return-Path: <linux-i2c+bounces-6448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E39959724DA
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 00:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9972C1F245B4
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 22:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA2E18C939;
	Mon,  9 Sep 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQxyacZq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CC17085C;
	Mon,  9 Sep 2024 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919241; cv=none; b=KPI93kEssoG1zSpMEpEmXPquuB49ToTcgYOnFbjV6CBt7qYLKb5MEsIRnep6IRz9AJv+FFIM2dtCvGbfgEdJPhZZc0oO+44ucFxC7OdQPrXXdTEGPGlGjWmvoegdnlRy13Nn7XSM6+l+//4YRHkqKYjGu+xGaBDK1nmY/IlEOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919241; c=relaxed/simple;
	bh=JGqxWA1KpqkAc55m1tTC6BCwYiBtn9t2WlYbKLNP9PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7LTXBUPaCpQdJxHG8SxPM471MOStfjEMmgVhfFTSHGkq3ACgq+APyboa9FzIZJAnDgICCdN7sBdIXBRuqtHIIF6zuSXMC7Co2tinYkIw12v9oaz/whXBOcG0cs26YHEwJYV7Hf4pZIBUOTM39HeTvDnDITYrucP8n4HGZAeJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQxyacZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22797C4CEC5;
	Mon,  9 Sep 2024 22:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919241;
	bh=JGqxWA1KpqkAc55m1tTC6BCwYiBtn9t2WlYbKLNP9PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQxyacZqx2mx4EIfylMDD80N8nKpi6Z4sD/6j/wb42m457LVQ7pSUYuqK9GwJ591u
	 PbP+1nkeIN/X9dNDZ+QlCx7QuEuRErypeBcRu04QZcCVboJCDgqIAoCZlUQIoaZ3ry
	 7yEiOmZB03zKzR2vJjhBoA1r0BTUqVtYhw9gX5VdjH7qmXrvgfaT7Ux6Om8uea3lgk
	 k3uIZrrYN8N0cpQA3ftiduW3sSUipu5n8RYtU192usneRZ8bZN3ZxBrr1R26ApGpSO
	 22OhK7XfNoCuee+oiepdl8ebEpfvTsT05+vRXrdkfbAMAYGjE2ObeU03mP7wkJrL0L
	 3oNMpguap45Qw==
Date: Mon, 9 Sep 2024 23:00:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <70673636-5b44-4b61-865c-83f9c5d3501d@sirena.org.uk>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <d206e315-3324-4814-b98d-027c3af6ebb6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+4FsY8uVcR5U7FtS"
Content-Disposition: inline
In-Reply-To: <d206e315-3324-4814-b98d-027c3af6ebb6@quicinc.com>
X-Cookie: Anything is possible, unless it's not.


--+4FsY8uVcR5U7FtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2024 at 01:29:37PM -0700, Nikunj Kela wrote:

> Now I am confused which prefix format shall I use? first spi or first
> dt-bindings?

spi: first.

--+4FsY8uVcR5U7FtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbfb/0ACgkQJNaLcl1U
h9DmmAf9G79iJqbIo+rLvhxVQG/V00Xz3Y1hZjGbPTyKNQIuiSThwS/ZexjpAnky
dxPN6CKinfv2CcaHSqAfTaiOX7e41E6yQe0MhZRHgvnp9GWDwzFR+vo/Jkf7vOvk
FdHkgDxP+8DqOEk/JvSsuUbeWBm8+6SYmz3aY49ZDdTM/AWXoLpfIuRG9HHI4oC0
pcewKeElbb4mm8XtAESmg+SfofXpaXXqWnzrqGfKnG2Jhz2SYaDIbLUzRrIcMyQC
UkUJzcsdp019ZGJl0xUhb05YlxUPnZ2vQ1OJaDh/15NkTWCoSTdDX1WTWjHtmjfB
soCaA83E+/cUHrHnZjH7ZOZFfA0F2A==
=OtuN
-----END PGP SIGNATURE-----

--+4FsY8uVcR5U7FtS--

