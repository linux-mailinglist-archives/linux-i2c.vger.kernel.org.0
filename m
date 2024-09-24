Return-Path: <linux-i2c+bounces-6954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E549984127
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 10:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0EC1F23735
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EA61547F3;
	Tue, 24 Sep 2024 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoqrjFIK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D57450EE;
	Tue, 24 Sep 2024 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168125; cv=none; b=MiypQtNyvlX2UpRDmnmF6pR7Y0TQ31fQ4L7Th0csvQ5DjsBzn+olsqV1dDSf/9mrF4GSlbicVfINubEJ2SpIEyIBXLn8zH+vSXgZkZXfONDrB1mnJgM8RlA4c/In2+d3gJojqYbsqm3ovsE9DOHbwpwuCvj0rJjjhFUjKXctp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168125; c=relaxed/simple;
	bh=AF/TqDJ7nws4BZEm50+7bH9O/iYwDovQhJ+Sea3Kl4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bglByXV3VmRW3LnmbkR23jfR/kOrb5DZQX+CboyjYAx23iXaeQQpYM5OkwhF9JP11yfjLD2+B7iSvO944kAw5AJsyUhmVtwiul25SnJTgCora/SA/ZHRLihUwdJMqtJetqSH0jXsrgreG5DSa+pFhZqcsc7YEg/L5D42u1MQBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoqrjFIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B6FC4CEC4;
	Tue, 24 Sep 2024 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168124;
	bh=AF/TqDJ7nws4BZEm50+7bH9O/iYwDovQhJ+Sea3Kl4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HoqrjFIKDwwx2wreLl6lJ5v0PMjXZUsVuVQBrrQPqZi1mcfS80QdM82bRx51EMh50
	 yi+nenkv0GVHrfQqSSgHMUnWXDkl6/EAK21GXOQJbKgvOi6o3sLrnto1deZPNDceWx
	 3EcLktQEF2wOJBBoPwECgzAtklEIlgY+DS9S1i/bVyklEomd9BOCPJlk3M6e6e0U/X
	 bgSZLKYVTBPviWP3fVZwejVNeq52xr2YgZl8rssZnK5eKftEnf/SbSe5gsl6NjjhJD
	 rEmkI3gtLYJ9TqkDbN9BBN6zWrZpZZkhLhl5AlCaYanrVGpByIJgrXkZr12Bri2wEG
	 lXM8peOC84Q6w==
Date: Tue, 24 Sep 2024 10:55:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Message-ID: <uxv5kzjo5btypvca5vh27i7xkajyqvbqtkys7xcmfz5ltmwezv@fgrlz4yzznri>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923230230.3001657-2-chris.packham@alliedtelesis.co.nz>

On Tue, Sep 24, 2024 at 11:02:28AM +1200, Chris Packham wrote:
> Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
> controllers on this SoC are part of the "switch" block which is
> represented here as a syscon node. The SCL pins are dependent on the I2C
> controller (GPIO8 for the first controller, GPIO 17 for the second). The
> SDA pins can be assigned to either one of the I2C controllers (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v3:
>     - Remove parent node in example
>     - put unevaluatedProperties after required
>     - Add #address-cells and #size-cells
>     
>     Changes in v2:
>     - Use reg property for controller registers
>     - Remove global-control-offset (will be hard coded in driver)
>     - Integrated the multiplexing function. Child nodes now represent the
>       available SDA lines
> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> new file mode 100644
> index 000000000000..979ec22e81f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL I2C Controller
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +description:
> +  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which

This is confusing. It took me some minutes to understand that two I2Cs
in the example do not match what you wrote here. I got there only because
of your DTS. Your patchsets - sent separately and describing problem
incompletely - do not help.

This is the binding for I2C, not for RTL9300 SoC.

> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
> +  assigned to either I2C controller.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl9300-i2c
> +
> +  reg:
> +    description: Register offset and size this I2C controller.

Nope, your reboot mode does not have reg. Either fix reboot mode driver
or this. Preferably reboot mode.

Best regards,
Krzysztof


