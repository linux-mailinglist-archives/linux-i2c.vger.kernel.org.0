Return-Path: <linux-i2c+bounces-7016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11980986C96
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD41286D90
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6033C188CA5;
	Thu, 26 Sep 2024 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEC1ENjN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9A187FF9;
	Thu, 26 Sep 2024 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332523; cv=none; b=hNUw23sUhXFm5WJ4/50hNp42H6LA+FMNW8f4aJmFghsrTucihrY9wsr5ElqKkWS0bYGfsHQpeSRnY8fkzwolWKo/3NaYFjIpC85qhRZRORcK62hzCOxDNYRWGpENQ9BvA6ECj0ChUm5+cY8+kv1h/rHd3f+7qbd9LJFi0nvIQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332523; c=relaxed/simple;
	bh=PO/6Zp84ZuCm40Dgw5tmnLIU2ZUwmTGgZe6kZUgcJvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPOtylYK7qDDgSe3g33C+yqQuHFXZCpGXU8X1zR017WxFhexeVhIsisPVE3sBCkqfYy+fjurdXbGn1NIwJHRYIdMN6vUTwVOymv9YLLHkDcEdsJfTj3ZCdUEtMStX2OQLKkHshl1cpoXcXpxHSVp4QL/oBYUX6vNzQwNxwz1WU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEC1ENjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D669FC4CEC9;
	Thu, 26 Sep 2024 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332522;
	bh=PO/6Zp84ZuCm40Dgw5tmnLIU2ZUwmTGgZe6kZUgcJvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEC1ENjNU3SZucMSURgGfeod9h6gDfGCzxJZB2VbU56d1HVsohKyBBkELLnGd5aj+
	 Gy++4kWgct4364IIikLuJv8pqdmJyJ9OF838RvWbYK4eVOP0mQ/LLLRkoiLcAKJ1cf
	 jKHcwQto9J6MiJQa8kSPahAsWe9e2+VB+BNqRhLm2ZESov1JOfOintWGfyI4/afOQJ
	 e46amhCByRraN5R2PS4CA/ImatMXlFeJXOT63hRLLXqtjtMs9Cd482/Kos0dXWB0vO
	 H+RKsMnu0TPnoTh1FY3eA8xQ3oXEeL1sqa7rlYS6ObjO9nopS/Kcs998RO5pGF+VPn
	 yErexTZvQchow==
Date: Thu, 26 Sep 2024 08:35:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 2/6] power: reset: syscon-reboot: Accept reg property
Message-ID: <orfv5lx2qxemqzwed6p5hgt6rkiolhin76gzvc5syvgffiphtw@ab56xup3c4df>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-3-chris.packham@alliedtelesis.co.nz>

On Thu, Sep 26, 2024 at 09:58:43AM +1200, Chris Packham wrote:
> For historical reasons syscon-reboot has used an 'offset' property. As a
> child on a MMIO bus having a 'reg' property is more appropriate. Accept
> 'reg' as an alternative to 'offset'.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - New, making the driver accept the updated binding

Thanks for doing this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


