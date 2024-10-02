Return-Path: <linux-i2c+bounces-7193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A798E4BA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 23:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBDD4B203FE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 21:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A529217328;
	Wed,  2 Oct 2024 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rccnBrwL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EBA217321;
	Wed,  2 Oct 2024 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727903834; cv=none; b=dlm2+PUV6g93D58EtNXSNmspcYdnIzLQUjc5wxHkocmV8km510OAn8iqmhpTJmZfy4PxLuDWS4Pbvv1EKG18+xFQxtK1FEYKuJHz9ew0KKZg/2nWia/jz3nOJrI7moyceddAFT9EkB6kLdtiGahtsEbbHWpqnw7N3sbCM70rWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727903834; c=relaxed/simple;
	bh=kpJ/omUqILOYyziCaBhk3ZAXJAbS3DpqGIOJeCBzFHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzZzGETPnpxRtHeJ4D4iK181w2dzBxcni47ETg9fx2aIt0VlBf5ZPsITSdDQUEyfRwLjI074Im4SFLuvZETf3gThfQDgQkDw6p4w/MTt1WW53jR7S/mhQAQ0WgtiOPMMu4Onc0q9AtN06ev+fY3TQoSXy2SmuVN7nMFVJ4yfMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rccnBrwL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC2CC4CEC2;
	Wed,  2 Oct 2024 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727903833;
	bh=kpJ/omUqILOYyziCaBhk3ZAXJAbS3DpqGIOJeCBzFHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rccnBrwL9njKVjG0B3Jr7zzLRbNWkXYfjluqu4DDCBlq92mXBhagX1qE4iuG7Gnri
	 VFkwqV5vSwV8/IwYGo5e+9HncFBUV0D+lykGx8m7umpRQspb/x7XzobQKVSPORszF1
	 xcTsdJDTrNSPVqDYjaJkoijKVkAETUeAQeUdHWr0PjBQsYBjeBowJ5WQ/wkrSy6sY7
	 FaO5CoAITt6YZUTX/q6UAEepD6+5EoOfL1oGsRBFX3UdqtrxGFsE4ACEJ8V/I7+RyJ
	 Q8HDCdXYMQ7CtI9W86sM6RkUrVxO4bHGHV1hqAOWaIkqlKdtQyNn3Esayjq8oGf6je
	 k352vLxsjPMTA==
Date: Wed, 2 Oct 2024 23:17:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] i2c: qcom-geni: Keep comment why interrupts start
 disabled
Message-ID: <bugbcj7dysydc7bejjtfnrvdqq3w4xtd7rxgymomyzcya7aobo@me5ivlzj5bmt>
References: <20241001133620.2651795-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001133620.2651795-1-andi.shyti@kernel.org>

On Tue, Oct 01, 2024 at 03:36:20PM GMT, Andi Shyti wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> The to-be-fixed commit rightfully reduced a race window, but also
> removed a comment which is still helpful after the fix. Bring the
> comment back.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

merged to i2c/i2c-host.

Andi

