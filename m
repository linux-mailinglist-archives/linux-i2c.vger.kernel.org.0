Return-Path: <linux-i2c+bounces-12387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0AB322D8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 21:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A1C54E10D1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 19:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490BF19E7E2;
	Fri, 22 Aug 2025 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f26JL4hT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB72021ABD0;
	Fri, 22 Aug 2025 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755890992; cv=none; b=B/yR2W6ZODI/6MKKILqDMswFB2zmwyXJPeEE/8FMxXVt6n2waRlbakPXqq61bhTl/D0J9InsPgntXeej5eOwtLPz/WJedjhD044YIFbrkHVlUDbsgGx7sQVoHHBopLuLh74aXgZwLeJ9qzPjh+8knSnCrDM8dm74nYRpBgKLdDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755890992; c=relaxed/simple;
	bh=vdJq0q+my1ci9w+fJXlyPSjDXSOdjzeQy/4dcrw9iVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6s/b6v+yM6Bt1C+lDmBEPniQ26Xv6rAyO7GtL2tct+/IC/uQbv7mKZFQJXsFsgdVdO7kH40T3u+DiAYMu3+pu9SFn2sYjX2E55B+2PJ/XLzu8VYvQFCS0WBkG6eM8q6Un5TYKf5drkYxNDCNBTjm0nEQ5bWA5x/4qgAF4QDGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f26JL4hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E07C4CEED;
	Fri, 22 Aug 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755890991;
	bh=vdJq0q+my1ci9w+fJXlyPSjDXSOdjzeQy/4dcrw9iVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f26JL4hTa2a+spujmu83Fj2J4dNM7QAdh3rEmzH/rlz2A87QacngV0QCB8l7wyEuD
	 GdTi0XaZe2yM60aDYFa52UaxKkmaC2ccDHBimuM8mTOhK19NDKlU7lpWl9l5G6nXGT
	 RDrirbrVpwy1pX8Ew9i/5AAWW9+aQtUGNewov6uVXKTTEy8/tV/9fcPOprw52Q4f6s
	 uvb93Gxu41v4Z7u3Etr80ugzjXqRDXDqxF8rzjbv5cgJBRdsShJ/3d2x/7whiTemDT
	 XoURB8jY01XfNHQa9aFBH0fii/4wkOa5zQfsiC12epXAqcXcZ2R7HpKfIWLViEXDOJ
	 yZa/s2dw4AiiA==
Date: Fri, 22 Aug 2025 14:29:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, Andi Shyti <andi.shyti@kernel.org>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <175589099015.179539.7406634421042380290.robh@kernel.org>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>


On Thu, 21 Aug 2025 10:32:06 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


