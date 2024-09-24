Return-Path: <linux-i2c+bounces-6952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E35299840EE
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 10:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FD3D1C224BA
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 08:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA28154BF8;
	Tue, 24 Sep 2024 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyYtC09+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3E1514CE;
	Tue, 24 Sep 2024 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167580; cv=none; b=Kp2PJ6BUtaTzNjql33AkUxR+OrLXuc7u8Fvja/fbCoNGaiV9+rlqRzfvtIewKzIFVYBoJ5m4VPOB11W8tv4puy4VjNLm3wkUnm8NLCrcmfMYIt+DENT2bGX5lQ+BcFJOXfaqN8NUfC2KuWVBfK+vre9dMQTvdEVy7e4GIzu04ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167580; c=relaxed/simple;
	bh=B6uvYaPnjBz1RUY6tHRjJdMEouA95lD9v4gxdsvVmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spY/7CY9XhmFxtX4tRxj3wx8ZCLNYRIwQyXL1+er1hNlZrkkmFi5pnAdnooSZQ1OsGTSV9OXH9cJIUaajqR8Dt2i3uppe60CovMlooTjegclgsUvytuSJqn98nu13JU0I9q/p4fBB0j/esMMEDUjmzA4w/Euxtg5Ksm1Aq+SIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyYtC09+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A38C4CEC6;
	Tue, 24 Sep 2024 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167580;
	bh=B6uvYaPnjBz1RUY6tHRjJdMEouA95lD9v4gxdsvVmsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyYtC09+JUgNfu0/O7noXrpIgoPW326OfymRuCS14HrsYIqVUkk0C+kMEw2mjuMzQ
	 ooQLDjJjMMexh3fx49vtZXOqB+BbMqD7b6+erCIS628OdKtMacjxPVvAc1XD/0R8Yz
	 rlYRYLWO6Afy9oCrgzje8KV0pOCovGu2U3OtX/QDBTVSdrUtoykrvmFIH8NJWXKohc
	 3sSFd5ZZDajNybaSL3Gfn6IHsqFQMhrseIU0uXccuAc4OhxnCSNSI/SNU2I9L1jILG
	 DmA/wmWwkuerZ/4Ed4H2TKZ+9dxuKNc1FTzbYXzpZ0UwY80mCbLHYvjQc7kl3c5G8x
	 810c2lzhf48iw==
Date: Tue, 24 Sep 2024 10:46:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Message-ID: <ppcr2rx3kkm5iiykbagv67fqmyoounmvdgscbd5d3t5e42ym2i@37csodg3qbap>
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
> +  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
> +  assigned to either I2C controller.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl9300-i2c

You need SoC-specific compatibles in the front followed by this
fallback. For each SoC.

Best regards,
Krzysztof


