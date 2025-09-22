Return-Path: <linux-i2c+bounces-13096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645CB92600
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 19:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A83442804
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 17:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AD1313276;
	Mon, 22 Sep 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvfpwM20"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9F3101C2;
	Mon, 22 Sep 2025 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758561350; cv=none; b=pa9Ujbiu0c6idbhWZCgGp28EAKIPrrxPxlJ6ft1N1XlyRo5FUztLyZtr647xkIAsQHjFz3IUUi+5jbh5z0FQTXDNVlVSipTy3ddCWvvkRtf0Ho2WYLj4urD8t39Txd+148YEmxlzGhCvMnzpAZNzByQ9qZ01CpkO2sTY8BUq3Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758561350; c=relaxed/simple;
	bh=mi0cY+Nvy3Qqsit422rWrrAWc80S+JmM8GQj6PeSV2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojNDXKNv+ogD7yIcQgyOPcSGOJGXWNKhEZdsf+SsnYcxZa9PKneHKnFYIS32AjUP1w8qgI4xmHD8Ik6GsqvmtMNJBzYOSdgy6m9MQ6TRUHdyLjQanvJS5DGiQsw/SZvAR0LbNvS9FwEhDPDPIH6AW9N/giL1PDHWwLRpNCi+dLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvfpwM20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58690C4CEF0;
	Mon, 22 Sep 2025 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758561349;
	bh=mi0cY+Nvy3Qqsit422rWrrAWc80S+JmM8GQj6PeSV2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvfpwM20kmi/LgRVzKQciG+YKjCg0Mx1FzurfkQzFI3ACRPTweEOfg/DxNcvwLtZQ
	 iR5+FuScP004ixrWCtOX2ZTFZTIwtltSLvhSpGl0BjwX0XQxhU3YzGiF9Uiqf1cH0W
	 M8LMfyXpmSCosMi5Hh85MmFVG2gy8pF8uzQ/9DgPKtTSDqeZlD6jTsShE0IcUpoeY3
	 ulHY+lQil5ATUZUwTdPSRdCAFJejFPD8rN7ItMIWcj4/C4Sh8Z+5KM+Sw4GyU9YUhM
	 9QzQu95/8uJclYKbA1eczKjiqBB+i/PoA0VjY2JWJ+WZ/+ksJ3TYhiiI3++cpaRwgn
	 Pzlotp4RgnngQ==
Date: Mon, 22 Sep 2025 12:15:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: soc: samsung: Add Exynos990 USI
 compatible
Message-ID: <175856134761.488862.14515741406588517513.robh@kernel.org>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-perics-add-usinodes-v3-3-a3629e4666ef@gmail.com>


On Wed, 17 Sep 2025 21:04:23 +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-usi compatible string to the
> Universal Serial Interface (USI) bindings.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


