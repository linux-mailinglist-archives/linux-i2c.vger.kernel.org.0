Return-Path: <linux-i2c+bounces-7684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45349B7F07
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 16:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B0F7B22D05
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 15:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11411BCA02;
	Thu, 31 Oct 2024 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvQWtG5U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED3F1BC9F3;
	Thu, 31 Oct 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389738; cv=none; b=bkrrD43Hf9W2Yh19pzxvtbE4NyuAYDWx84YeJ1OZLFCLOvnpz72hsr0D01UItYrWk30IYQGh1L6HG3TOIvDiZSaNmlUxtujEftV6ZOwX7buRPeJ7sGoybvj9i7auHj4CavCPpQIxO7jMT0zmWJTLf0Rx9ZJksZyolGHkLnbZPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389738; c=relaxed/simple;
	bh=ARsdt7q0eVUNvr7pYU7BYuIsTkSNZkoxY5yzKP07DrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n55jtHOJL+A7klZRoyonUHthIBCK0j79PE4YMCkThVkwy4RBjJN41eq5uq5t06cNJ2lq/MEyaO+5+jCP+6drM1VuzLJ/Sr/PIpandfKDxI0Tp6MelSZ29kRQtRcHza9Ahl+J0jIKijw/HIkdLgYyMwwR16uitqKuHKQb5BqFC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvQWtG5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4477FC4CEEA;
	Thu, 31 Oct 2024 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730389737;
	bh=ARsdt7q0eVUNvr7pYU7BYuIsTkSNZkoxY5yzKP07DrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AvQWtG5UkTOa5+HJMdxSSq4RUi208Z6bN2KLb8dXitDmTYs9efECVvdhUx/phKCto
	 br4TfCUy86h5Crrc1uLNV2o6CHBobVB7ldPN6isVGpRWtsi7qmdXs72fMi7vpX4Noa
	 liVwQj7bA+PYAxYVsTdVTCW3ELkF9hC4HfE/EUMgxm5OnBWH73Ys5mh2sLyi7vTRbi
	 US6+yJaTpVnYj8aQaV5eXz5ifk9vmgXQLqbvu9TKJ4YJFp2K+1vJwNPMM9KnIA5uWb
	 ZObXfhdm/Maz3hAB/Ka0xs6SQKVG32ys8+fq8w9f5jqnzP6CsGPKNuBhYC9BvAxYG0
	 ajfzphlDCcrUQ==
Date: Thu, 31 Oct 2024 15:48:52 +0000
From: Lee Jones <lee@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de,
	markus.stockhausen@gmx.de, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <20241031154852.GI10824@google.com>
References: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
 <20241017001653.178399-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017001653.178399-4-chris.packham@alliedtelesis.co.nz>

On Thu, 17 Oct 2024, Chris Packham wrote:

> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v7:
>     - Set additionalProperties: false
>     - Remove extraneous examples from i2c binding
>     Changes in v6:
>     - Drop wildcard compatible
>     - Add specific compatibles for the 4 known SoC variants
>     - For the i2c part of the binding accept realtek,rtl9301 as a fallback
>       for the other compatibles
>     - The overall switches will eventually differ because these will have
>       different SERDES/port arrangements so they aren't getting the same
>       fallback treatment
>     Changes in v5:
>       I've combined the two series I had in flight so this is the
>       combination of adding the switch syscon, the reboot and i2c. It makes
>       the changelog a bit meaningless so I've dropped the earlier
>       commentary.
>     
>       As requested I've put a more complete example in the main
>       rtl9300-switch.yaml.
>     
>       I've kept rtl9300-i2c.yaml separate for now but link to it with a $ref
>       from rtl9300-switch.yaml to reduce clutter. The example in
>       rtl9300-i2c.yaml is technically duplicating part of the example from
>       rtl9300-switch.yaml but I feel it's nice to be able to see the example
>       next to where the properties are defined.
> 
>  .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  69 +++++++++++
>  .../bindings/mfd/realtek,rtl9301-switch.yaml  | 114 ++++++++++++++++++

Can you separate these out so I can apply the MFD part please?

-- 
Lee Jones [李琼斯]

