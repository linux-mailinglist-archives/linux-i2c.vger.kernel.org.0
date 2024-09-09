Return-Path: <linux-i2c+bounces-6402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8589971A04
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41341C23093
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29841B81DD;
	Mon,  9 Sep 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSio4dXn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628381B5811;
	Mon,  9 Sep 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886402; cv=none; b=Ny49Yv+bU+URnyz8jUk6pdCV30bqoK29fdSM4NPts7/Z2skQu/KP9cxIJ9TACIoz473a+3rdTVnsPRlipGVUGkpIj1V4lFWYuxcCQJI4xmAIVRFe0sdiDuMGpsI1ATcAWeLDnRwiPeTOjwict1lckXthC5PFBTvUBt0TJlGAGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886402; c=relaxed/simple;
	bh=pDUb1q6JzchBUPz4BgEpFQep9MHv+L4GOI9KmQV3dIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qml+9aoimAbhxNGzSpRCr5QmJ3eNxbHgXVlyPuN/dr33+yX91UZ+cOeTPL4ex0So58fs58HZg7CSNUgyG42jdWzT+AwHDGWpYDfHImzxO+U13d17Cmtb66JeIQYbhRsSDxK56z/WZItSjrkHXVQcsiGT0rhXE1I0f2AyFDAbdpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSio4dXn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABD9C4CEC5;
	Mon,  9 Sep 2024 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886401;
	bh=pDUb1q6JzchBUPz4BgEpFQep9MHv+L4GOI9KmQV3dIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSio4dXnQO1lqCO1VCgX5k5A6E0mhV3QEepBPzppUCkpKehJy4Y1zyIBG7jGim5KG
	 5ii/eRDqCB8yBwCj81NHo/V/ACNKlicMhbg0kGq5X9VqgixufE88v6jq5OAJmwYuxu
	 wagl+aXwcOrN5mL1pfdnr8krgViqUov/XIMm4VDO8gxgQXo6nhNxuJJybBHbnELacj
	 xICmh9cD+7n69YaQDZbZ7/eHajeLzGddbzvn9il7UYRv1tbc/iorX5kykqeHXCGbc3
	 W0P3O/NDhqUB+WDIHI+orXmTqrEYa6M9efFzk9hczx48Yl7gl5uxc97dVq0nX5//2F
	 VQdyIvCZfH/Ag==
Date: Mon, 9 Sep 2024 14:53:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	neil.armstrong@linaro.org, konrad.dybcio@linaro.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
Message-ID: <fhojgh44bcqhpbdffclop75uq2m32txvkwlht3sipiq2kdfr27@6gv7gpaaybhv>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
 <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>

Thank you guys for your reviews,

On Mon, Sep 09, 2024 at 01:37:00PM GMT, Konrad Dybcio wrote:
> On 9.09.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
> > Hi Neil,
> > 
> > On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
> >> Hi,
> >>
> >> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
> >>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
> >>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
> >>> usecase requires i2c controller to be shared.
> >>>
> >>> I2C driver just need to mark first_msg and last_msg flag to help indicate
> >>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
> >>> access from other EE or Subsystem.
> >>>
> >>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
> >>> Unlock TRE for the respective transfer operations.
> >>>
> >>> Since the GPIOs are also shared for the i2c bus between two SS, do not
> >>> touch GPIO configuration during runtime suspend and only turn off the
> >>> clocks. This will allow other SS to continue to transfer the data
> >>> without any disturbance over the IO lines.
> >>
> >> This doesn't answer my question about what would be the behavior if one
> >> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?
> >>
> > Shared usecase is not supported for non GSI mode (FIFO and DMA), it should be static usecase. Dynamic sharing from two clients of two subsystems is only for GSI mode. Hope this helps ?
> 
> This should very much be explained in commit message and perhaps in code
> 
> And since it can't work with FIFO mode, there should be checks in code
> to disallow such invalid configurations

it would be nice if, along with all these open questions and
clarifications on the commit message, we could add some good
comments to the code as well.

Thanks,
Andi

