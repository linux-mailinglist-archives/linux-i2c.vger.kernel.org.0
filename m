Return-Path: <linux-i2c+bounces-12759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264FB48758
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02711188496B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 08:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B792E9ED2;
	Mon,  8 Sep 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeoQeGoC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACD1E492D
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320625; cv=none; b=ZuFL4lvpQb29LfZat+kOj4FfC/2Y85f/jSsWBeaJSMSkin3bhhfMvj+/xk+N1M9X6ZBSsMEUYjpoLekH0i/CML8fWYOYSrDOdKLghfmR9qNzY8qTuOo3mS0Xecl8gYfG2LRC9PgL+jW8BX3uj1+17aB1jTUUXZAHAdUc/bLUQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320625; c=relaxed/simple;
	bh=NXnb+PUluiL2AhSnB1IAsaQbX54JUl7zDPq2/38XIo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or17YBV7dPY7+O05ps4BKYjaIKFYFhetJNOFfywXZScMhm67uxxGrbxHcIPnO9LFfqktMlYS9nr+tVVrNkqhn6vciO6q9gYKReDplQXtWvzBx/l7hqWXVAdildVpOh+iLQN8wBMh90RNsvAwXCFRv06PMhtOunsNtBjc0vyIfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeoQeGoC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b00a9989633so778185866b.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 01:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757320621; x=1757925421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XH0JCQWRm8WTHxpKfgo5DMbnz5sypzW+t0+NXBLukE=;
        b=DeoQeGoCkIZbJ0qFP6yaMOh4YHZegb30G1mfgxHCThNf6a1zwkgsnKo+QtEAX888Cb
         7+QBxpGT9VhSAE7M2sXITAG4ZGPBy/AgktBhIwk710XdFPRJ6iytOLWsS1p6a0t3bvLQ
         LQKTL3icelHKaP5LaVbc9A55AvbmIa9LbcGZNggtoJdmi2ppPqnOEa9VQT4dIKeu9yOO
         oVMV8BigZvZshWaAXUuYEjzTNLoXGeXCDfhTbChbfVQAFa2xlKXGR00Mkxzox+ncvlBp
         RtzoBdqBNHc+yLrzm+4X7e6qQTo9nxPt6/1ARMRQHGiHsCMXzeqPo0pKjVnBf8SdS26f
         +3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320621; x=1757925421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XH0JCQWRm8WTHxpKfgo5DMbnz5sypzW+t0+NXBLukE=;
        b=rEK8Di1VnKT30ma3XGwozlrJkGMrmumqZhBsKy+uJz5SjzijVTOBq1CD/na43hlrEF
         t3/y74762ItDt+l8nFrUh64O/HUrRTFINyv9Wnlt2nG7qkntJAleVJOcVSDm/Jvpxio3
         iWoPqEIl9IAN1qX0UZaHAt1MqFV/pzYROv1zQ/zgtMmMw5ZyuYT+VEJDPZE51qoyzWIZ
         xZUVTfkU449hKztGV7Y+ns7OGo74I5BArUBhq1/1GViDjtqfpGaO5OU233o0yz1J8Xgk
         BpT5vQyi1Z+aQsrjdSF4W8HPNA2/jHJwc8LssPsrY5RvIveQGKG2I9JtrjtQJUhK3ZrU
         3phw==
X-Forwarded-Encrypted: i=1; AJvYcCX8cfg/734FtlK9Sm2JEJJcoqxeGpapCsJoEkgI5097xsuwoIM/n0bCYxtoxJPeXtrR2PL8d+bWSWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22PLkf5UjGequwvhFgNgo1Lqo7am0csyAyWWp9noAI7gD2+oM
	P69d0SskKaUl5qCqu2JSfnoymbxR0jqV18+6Maitq3DBnIUpnSjGQ0WWHpQg1d5IaLw=
X-Gm-Gg: ASbGncuLtoEwDagyS4RbFWSa0Z92wPzny+WgC/iehT2GAMAvBT0CFibzeVHrzkgN98R
	y5bfuB1LHzlW5hlQeIIP2YLKoPaJuhHCn52FyjCAjTJrUQUgJnU7rm5KNj+NbTiYTQUpCaxUvIZ
	Fs1us2s/VedwtPer+Fa9vKo8vxnOE1uNo36CPbs8LvhogagRq/3NYVkJIZk48goy/7/QrAJB1yV
	iEVN9Tat3DrJPDnwzoa1UoralMeAg3Kf27HXju8PC1tiejdqb0Faeo9uSwgTaWsLvpaxy6FQ6Vx
	skfCwA/oF0jq8XYOBN1Ut/5fHCVRfdC3LpK1b144E5wYvTU1O7Vqsnkj0Ug7ynHL1hHtwsexuKz
	LUQcXoGr6M1lbnIzcn2jJLkVcv2Pn/WK+
X-Google-Smtp-Source: AGHT+IECPDhPNh/BGrjoNwZ3MFMyy/CdulLWdnO4Gww80R4odqdHGExKH03tYQgvNoDXudzRKyAP2w==
X-Received: by 2002:a17:907:9691:b0:afe:ed05:2e68 with SMTP id a640c23a62f3a-b04930ac043mr1180321166b.11.1757320620463;
        Mon, 08 Sep 2025 01:37:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm21501622a12.44.2025.09.08.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:37:00 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:36:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6Vp-3er71AJPJd@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>

On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock has voltage requirements, which need to be described
> through an OPP table.
> 
> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> (which is a value common across all SoCs), since it's not possible to
> reach the required timings with the default 19.2 MHz rate.
> 
> Address both issues by introducing an OPP table and using it to vote
> for the faster rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Using an OPP table for a single static rate that remains the same over
the whole lifetime of the driver feels like overkill to me. Couldn't you
just put the "required-opps" directly into the device node so that it is
automatically applied when the device goes in/out of runtime suspend?

And since you need to make DT additions anyway, couldn't you just use
"assigned-clock-rates" to avoid the need for a driver patch entirely? We
use that for e.g. USB clocks as well.

Thanks,
Stephan

