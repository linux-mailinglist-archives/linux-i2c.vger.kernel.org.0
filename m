Return-Path: <linux-i2c+bounces-6593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D1975952
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 19:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C046B1C23794
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247111B142E;
	Wed, 11 Sep 2024 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RLTfxw5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534D14D8B9
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726075585; cv=none; b=WxKYsOuLUNwu+fRYaRUcvngVu0Hl7gmk09uR48mHvz86PseZyT77YRIjO1oArN57/rYEjFSvBsxZIFeiFzBGV6BUzIi4UBsxjMZiwkTtIiPlO56MjzvlHXphiOlMhtKb9Thwk3HvV6pcZTDSgwzjW6FC3mCQ4aSv/2Uc2mZxQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726075585; c=relaxed/simple;
	bh=j4LfUsx854x7YJ4n3qpUsMJcQSYqch/FDWG/7MZN6hg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jiQ09JZTFTiZ3VMRESjHvoFF9jxB2MOPgVe0OYRDCZ42v6MwF13I5tFBcTO/FDAplSvITlw/eqK0617CGZBOgdx77Lswkv0B3zk37TOVhixNj9gp52QLrw/VU4uQdW7xlLK6RtEPqUsx4DER9cwoDcW3Q5UhzqyQ3UDE94c2D78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RLTfxw5x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so20881275e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726075581; x=1726680381; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLZX+SWdHz2tB91UF3usEBJbpzw/IHLAgfNzOfmxmj0=;
        b=RLTfxw5xjaulz4Fgppqf+838Phf5Qm/KRabvOD/E4QrPBdfU1+YNeBVHUvfxC2kTac
         FCdGG31ezs//EDw6jyo/9N1W765YOrbwgUddEjZJXjDLkWl0JMoF5SDGRgA8998AUg5W
         Oy21iDDfyTzIi7pHTN5dFLzuab1m5D11aVKN3DaSyTzUXUvA/guIjWBKZBQVSqEonrgW
         ewHURwuIM3mznE78SeGlpnOT9TfsIoE7EnYaKiaK9fiE++iQyn8q3r+Gm2yRZKXIcOoe
         AI1krpr7+3DqzEsLlhIdKa3T5bbif4iwc7pL9PkANyR1O/QFVhmMGXgj/jVS/VzH9UJ/
         TYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726075581; x=1726680381;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLZX+SWdHz2tB91UF3usEBJbpzw/IHLAgfNzOfmxmj0=;
        b=MtoWj06qMWx9I2EGHJyft07pEKL9ggD3rYLQsep7h0F3qxj50pWXuouKYAZEPAqoIB
         Ts0McdMjeYI203IE8NdLEMLPU9GT+ChvZ4uCaQ2t58Ptt5ztEAXyzv8tYtGd145mABC5
         BO3eZlB+Iy2PUtlNMREOqIJI08yGhpttwpf2gygI5dTc1fsULi9NNJIzSbNpo4VH4Gpr
         FylfKi7hS+xUqYFQ7V8U3PESF3tqCFtCVxaRdFEcppRGqJBM2SIvPuP69kzi8GgxFmvu
         p08J99ICS0RFw7DYXob2iVZhDXDERrSWOPnbHNjkdxuVCzqUcyHZRFxOq3/VN6aNnc2b
         2emA==
X-Forwarded-Encrypted: i=1; AJvYcCVqES1TNNhFaGZyAsh7JsXXjQkdUA3OWjK63UTP/rDueZrqL5MxudnveM+T7V5gXLhW6PW66i8gYfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/j5krBe6a0SXJsfPAirGJBKvXpTly4tEcewFTlshkPI5bhAFR
	rWtN1/11tZggepDkNEgehF7O3WCP8/RHgzQR26hMjIChCE4ssW5KpsBZJ4BqgQg=
X-Google-Smtp-Source: AGHT+IFkbjwusK7GBMy+uvOrk1ENPvXDg5jbLTlihJ6/ABtP7FGYUmy39dxdfPmSU+lvToCwURKoow==
X-Received: by 2002:a05:600c:5123:b0:42c:bae0:f05b with SMTP id 5b1f17b1804b1-42cdb4e6bbcmr2458165e9.1.1726075580979;
        Wed, 11 Sep 2024 10:26:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb5a66475sm118471705e9.44.2024.09.11.10.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 10:26:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Jean Delvare
 <jdelvare@suse.com>,  Guenter Roeck <linux@roeck-us.net>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Jonathan Corbet <corbet@lwn.net>,  Delphine CC Chiu
 <Delphine_CC_Chiu@wiwynn.com>,  linux-hwmon@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: add ti tps25990
 documentation
In-Reply-To: <20240911144532.GA154835-robh@kernel.org> (Rob Herring's message
	of "Wed, 11 Sep 2024 09:45:32 -0500")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-1-39b37e43e795@baylibre.com>
	<3efbzcys4762rhx2h2cbhqvi6dgik7pfrxcziccdko34pb5z54@joodcym6c3s4>
	<1jzfofsvmh.fsf@starbuckisacylon.baylibre.com>
	<20240911144532.GA154835-robh@kernel.org>
Date: Wed, 11 Sep 2024 19:26:19 +0200
Message-ID: <1j7cbiqeys.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 11 Sep 2024 at 09:45, Rob Herring <robh@kernel.org> wrote:

> gOn Tue, Sep 10, 2024 at 11:31:18AM +0200, Jerome Brunet wrote:
>> On Tue 10 Sep 2024 at 09:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> 
>> > On Mon, Sep 09, 2024 at 05:39:03PM +0200, Jerome Brunet wrote:
>> >> Add DT binding documentation for the Texas Instruments TPS25990 eFuse
>> >> 
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> ---
>> >>  .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 73 ++++++++++++++++++++++
>> >>  1 file changed, 73 insertions(+)
>> >>
>> >
>> > A nit, subject: drop second/last, redundant "documentation". The
>> > "dt-bindings" prefix is already stating that these are bindings/docs.
>> > See also:
>> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>> >
>> >> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
>> >> new file mode 100644
>> >> index 000000000000..e717942b3598
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
>> >> @@ -0,0 +1,73 @@
>> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +
>> >
>> > Drop blank line.
>> >
>> >> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Texas Instruments TPS25990 Stackable eFuse
>> >> +
>> >> +maintainers:
>> >> +  - Jerome Brunet <jbrunet@baylibre.com>
>> >> +
>> >> +description: |
>> >
>> > Do not need '|' unless you need to preserve formatting.
>> >
>> >> +  The TI TPS25990 is an integrated, high-current circuit
>> >> +  protection and power management device with PMBUS interface
>
> And wrap at 80.
>
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    const: ti,tps25990
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >> +
>> >> +  ti,rimon-milli-ohms:
>> >> +    description:
>> >> +      milli Ohms value of the resistance installed between the Imon pin
>> >> +      and the ground reference.
>> >
>> > Ohms is not enough? We don't have mOhm in property units.
>> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
>> >
>> 
>> Same discussion as we've had on the driver change.
>> At the moment Ohms is enough for the cases I've seen.
>> 
>> Will it be, not sure.
>> Using mOhms is' way to avoid "S**t, R is 80.2 Ohms, I
>> need another digit to not loose precision " kind of situation and
>> introduce a second property just for that.
>> 
>> No idea if Rimon will get that low. Probably not.
>> 
>> I'll switch to Ohms.
>
> You can can use "-micro-ohms" too. The reason we don't have every 
> possible unit is so we have everyone picking their own.

Noted. after discussing with Guenter, I'll use micro-ohms in the next
version, not ohms

>
> Rob

-- 
Jerome

