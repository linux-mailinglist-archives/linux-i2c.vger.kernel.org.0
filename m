Return-Path: <linux-i2c+bounces-9358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13178A2DDAF
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 13:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C28A7A2B9A
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Feb 2025 12:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8F21DED69;
	Sun,  9 Feb 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1KmhbB6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE71DE8B2;
	Sun,  9 Feb 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104202; cv=none; b=XFzpbctgL5w6KdctRAFRZA0cXEMUTzM4xeUwT2vKco4kCSuglsvwXZLbdBXcGktWtZlY3lVejPFqzE88Jx4f0Kkw3Iaz0dtxnyxGV7x9wywUEGCH00X8LhPkQgZpOOl8oVplvVrsI7bjr3aVlYZVyPGnOBLzxX+5FNsjGIlwsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104202; c=relaxed/simple;
	bh=xqukpy26Z3iegl+pF+dGnvIJ1lAU5wpCM3dnyuT+zfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiDtxowA/SoQSmB9WrJwIIk57IrWpdS4rOvU1JFx9LnulduYMy9Fdrj+LPP5xkZXEJ2rrT5ixjMmgx85gdIbn+hk72WJa+HIGh7ub3kGcJEge9k6AzUif1F1PQ3FZ49o0r20boBM1JMkbTT43XEuJqSK5RXzs73KjuI1Lm1Sm0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1KmhbB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DB1C4CEE6;
	Sun,  9 Feb 2025 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739104201;
	bh=xqukpy26Z3iegl+pF+dGnvIJ1lAU5wpCM3dnyuT+zfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1KmhbB6cgUcGLeFTVZ5Oky3jL1mtVQpx8ZkHuHoUjDHyv39vF3rXGYvcUywfrHC8
	 ZZQMqezBXHUAM6EQsMgP9yKGb+1jwGqMuDSy+YWyOLu2aXWwiY3yyGqFEt8ozrdSLz
	 4tQDLQfk/4G8JgzE/p4LbEeXBrU+LB0/JBIv/UM38SqdZk3hlaVtSktYfHnoXK3h8W
	 JgQh7Nd/5RbOn5bhWCQS24VoZqQqWS0VBOhPYvAZWWRN4iXHBzLAkslUr0Etpqu8sV
	 LNk9mXk7qHUw9H6DcctFdGpKA6QYsSCfohIm1W/9Kv0NGZ0lgCmIqU9CN2vubbZycB
	 yeXIl+OfdLk3A==
Date: Sun, 9 Feb 2025 13:29:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: add atciic100
Message-ID: <20250209-antique-camel-of-assurance-390cb9@krzk-bin>
References: <20250207021923.2912373-1-ben717@andestech.com>
 <20250207021923.2912373-2-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207021923.2912373-2-ben717@andestech.com>

On Fri, Feb 07, 2025 at 10:19:22AM +0800, Ben Zong-You Xie wrote:
> Document devicetree bindings for Andes I2C controller.

Explain what is the hardware... Here is Andes I2C

> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/i2c/andestech,i2c-atciic100.yaml | 40 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml b/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> new file mode 100644
> index 000000000000..cf96a9186176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/andestech,atciic100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes I2C Controller

Here as well

> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: andestech,atciic100

But here atciic100. This is all confusing. What is the SoC? What is the
name of this device?


Best regards,
Krzysztof


