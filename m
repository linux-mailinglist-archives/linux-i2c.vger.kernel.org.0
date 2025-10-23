Return-Path: <linux-i2c+bounces-13753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975FC01530
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 15:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90E633AD92C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365A230AD04;
	Thu, 23 Oct 2025 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZMmalc2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17D328E00;
	Thu, 23 Oct 2025 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225542; cv=none; b=F3ndcun1caz5iCcUhy5/1XTUsGhvl0Yiab4pDlkWkXJ4pJq2c2KBrFHK7kxEdb4a5fKPhHWoXgyKNlhXVI8pKLArZnNJ6xqHRs2dWJQrUfr6ugsYTI9ox925ZS2wUaleJnsXj4IRb7GIR5ngmLb7pVrYjuTs0bYa9z+ebKJVsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225542; c=relaxed/simple;
	bh=ZJniWJnry8+fO1GaHhaSnqADgGtJIJ8AN2vSP4jyT1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbwrhNaM9Je7U98HNPlby/IXGTS4thXgnARqQbCBNREeefsz5G7erTmP2HDCotkQHcjYo3Srsx34J2w7SfiCOQXzVLsyOpi/733ghglyVIKTPWAH2lz5m2mt8ffYnnKsJiplbO/13FQlFKPEtx6M6lbHnMH6wDGy0qvkSXMNT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZMmalc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A02EC4CEE7;
	Thu, 23 Oct 2025 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225541;
	bh=ZJniWJnry8+fO1GaHhaSnqADgGtJIJ8AN2vSP4jyT1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZMmalc2PI3KQ7dFvTUbDh5yiuRR4B1rQ3kmUv8x1XuziDKiGm2c5xo+zIOJS33ZL
	 TzYj8VUU+eeNcNv+iT0z9B5GZBqNhmcHPo9Y/EpmnSgYaZBJggGycuQHG41gtLcSNv
	 pz6n75HxPtBXKGN1fIPsWj/N8maA1w0L31Fu5JlvFxhrxaBKxMk5oLTsP4gtaweIhZ
	 3121XndTj/q3er6QBG1jJLho5B/qmhX8b9a4ojOugm0SEK7up/WiD5sb42G5rViHUi
	 mcxXYN8ldCZJF6JVHZnP9Z/HqzzQW4rkNT8Br/iVxAckKmwkSu/04z3YxaXdKdsVUd
	 hKAg6n+XxALIQ==
Date: Thu, 23 Oct 2025 15:18:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3506
Message-ID: <ka4wwbldtcmsivvoie2qjzdzadjpougx5odwztdy53252h3l4u@y4sfbrdbagp5>
References: <20251021222853.193224-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021222853.193224-1-heiko@sntech.de>

Hi Heiko,

On Wed, Oct 22, 2025 at 12:28:53AM +0200, Heiko Stuebner wrote:
> The i2c controller in the RK3506 is compatible to the variant first found
> in the RK3399 SoC, so add the RK3506 to that variant list.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

merged to i2c/i2c-host.

Thanks,
Andi

