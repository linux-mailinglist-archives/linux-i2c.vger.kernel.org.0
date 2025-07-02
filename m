Return-Path: <linux-i2c+bounces-11769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4332AF5CE6
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8738F174E4D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9662F85CE;
	Wed,  2 Jul 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgZ91eqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017172DCF5D;
	Wed,  2 Jul 2025 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469990; cv=none; b=QuAlTiLOzN74t/V2qTKEMlETstfa9AY4zf9+6BWAGrY1y0BW/YAh4VxFsJEX9sDQPetd++C0WZYc5nZOxCMIqlCkW7p2pppXBQDDuOTDmI3D9LeV75oOcLTNWJ5hYtmI4SqbeXyRHnuM9sV2j+ycaA5suEG4sDPfBU6z0P6otUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469990; c=relaxed/simple;
	bh=7okOT5IfYKiyYMXcsNq7ymo61Mb7svz0NuqWQGVawRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9+VE1BJpmhBBDfQmzyUL3HVUrSkpuro3ZaXDPD0phWHRqMWDl1pdTO3aHSVS/PhBoNYJB/ue3VS4f+PREblVqUZB5p9SEWZjCtlpE8WzGbCT0bxJb/QZXJJsOuB/OOMPnDJtyLGvdJK5Ade9Yax81UqBtv+S2Ba8KADZTKU5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgZ91eqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42D2C4CEED;
	Wed,  2 Jul 2025 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469989;
	bh=7okOT5IfYKiyYMXcsNq7ymo61Mb7svz0NuqWQGVawRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgZ91eqR43gGicb2//J8fDAcg6+Nso0Twm17+LeCNqcg3xNlxSiSFRRcfP5gm7kHA
	 3Ge1fZXlAKylUUy0bEJBa8X5yJaHEYBgWJ4cQjQoyASr1HmaC/6lLRP34fGmCXgRSh
	 O9mMGcZrR58AQHcZlc7IArmPZu2tw5f8xjHCocurXj1iUzaKFg6J0OFXYk7ASIhdWK
	 fX5o1Y/NtnHGQdJS8PkIYv8HkifLqKjRk+ogoX/CPohsdhsLkYke0F3l6gy0R5FNyH
	 mdZ3UDvj9KNNmwKy/++ViTua5MUXC3XKyWiiuFCgFlcXThCRFGtjD7UZN7VT/phYZ3
	 Ax9paKt+2tI7Q==
Date: Wed, 2 Jul 2025 17:26:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg'
 constraint
Message-ID: <nx6ur4ptmogej6zsfhaui2t7yhstwi33w53uzl34ura5xzofrl@kn6ku4g4arnf>
References: <20250702061530.6940-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702061530.6940-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Wed, Jul 02, 2025 at 08:15:31AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed amount if items, so add missing constraint to
> the 'reg' property (only one address space entry).
> 
> Fixes: c5eda0333076 ("dt-bindings: i2c: Add Realtek RTL I2C Controller")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

