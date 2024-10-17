Return-Path: <linux-i2c+bounces-7445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7C9A1C12
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873F3289682
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A841D07B2;
	Thu, 17 Oct 2024 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdA4yceQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6B11CFEC2;
	Thu, 17 Oct 2024 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729151813; cv=none; b=rP6GksLSkrEZHolIbt7gtq3+lcUCz3iNFNSwGwwu5o2YykQu6jNFAY01o7eQi04ruDrS5yVGEMrhicE1JhkshgfUkcdOEMx2gxxTtqyx6CMMM/VHGLNj9xGCZDKYyysUx+uMbDgyjiFx1l5VZyzPfSYebTh7oxpYmVcNFfEW1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729151813; c=relaxed/simple;
	bh=KHj182ceY1l+tWN+yPMGSpqPxinzby8wZiaWb6NY2n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oll3KDEy/kIfvSDdawZFFBG3Kd4xjBtVq069DVJHt5Qm6857QLjy/K9Ph4Bm1yXc6BkrFYxV86HpcAaVOcPMrGYXYCP73oIxupkQrImkDiVbU2RfC1v1+yFwcjvbvGP5MriNOn840os8zNZzlBmLjpEmFFKkcCdtSwvJv5TPIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdA4yceQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8A6C4CEC3;
	Thu, 17 Oct 2024 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729151813;
	bh=KHj182ceY1l+tWN+yPMGSpqPxinzby8wZiaWb6NY2n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdA4yceQ7A32VhcQ3hbmjeOzriFjb3hcgTaN5EYow5ZEp4MelTgM5ZBEFmtgj8tu9
	 AI8BDCBld/MbHK2FQaf+lJA7yPwV2pVgYoTu9pFSGtfI5QyWlJb2BH7tOPv9EbTrdC
	 Iij8p9deJgXxsXw4WNdseQBZQjXo7GNEhVGd4hPof9oZeDW434BhFAzYTZwD6Xb3dQ
	 Dg5/HXailnbgXK9VbBpsO7zLJPvCX4jcuRnmjchLEOGP+qdVYs82/BlAMMSJSTn9CV
	 MqgS/YBSyXtGw0sry3fOLtx6z7wSi48aJLatHOom9e3pCzyVrWCIOW18UhmHVe0y0K
	 gwmd6w+AFtsHg==
Date: Thu, 17 Oct 2024 09:56:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	markus.stockhausen@gmx.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <qftyzxnlvfyhdavhrivuef7o4den7yhjjy54eps5mngtce5iva@jq4wuhf4v4xw>
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
In-Reply-To: <20241017001653.178399-4-chris.packham@alliedtelesis.co.nz>

On Thu, Oct 17, 2024 at 01:16:50PM +1300, Chris Packham wrote:
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

Thanks for the changes!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


