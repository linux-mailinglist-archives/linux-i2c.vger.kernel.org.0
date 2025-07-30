Return-Path: <linux-i2c+bounces-12092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624FB16907
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 00:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE36164888
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 22:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9C822FF2D;
	Wed, 30 Jul 2025 22:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmjo2jH/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC521CC71;
	Wed, 30 Jul 2025 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753914574; cv=none; b=kyp6DPiE+6w2W3dN5lxmp2tCiP4gh9UsojbDK44XX+c8CVkGNmUlY/Ysg17fsdVfzN/gIsizlLqMPvyF1zjjgUoAhIf9pbUuP5QPE+yVxZ6RXtSzCBWuEWBVbKVa3xiZRBy6BeJZN1q2GveRut9hCTotDpacEp5MyG0y52YoGMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753914574; c=relaxed/simple;
	bh=T4igBNcl9uD7+RKUKa48Z1nfQzCLhPJw0xghu6Yhp1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZNBmojyODvt7ePDCVl3G+MO9spS9Pr6M6Vvge7TC6YPHuFjVVfHBI14tHoqptbM9LDGNy++J2JmIv6EOgQxMKYrfReiZb2PmlvQspAMR8iKK/q2e24PafsACjgkbMur0l1y968fk5KqNlrnth0klK46ldJhYjM1f/rIRvZp0yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmjo2jH/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BD1C4CEE3;
	Wed, 30 Jul 2025 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753914573;
	bh=T4igBNcl9uD7+RKUKa48Z1nfQzCLhPJw0xghu6Yhp1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmjo2jH/evhrq8kCXIP1W9T+BNl3rmWErKpsVnhDbKdGNMTBWHVweRLmIbXXmKv0P
	 SgLfCalCVl0F5hazntHgxr+QoNG39Py/kdxhxBCjSTMOOi1qgm1D8duLRPniXgJ87L
	 zkO/pbl3+mFqPFosmIqUcX1F305we+NLNFsNbouoy3vlILXCBrd1JxedN+RxAWz0FO
	 /C2fFl9OBGR97iCCh178sVELjoMyckmgo7531iEuPEwp2awT5vjgHvxPcOO+wwXK0i
	 b7azWJzznzSHi7+K8JZOy5NarXNHKkxw9Q9HlKVLPkeMwdbzG09yNh5+6hu75u4d7Z
	 a+G64Noqo777A==
Date: Wed, 30 Jul 2025 17:29:32 -0500
From: Rob Herring <robh@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Message-ID: <20250730222932.GA1810634-robh@kernel.org>
References: <20250729075145.2972-1-jelonek.jonas@gmail.com>
 <20250729075145.2972-3-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729075145.2972-3-jelonek.jonas@gmail.com>

On Tue, Jul 29, 2025 at 07:51:44AM +0000, Jonas Jelonek wrote:
> Add dt-bindings for RTL9310 series I2C controller.
> 
> Adjust the regex for child-node address to account for the fact that
> RTL9310 supports 12 instead of only 8 SDA lines. Also, narrow this per
> variant.
> 
> Add a vendor-specific property to explicitly specify the
> Realtek-internal ID of the defined I2C controller/master. This is
> required, in particular for RTL9310, to describe the correct I2C
> master. Require this property for RTL9310.
> 
> Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> index 69ac5db8b914..29676e99a8c3 100644
> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
> @@ -10,9 +10,11 @@ maintainers:
>    - Chris Packham <chris.packham@alliedtelesis.co.nz>
>  
>  description:
> -  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
> -  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
> -  assigned to either I2C controller.
> +  The RTL9300 SoCs have two I2C controllers. Each of these has an SCL line
> +  (which if not-used for SCL can be a GPIO). There are 8 common SDA lines
> +  that can be assigned to either I2C controller.
> +  The RTL9310 SoCs have equal capabilities but support 12 common SDA lines
> +  which can be assigned to either I2C controller.
>  
>  properties:
>    compatible:
> @@ -23,7 +25,15 @@ properties:
>                - realtek,rtl9302c-i2c
>                - realtek,rtl9303-i2c
>            - const: realtek,rtl9301-i2c
> -      - const: realtek,rtl9301-i2c
> +      - items:
> +          - enum:
> +              - realtek,rtl9311-i2c
> +              - realtek,rtl9312-i2c
> +              - realtek,rtl9313-i2c
> +          - const: realtek,rtl9310-i2c
> +      - enum:
> +          - realtek,rtl9301-i2c
> +          - realtek,rtl9310-i2c
>  
>    reg:
>      items:
> @@ -35,8 +45,15 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  realtek,mst-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Realtek-internal ID of the I2C controller/master.
> +    minimum: 1
> +    maximum: 2

We normally try to avoid instance IDs. Why not just a property defining 
the SCL # to use.

> +
>  patternProperties:
> -  '^i2c@[0-7]$':
> +  '^i2c@([0-9]|1[0-1])$':

Unit-addresses are typically hex.

>      $ref: /schemas/i2c/i2c-controller.yaml
>      unevaluatedProperties: false
>  
> @@ -48,6 +65,25 @@ patternProperties:
>      required:
>        - reg
>  
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: realtek,rtl9310-i2c
> +    then:
> +      required:
> +        - realtek,mst-id
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: realtek,rtl9301-i2c
> +    then:
> +      patternProperties:
> +        '^i2c@([8-9]|1[0-1])$': false
> +
>  required:
>    - compatible
>    - reg
> @@ -68,3 +104,15 @@ examples:
>          #size-cells = <0>;
>        };
>      };
> +  - |
> +    i2c@100c {
> +      compatible = "realtek,rtl9310-i2c";
> +      reg = <0x100c 0x18>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      realtek,mst-id = <1>;
> +
> +      i2c@0 {
> +        reg = <0>;
> +      };
> +    };

Is this really different enough to justify another example?

