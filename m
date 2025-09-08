Return-Path: <linux-i2c+bounces-12765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FBB489A1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 12:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39E1C167BBA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965942F7AA1;
	Mon,  8 Sep 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofx8qPL1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7DE2EBDD7
	for <linux-i2c@vger.kernel.org>; Mon,  8 Sep 2025 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326187; cv=none; b=qiy3KZoUES8IuLVDWGHfVXEubrh5Dzs/YR11lJshONnygKLOBU9mx25VYNndevKM9O1aZP4gOWrx7d8eCX2/7wv3SIwr0bNxsH8dUmCWwt8ojYqqW9OKsQOjccLx0wzCbNq/YpHPHtqY2Ia3welbQtUJIOLmk769/JkBNKQIpAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326187; c=relaxed/simple;
	bh=fB0j1knneymsQb6zW3oZLg20Ti2gTC3sDQkEwCRnNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHDFsxuFB1fisyXEAzXCD629gOeR5bSTLgoXVGoPF/0EACqZQw/sbZcaQNw4ABN0ZcHvKEK1uYwDRAhqdwICUWFt29z7vKwphgg0oxJUycjUXPvOiwKke1KDLA0dl5SOyEEwQkpCs5wlSXzJmy0OdDrg3ZuTvickzJewyLsagOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofx8qPL1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso5466080a12.2
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757326184; x=1757930984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmnKeVv8YY/fXGQA22sRQfhv2+yYeWQAe73fa2iIOM0=;
        b=ofx8qPL1OqEDNEXZbdmvX/BAEfCQYAafCrNhcCjU/DbxHtOmkTRRWImAn2Rpr/ccOx
         A56VpwSWiucH1+xMdV0Nj0fwexK5LQ84j9FFNVgoPV/yYru5Td7b+gV7h6xcWiQ4oajX
         8DjoFVkeNOBr8eH5lWhFeyopgI/Gv9TkR1hXicuYdHNgxwUh5pWZ79wcOCfnKqBjgh7I
         X5DvNJfEXJoZ+jTlIrIhxgbxPVId0dhmEbFfFaGw+UMVrdiNGHxZLoRTWLe/1NTp7wrn
         9pjv+HR06bgx8QFzYZIx/PuEjxo4ZZdto/++av7MiHUXykthmQZcE6VycnlGD2V84gj8
         7kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326184; x=1757930984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmnKeVv8YY/fXGQA22sRQfhv2+yYeWQAe73fa2iIOM0=;
        b=iJ81Di5n+q7saXL6xIJWWfmEGbuKc+3wb5T3P1at4spVli8BoViQbhiFaZUvLRtWTF
         +EzDF+u5YqVPSQAG9WfjhqJvTIPt6bOrCoCrSakLd5NSwSLuPWTbKiBOA8F5oAQ7W7Ut
         slDgSBMZ6qGBDyBQauuLD+Ugp07kW6I4wWy1DX8Q8vHTcAX/h2ktAthPRDeH3Ye1ZdPK
         Xjtn1xmvSN+wAg9B82pJkjybbpYQ56XUvZyHx6PCYYIYe2vt8SyKtidqbcL5VKcbSz0U
         MJO4jqZScS9PKGQvct5iJbY5BbZmlNSR+gMZbSM4gI35Ikv4ulJegZUw6x7Lyi1zNtRH
         0GUA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9Y9RTg/GfLlPS34RnRZ3QNlnCN4s9GVhzGjsq9omkaBJjDJCYhDEAXWMghoB45oop+7Aasmewwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNRXwSw5m5CcJfH6uOVxx1oK4BKLCU88Z8B0K1wh/lZNYGuu1r
	qYMxNe8Tk6RmL//YeiWc0FbHicHIG5K5mlqQievj+Ol996qfPcs0fBcG6G8KIWkYje4=
X-Gm-Gg: ASbGncsrWp/wp+XQ+eq9bjPUxUGJWKcwOOsJkf4esKrJxzBeya0i0RBqilkx9PnHRoN
	aZYGJnCZ28Q8nm8DHkFdOb13t0ILcjJOltE3AL5pdl3FFFmYoAt88/xlo6SC/k7+4jrCSfWsp7W
	ykb++a9dGPrTfMBUBxyQzeP/MBbgfabHstfmrfoNzV+V/itceOoYOLTRz7adCosQ5KFAudXkN5h
	W8xoN6/kJxUSTv5T/pIizYzgVRdJiz3DjBGXxDalqZs1BOmpjCgfVu+qvsx8/1XLdK4yCwkmq6A
	pJZJmFsvK4a8ncWf9bVYTOVWCi4pTyFEUV3SVEKy0s4fXdLMn1/e2NM6VdEU45kEH114UEO1eV9
	2T0F0YwvSVr5/BnUWvn+Rd5R5ZA/agFA/
X-Google-Smtp-Source: AGHT+IHT9tblAzVu5lhgCq0ztZJTqFIki97fYAjqSfcc3xjXv/tUZI241Ra1XOnBVaFhW1VRKrKEng==
X-Received: by 2002:a05:6402:3550:b0:62a:c9b9:cddd with SMTP id 4fb4d7f45d1cf-62ac9b9d0e2mr609155a12.38.1757326183688;
        Mon, 08 Sep 2025 03:09:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-625ef80347asm4229469a12.1.2025.09.08.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:09:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:09:38 +0200
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
Message-ID: <aL6rYq5gmX8CdeE-@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
 <aL6nZdJCKmnWcswB@linaro.org>
 <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1899862b-530b-4a75-93fa-c70c90d98016@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 12:00:13PM +0200, Konrad Dybcio wrote:
> On 9/8/25 11:57 AM, Stephan Gerhold wrote:
> > On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
> >> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
> >>> On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
> >>>> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> >>>>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> The CCI clock has voltage requirements, which need to be described
> >>>>>> through an OPP table.
> >>>>>>
> >>>>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> >>>>>> (which is a value common across all SoCs), since it's not possible to
> >>>>>> reach the required timings with the default 19.2 MHz rate.
> >>>>>>
> >>>>>> Address both issues by introducing an OPP table and using it to vote
> >>>>>> for the faster rate.
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> Using an OPP table for a single static rate that remains the same over
> >>>>> the whole lifetime of the driver feels like overkill to me. Couldn't you
> >>>>> just put the "required-opps" directly into the device node so that it is
> >>>>> automatically applied when the device goes in/out of runtime suspend?
> >>>>>
> >>>>> And since you need to make DT additions anyway, couldn't you just use
> >>>>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> >>>>> use that for e.g. USB clocks as well.
> >>>>
> >>>> This is futureproofing, in case someone invents FastMode++ with a higher
> >>>> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
> >>>> clock which would (marginally) decrease power consumption
> >>>>
> >>>
> >>> If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
> >>> then I would expect a separate entry for 19.2 MHz in the OPP table of
> >>> PATCH 5/5? The DT is unrelated to what functionality you implement in
> >>> the driver, and that would make the OPP table look less useless. :-)
> >>
> >> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
> >>
> >> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
> >> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
> >>
> > 
> > The 37.5 MHz rate still exists on X1E I presume, or are you saying we
> > need more changes to support those odd 30 MHz?
> 
> Yes, any corner over lowsvs_d1 is 37.5, sourced from cam_pll0
> 
> > Personally, I'm not fully convinced there is ever going to be a use case
> > of someone using a "non-standard" frequency. Even if "FastMode++" is
> > invented most devices will probably want to use it.
> 
> Not really, there's no reason to make your i2c bus go fastfastfast if
> the devices on the other end can't cope with it
> 
> > And the voltage
> > requirements we're currently talking about here like "low svs" during
> > camera use cases are kind of negligible compared to others too.
> 
> Again, this is an I2C controller that seems to be associated with
> cameras.. No image data has to actually be processed for the
> communications to take place and you can attach any odd device
> 

My point is: In the unlikely case that support for faster I2C speeds is
added in newer SoCs, I think you'd just get a new "standard" base clock
frequency, add a new cci_data struct with adjusted timings and everyone
will use that (even for the lower I2C speeds). I doubt anyone will
bother adjusting and validating this for just one "corner"/voltage level
less. There are much more effective targets for power optimization than
the few bytes of I2C communication. :-)

Thanks,
Stephan

