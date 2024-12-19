Return-Path: <linux-i2c+bounces-8630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B11179F787E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67481886969
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B253E22146F;
	Thu, 19 Dec 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oy960b59"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5938D149DF4;
	Thu, 19 Dec 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734600533; cv=none; b=TuQAqNcfiEcS0Y4/BHG3LjjcY/wpS8PYOqMs+RqMq2uSm9wdw/+hGl/1waIV0TU6WdVRV8N+78qDr0zZKOrTPYF6bLnd7j/tv/Y1VBeaPtcNqY+Ew4sZbkTTXL1fWBYnuEp0Ch/CqRefwXptCv/8WEWJweTe2YuzEnwSJszb97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734600533; c=relaxed/simple;
	bh=G9YDF+1hDYtfBO4tQpAjo/U/ppewsYDLTzmy84NZADo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OftE4KxwEMmleJN05mMmpec1WYN0QU9utV8Eenn7nAFVPDReQaRqoiQM4rfAjybzz+E9rwzbHQ28lKyh6J17HM2fImyHIyDazpfzp53pV+rIxxXPlPqbxtEp4wBBZelblt5HwbNCXwj5P6D6mDFVG7gW72CxrVBKGdmT9Gi3Co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oy960b59; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C042C4CECE;
	Thu, 19 Dec 2024 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734600533;
	bh=G9YDF+1hDYtfBO4tQpAjo/U/ppewsYDLTzmy84NZADo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oy960b59B6Aiis2IUkJGIbOgwXWaTvzfis/e58EG44cB7YCKy2JLNnzVduPGK1V9k
	 u9M6C2H15VX1dSg5anZyifZfsLSJBXJcXgB9D2c9kCE9v2hY0xP+ly8XnJF1e9L8aE
	 hFaC2ScazWkBQDMpZ/zx2wa4NrmCcc/4zBms6geDFNwy8LL+7/lb5ASWMlJweDUqgA
	 U1aFPEw3f1xoMtEg2dBclG3VspfnIAZU6v/s14vqHPXYOjmQQ+U0zWndYzyA1iDPeD
	 ICneS3XHaTnRwsOPXDMTxaJ8d0KmXar/ku7xMslLmL2qkNzz5vMbymqI1COedbF4OA
	 qoS5FPIPGghQQ==
Date: Thu, 19 Dec 2024 10:28:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabien Parent <parent.f@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
	Fabien Parent <fabien.parent@linaro.org>
Subject: Re: [PATCH 7/9] dt-bindings: regulator: add binding for ncv6336
 regulator
Message-ID: <kb2ejk6c4uvazuumuezsd24qhjwh3k5bw76k2shywdugjqlf6e@lrghxcxxmnrm>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-7-b8d973747f7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-ncv6336-v1-7-b8d973747f7a@gmail.com>

On Wed, Dec 18, 2024 at 03:36:37PM -0800, Fabien Parent wrote:
> From: Fabien Parent <fabien.parent@linaro.org>
> 
> Add binding documentation for the Onsemi NCV6336 regulator.
> 
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---
>  .../bindings/regulator/onnn,ncv6336.yaml           | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

subject: regulator first, then dt-bindings.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> diff --git a/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c69d126cab33668febe18e77bb34bd4bef52c993
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/onnn,ncv6336.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Onsemi NCV6336 Buck converter
> +
> +maintainers:
> +  - Fabien Parent <fabien.parent@linaro.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The NCV6336 is an I2C programmable BUCK (step-down) converter.
> +  It is designed for mobile power applications.
> +
> +properties:
> +  $nodename:
> +    pattern: "regulator@[0-9a-f]{2}"

Drop nodename, not really needed in device schema.

> +
> +  compatible:
> +    const: onnn,ncv6336
> +
> +  reg:
> +    maxItems: 1
> +
> +  buck:
> +    description: buck regulator description

Why do you need "buck" node? Just merge the properties into this device
node.

> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - buck
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        regulator@1c {
> +            compatible = "onnn,ncv6336";
> +            reg = <0x1c>;
> +
> +            buck {
> +                regulator-name = "ncv6336,buck";
> +            };
> +       };

Messed indentation.

Best regards,
Krzysztof


