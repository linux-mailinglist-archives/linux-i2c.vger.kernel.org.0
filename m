Return-Path: <linux-i2c+bounces-5888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0569963CF5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF121F2429B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 07:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01085188CC8;
	Thu, 29 Aug 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryNyQ0EH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1914F130;
	Thu, 29 Aug 2024 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916580; cv=none; b=naHgX4vFcn4Rp1RSquNrIyUlI97tXaPs3Ts/sb3QeXo109sbqWDDVXQ6i2Yr+4ngb2w0Xvw3/VY8QB13Tdw/xw5fIfi26QHGlgTluTwnKaHvdBpNkKlNNw5k2dZePZLfiU8tXlC8/tNbPV7y7LL9jsrbL48GMdmW3Za/fIkSeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916580; c=relaxed/simple;
	bh=+m9S5mNySce+WLH6H5YlfJXs1rGPjwg6wZ4jhq2ANek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIt/jqYxazuXD2qRPQNl7eLrdjefATrFALkv8zPsGJEgvzJ68UC7gE0HHOOcq9N3htrMITGlSwu9bpZESY5lyoU1nT9WHd8q4FgQSqr1wHWNUPmCPabDkq68RjUQCWG6LbK3Ubnj28U9oEaGLkgxGteS4TvWVI/Vaa3+03wXKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryNyQ0EH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0F5C4CEC1;
	Thu, 29 Aug 2024 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724916580;
	bh=+m9S5mNySce+WLH6H5YlfJXs1rGPjwg6wZ4jhq2ANek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryNyQ0EHzvni8Ol3gAnMEa3kzgxM8ZaEzkXjVhsIs6mvCD70MB8tAL5X7leZsNUfQ
	 0UDs9SEueUErZq2qLC7PTG/XzhkWOBzzIYQpUET6C43KrPhOLUy8IAV5aUY5gj96aI
	 Xgkdn+hVEONzvLxejuH5jdqtaIANBFKHm5dZEZMQFnKD4NLHF8QMGu0TEOT4FamzaO
	 YcO6H+s4FcZ+38bUVnHuhwQCKErpmM1ERMHut9PUxZHVY4CJ2+xa0MElDR+lNVVrgX
	 X0FWYoCgTPZ++pFcB4y/3stJOtAQetufFsqwbj7nhADgzaiimCBAiY0JCvmQGUTMZ4
	 EDmZ5ti1yftZA==
Date: Thu, 29 Aug 2024 09:29:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	robin.murphy@arm.com, cristian.marussi@arm.com, rui.zhang@intel.com, 
	lukasz.luba@arm.com, vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org, 
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com, robimarko@gmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH 11/22] pinctrl: qcom: sa8775p: Add support for SA8255p SoC
Message-ID: <erlzqkxrogk24ugfahfsxrramay6tfhljnxrcfcuhe24pla7k3@lytnz3kmszyj>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-12-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-12-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:10PM -0700, Nikunj Kela wrote:
> SA8255p platform uses the same TLMM block as used in SA8775p,
> though the pins are split between Firmware VM and Linux VM.
> let's add SA8255p specific compatible.

The change suggests devices are fully compatible, but above description
does not.

This looks conflicting.

Best regards,
Krzysztof


