Return-Path: <linux-i2c+bounces-5637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3395A6A6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 23:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56E2C285A94
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 21:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3667A170826;
	Wed, 21 Aug 2024 21:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBuhswM4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BF16FF3B;
	Wed, 21 Aug 2024 21:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724275930; cv=none; b=LQ3fdsHqVL7wWoAr/G5seThCojmHj6zFsVB8ewy6BVJB+mf/x/qaF3B0Odnc3xvtQfRZvc/KGqkx4QCex5YXVQ3VMQX6yqDBIXlUq3mKnAX1Coe+O7FMgu4+LAp3CoJZS79eHBGFdZt9r1UhoxnwVLR/wMUVUaTb9a3rrTb2fLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724275930; c=relaxed/simple;
	bh=l5xBHEjT3i+UeKlUGVISUFPtAZO6Ebyyuc4e6mTyje4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDFJjel96ZhuEg+kKnctMhtOeU14R3DdAi5A2z5d3ClmWGX1nuGe1HviroQMzEJGIAbRNOnq6OXd5/yNjuizZon2OeyBcRSr9cKkj9RRHnoyXFTPIg1I7JS62Q3jcGBCn3MvDLaxEoMJOHo/TCQh73tS9OA7rFwXYyhmPsq9JXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBuhswM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02A8C4AF0E;
	Wed, 21 Aug 2024 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724275929;
	bh=l5xBHEjT3i+UeKlUGVISUFPtAZO6Ebyyuc4e6mTyje4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBuhswM4RGc4yx8nKhn/fDU5FwvUCPvpwv8f3f2HYOrbPGVmuvBm/elaRvfmqnbS7
	 BH7Lu+6+FXazVjRagDwtsdl5OEaY55j82ru93UJN9KfeMItUS7lP2AyNejSZ3P1MYL
	 WNGwFEFn/UNGsd/XgHJG8zgTZ4PR2BzElfGrtMgrrTiaKGJK/uOrptlmObvk8cWP0Z
	 TOf8abzPNXqe6rl1nL+HGFN2i7+OL2yaLx8WFf21t+YP8YJMeQEXkaxSSYMw7d1l9Q
	 Tv157jv5/Ye/PaP8Fm4+epUDjtK/pBaJG+fBgpcfj20G7pILVrhWUx0o5GgE64LVVc
	 Tmz5USTbVGtDw==
Date: Wed, 21 Aug 2024 23:32:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: qcom,i2c-cci: add missing clocks
 constraint in if:then:
Message-ID: <na4tcb6qn5uzm222zq2lnmilivfxl5d5k3jp4jymb25j6kmpbl@q3h7637y32ta>
References: <20240820063124.9242-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820063124.9242-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Tue, Aug 20, 2024 at 08:31:24AM GMT, Krzysztof Kozlowski wrote:
> Top level defines clocks as variable from 3 to 6 items, so each clause
> in if:then: should narrow it further with explicit min and maxItems.
> Without minItems, the constrain from top-level is being applied, thus
> qcom,msm8996-cci allows between 3 and 4 clocks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Merged in i2c/i2c-host.

Thanks,
Andi

