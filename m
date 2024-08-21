Return-Path: <linux-i2c+bounces-5627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4E959F6E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1918E1C21DE8
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25321B1D45;
	Wed, 21 Aug 2024 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/AsI3tF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC418C348;
	Wed, 21 Aug 2024 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249591; cv=none; b=fxO9Htvcd8jeNkD89Zus0ldYO2yiuySrrGynydi5JKCBk9hfAKPSDKZKnKGELIyxqh5RXgT6+O1qU3/LBMKhqxgYyNXzJSw3yKlKNYopPDGrU5zCXTpT2iZlXHP16+hvDQbyFi9hm0jzVdqWf6MR14yvmCgFIdZqNq1iXucHhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249591; c=relaxed/simple;
	bh=sZwr6HFTcdqf2bHrANyg6CQ//2dIkGcLCdziHq8M6Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMlHLoGfpYxIsu9GO4rxXXH3XoFigfIvNk49BUEQUibxBe0MZ8XNuWAHRYcZ7mGLNKgBoyrmHQog3JWDgTTtBwxkI9L57eDYsF4q8+Qg+F9WNVjeLZHP1hWjzW8mZJH8gSbkzQrLJ38EMpX2sWSvzD3+b8sj19uvrNNx1bQHQso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/AsI3tF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCC8C32781;
	Wed, 21 Aug 2024 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724249591;
	bh=sZwr6HFTcdqf2bHrANyg6CQ//2dIkGcLCdziHq8M6Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/AsI3tFgf5V4mEnQbUPB6wtEUw+gI37oPp/UQXa6wq/4alIlDKJPg+eaEZm+NN1R
	 c94VFwSbkKs23mU22wM7CtE9g0S9kkJBeVgg9H96Gy7cwKBk4Wkqmxjxwm/bd/601r
	 TJWDe2gQWVFhh59dwyRSqOT33ehw1hX2sUqxnVgCSFDA8ZlDSPhCxCuz7yfjtGPNbe
	 8aP7dL59gFxDobtrejgumd0XN0tPRRfqRi4SvSF7L2HEI4ytOTpk6WX0pSgTFVELfc
	 F/dUuQEjbKL7NsRZdQdnknhY2rO04eDCzS+Zcx3D0N49LlD6J/4m150Ahi6IgFGvgb
	 bGM39D1rGfysw==
Date: Wed, 21 Aug 2024 16:13:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
Message-ID: <dkcfnidl3xgvspiusp3zftgdftyvlbxahlbumjdfl7dvxgmdmr@nomisqfu2mwb>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>

Hi Krzysztof,

> Krzysztof Kozlowski (3):
>       dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
>       dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:then:
>       dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level

merged to i2c/i2c-host.

Thanks,
Andi

