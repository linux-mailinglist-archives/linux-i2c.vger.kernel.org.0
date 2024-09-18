Return-Path: <linux-i2c+bounces-6856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10197BDF2
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 16:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F35282B84
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFDC19ADA2;
	Wed, 18 Sep 2024 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6/xG7jP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549719AD7B;
	Wed, 18 Sep 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726669537; cv=none; b=qi/+Y0kQoTpDJbpN51VBfNK9vLKMqxaNfwfGxgNWMYpcbWXiOOY9Y10cWf8yiuySz2KlutoQJ57g2ZKuIhUN/yRubrMW9T/SZk3egmQfqcxc7R8Ap9yrl/Yvb5oOr7HO2JogaphgkRb0cQJfnlKTAB7lMkATQtWKRkH0BOyX2Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726669537; c=relaxed/simple;
	bh=LiIZYaEnf2qPYrXez8fE0c6tVSv28NruGjWFEONPD20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCTRmmJlMpHxLzw/qY6MhiS94YklmDvCCW6SK1zIPYp7eWIRlXPCB1zY1Pzgpfr12QPL+av3iM3yXensxWhE5ypb5e1KgpUr/uRrwS4pDKBXIpCFbIBTJuWrYy987gHavrW7hLgrS4tcDsvwiE6bgF7EAUAJT8itZugBS9LAqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6/xG7jP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D342C4CEC2;
	Wed, 18 Sep 2024 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726669536;
	bh=LiIZYaEnf2qPYrXez8fE0c6tVSv28NruGjWFEONPD20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6/xG7jPJCdshOrc/0Cqrx3rHUjVcjVpCKJjmF3fM3yT9W5fRXkPj/W+If8wLal6S
	 u+rjtnOjYobThMmsGn59gcypx2goLW/SOg54ivppEOUJb5/3lduoSAOeZjh6o5vhX7
	 3tKP12qRJUiho7VgZlSNyEjXSpSAxRA5GPSvNjrZeFLJ3sItzKrdR+OcfRm2hCVu7/
	 KY8Dkyf+3A8aZ+sJIifW4FYMB+UFzGKtXUhD89x5M+lcP3qPz9bYELa/trIrY0Hu8i
	 ER7KkvGnZ//8SXpAR9UUHisD17RnfPn+2FEoT7CUh5nfbiuxtJT1pPb+aOHRXB9Da+
	 rW9cJS5CnUYMg==
Date: Wed, 18 Sep 2024 09:25:35 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: i2c: Add RTL9300 I2C multiplexer
Message-ID: <20240918142535.GA1519783-robh@kernel.org>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz>

On Wed, Sep 18, 2024 at 11:29:31AM +1200, Chris Packham wrote:
> An extension of the RTL9300 SoC is to support multiplexing by selecting
> the SDA pins that are being used dynamically. Add a binding that allows
> us to describe hardware that makes use of this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/i2c/realtek,rtl9300-i2c-mux.yaml | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
> new file mode 100644
> index 000000000000..a64879d0fda7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL I2C Multiplexer
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +description: |
> +  The I2C controllers on the RTL9300 support a level of multiplexing. In the
> +  simple case the rtl9300-i2c binding can provide a single SDA pin per
> +  controller. This binding allows a more than one SDA line to be used per
> +  controller providing a level of multiplexing.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl9300-i2c-mux
> +
> +  i2c-parent:
> +    description: phandle of the I2C bus controller that this multiplexer
> +      operates on.
> +    $ref: /schemas/types.yaml#/definitions/phandle

The mux isn't a separate device, so I think this should just be part of 
the i2c parent:

i2c-mux@36c {
  i2c@0 {
    ...
  };
  i2c@1 {
    ...
  };
  ...
};

And then you can get rid of the SDA pin property. If you only use 1 pin, 
then there is just 1 'i2c' child node with an address matching the SDA 
pin.

Rob

