Return-Path: <linux-i2c+bounces-9490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E1A3AC6A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 00:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E091887189
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE291DDA09;
	Tue, 18 Feb 2025 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKih+XN5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1A1D63E8;
	Tue, 18 Feb 2025 23:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739920423; cv=none; b=XjXSyLBjl5c4deEHGOKs7Iwmrzi/DPUXwoaoFU0UOxRPIO+vvLtCBgGe2FTVINophvWD8XVz2HaMASigkHd8ZR4db79qbnVbZA+ZDex+e3Fhnwhwo0oh6fNjgz8ukrqR84lfp86j5TFIqNu5oLhDr7Ofv255XUqro4U13UnWGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739920423; c=relaxed/simple;
	bh=SCDKF1HoHHarhwEmWoM3dR48vVDKXe+cF0KeNOcg/LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1euzATzEZtlcfEGdhg4poBuT7cYyMWVcb72XS3Tfu04t54VLBQPNYanJZo4+uQpjNeQoJ4B8XaQSE6ttGJDphZtoCHZkPXfliYMaOM9PjzOG2+ap93i8j44PgsxGKgAXfGJKRMmWb1g+nT6mk09y2WTDDRjYGMC4UGkIoSJitw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKih+XN5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A788BC4CEE8;
	Tue, 18 Feb 2025 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739920422;
	bh=SCDKF1HoHHarhwEmWoM3dR48vVDKXe+cF0KeNOcg/LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKih+XN5AbPDgr/sagGJxS8CT/IQ/HQIOXmp3iAijUX+7AZOpbWJwDLWN1pkMyiD1
	 bj6AzzrwVQiXGY5EX90g9w3JE+jWBSVvl/xrh8qszcFqE+WGkCHezh80F8Bp4hw4qg
	 Thf0tYp3boR5s2NsjTLfWxLSZmtilvstRK7aE2YhWIhu1BPcOPEuxA/6rjYEXJiaKy
	 3R6YS2amX6izCBN4SJtm6A4wtbkX/LHowPAq1xvHGqsGZmmfFM+uQ1O8UtRWx7Hn85
	 wbJ7L/Na2xpTIXwzyMsIYM5Z4bPtFmzFxk5CQskUnWPpQO0QWZ+klz8BeFhW9lkCTf
	 Vs93QF8ACaz9w==
Date: Wed, 19 Feb 2025 00:13:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <lk5gvdt56mzushxyfo2exlzwyj4abzdd2umtr6o3qhffke2tm6@5zkuw6o5l2d2>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>

Sorry for replying to my own mail, bu I needed to fix Stephan and
Konrad's emails.

On Wed, Feb 19, 2025 at 12:02:11AM +0100, Andi Shyti wrote:
> Hi Stephen,
> 
> sorry for the very late reply here. Just one question.
> 
> ...
> 
> > downstream/vendor driver [1]. Due to lack of documentation about the
> > interconnect setup/behavior I cannot say exactly if this is right.
> > Unfortunately, this is not implemented very consistently downstream...
> 
> Can we have someone from Qualcomm or Linaro taking a peak here?
> 
> > [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/67174e2624ea64814231e7e1e4af83fd882302c6
> 
> ...
> 
> > @@ -1745,6 +1775,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
> >  			goto fail_dma;
> >  		}
> >  		qup->is_dma = true;
> > +
> > +		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
> > +		if (IS_ERR(qup->icc_path))
> > +			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
> > +					     "failed to get interconnect path\n");
> 
> Can we live without it if it fails?
> 
> Thanks,
> Andi

