Return-Path: <linux-i2c+bounces-4755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 948FE92A404
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 15:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7F31F22B0C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 13:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AB213A272;
	Mon,  8 Jul 2024 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJmTuOFz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C397B2746D;
	Mon,  8 Jul 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720446451; cv=none; b=O6ebkvWcPjUN7CU1fnffQCMUBAhl+okFp9xrZxuIklzOY9LjteE+ZM13xFAQHNliqzIwD0w9rtTPcSvsL9thrhFALhQl0vBe3O+F1lUrkqevJjlyAnIj2cJ9zglPwboLDRRqSH0YIWYbfK3FqJf4e4uvhGAi+/CMaFAFuXTMKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720446451; c=relaxed/simple;
	bh=7hu3e9/Hj8XC7xexm2FHFjZJcixRqYd55unsbK3uK94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q79Fo0Wp23bf9OBWf0hyssl9m4JvQFPPHFrJaqvppq3kfCMDfhDHPx9LbWNs3LuJChlZII2TyV3T8UgjiTPKjAVtd/894eRqn4aYu9hFTjehlvLngp8kGeZPQS3u836hATnfN1pPfY9/9ngiRifdCsfEOtGZm4g4IYJb711fsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJmTuOFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E71C116B1;
	Mon,  8 Jul 2024 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720446451;
	bh=7hu3e9/Hj8XC7xexm2FHFjZJcixRqYd55unsbK3uK94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJmTuOFz9YUaZVvSbeZHVgmn99MOvvOkPPiu3F3d7+5/m5qwDzOZPIyuVKx4O3U1p
	 1FfRqxlNExaCIF0AtJa8O8k8vDj4tqtbl/7XsHVFb8iuTuGwXU50sMnr/skst8U8Vs
	 TMuSFeqpmtLZZ+nFYW7bh2UrvJXdFnyUaHV4PQKhhuZxD38t2kmzvfFrWjIQ2HPimE
	 CQGsCDfOF7yWoRatQHQByGWHGUerIz+V1thfMUIFmJhwJK+k9Ujnun0xRrnU5KByBr
	 UUA7ivjC8UF8z4BtLu8yQnTNVwlZKOyi9I+ge5s6ZnR4YU88xqTXFsY8vRw2kGgY4r
	 LOKXviKqq9olw==
Date: Mon, 8 Jul 2024 07:47:30 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ninad@linux.ibm.com,
	lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	andrew@codeconstruct.com.au, joel@jms.id.au, conor+dt@kernel.org,
	krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: Re: [PATCH v6 00/20] ARM: dts: aspeed: Add IBM P11 BMC systems
Message-ID: <20240708134730.GA2916637-robh@kernel.org>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>

On Wed, May 22, 2024 at 02:25:04PM -0500, Eddie James wrote:
> Add the Blueridge and Fuji BMC systems. Document many missing FSI related
> properties, and fix existing warnings. Make some minor fixes in OCC and
> SCOM drivers for the updated bindings.
> 
> Changes since v5:
>  - Switch from clock-frequency to bus-frequency for common FSI controller
>    properties
>  - Add reg properties for AST2700 FSI controller
>  - Fix patternProperties for i2c bus nodes under FSI-based I2C controller
>  - Add bus-frequency for P11 FSI device tree node
>  - Change model name from Blueridge to Blueridge 2U
>  - Add missing reset gpio to led controller on Fuji
>  - Add Huygens (Rainier with modified FSI wiring)
> 
> Eddie James (20):
>   spi: dt-bindings: Document the IBM FSI-attached SPI controller
>   dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
>   dt-bindings: fsi: Document the IBM SCOM engine
>   dt-bindings: fsi: p9-occ: Convert to json-schema
>   dt-bindings: fsi: Document the IBM SBEFIFO engine
>   dt-bindings: fsi: Document the FSI controller common properties
>   dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
>   dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
>   dt-bindings: fsi: Document the AST2700 FSI controller
>   dt-bindings: fsi: Document the FSI Hub Controller
>   dt-bindings: i2c: i2c-fsi: Convert to json-schema

Looks like these haven't been applied, so I applied patches 2-11.

>   dt-bindings: arm: aspeed: add IBM P11 BMC boards
>   ARM: dts: aspeed: Add IBM P11 FSI devices
>   ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
>   ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
>   ARM: dts: aspeed: Add IBM P11 Fuji BMC system
>   ARM: dts: aspeed: Add IBM Huygens BMC system
>   fsi: occ: Get device number from FSI minor number API
>   fsi: occ: Find next available child rather than node name match
>   fsi: scom: Update compatible string to match documentation

