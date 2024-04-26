Return-Path: <linux-i2c+bounces-3189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1938B3036
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E5B2819D1
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FEA13A41B;
	Fri, 26 Apr 2024 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bihmPHJ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849D2F2F;
	Fri, 26 Apr 2024 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714112367; cv=none; b=WjocTor4ztvcF68rJ7knWQLrw1/qWMMYNwdgY4Ar+8t+uIPccHv49s8OQTOkno1BuiTCw8qKbtzeTxheaxVJhALDl2VYQel/rJXyPsQNeZU7C1BOrV2hxMCIFdcDa1MPyBbBfag8Q6ejG6gINLHH6NP+d2m9HUPfuszqUxzbYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714112367; c=relaxed/simple;
	bh=XyTI7ypwL9XuJwKRNN0RAtJ/sCeTZRClu7Qjug3+9io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n12yO37uTOhk22QiK+HABfzRk6srSk6OazDIBmNO0yPON6wS/uJ0ok4dFcFM4b7LCx12Bio/J4wxuq87fRfMrYUGUcdTIxrowcsFri/rI8SIt6qqqM32OIH7vjArjaYcKaUsppa/j76jTgMu9sH4XxV9N+HnjimvO3vMKLS8fXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bihmPHJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ABEC113CD;
	Fri, 26 Apr 2024 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714112366;
	bh=XyTI7ypwL9XuJwKRNN0RAtJ/sCeTZRClu7Qjug3+9io=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bihmPHJ9TAj7CA/+t9/CNJCCAE90+eKnV9pc1gmINLmt56pp0NgVhyN5q78O9KpfQ
	 8IWCyJ1gZOQN7sxPqQei39aE5Fa8s0QT3qlfz3KsQu8q3iF3y39OfguoTb07CtCQks
	 XcJjMe4PZIbDmXNZweh4DLXlJYPKHRghdsX4KwUqYMonKgL237goUwdTFk+V/WrQj9
	 evcQT1MNDaXjz2yAKsO65ObqzppTuzq+0/7p8eUGpZ+u+ykOaeKt+MYIBAHdbPm+vM
	 pOB6pCTEHw3X8ht0r9cztUVL0bfqLps19p9a1PV64Wy+StHqfNfzn0co0RGAhMLxeI
	 B1EoW7aE1Ldlg==
Message-ID: <d5e79c40-d961-43a9-ad4c-ebed17dfe814@kernel.org>
Date: Fri, 26 Apr 2024 08:19:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] dt-bindings: fsi: p9-occ: Switch to yaml format
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-5-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240425213701.655540-5-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 23:36, Eddie James wrote:
> Switch to yaml for the OCC documentation. Also document the fact
> that the OCC "bridge" device will often have the hwmon node as a
> child.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
>  .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
> 
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> deleted file mode 100644
> index e73358075a90..000000000000
> --- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
> ------------------------------------------------------------------------------
> -
> -This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
> -a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> -nodes. The OCC is not an FSI slave device itself, rather it is accessed
> -through the SBE FIFO.
> -
> -Required properties:
> - - compatible = "ibm,p9-occ" or "ibm,p10-occ"
> -
> -Examples:
> -
> -    occ {
> -        compatible = "ibm,p9-occ";
> -    };
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
> new file mode 100644
> index 000000000000..1fa87d452489
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM FSI-attached On-Chip Controller (OCC)
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description:
> +  The POWER processor On-Chip Controller (OCC) helps manage power and
> +  thermals for the system, accessed through the FSI-attached SBEFIFO
> +  from a service processor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ibm,p9-occ
> +      - ibm,p10-occ
> +
> +  reg:
> +    items:
> +      - description: Processor index
> +
> +required:
> +  - compatible

required goes after all properties, so below.

> +
> +patternProperties:
> +  "^occ-hwmon(@.*)?":
> +    type: object
> +    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml

Drop occ, not relevant. Why unit address is optional? This is supposed
to be specific. Use proper regex as well for hex numbers.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    occ {
> +        compatible = "ibm,p9-occ";

Not complete.


Best regards,
Krzysztof


