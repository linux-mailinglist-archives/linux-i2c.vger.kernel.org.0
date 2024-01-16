Return-Path: <linux-i2c+bounces-1333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909582F1D2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 16:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87D2EB229C6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 15:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213141C695;
	Tue, 16 Jan 2024 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7hkVFcF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E81BF53;
	Tue, 16 Jan 2024 15:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCBBC433C7;
	Tue, 16 Jan 2024 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705420204;
	bh=i3khedQ+kiQ0f7qWV61kvzfkthuUNxWpEynNOJvz5Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7hkVFcFHNtDHPtRPUO+psut8uD4XDQ6J6Z1j1aS25VcpxgYMF04nRcp021DwdSuU
	 blLjX3+dH65ZlAXHYHJP1NrqwAxhuMgbD1rG5IRXwiXmUA8epSC/TYjopWZggSd7Z0
	 LvTJ6v8QKqnmqA1f/yD2zFgtNpOcRxehzcVV1Q/zyInUErQNUo/aMEr2lVAg9bPyJs
	 uqnU1XsKgJUNFx9JcDsP6Mt5VSCwTGpBJG4Yshf0Swzg2I8uFVndetcfiGcwpch+Dd
	 SBQgciWT8/tKGvHdFkMLWjCHNOxapWZw4qPWi3e2JtPeJM2DsR973TyY3f4pqj2qS/
	 kWeSsW7GjwAJw==
Date: Tue, 16 Jan 2024 09:50:02 -0600
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: cw00.choi@samsung.com, willmcvicker@google.com, andi.shyti@kernel.org,
	gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org,
	tomasz.figa@gmail.com, Sam Protsenko <semen.protsenko@linaro.org>,
	peter.griffin@linaro.org, s.nawrocki@samsung.com,
	andre.draszik@linaro.org, linux-serial@vger.kernel.org,
	linux-clk@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	jirislaby@kernel.org, linux-i2c@vger.kernel.org,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel-team@android.com,
	mturquette@baylibre.com, conor+dt@kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
Message-ID: <170542020157.4185440.8965772370823681119.robh@kernel.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-2-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109125814.3691033-2-tudor.ambarus@linaro.org>


On Tue, 09 Jan 2024 12:58:03 +0000, Tudor Ambarus wrote:
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v3:
> - rename the clock names to just "bus" and "ip" as per Rob's suggestion
> - collect Peter's R-b tag
> 
> v2:
> - fix comments as per Sam's suggestion and collect his R-b tag
> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>   was not implemented as I felt it affects readability in the driver
>   and consistency with other exynos clock drivers. I will happily update
>   the names in the -rc phase if someone else has a stronger opinion than
>   mine.
> 
>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>  include/dt-bindings/clock/google,gs101.h      | 81 +++++++++++++++++++
>  2 files changed, 104 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


