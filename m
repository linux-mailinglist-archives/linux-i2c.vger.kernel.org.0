Return-Path: <linux-i2c+bounces-9588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11525A457FD
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 09:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A16633A8DF0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 08:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830591DFD89;
	Wed, 26 Feb 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiIm1eue"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F70446426;
	Wed, 26 Feb 2025 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558044; cv=none; b=RI8JthibhhUA+JwPX1swNcXd0a4Rzq2t+p94St7pqS+v3t7u87AvVKztjLKwcVSWBk09AEDd6+slh3x+70uG/SCrX2RnJ2vEh9kdZfvsHwTkVvbnsRSZpg5QdgunD2430Y9Xqtpy5Lv8QwWS2eKLdB5wMcTZ/HAhItLsRUYycN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558044; c=relaxed/simple;
	bh=4Pe8SdHpMNion2K2A1gVO1ETNWDlPyE6kIyEGg2L6M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVRs7/qZXefsjpr2k9YtZyujNmZAguigpQIDTfQ/IzOP690P/V4lsligxIekh/RvHAyTH1CV+h7DttsdvWLPpInDLKe8+085XsZbeYWYI2HwHUMTvvzN+MzQIOY74lVgC0/LQSeX1dKoLSK02KBGMdJPq72mbhELfO5f1VDz6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiIm1eue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B91C4CED6;
	Wed, 26 Feb 2025 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740558043;
	bh=4Pe8SdHpMNion2K2A1gVO1ETNWDlPyE6kIyEGg2L6M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiIm1eueQybrvNRsuNh8H8qRFgt8iHMrY1eUb0Gn83kdwU35X8kuTonpjSy3fIA93
	 oVOzTsR5oNN5Kniu/v3KeNVmg1Bh4DJ64S/GhHIViumtsLjV2PIYdDV0yBNAelZkKw
	 JnJst47qH/M7Sm7+ZtORetxKK+ptFMd1SiPLeZB1tI29tiZvjEtCYKyvVyxJrPvGbS
	 l5AsyBJ9PLYeqnrBNXZOFc1RWntYlfS2vCFNy6YGex2DNVYBg1ovbmPqINPZ3hLqqI
	 10RxbDM5YgxNit/zXBSQqJ3ghCbCIh6opv8NXkhfteFs5wDQDLgoymGvuuP98ISZPl
	 PNA/bEBabI9dw==
Date: Wed, 26 Feb 2025 09:20:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>

On Tue, Feb 25, 2025 at 09:01:13PM +0800, Cedric Encarnacion wrote:
> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
> Regulator.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LT3074 voltage regulator
> +
> +maintainers:
> +  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> +
> +description: |
> +  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
> +  response linear regulator. It allows telemetry for input/output voltage,
> +  output current and temperature through the PMBus serial interface.
> +
> +  Datasheet:
> +    https://www.analog.com/en/products/lt3074.html
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,lt3074
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: |
> +      list of regulators provided by this controller.

You have only one regulator, so drop the "regulators". vout could be
here, but since you do not have any other resources, I doubt it stands
on its own either. This is even visible in your DTS - you named the
device as regulator, so logically this is the regulator. Regulator does
not have regulators (otherwise they could also have regulators... so
triple regulator).

hwmon code might need some changes, but that's not really relevant for
proper hardware description.

Best regards,
Krzysztof


