Return-Path: <linux-i2c+bounces-3329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D80458B6AEB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 08:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E0DE2821AB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 06:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E641BC56;
	Tue, 30 Apr 2024 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkJ861fv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF742199AD;
	Tue, 30 Apr 2024 06:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714460009; cv=none; b=TDpj1nF8opLFrHdEd/eFcmlwY/uvQQdA9DLdfjfyzLSubv8BRKhw0WX30VS6HRzMbnXWO7Je4butCAyv9VOqqmdCQYHBQNPUxyEioF3/r63ncD7ehuEj9uTcsuQNL+C1z3EMdB2nPjIaNlh1ABHe42QQvAyYYvhy7wVo+D+eYnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714460009; c=relaxed/simple;
	bh=A4udmfrsbNNVRsTYY8tj7q0ca1mCn9upsMLw5+HbsTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E41805unl3qWvyW9WepqnNqYhY48mHosBAUhxCIT1BwCvdljZqHALS3IM4MxjYr0NGXfS2iO2vWn6SuF+zwwqfelKyZZazP95IXjQqQzpL/uVBpFuaE6qBIu7/0Iign+w7+xA6MQfwg9iDaQEchKdimkNdEsgpAQsBLlFnSq1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkJ861fv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0599FC2BBFC;
	Tue, 30 Apr 2024 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714460009;
	bh=A4udmfrsbNNVRsTYY8tj7q0ca1mCn9upsMLw5+HbsTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JkJ861fvqe+SCMeOKFcxR5jPf6QTeSg8y6U7hhDguFBDXy/vu+ktBRdFKmSPfrMVv
	 DY35l9pmfR4Acxvfa8Ss30tcGcqQTF5FSYSF2tq4yVtoXe7Re82ZoCz5UOKEfJTOj7
	 F75KXsehJzP8ZWhw1zmTsjmbkqpBeMAceeCNJW8hhZ5N3fz3IrrLmJu3bqYne5HsJt
	 ojhcQ9EZUByKjO7Gh8+03N4KskVaZ7nuu+trFC8ytbmbzPg45EeTxiG2Cm0+XshppY
	 mlYMxtwn+NtkJ2SNJ5opMS5R5guXvMY6Pwdm5RgcVUqG3r3QvTsnb1in+mYnWrgE1r
	 lte+3NPEj2fxw==
Message-ID: <0fcadbe6-7615-498e-89c0-e3b072c4828c@kernel.org>
Date: Tue, 30 Apr 2024 08:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] dt-bindings: fsi: p9-occ: Convert to json-schema
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-5-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240429210131.373487-5-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 23:01, Eddie James wrote:
> Conver to json-schema for the OCC documentation. Also document the fact
> that the OCC "bridge" device will often have the hwmon node as a
> child.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v3:
>  - Move required below other properties
>  - Drop "occ-" in child node
>  - Drop hwmon unit address
>  - Complete example
>  - Change commit message to match similar commits
> 
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
> index 000000000000..3ab2582cb8a0
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
> +patternProperties:
> +  "^hwmon":

And now it raises questions:
1. Other devices on FSI bus have unit addresses, so why this does not?
2. This suggest only one hwmon, so ^hwmon$, which is then not a
patternProperty but property.
3. But the true problem why do you even need two empty nodes? These
should be combined into one node.

> +    type: object
> +    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    occ {
> +        compatible = "ibm,p9-occ";
> +
> +        hwmon {
> +            compatible = "ibm,p9-occ-hwmon";
> +        };
> +    };

Best regards,
Krzysztof


