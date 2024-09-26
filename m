Return-Path: <linux-i2c+bounces-7015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE693986C91
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D715A1C2495A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153C6188731;
	Thu, 26 Sep 2024 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DURab5bT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31271D5AB1;
	Thu, 26 Sep 2024 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332495; cv=none; b=M9B2isKsuzKa//uSFDW8LLwIXUeFRGQqY9a5D7xKs2NBEXR9CBQwHvjSK9h6DBkiT450BvdZI7FHQNqElVsyJ0ChIbwUN5m2g6TaisSKI1pKdmZFMt/w20uAGepYXMKyAEpp7saZQDBRryQTP5RKMNQRfG+IkD6zCF1GXXYEj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332495; c=relaxed/simple;
	bh=S2S77/Fm8eGJ8tkVfDio09uTr+wfrhI7si5WI+gC/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD2TMVF4dMxdO4X3USTAU9mcFrzMSCHCP1UCG73QsCr8SF+BY/+nW5VcKHBK4dnkRB/awE/PRlK0EatYiO4xPmP3X5CKyNebZKPvCM6AotjmZ3Lt0syGiGH25pF+EPhK33wlAYh8RXnFsJN1mYlkTLVvb1QelnvPErjQOMuNgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DURab5bT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85747C4CEC5;
	Thu, 26 Sep 2024 06:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332495;
	bh=S2S77/Fm8eGJ8tkVfDio09uTr+wfrhI7si5WI+gC/d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DURab5bT9wbWK+IIgbbS5o3ZzSX92MHyNb2mGeVJN65cUkLZiLT5SsoLvtTFmnYrL
	 XkPXTnyh16M+FYGnK3c99UCBv8imHe0FInyZs8Ta7Nbgz1EXUNPpqyaKr6DcJ815ys
	 5GNb2zQ3B8GzR0Mo5ZgamKqfYSf73npk4w4MARepjFJTRRUEtQLpsvBg0ZkhB1p3RO
	 4S0OWRah9AL60qEmlQngQJlQG28xnouhfvqtrk78HyUfOgTEGPtnAP/mvpHxDDriRS
	 /vNm7Bnd2IQjqlkxko6qgtOYDXyusuRy5b8a46l10/VPs+E52GH4CI3sl2SzsDrLcx
	 xXfYBI+fX1SgA==
Date: Thu, 26 Sep 2024 08:34:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: reset: syscon-reboot: Add reg
 property
Message-ID: <7q5kwjudw2a3aow7sl4epf733j546z2cse6rviwt77o3wq24bt@vwyeahynhutf>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-2-chris.packham@alliedtelesis.co.nz>

On Thu, Sep 26, 2024 at 09:58:42AM +1200, Chris Packham wrote:
> The syscon-reboot binding used 'offset' for historical reasons. Having a
> reg property is appropriate when these nodes are children of a MMIO bus.
> Add a reg property and modify the constraints so that one of 'reg' or
> 'offset' is expected.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - New, suggested by Krzysztof

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


