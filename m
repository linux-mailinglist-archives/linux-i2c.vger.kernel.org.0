Return-Path: <linux-i2c+bounces-7048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E603C988056
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 10:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84C5282892
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0BF188A13;
	Fri, 27 Sep 2024 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o59cfUGP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C8EEAA;
	Fri, 27 Sep 2024 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426112; cv=none; b=HRtfLEdh9QvaHy/hEmcXEZOBIy8VPOeWtCGpwtVaD6wAuKF7N/pMyJQsAPmly70WbaubV3rm43G3waQhcvA4QVB4DCyxvdcx9oIgX9l2Z79xWOHoZLTrBf1tkUHtFez3lRroA3ERlE9EID2Kx+Xqvbme8lGlqj4EheiaOcWHM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426112; c=relaxed/simple;
	bh=9g4VPRK3m4EtOdbzcHEf/DIiBw9NngEa8O7LKk1CgFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1GiiHoCCKTUT5ad1VK2sjE/6FGAp2I7ckAN7xqjpUribmhVg1gD6PkRhO9/nJ2JkgnggxQPK2McAA1ApZoHwSKW/GZG8Txt2M+bL96/fja/zJd5ue+q4Zp6VfLiNIBtr3IYNCoDqkeCkOgVc3GHg2ylr0wdPF+I7/PzngYS1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o59cfUGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC63C4CEC4;
	Fri, 27 Sep 2024 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727426112;
	bh=9g4VPRK3m4EtOdbzcHEf/DIiBw9NngEa8O7LKk1CgFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o59cfUGPl5JVsZlQRpBUTxmq27dmg0XZmva/mYr6cptRGy5KGkQHX4UwMnbLJvfy8
	 jHWjJCvVjdqFfVZWKUL8n1kB/yvEsEJ45F3r0PesgPUS8iPXtCyPBWND9WJ+uqWUCO
	 9rLk0akBytT1f02pXgqTmst3Z0QjeyVTkdvga+qPZRx9T0QHKMxkXBkZA4JmL0qRRX
	 q9la0TlT0jaG4bRg3Ts3hutcLJspxEKbLxsQNI/vdMS76Ojoz93CwCWQvblHSW09Xw
	 N7fR2zykQkfvM/DF3UEh0+MUnlLsmDKnK0c3EEDEABl9y8tTVXerrbQ7eFGrn1A/pr
	 H/ronWJu9pMsg==
Date: Fri, 27 Sep 2024 10:35:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: snps,designware-i2c: add
 bus-capacitance-pf and clk-freq-optimized
Message-ID: <kr7z3qru7pfevn23pe2xwfo6vkg5m6gike6xdbi6cgy5vshtch@5nxuodh5xzuw>
References: <20240927042230.277144-1-michael.wu@kneron.us>
 <20240927042230.277144-2-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927042230.277144-2-michael.wu@kneron.us>

On Fri, Sep 27, 2024 at 12:22:16PM +0800, Michael Wu wrote:
> Since there are no registers controlling the hardware parameters
> IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
> declared in the device tree.
> 
> bus-capacitance-pf indicates the bus capacitance in picofarad (pF). It
> affects the high and low pulse width of SCL line in high speed mode. The
> only legal values for this property are 100 and 400, which are used to
> calculate the tHIGH and tLOW periods for high speed mode. This property
> corresponds to IC_CAP_LOADING.
> 
> clk-freq-optimized indicates that the hardware input clock frequency is
> reduced by reducing the internal latency. The property affects the high
> period and low period of the SCL line. The property conrresponds to
> IC_CLK_FREQ_OPTIMIZATION.
> 
> Signed-off-by: Michael Wu <michael.wu@kneron.us>
> ---
>  .../bindings/i2c/snps,designware-i2c.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index 60035a787e5c..fc19e6a8b306 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -87,6 +87,20 @@ properties:
>        This value is used to compute the tHIGH period.
>      default: 300
>  
> +  bus-capacitance-pf:

Why is this generic property? Is this going to be applied to all I2C
controllers? If not, you miss vendors prefix.

> +    description: |
> +      This property represents the bus capacitance in picofarad (pF). It
> +      affects the high and low pulse width of SCL line in high speed mode.
> +      The only legal values for this property are 100 and 400, which are used
> +      to calculate the tHIGH and tLOW periods for high speed mode.
> +    default: 100
> +
> +  clk-freq-optimized:

This was never tested.

You got this comment already and not much improved.

It does not look like you tested the bindings, at least after quick
look. Please run  (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +    description: |

Do not need '|' unless you need to preserve formatting.

Missing vendor prefix. Missing tests.

Also, extend the example with this.


> +      If the hardware input clock frequency is reduced by reducing the
> +      internal latency, this property must be declared in the device tree. It
> +      affects the high period and low period of SCL line.

I assume this is hardware choice, not driver?

Best regards,
Krzysztof


