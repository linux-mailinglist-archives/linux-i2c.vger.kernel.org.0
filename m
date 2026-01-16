Return-Path: <linux-i2c+bounces-15210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E517D2E5FF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F83D30E3D42
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAF13126D2;
	Fri, 16 Jan 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4bO/bZf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017AB2E0B71;
	Fri, 16 Jan 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553810; cv=none; b=SpIdFfhVkUzVOeWD5PRMD7NaPnjIPpba3aYKgjpR1mlfXGOFJmVMr5YJodjBHCogfQBLU1VyyMPxqeZ9BixdsMsyx+ulitZylPPN4BfZ2+by1DKL5Xzqk2qO3SS+3nuJv/2oWSjuX94cKjeZg7OtvRinh+ljnRRSRXryjmg030U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553810; c=relaxed/simple;
	bh=FGueoh0MEGyZiMBtIFEzwKwWYuqylyX82TgCw7GsZQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjrPAPi4qBxGAjLjogLm71IkwkijEN+qeuBCBH/EZERn4cXAqS/+w2CMR6P5oPY817nJQKO7OmxCDCasXv/Ymxh+Y/fsPaUr+M/aMeajI2FycOYor/s3FDlM12T1Eg89D9J9F/5GcjbM+iq8ipXfLpFrhaiHdjPvHEDV3YxKAsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4bO/bZf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AD1C116C6;
	Fri, 16 Jan 2026 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553809;
	bh=FGueoh0MEGyZiMBtIFEzwKwWYuqylyX82TgCw7GsZQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4bO/bZfF3dn5MJcYGfb2Xp4kauPUYLI+laA9G9bu0uTo9vehX1LQYdj9iZsE53j2
	 OYedKTzxEMXSyl2fs091UXRyTgsgaUvSMQIdL2RebzNReLnlAjlrOkWHDw3dnCwYjr
	 Cg3qNif5qfY5PzncG1IVFnJRuWYLcFOO8HJAiQXZwNKV5YD1i8ZPJpIR9cTfvk4mdX
	 Pt2TgVAdzXJsI77XfB8O5yjazINwhGm4TBcclgw39ZQAHSq7dMuU49d9HFQkE1QrnW
	 9cBu3ddU30K1zz4Ki81gEpVx0hIVAAi5adMJpMoMMBRI9/kkvttyLLfwVxcwr+QGPb
	 IIAHo4OlFj/rA==
Date: Fri, 16 Jan 2026 09:56:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c: add support for Andes I2C
 controller
Message-ID: <20260116-tasteful-white-hamster-c47e7c@quoll>
References: <20260115145244.435890-1-ben717@andestech.com>
 <20260115145244.435890-2-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-2-ben717@andestech.com>

On Thu, Jan 15, 2026 at 10:52:41PM +0800, Ben Zong-You Xie wrote:
> Document device tree bindings for Andes I2C controller.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/i2c/andestech,atciic100.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> new file mode 100644
> index 000000000000..dcbcafc8d6bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/andestech,atciic100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes I2C controller on QiLai SoC and AE350 platform
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>

You already sent it and you received review, so I am not going to do the
same work twice.

Version your patches correctly and provide detailed changelog with
rationale of changes.

b4 helps here a lot and you should be using it if all this process is a
bit too complicated.

Best regards,
Krzysztof


