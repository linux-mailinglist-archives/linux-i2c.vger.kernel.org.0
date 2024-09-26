Return-Path: <linux-i2c+bounces-7018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50683986CA1
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDCD31F26F99
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D10188CC6;
	Thu, 26 Sep 2024 06:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEJClAtF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EE24B34;
	Thu, 26 Sep 2024 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332616; cv=none; b=ntgH9I272NrMu4cRadSJbt8FbXQ0W43DfePHc+StqUWj2S45Kuo0JtSB8g0RvidHHv5edl3uQbS1+2KPNNGVn6i9/PJz4HSfkp0Rluinq1mRQqEGElO4B+LdSC/ULp7gYYLjCrypTJ5AGE7BOKTVsClxPO5B2OqYWjMD7x1u6p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332616; c=relaxed/simple;
	bh=x9QILis8EI/H4U8nyqrShEROgE3Qii297UrXbrJvA+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjo24DqRtXXyJ7LEHgZ6AnuXVixEKquCUSzXiai/kEjMGtr97C52ywadJoQ8kvQVrPCv9FQTNi5i3Zo7DfJPMtQnXLrZ95aqRsnm5Z21FxMlhK4w21klh3YVWTN784hVR/WnrxPZnV9UWZM7JtVvw4fErfbzYdvQOtkZUWiy8ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEJClAtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0E4C4CEC5;
	Thu, 26 Sep 2024 06:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332615;
	bh=x9QILis8EI/H4U8nyqrShEROgE3Qii297UrXbrJvA+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEJClAtF5t3W1N0+1bq/AgcodlJn/i6vy2dUxtKZS6jxppOPtdNjqs1xLYW43I0jt
	 +9rDk5FxS00tawJD0/8TbOs2e2GT3mxHhX9AhSKDjaPTj/3EN6YFx9AzVM/DiFuT7w
	 AkBw8RGH5WwTta8Yh0eeTpZ9pQ+aIk6xahke9yv2K0BcJGp7FiPWrSFwG4nNygrF7a
	 hnzexKVpTWyyItgGwbhFmQYcstXVAnzgpYwtU3w5Fuanpp26DDxV2IpKE+y0N0m2s5
	 s2rlcw6BTTIcjUXG1QMDKSUc+gJUszF83j7Z+lIIwP9BaIefNA7B2aTLwKs8c5IO1g
	 Os/2gmN/2nCGA==
Date: Thu, 26 Sep 2024 08:36:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 4/6] mips: dts: realtek: Add syscon-reboot node
Message-ID: <5fegmyf4fihd5fotoyywo5fkyyfps4ppqeffbevkuhbhgsr7og@6onv7d3sb3gq>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-5-chris.packham@alliedtelesis.co.nz>

On Thu, Sep 26, 2024 at 09:58:45AM +1200, Chris Packham wrote:
> The board level reset on systems using the RTL9302 can be driven via the
> switch. Use a syscon-reboot node to represent this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - Krzysztof did technically give a r-by on v4 but given the changes to
>       the rest of the series I haven't included it.
>     - Use reg instead of offset
>     - Add a rtl9302c.dtsi for the specific chip which pulls in the generic
>       rtl930x.dtsi and updates a few of the compatibles on the way through.
>     - Update Cameo board to use rtl9302c.dtsi
>     Changes in v4:
>     - None
>     Changes in v3:
>     - None
>     Changes in v2:
>     - drop redundant status = "okay"

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


