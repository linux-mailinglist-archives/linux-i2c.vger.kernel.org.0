Return-Path: <linux-i2c+bounces-6458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DD972B28
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 502C8B250A6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 07:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1F6184522;
	Tue, 10 Sep 2024 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6sSqXdN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A889178372;
	Tue, 10 Sep 2024 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954518; cv=none; b=WVrnrIclyC1zbEuFYpnU/uiR+Nct39Jw2iAk0c0jVAMZmIp8UM6cYQioYzclJohtRP26ovCEG0/a/j7z8tzKoet+qETFLQlUbuhtKOuFDYHD3DXYodoLJCm/dTqXla4Lz+5/NiALZuKzQxr6wLu7tsX8+sLUvcohcMLbjC1Y01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954518; c=relaxed/simple;
	bh=oVcm5pPuoXPMmaLHWRquGf9gSRas5BoTQHrjW2H/IUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9Ap1kajXUAjJwMk7FczEcYYTAhOZ208ApMJsaQYG2bVscMSD1BHly6nvwG3o+rVvjCZArOm1i9n/KZEQcm1BY0S9xvE0LXjCDK0DpwNO3G/ja4pAjvFMEvqdQm48n8yYxmtGrEXwl4IliyIl0gT2BbWeNaQA7cWd5NfVjGSVX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6sSqXdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15603C4CEC3;
	Tue, 10 Sep 2024 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725954517;
	bh=oVcm5pPuoXPMmaLHWRquGf9gSRas5BoTQHrjW2H/IUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6sSqXdNBJ+cXXY8R6uMMPmTlSn+NvKYVkPPyUjkhMZTVDTeVrExeiwhcl51o8GUi
	 OiHjY8BCdnqSXbXt7s86fP3HcF8qAOoaRThNIbQ2N0vHn2elhDekP+YhnImdWcGxGy
	 S8iV7F5w+epveghDOvxXJl4SWcM96JUlunBsJr/63qq83VJenIONApCrdg+Ld1tpOB
	 AjxQ+3cwVgtcu2e8Hf5zt76PbrsMNV/fM2k9Hj8MnOgOHbpAjGdrc4MzR1MK1KKNrB
	 Qvs1sMoKN67g4v9LlGOOOgiUniej1Junbkdp3KlDcb+AIiIgUTznaMP129xYUUGb6v
	 t1vmkYpWmrUtA==
Date: Tue, 10 Sep 2024 09:48:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: add ti tps25990
 documentation
Message-ID: <3efbzcys4762rhx2h2cbhqvi6dgik7pfrxcziccdko34pb5z54@joodcym6c3s4>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-1-39b37e43e795@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-tps25990-v1-1-39b37e43e795@baylibre.com>

On Mon, Sep 09, 2024 at 05:39:03PM +0200, Jerome Brunet wrote:
> Add DT binding documentation for the Texas Instruments TPS25990 eFuse
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>

A nit, subject: drop second/last, redundant "documentation". The
"dt-bindings" prefix is already stating that these are bindings/docs.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> new file mode 100644
> index 000000000000..e717942b3598
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop blank line.

> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TPS25990 Stackable eFuse
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The TI TPS25990 is an integrated, high-current circuit
> +  protection and power management device with PMBUS interface
> +
> +properties:
> +  compatible:
> +    const: ti,tps25990
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,rimon-milli-ohms:
> +    description:
> +      milli Ohms value of the resistance installed between the Imon pin
> +      and the ground reference.

Ohms is not enough? We don't have mOhm in property units.
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +
> +  interrupts:
> +    description: PMBUS SMB Alert Interrupt.
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description:
> +      list of regulators provided by this controller.

You have just one regulator, so drop "regulators" node and use directly
vout here.

> +
> +    properties:
> +      vout:
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +        unevaluatedProperties: false
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,rimon-milli-ohms
> +
> +additionalProperties: false

Best regards,
Krzysztof


