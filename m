Return-Path: <linux-i2c+bounces-14300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A51C8D10F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A7AF34CAFB
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECB53148DD;
	Thu, 27 Nov 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ta/FGVK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E8136358;
	Thu, 27 Nov 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228010; cv=none; b=dSicEdRK47uZsHqOssct3ILYo2P/MYgtV8k1EK6+NmsBkMdyvUZfWbvZSLeVR77S5fbhIgLIAxwS2UdIjoAtkSUfQxiBdWBiVbyPw1DbXRpmOQN+4ARtBIPBdL+8ovh1Ec4v5xBJLlw8YoR6Besq+VlNmpZlZiNRLj14G2gUxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228010; c=relaxed/simple;
	bh=jP31S8Dt4+8qiI2aac4nVcnsADB8VoG9tzhBRujNSS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYoZHOkUbofEFp34QxeHVduC5ukGKfX6jvB0N3W4IyHZiNFMC4bE2RiNc3zuvGk2csgEgRKDIsUfc9Fb9vnmkdNYo10idob6LTYMFiX96H3M6FOamkxQtBI/aPCFxOY+Kzc+8SL9ckaLJCXxzrlNLYSOcf1KumJlxHPdbkb1Xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ta/FGVK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CBAC4CEF8;
	Thu, 27 Nov 2025 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228006;
	bh=jP31S8Dt4+8qiI2aac4nVcnsADB8VoG9tzhBRujNSS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ta/FGVK6jTc3POxSH0uKvo2/kTkSmtyN47d/3QFKgFfKgWDjf/w3RXdiuT9aGGYit
	 Yo5o21TLvUvtNnJ58McCz+InmA5WYIqd5ItBNWDhgWAauCPfuQt92OQPwIxhh9Tc8N
	 nO+nLL7ZDN8RjYru1om1s19mz49xPvIk5UdbPEWPSIQ1xO4+ITt+u5RCz3oQXLcCvM
	 1TJOG0zVM/CVJyR3y4JWsOj4M+vKFsryyfBUMVz7dN1AhEAVPHjzWxrReBorMH7E4k
	 ARo/o1O9JQHfost0MGYkvsWaSjMYr/dhZg/geN1c9+X4LnmjvHdATbK0O70BySYLJp
	 epd3jjBWWhyZA==
Date: Thu, 27 Nov 2025 08:20:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ethan Twardy <ethan.twardy@plexus.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>, 
	Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>, 
	Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 0/3] Firmware Support for USB-HID Devices and CP2112
Message-ID: <20251127-hasty-malkoha-of-science-e5efd5@kuoka>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>

On Wed, Nov 26, 2025 at 11:05:23AM -0600, Danny Kaehn wrote:
> This patchset allows USB-HID devices to have Firmware bindings through sharing
> the USB fwnode with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and ACPI and interoperate with other drivers.
> 
> Changes in v12:
> - dt-binding changes:
>   - Drop "on the host controller" from top-level description based on
>       comment from Rob H.
>   - Correct "Properties must precede subnodes" dt_binding_check error by
>       moving gpio_chip-related properties above the i2c subnode in the
>       binding and in the example.
>   - Include `interrupt-controller` property in the example
> - Modify hid-cp2112.c to support separate schemas for DT vs. ACPI - DT
>   combines gpio subnode with the CP2112's node, but will have an I2C
>   subnode; while ACPI will maintain separate child nodes for the GPIO
>   I2C devices

That's a b4 managed patch, so I wonder what happened with all the lore
links to previous versions.

Best regards,
Krzysztof


