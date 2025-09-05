Return-Path: <linux-i2c+bounces-12691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5100B461AB
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 20:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894531C8297B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 18:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB7C36CDF5;
	Fri,  5 Sep 2025 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFgDxtxL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E47F2F7AC1;
	Fri,  5 Sep 2025 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757095428; cv=none; b=Oh6+PTGfPHrsaq/91tmMAt6fgapYon502ho/1/bW5sh/02bAzu8KDaLEAJQ1EcUsBiTPGhpGOJipvvxAxH6qspT74NqfJKY6jc/hhjq+XrZ+PDeg/WMyqdUto1r09so+4fdbcrhreUSLScYAIfcTi17STUU8WMtuzbxsZgZ6tmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757095428; c=relaxed/simple;
	bh=aHNLolNwFIWfnR3I99LK8r6Twqb2kIqTa0Yq84hjZco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8k2E25GzWwQveiGGh8Lxm2JekDrpQ226WKh72dKpYXgXGzgSKIMjgSXHHgZFf1J3rSBc+SShCBspPKdPM6AQrdXGfC4SIUSvHHOPUphpsUZFWTSjLLWdcgc346I4c3qb/02JXG2Im3AL84s2Fwpflpj4EGU3HlBbqOY9NhKbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFgDxtxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C73C4CEF1;
	Fri,  5 Sep 2025 18:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757095427;
	bh=aHNLolNwFIWfnR3I99LK8r6Twqb2kIqTa0Yq84hjZco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFgDxtxLkDnaNWGC7yASrUFDQHbVOe35eVK5S9QFKMoH26XAbGr5w+5CMxqPB9/uX
	 fcNCURIvQnpp4YnFM6L1fdEWOwDhW0tVwUj4TS+ZpOCZBGY4fTyIopm1ne6rtz/lr8
	 Rutp6XzISO0+OFL8jyJCqhjE+QpyldalEf+4D/xidtnarTS/emidVENUwUAcvB1ahx
	 UebB2P+p8n1UZeUDT0oMEnGSmzfyZzfhy5HihZFd88Q3jGQiw9lOeOPakSigW4NXc5
	 346I+FpMDt8vQ0io4uhMajc1zZLSM7S7AHx1rnzTHeFWBLT/O6rjs5gxVMCUyRBr7n
	 8sR7XShDXrITg==
Date: Fri, 5 Sep 2025 13:03:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: i2c: qcom-cci: Allow operating-points-v2
Message-ID: <175709542621.1016405.11547576176371094011.robh@kernel.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>


On Thu, 04 Sep 2025 16:31:21 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> An OPP table is necessary to express combined voltage and frequency
> requirements for the CCI hw block.
> 
> Allow passing one, without requiring its presence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


