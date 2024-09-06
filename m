Return-Path: <linux-i2c+bounces-6290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03AD96E7CE
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 04:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA0F3B22A9C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 02:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6039A288B1;
	Fri,  6 Sep 2024 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQDwoTPC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074C1B969;
	Fri,  6 Sep 2024 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725590195; cv=none; b=uDe7FHmYMnqccbX1NQS8SPx2woERup+t1i3Gyh9M5+LgqzI7azdDCTB7vikGv10m0915rpu/J2AmegAFoO5Yo42+/KCOZbjHUZSEnLkt7YWv2edYXC8uJjUTf1a1UmGQ1vA9c3N1RX39cWKnoxdSTL4Ato5zg87PfyWJbr/z5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725590195; c=relaxed/simple;
	bh=l/L5FGZqn4EE3bWvcZ4oUF9HzXQWZkujyE9rwI0wzNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guTumuWo8fp1FDqKWz6MWTdfmCxg8cyeInNKagnbazRdaTlEuvex6CR+NTcZAhbS1waVkaNL7De0eq7vqez7LTvvx9z8xWvu9K72SzbDQUxLbJEoSu9t7tnWCJ2Vsw8Gq3Mrj44JOKkKz1lya9ZPP6kYQi3DJv0/FCj4cz2uloo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQDwoTPC; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso1622170276.1;
        Thu, 05 Sep 2024 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725590193; x=1726194993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVMdGlIj9xk2r5uxVbI4SIjTki6YfCzvVODN1CuCuF4=;
        b=fQDwoTPC+78YKZ6MP+CBwjsd+bilaqolyPHTNhTZlMM0RWxFksAG9x8RLCm9x6tOAs
         exaJ6LUji8q/MfQAq9nWBFQSpazW7rn9mfSmZkuElz59gO4BXlJhYmGbioen9IOKdCBD
         9TAasB9smhuMSlZ4Yc9BlXyOk+FlDr4AtzTko91SEv6yOZEzgQBcLZQQGJ2qNfR/dMAL
         f6DgY0G4KUJLHPfDr6leNFw36Axy0spEh+CZVCWUVzQNNe+ysj8XXgPfQ/bZRmyJEL/B
         Yl6Mawk5pTls1hbMTSn8QZIuuEby13WOXbeXY4qSA8FfKQZldQmH2sF9jjnCRPDzzQAO
         Ob4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725590193; x=1726194993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVMdGlIj9xk2r5uxVbI4SIjTki6YfCzvVODN1CuCuF4=;
        b=B9ZYu+Mt9uox6xIpzx4IeUa+r0kwJVlhUvaaMfU86nWjHsNO6rji+AWnwYmY0fc14n
         58i2JqDLbTVbSx3QYATDVdyiI60OvYjoordNo/sN6CkeKF+u6GqNOajJtppHV8zoGVV3
         wxjCMoX1H0CIXVJzO1XfpYxSa7g9PUX9jBvS65MBXfi5fZ9DN6h0/iR4DA+6Y9Cz3TkL
         FOq6N/suW9+Git8+f+U71eEZJ6gcpczwYKyzg8RbTUklXi9sBCCf1qLhJOSNO5wOztWb
         oYJr1ZiGyS6PNflbV0halXqICeJ5N5Ak82F9JgndpJm5NMuSYQrl5hcxm6rSqgkCrlhd
         vwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBj7J+ZQcHYJV3/Yg0yzgtKtC12iihi2O250Qd6HbOy4Zb2kJ3b0KB78TFvJABL+6RNvmJqeeKXlkE@vger.kernel.org, AJvYcCV7ReY+OPLEYLJCSSzXDxxJx09VIJji7eKFvW5lsw9tFEZimCH1MLtEo935uD3hJPj7qbwomZhE34axYopSnA==@vger.kernel.org, AJvYcCV9knSbij/dARIrm5AD6J2uajlhH4SiW9TZG6vaDX4DwCG7wwEssEFMy75KJmWYo8kMb8yzcqgfRmsB@vger.kernel.org, AJvYcCVShNLuxzLdVeqEIH5WEGT/mutdoqov9aqMXN5OaCFUPhceCY3rbhYKRrHObV9dLZD0hmog75yoJSZE@vger.kernel.org, AJvYcCWH+REPiqJqbDWwhsdip7Ao6fmnNRAJ20SFRdqOiEJCuRmp95xzXRYn2ayw2nP0e06qoDBjI6WKAJs0RmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kiCOqldnNF4M+YGpl5f5osml35+Q/2siFyqp2lIzmriR62wL
	/TSDeKrOef/Lfnmc4tSLCcowH7iEMJn9Xi1A8jiGBdSiQeB6adoL
X-Google-Smtp-Source: AGHT+IF86jLnkCVqdhTbMHpt4/KAK2kFi9egstzyzRlVhvtwUHnadDj+kjXTpmL6llQZUVva33ipRg==
X-Received: by 2002:a05:6902:1242:b0:e1a:b04d:673 with SMTP id 3f1490d57ef6-e1d34a3a94emr1447077276.55.1725590192531;
        Thu, 05 Sep 2024 19:36:32 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::4eac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801b35d07sm12458121cf.27.2024.09.05.19.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 19:36:31 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:36:28 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Message-ID: <ZtpqrANbJurWNOzV@radian>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>

On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
> Hi Richard,
> 
> On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
> > This adds support for the camera subsystem on the Snapdragon 670.
> > 
> > As of next-20240902, camss seems to be a bit broken, but the same series
> > works on stable (although it is much less reliable now that the CCI clock
> > frequency is not being assigned).
> 
> I am not understanding this bit: is this series making it better
> or not? Can you please clarify what is broken, what is less
> reliable and what works?

When applying this camss series and some camera sensor patches on
linux-next, the Pixel 3a seems to hang when camera capture starts.

When applying the same patches on stable, the camera does not cause the
Pixel 3a to hang.

When these device tree properties from the previous series were removed:

			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
			assigned-clock-rates = <37500000>;

the CCI would sometimes fail to probe with the error:

	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110

On further testing, the rate can be set to 19.2 MHz, and there would be
no failure (or rather, it wouldn't happen often enough for me to witness
it).

> Besides, I'm reading that this series has not been tested and it
> makes it difficult for me to take this in, considering that you
> are adding a new support.

Of course. This revision of the series wasn't submitted to rush into
v6.12-rc1. It can wait until everything is resolved.

When device tree maintainers comment "not tested" on the documentation,
it usually means that `make dt_bindings_check DT_SCHEMA_FILES=...` gives
errors or warnings (even though the device tree and driver may work on
the hardware). It's a separate test and one of the things I haven't
scripted into my workflow, although it's still a responsibility.

