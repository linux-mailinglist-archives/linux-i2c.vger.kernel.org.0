Return-Path: <linux-i2c+bounces-5473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624C955D1E
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Aug 2024 17:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899121C20F9A
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Aug 2024 15:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2B245007;
	Sun, 18 Aug 2024 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMEe6Hyo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5C3232;
	Sun, 18 Aug 2024 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723994145; cv=none; b=s2yU1gFj4C2R62PG1/76Ps7XI8hebr7UnZUZUIIiWw6D+Or8rtsOaXEAdldVrThvD1kvfo7o32MmWAQU/5ZS5mMTx8lVOTZiBuy5FuaO5M/GtEyZm8QBEE4a+TWyOn0u6zqHColkJT4bbIL5wg5L0ZkbsT4KhnyL4gmR2FPOTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723994145; c=relaxed/simple;
	bh=tW5sOEFgT33+2UukCrapiNz4mmE63f3gCo8xq+yXlkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4wDQ0bGR9HchQ8mNVQ25ZvLpLJBMLQAHmXHLGIGAj1rNHXWTA1GOxTraQVJPbLvRTLu0OtJSwarE2zvF3qZWx1jmADZwYCYm+LwG8RSRmEDdSnH+SC3XSsERYs6eMREdoy0kQTh510kEDHanRvEOBgp9hv/KxutzzlzwvtlXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMEe6Hyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A4AC32786;
	Sun, 18 Aug 2024 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723994144;
	bh=tW5sOEFgT33+2UukCrapiNz4mmE63f3gCo8xq+yXlkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMEe6Hyodx54GX6KuQDStFlNzP/m8atWGuVmFoeGuOJNzKu+pgykDu9RKGII01RM0
	 FqES4yF19Va0s7YBxXqhXsTLDUdsWlXMWCZmR7P6E9OG6MAYMaeqDxYY+vGkuMXXdd
	 hhjgAJwIvE9NphbvB/hBwRMUwcyxValVw2lAn37RwQQj87JSncpc0g2VTqARfRdS60
	 DGlxsLCS6bgexz1DfZ5hVB25eGsbIHNjQwRKhRvgfCI9sF+zDujK6cyhISqAxH85vO
	 TIORgNFmi2JWh0PToCQp4rCbtswRwnDclwXa3fjfgfzVpqK4E1i4Bl0yV29bsSuRyp
	 Ec+nLwvFXdkMw==
Date: Sun, 18 Aug 2024 09:15:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
Message-ID: <172399414297.96963.16801957440346846709.robh@kernel.org>
References: <20240813230037.84004-8-mailingradian@gmail.com>
 <20240813230037.84004-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813230037.84004-9-mailingradian@gmail.com>


On Tue, 13 Aug 2024 19:00:40 -0400, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


