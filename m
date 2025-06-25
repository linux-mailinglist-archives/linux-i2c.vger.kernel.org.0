Return-Path: <linux-i2c+bounces-11589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2052AE8F3D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90681C23E8E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 20:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78B82D8760;
	Wed, 25 Jun 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUguQlRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C482267F4C;
	Wed, 25 Jun 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882405; cv=none; b=kAe+/gVmGWXLZ+ZjymuV6Y5MhdicZQcPb//h7mtU3c29MQQg/a16aymrZnu35/fAFLat05ayM9IlPhhkBnB6uYpqzXzMZASJbJS0ZMhy9z8zYXJLGvEs4ZxaZO+GO1/eJaS8di4gmEalyo09uB7FhiA+6OTsVz2vjBTy9wt7/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882405; c=relaxed/simple;
	bh=zPNkKYayJIxWTUaQnmIIX16h79rDQcRVFOg5N+6RMbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFqUfnqlmSiRJPnWkWIY3Emz1XyokW9nFUqn/MLAuUuBeUCXR/xo25N9X7N4/wlMLlLt/nQ9F1T2cgg6Y8ew4FCWkes8hJTEmFFhBUmcLVnRvboOOsE3Hhe67XB9pyLqXhgaOGAj8bq7qOjlYD68ryT71kkOB7EbsnnUx30goJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUguQlRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437DC4CEEA;
	Wed, 25 Jun 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882404;
	bh=zPNkKYayJIxWTUaQnmIIX16h79rDQcRVFOg5N+6RMbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUguQlRutLZB2kKQ6PnH4vIkUeBzHe5x+mixpdSni6mitWR5mhUOUL2sySgP72aHB
	 L4dz6RNCtbVIMRri4m9+NCGom6RdOzRXwCf63a5zZSDItNxHTjpMh7xEPcVKhL8fZ3
	 4PaHLD9uOm0Jg/tZPKPL//MhqChA8KEeJqQYrZ5jR8/OmDdiz5rw6fP7uE1AVmPb5N
	 pQaTyh8wDHi8D7IUOPD89lr83ZJxqGmwBW2MHbONymszfIfkE0WR5XCKUZxE8vrlQH
	 2t/r9Rn2RPa0Rp1T3txmSJ3Oq2cRr/p/cZQTtYg+TnyAukV9AerUSDdLPrXI6wA4nw
	 pWSsZ7yIOBtlA==
Date: Wed, 25 Jun 2025 15:13:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	jirislaby@kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	qii.wang@mediatek.com, andi.shyti@kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <175088240336.2135179.14074379043587358741.robh@kernel.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>


On Wed, 11 Jun 2025 13:07:58 +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


