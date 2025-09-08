Return-Path: <linux-i2c+bounces-12763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01EB4893D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0132C3A7E04
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381762F533F;
	Mon,  8 Sep 2025 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXiHg55P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A92EBBBC
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325438; cv=none; b=G/ziXZq4ZARp41gsJ7UmIYE9GtMhSH8Qzkz+iiQ3ZfGpz0xmjNC3w/rotoNuS5YW18UiP06ADdr2Ntp3uPvtAzO/k66Ez0aW60b+FUNwQQj4NYbVcstGUUUmtwzrWOE/wY3rqg6M6VRJwOCeAqZ5iJcp0DKXbDUIWSR6yEv/0UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325438; c=relaxed/simple;
	bh=ykDwW2zeFPOxeLSt8zP2A70oe7r13xxaM+2jTS0GedI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sABApyAR1n2arlEiJ0PqzuchU/+as2Zi3tRQaiF3DsTu/+bJWMr9EN3Xrd8/hlSCt7pPE/AOtCsJRb1qGQpyoVb8ZoCCapr9oN16y1yMcU/siN7X03HXnMscTGlBmFI1I1OrAqmeRA6DRZVRciKrmDarBUYrloL0SVfqgtXc/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXiHg55P; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0472bd218bso655096366b.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757325433; x=1757930233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=haIepL/P0jz30Rbxjb0+O92cxvQz/NbDyzEigt7PcCU=;
        b=BXiHg55PXsd7pKl2UP/uL6qEdKOPNWomPgRlOWdq2sS0g9aXM2fTiSn0EVHCrFIjuT
         TKX9YtprnB4Zi1G7REEYpu+RoJMlguPrKiWZb0E2zUHQR3mwEpLOsglb4Fu9slNugeba
         nIH6SZJ/1aiw8pM1ZDda6ofh5RrFs1mFXsk+AdNnisyllcnx2uDngEwDQYnvsdL5AoJ8
         iSuNnVpnSSRqjnJZDo0mfPuEAOAjB6xXKuxB6oQ7WifUVnvD4ZOLH0gDpERWr1Z4uPqm
         2Bg84/j9cidiKwf/Rzk5yOUTbKt6HR4bh6oeT6Y87OoVaRR6Tin4bCS5Hbl+iYHyLTq4
         tYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325433; x=1757930233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haIepL/P0jz30Rbxjb0+O92cxvQz/NbDyzEigt7PcCU=;
        b=jEFO5734ThyOOM0IumvYtO5WqUT0YpxxoADn8SD0CAFyKYyrpnktn1SvZcazv2klF0
         Lh0ujlEnAJamWPBT/J804HrtnmjexRzIioPISa+mjQH4wn/eLNXtFMHa+uxH9LZ4Ri3A
         Tii/SDllEKuAiPKB7XzxU6QImsyFZlZDyp2OekGLiZIEw2kDGnVA+9K158Nf/rzmCAnP
         aCst2pjHSQ86VRw06MvYkTLOo9/PQClGHJHj0jixr1ii5j9C0wtPu9erpbL/bhLkF91x
         ho8NERZBEMWMrK3L+vMwOJQbkznGzqoSOR8szrc5zfio7kHoVBdZo5HJmXxxNtC2yiNp
         cW3w==
X-Forwarded-Encrypted: i=1; AJvYcCXS7TB19PW7X8ETi/0V2/0oVYgvZ2pYoqWZrCKXpesD/TdS2xiZ/7+hRUMwb7mJNdSKYb/OYkho7G4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgUxE0NcyHw1VGvUK0nLNT0pMHLMZKyQ1Y9n+rReUMsqDfzi0
	JwcFVS7AjGvkfdNJWh8t3/WamhPMm4U1FYHKZ6rA0xKslAPJ3yVn1ox2WHqvNU62Su8=
X-Gm-Gg: ASbGnctYOQh+bjKRFU9x7rfekaLsEO0QbDaeldENAKwmspTz6ndkGzIMSiKcacot0U4
	WfiM56/VaC4TmVVGjXpw+owk5sijeyoDGevAGuTzPsqlL4iFpE1ywS7GUW/xACgqAbb+eqhR6Ew
	lrXk6SnFfGY6ZTnI1mvRRRoM9Qv4vqOVi50kjB9IdhNl7MSLxLBS5KBVcqDkLqUY971LJY2t56t
	DL4lq2rxbfulEJHC9c8wuP90CsjIPXo4eJerlTS+53zSxNMpEkZPfceNnkdnwVL5cHbR+wLTjX9
	2QlBZDgZ5OMGtIEqKHmi8SUPR7zTNTw3D4D5enzTrDjzLD+ATdukzZQdWLg2Q1pWkBwQQX662kx
	oLJzBHzEEu9gt5wWVaI2gXY2UA22L2EEw
X-Google-Smtp-Source: AGHT+IFYq6V5J5rXx5QgUvWRFIgmg8psdjbRgWhuE+b5PuhIMU45skzaKalA52LZGkVjQ1Apw2J66A==
X-Received: by 2002:a17:906:d554:b0:b04:48c5:340 with SMTP id a640c23a62f3a-b04b13cd56amr710023166b.9.1757325432564;
        Mon, 08 Sep 2025 02:57:12 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042523ee7bsm1959154266b.109.2025.09.08.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:57:12 -0700 (PDT)
Date: Mon, 8 Sep 2025 11:57:07 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6nZdJCKmnWcswB@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
> > On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
> >> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> >>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The CCI clock has voltage requirements, which need to be described
> >>>> through an OPP table.
> >>>>
> >>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> >>>> (which is a value common across all SoCs), since it's not possible to
> >>>> reach the required timings with the default 19.2 MHz rate.
> >>>>
> >>>> Address both issues by introducing an OPP table and using it to vote
> >>>> for the faster rate.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> Using an OPP table for a single static rate that remains the same over
> >>> the whole lifetime of the driver feels like overkill to me. Couldn't you
> >>> just put the "required-opps" directly into the device node so that it is
> >>> automatically applied when the device goes in/out of runtime suspend?
> >>>
> >>> And since you need to make DT additions anyway, couldn't you just use
> >>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> >>> use that for e.g. USB clocks as well.
> >>
> >> This is futureproofing, in case someone invents FastMode++ with a higher
> >> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
> >> clock which would (marginally) decrease power consumption
> >>
> > 
> > If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
> > then I would expect a separate entry for 19.2 MHz in the OPP table of
> > PATCH 5/5? The DT is unrelated to what functionality you implement in
> > the driver, and that would make the OPP table look less useless. :-)
> 
> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
> 
> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
> 

The 37.5 MHz rate still exists on X1E I presume, or are you saying we
need more changes to support those odd 30 MHz?

Personally, I'm not fully convinced there is ever going to be a use case
of someone using a "non-standard" frequency. Even if "FastMode++" is
invented most devices will probably want to use it. And the voltage
requirements we're currently talking about here like "low svs" during
camera use cases are kind of negligible compared to others too.

But I'm fine with either solution, just wanted to mention it. :D

Thanks,
Stephan

