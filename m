Return-Path: <linux-i2c+bounces-7066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497D988C66
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 00:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D101C21599
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 22:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F4E187344;
	Fri, 27 Sep 2024 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV5S01Fa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A1C139;
	Fri, 27 Sep 2024 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727475826; cv=none; b=AOx8MECCbUyqzVKaNGdi0z98Q2vYnp2S/o9ags/m7n61vedMGX+ByzKdwHYYHHbUSnEFXz5jve/ssQEJeEKy7M60QN9N7qYh5jLJW1jtvYKMzqBhIlVvGApbuZq8xSUq3S+Wsd75fmVYeKFTVB4Fovz4+wE9ZXekKJt7+MbM7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727475826; c=relaxed/simple;
	bh=cIlpWhYzZ9AXjJM28VbVIh76rDaXlxbbEq8trVQXMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReJkEEmRcdu1BF2XglXQK/2D/MgGNyrxn4+HNpjwf2uaU+2KGFd3+NkVITwGDRnGehFZr0FwqR+6Zb45Z8yFvwCVKkzrqAzghWJYQhuvjgkQ+Q16FbGmfqJlhDjSttCBHCd80EGJD0+/iX+e5+1szceuJKFuan9J2GhPogrKVmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV5S01Fa; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9a30a0490so271935085a.3;
        Fri, 27 Sep 2024 15:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727475824; x=1728080624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DanJ6h31Jbn0TSq8bGdh6DzWA3sprA/cMXnBlTSkGbo=;
        b=jV5S01FaYubiGwonRiQZ5sOjysBQ3saC0WvowIHLbjxJd2KjJri0cO/yc+f9zWvByd
         /spteR9ErC7QI5mZ4HbyNlimv8ZNuas5esPSiRqb3WyE+T8cULdGYC7aL3qND3nNFtn/
         lcwP5d//E8ANkz6MvsnF/HeCmvBD+I2kXF4frOMv9SIZwIHC9D6sI8Q5sXzArG2dDNN6
         azPQPVdos5XhJK3mw8schEk9TJjuyO3RK6UMvZfyVReUQX+WvPJ+5PdEQkgcR1oiSVh7
         87kDvKZHisYNjyFdwc6pC/UKS5TMwf2F1DsKi+0woXsEeVUUo3pFtv1IDGPVSU/10/P0
         JhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727475824; x=1728080624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DanJ6h31Jbn0TSq8bGdh6DzWA3sprA/cMXnBlTSkGbo=;
        b=nsCVRFJUck9MJWm55tqYYyzMM1wJ9VILOQsuZH+3qDRKfGxzjOkijHf6qWsHhdemk/
         gE2+t4oBLajV0teoQOfMUHoQoaJjn4b4yXbr0Xq76tT/r6jZ5QkN946DSjbWki0Kvpj7
         qYvfTTzERstkHcgCmUdZ4B9PV/re1SJDR/ePjQ8cCBGp0TFiGFdpIUNwt2BXUb4/U7Cd
         TWHqIFyBLTf0qlN08NGKZ2WB4pyQASKIU1cbWY+JpIRIAJovJQ8oy8tes73ib7zO4Vsg
         l0ouGvUrgcxLEmdg7ulBNXTsTftjkwNZ3EiQdcAtvadZXyQ5zz9mbs0niFbxAaGe8vRo
         pe7A==
X-Forwarded-Encrypted: i=1; AJvYcCU1i03iZABQMDm7qAyn18a34GOEnWZ9STInNywNAnTXtrHe7JxFGe4v5h+8P7Nn9UEtZpRYYn2LJfES@vger.kernel.org, AJvYcCURPQqkKOAQwGV7R0f2+L+ymLjvwcxnJP3IattpFySNtY+/Bt3Cq19H/TBxYsHZ2GBomE7uTxfAAiiFamU=@vger.kernel.org, AJvYcCW8i/UIYIdcDwdS6aGGTWHMLXl2YH91n1oij+c1ZOBSH9MZ3JLS4Szn/hulknPiZS/OOySy47ggpPSp@vger.kernel.org, AJvYcCWIykpvuguwTDe0u0NPUVaMpOGJeAhncEuWCfchz07A1nvAw0d0lqUCoHYSThHIPuPccytAKi92WOMZ@vger.kernel.org, AJvYcCXVF9oNJ/9jzZ+bOFwpgvqdNZTn1S9Kr+AxS27Grxaam1XBYDIWYKIVLotTxJ05WRB/avz6T07Vr8nkvRQ/hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk5UnJFgcvvpsDvqYvOxPw42VxeA2ocZhxEy34gjpWvPKAVe1q
	W+M8o6KgSW83kSKfaiJhXi4wI7cft7MQIN/RiQ91UpkWBVt1FTE6
X-Google-Smtp-Source: AGHT+IF2ytXoD+d32d4iKl7U3UVyVkSgOM2tAMYK5KlTGsf2bIaRccejmrWrhMWpXq/zHUEB2OfcXQ==
X-Received: by 2002:a05:620a:4623:b0:7a9:c203:7c2f with SMTP id af79cd13be357-7ae37828db1mr853955785a.4.1727475824034;
        Fri, 27 Sep 2024 15:23:44 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::1a17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377b863asm133692585a.20.2024.09.27.15.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:23:42 -0700 (PDT)
Date: Fri, 27 Sep 2024 18:23:40 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Message-ID: <ZvcwbCh97WKnvarS@radian>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian>
 <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
 <a27adb94-5280-4213-a532-0dcc907f80b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a27adb94-5280-4213-a532-0dcc907f80b7@linaro.org>

On Fri, Sep 06, 2024 at 04:00:32PM +0300, Vladimir Zapolskiy wrote:
> Hi Bryan, Richard,
> 
> On 9/6/24 15:19, Bryan O'Donoghue wrote:
> > On 06/09/2024 03:36, Richard Acayan wrote:
> > > On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
> > > > Hi Richard,
> > > > 
> > > > On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
> > > > > This adds support for the camera subsystem on the Snapdragon 670.
> > > > > 
> > > > > As of next-20240902, camss seems to be a bit broken, but the same series
> > > > > works on stable (although it is much less reliable now that the CCI clock
> > > > > frequency is not being assigned).
> > > > 
> > > > I am not understanding this bit: is this series making it better
> > > > or not? Can you please clarify what is broken, what is less
> > > > reliable and what works?
> > > 
> > > When applying this camss series and some camera sensor patches on
> > > linux-next, the Pixel 3a seems to hang when camera capture starts.
> > > 
> > > When applying the same patches on stable, the camera does not cause the
> > > Pixel 3a to hang.
> > 
> > Right so -next isn't stable that's not exactly a revelation.
> > 
> > 
> > > When these device tree properties from the previous series were removed:
> > > 
> > > 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> > > 			assigned-clock-rates = <37500000>;
> > > 
> > > the CCI would sometimes fail to probe with the error:
> > 
> > Right, we don't have clk_set_rate in the cci driver.
> > 
> > Maybe just leave the assigned clock for this submission and we can do a
> > sweep of fixes to CCI at a later stage including setting the clock
> > instead of having it be assigned.
> 
> first of all it would be nice to confirm that the setting of a particular
> clock frequency is actually needed.
> 
> Fortunately it's pretty trivial to check it in runtime with a temporary
> modification in the board dts file, namely disable CAMSS in board dts file,
> but keep CCI enabled, then simply scan the bus with a regular "i2cdetect"
> tool in runtime.
> 
> If i2cdetect on the CCI bus works only for 37.5MHz clock frequency, then it
> is needed, otherwise (and this is my expectation) it is not needed neither
> in the dtsi files nor in the driver.
> 
> > > 
> > > 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
> > > 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
> > > 
> > > On further testing, the rate can be set to 19.2 MHz, and there would be
> > > no failure (or rather, it wouldn't happen often enough for me to witness
> > > it).
> > 
> > That's expected 19.2 and 37.5 MHz are supported by CAMCC for your part.
> > 
> 
> I read it as the setting of 37.5MHz clock frequency is not needed, please
> correct me.

It is not. My test setup just needs specific EPROBE_DEFER behaviour
(my setup being postmarketOS with a full-disk encryption password prompt
and camcc-sdm845 loaded after mounting the root filesystem).

In drivers/base/platform.c, the platform_probe() function calls
of_clk_set_defaults() then dev_pm_domain_attach() prior to probing the
driver:

	static int platform_probe(struct device *_dev)
	{
		...
		ret = of_clk_set_defaults(_dev->of_node, false);
		if (ret < 0)
			return ret;
	
		ret = dev_pm_domain_attach(_dev, true);
		if (ret)
			goto out;
	
		if (drv->probe) {
			ret = drv->probe(dev);
			if (ret)
				dev_pm_domain_detach(_dev, true);
		}
		...
	}

When handling the assigned-clock-rates property,
of_clk_get_hw_from_clkspec() eventually returns ERR_PTR(-EPROBE_DEFER),
being propagated all the way.

When handling the power-domains property (if not avoided by deferring
with the assigned clock), __genpd_dev_pm_attach() returns a value
returned by driver_deferred_probe_check_state(), which is immediately
-ETIMEDOUT.

