Return-Path: <linux-i2c+bounces-10513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AFFA95820
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 23:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9DE63B06ED
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 21:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CCD1F0999;
	Mon, 21 Apr 2025 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iU9s9Bcf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939618DF86;
	Mon, 21 Apr 2025 21:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271596; cv=none; b=DwKcEnu1QdurZGlg8GbYZmlpPDoSkjGmFRzlOfNGRnoqpJekXvB3QEyGCAAdLk4lKfQBitxjAs3LnPF/qKKf2zT8qjTJ0Ud2hBSZ98bFs5iL3FZYzL25+aclXDpklkOKm+JmlruYzCLk0NSHbtN+8/oTeU7/8afO/76F4rOov2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271596; c=relaxed/simple;
	bh=T3GkSIIQ85SqUH3WTbvVEGRU5qdWavvOZ0ZLlcEvrUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiWGF2cKZ575U3f8IhtCFtUcWFVx7arc8HQlYoE2EfGeAovb2KKusj4ECGoA5AumVbVjXKUwMh7DktzUArg/X7g22pH/ObHTnQF4AYW2UKNnorC39ki4ymN6IGLOj9L7n2gJ5CblzpwAHmbi3GuIre+V/hJJp380SFafac3Ui6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iU9s9Bcf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C098C4CEE4;
	Mon, 21 Apr 2025 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271595;
	bh=T3GkSIIQ85SqUH3WTbvVEGRU5qdWavvOZ0ZLlcEvrUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iU9s9Bcfqu3uHIwjgQ0eNghHcyH1y1w0r93nVf1yUypGDtnIszxb5sUUpL6YBG73p
	 xpBKhoEeP8gERBAzbUpvIW+gRMVaDGFqed+xeViaRjmjDNPy3LmofJpLYZv3PvXDdb
	 twnjyuAunL+0wGt2l2RIGceTCenSnhLa22QS0PdOY+x4+fe6mCJk+ypueyWVjyFnau
	 XhHNWzIaiKvI5tH9hzAbuQtJ53/fjD1acdFPx5FanpzY2XAHegyICHR4XDtcisoAeY
	 Udir0Otptffb9eLkTbuJZKN4f9kooMyXrjACE4girwIFhAHSQbFiAU0zk6HJKGkNcw
	 LHt0OkMRI1Hrg==
Date: Mon, 21 Apr 2025 16:39:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, qii.wang@mediatek.com,
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, krzk+dt@kernel.org,
	andi.shyti@kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add MediaTek Dimensity
 1200 MT6893
Message-ID: <174527159303.2974989.13770361241529717897.robh@kernel.org>
References: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120303.148017-1-angelogioacchino.delregno@collabora.com>


On Wed, 16 Apr 2025 14:03:03 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC; this
> chip's multiple I2C controller instances are fully compatible
> with the ones found in the MT8192 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


