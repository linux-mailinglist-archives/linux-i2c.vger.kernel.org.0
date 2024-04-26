Return-Path: <linux-i2c+bounces-3195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DA8B3071
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD4F8B21301
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E791442062;
	Fri, 26 Apr 2024 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcLg5mmy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD76631;
	Fri, 26 Apr 2024 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113066; cv=none; b=Nx8SOs/lO0M1UHJVJ3Cgc6nSCDXPALHaT2vobkXwn0Wo2LEfRESVolX/WQGxJw7Rk9N8NNhX64GUDpM/t63NdZ5fCQEOlvF2XoeSsubHLzDoaLC2qWHv47uRBjdCrMDaFu4Ixd9t0j2CsjTGYfhdywfDwj3YAcAUK0wnBecb258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113066; c=relaxed/simple;
	bh=EhSzvAHE8U0qvjOPlUInGj3l/8H0bs70oiNagANMIAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFOxtJ0DOEg1cU7cpYca5Sb7MkJKlJ+aTTfMlbgz7oDdLJswXPDLC1KgCxwL/qcUQRBsKuRqwjX5eKMSVqmEtpnKTzjy/83mUDtDDVRvgIS0kgJEBxvEiRzNXaiS4jZfO402ErP0zSSXC7gvdZdE1t2s7KOg9+wv49AWOFt9Bzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcLg5mmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3140AC113CD;
	Fri, 26 Apr 2024 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714113066;
	bh=EhSzvAHE8U0qvjOPlUInGj3l/8H0bs70oiNagANMIAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DcLg5mmy6eE1v46cWCirxj8KD3hoxwTo8pzp+w/teWNmBrMDDQj80OT0ueJlCuOgJ
	 wYoA9q0/GvEFmPMFpZRQd5/9a40qkRh3tBJ2jIB9GGFE3v2kJyKkJ7UPt1nKGcFWfp
	 KvJI1lcnwa3cEYLuqgK+NW83FJuc2cQBD1O64b3UuIndXxyvzkVNPz4kKklp82h0dT
	 KtYkLBgWRvmrxCv8RkHyVsOJ4tSDyNcWA4IzLfvRuuwvXg3wpkJcYVyCKjijHUsVV8
	 IaD+mnFQRbxnoCZTATv1u/uW7j2gFyDeQdntrHL0xzWKFjdJCDLRTpVj44zRiPCDG+
	 7s31EYqPWcdew==
Message-ID: <dc106aa2-8f69-4f71-ad9f-6dfb97c63a50@kernel.org>
Date: Fri, 26 Apr 2024 08:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] ARM: dts: aspeed: Add IBM P11 FSI devices
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-13-eajames@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240425213701.655540-13-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 23:36, Eddie James wrote:
> Add the P11 FSI device tree for use in upcoming BMC systems.
> Unlike P10, there is no system with only two processors, so
> only the quad processor FSI layout is necessary.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1696 +++++++++++++++++
>  1 file changed, 1696 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
> 
> diff --git a/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
> new file mode 100644
> index 000000000000..c3a0ecf12aa0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
> @@ -0,0 +1,1696 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2024 IBM Corp.
> +
> +&fsim0 {

This does not make sense. You do not include any file here, so what do
you want to override?

How can you even test this file?

> +	status = "okay";
> +
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +
> +	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
> +


> +
> +&cfam3_i2c16 {
> +	fsi-i2cr@20 {
> +		compatible = "ibm,i2cr-fsi-master";
> +		reg = <0x20>;
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cfam@0,0 {
> +			reg = <0 0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			chip-id = <0>;
> +
> +			scom416: scom@1000 {
> +				compatible = "ibm,i2cr-scom";
> +				reg = <0x1000 0x400>;
> +			};
> +
> +			sbefifo416: sbefifo@2400 {
> +				compatible = "ibm,odyssey-sbefifo";
> +				reg = <0x2400 0x400>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +};
> +
> +&cfam3_i2c17 {

This looks randomly ordered.


> +&fsi_occ1 {
> +	reg = <2>;
> +};
> +
> +&fsi_occ2 {
> +	reg = <3>;
> +};
> +
> +&fsi_occ3 {
> +	reg = <4>;
> +};
> +
> +/ {

Nope. Root node never goes to end of file. Look at all modern DTS.

> +	aliases {
> +		i2c100 = &cfam0_i2c0;
> +		i2c101 = &cfam0_i2c1;
> +		i2c110 = &cfam0_i2c10;
> +		i2c111 = &cfam0_i2c11;
> +		i2c112 = &cfam0_i2c12;
> +		i2c113 = &cfam0_i2c13;
> +		i2c114 = &cfam0_i2c14;
> +		i2c115 = &cfam0_i2c15;
> +		i2c202 = &cfam1_i2c2;
> +		i2c203 = &cfam1_i2c3;
> +		i2c210 = &cfam1_i2c10;



Best regards,
Krzysztof


