Return-Path: <linux-i2c+bounces-10892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69825AAF7D4
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D03F3BF7AF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281F420E007;
	Thu,  8 May 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBHuHaai"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199C1DE4EF;
	Thu,  8 May 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700323; cv=none; b=Y7jnH0ByL9nUOYCQB34Eo3yEjCfc2mYtH3hWSWqh4VRcYpzt6hS4aRGab4PL62bAGRJOobMXUfWaP3YOuVLoWngj1tw/XUNVwBl2T3dbMTjvMyfnxkG7SbHOvW8hZCY8qxhY74+cNg1m/iC720j9ev4xWUJOYs/fHVig9DUI3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700323; c=relaxed/simple;
	bh=CHelBqBpP/88IAjY7tksAEa5489dB+ryt+w4mhY/WiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUaIquIxIdU3lvh7qiePBS87pj7B3YTafsefrKSyVvysBTlQw8/4jmxkRjYPfki5qmNoD10x0Zs+DsyxM/tywm+qXJu8rXlIm8xKMlbh8rbZiZ+QvhK9Xcbxf7Jrd7qfMkOMzwSV63ypbaVvvmksZ2Qyl8SHfwo/gH3yhgjK2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBHuHaai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B65C4CEE9;
	Thu,  8 May 2025 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746700323;
	bh=CHelBqBpP/88IAjY7tksAEa5489dB+ryt+w4mhY/WiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBHuHaai3znTAjUB8enkfdSVPxffzb2rq/068BxCgs5w0kz0FnCgRsw8kyOjOYFUf
	 QANdtmA0BDXy6UX3nLKl6xwbG0klrVWIkiHC4K51Pz4Rqeh+dMCH/bgpi2elHrNZ0r
	 qw6LRXZCkBSnchvRyPJ0nn4IxZwZYsQhBxCtvaPrnSfa+c21oxK++u7xj5SY6XaLPk
	 t8k+mQ3wMotkod79fWhxHH5dO0WbKZ/unNdmKUpN7NIlPBUSXa/PxSJKJwzfUJANb4
	 etGqsAELXDKm5RGDTkBQ73greqCGXhFbvd4PFgUxqiJyPD7pnRmVc7EVQlhbJd8kWA
	 KqTiumGMiE7sA==
Date: Thu, 8 May 2025 12:31:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <wt7du4fu44sxut5i4ymhmb4akhm46btm7yszz6xbya2sxq7gdp@al24jhhqdz5c>
References: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>

Hi Alexey,

> index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
> -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
> +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml

this has caused some conflict. You are based on -next but i2c
hasn't received some of these changes, yet.

Anyway, I fixed the conflict and merged to i2c/i2c-host. Let's
see how it goes, but I believe we will receive some complaints in
the next days.

Andi

