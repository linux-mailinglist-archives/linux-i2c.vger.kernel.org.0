Return-Path: <linux-i2c+bounces-14190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B6060C72BD2
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 09:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10A43357542
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 08:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFF309DCB;
	Thu, 20 Nov 2025 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfBIh/CL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE693009EA;
	Thu, 20 Nov 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626434; cv=none; b=cSzkdrlPbfkPTnHRCp4dEqavtlOs0TVKNI+9t/kJwsLZa7Go30IDfyVJYA8QDLSu46JQFtgK7MdP4qWsTy61ISCspeAOoYmYAbNWvkMXfEV7yUQlIc1geEhGYRKVlY3LCnC7hTsvPqg4/Kxrbo5cihy/wtZ+0HWzNgSS9xx0ugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626434; c=relaxed/simple;
	bh=G9LXGufG/UQP5AIT5n6OMpjuYpG4fsbv9VqINY8RA0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vq3nNmjF6PmmoYDc3cJi23bh6eI5Wc7f5kB9OkGtYyLpAjp3aItNGr01QzAagJAFmoqYXaTvXrXieQkiZXs9QnGek1WQcOdMfddoBaR/r5nTgaMa2NG8x+xWR8L0bB7iNpnunUsaedSX2ixuAeIcaipfesgF3j9hW8TE8jpDNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfBIh/CL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1900CC4CEF1;
	Thu, 20 Nov 2025 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626433;
	bh=G9LXGufG/UQP5AIT5n6OMpjuYpG4fsbv9VqINY8RA0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfBIh/CLPUJs1yji8DrwVkAbqqNquYxkEsAiaruEwtyGTpX8RHSMkqy6tz7+eSG+9
	 qVZSyMlbZlXXVOAOmDZfaSc8EKhiKsl1h5ukZFuLwEoI0kAxrrUowoIgqKn4XArJNS
	 n8/28GiFhfQvuHlPLf+qS4hVBvGt7+8br2iwXljjy4tD1YkoSalbuXXOgoETo5FGzB
	 nTZ0HqzKxwrhUWE+irWLxXVeq2YwQsyTd1ZssRfcQ71xTRfJNzNOKghuJ6BFimLMF1
	 a065bnFoRcf8ugfo6OOfAJS6VZXyib3OEyoqEi8QJ/Rmh3dJHz51cPk7S+bIQq3LP7
	 7xVr0pcnL+htg==
Date: Thu, 20 Nov 2025 09:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <20251120-warping-logical-skunk-0674f8@kuoka>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>

On Wed, Nov 19, 2025 at 07:46:43PM +0800, Encrow Thorne wrote:
> Add optional reset property for the SpacemiT K1 I2C.

Why? You just repeated diff and we can read the diff. Please explain WHY
you are doing things in terms of hardware.

> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index b7220fff2235..3d4faec41abe 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -27,6 +27,9 @@ properties:
>        - description: I2C Functional Clock
>        - description: APB Bus Clock
>  
> +  resets:
> +    maxItems: 1
> +

Completely misplaced. There are never random properties between xxx and
xxx-names.

Best regards,
Krzysztof


