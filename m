Return-Path: <linux-i2c+bounces-6106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EAE96B137
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24BC81C21C17
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B779D136657;
	Wed,  4 Sep 2024 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzfJxgSi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D1684E0A;
	Wed,  4 Sep 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430301; cv=none; b=YaU8WlnzXgf93abw00SEaXRogli1/K5PUusjdbph16SNDWLh6O59iIhs4ZbWf0s+OPdAB+Jfv24cO0vL7oJDHMJoXt5vVsie64LxztwrKhhnUI66d2+RupTQ//xXvwflidK6HSPI1ESgPh5XB+Vpq/CsdGc7xgO1bbiMnnSjCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430301; c=relaxed/simple;
	bh=5rS/xtLtwNLghugO3W3yuSsZC+d6Enu/7XCKm8WxyoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWPBcpve2LIh/2c5yK7+2hNBfYdmd1RgarptwPi5lwl3O39Px6xANF6S3NlQUVZRcCbLrMLoGiAaYLyFLl10L9gYdLpys+lOGFSHKbZsbd1epLAWf1mnUaU0pZFm7hS86sbMlC2Xegita+I63AMT0xQKZnGEYGD/JVq3qKztVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzfJxgSi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC96C4CEC3;
	Wed,  4 Sep 2024 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725430300;
	bh=5rS/xtLtwNLghugO3W3yuSsZC+d6Enu/7XCKm8WxyoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzfJxgSiJJTf0eH4odHIu2hX2Z4o2Q9mwl5Bxe2Z+GBj2ivN3lGdoBj9VCHu4G1yQ
	 wLmUMKpzKLXz0T1qaTg7B0/mKY9P6s8m76v/F4IIinwAg631+9pMSGRhNAeOdUtCkJ
	 ZoeVqnPf9pPCIw3Ljzv7HYY/iyugDaHajIGjUllFkkXSDvcFoxF1Ec7ymxZ6A7Lnr7
	 QOVhPQs0jea6TrGH91MBw/DEp4s1qJm6ZqZsBJipTBnUWg/MhdpeoUsTz2TeHvB7aW
	 oOlWfpPldC8UqenSlQyvqz4sEZ6X8poH1ahqNULgFjFY5Kae/iM9DbJIm3ynafmx0P
	 NSNQGwqcFsj2w==
Date: Wed, 4 Sep 2024 08:11:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sdm845-camcc: add sdm670
 compatible
Message-ID: <sdolo6nutcr7e633ouchz352qoycdbq7of47il5yypfpbtgziu@tvn2mlfq25k3>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-10-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904020448.52035-10-mailingradian@gmail.com>

On Tue, Sep 03, 2024 at 10:04:50PM -0400, Richard Acayan wrote:
> The camera clocks on SDM670 and SDM845 have no significant differences
> that would require a change in the clock controller driver. The only
> difference is the clock frequency at each level of the power domains,
> which is not specified in the clock driver. There should still be a
> compatible specific to the SoC, so add the compatible for SDM670 with
> the SDM845 compatible as fallback.
> 
> Link: https://android.googlesource.com/kernel/msm/+/d4dc50c0a9291bd99895d4844f973421c047d267/drivers/clk/qcom/camcc-sdm845.c#2048
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
> Link: https://lore.kernel.org/linux-arm-msm/7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


