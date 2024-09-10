Return-Path: <linux-i2c+bounces-6469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E5972DA8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5510B25052
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E88518A6D1;
	Tue, 10 Sep 2024 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i/9hIIwP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4418595E
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960684; cv=none; b=CQddIyq9+goMrZWPMnCXbqs7LfnTF//S/+EJq6PmUhLlaeosvoi0aD1EgAgZtpfHUFaQ3l7D09VLDgluta82jR0nwqkF1F8pcCy8C5rCBeuCTCgExGX7AKlIe5+reNqH+0izkWty/LbSHpbq4GyBzVRQHCpHh72aWGjYqWhTwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960684; c=relaxed/simple;
	bh=/yBirLlbsXe5irgaHtC/VRx4dXEPb1T0JzXJA9JBoD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q+fIxbr4bLNrXGakd936NPI+UZiT9MzZ4CoXpOVGkejBL/i5KOO3DPe9ZRqTsiKh17kHBjj1Gv9vxrrObS2VCur8R8PlZTWiPBOO7kz/FlQPsUK1NMphDynC6geP2XLfMm297WXvnjE8UCJEb7ff3M0OJuLf8FftoQMR/ASBD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i/9hIIwP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374b9761eecso421979f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725960680; x=1726565480; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuS9MAxsmvjSgFrYtBO34391Uw04VZwdaHe4kRwnHIs=;
        b=i/9hIIwPb26ABV+w+ANhRNtPKPtpsEqV90b14y07k1blmy2dTwqgXybA4D06hQO/9C
         EBjfxlcS+88hXD2DOZMlE9jyFS3N0detA8wupak4v2FOHed1pbcydCKSyObHLwlhWu3M
         P11AFZeCBpj4sMlavcT4p13OmjPwwyKgsqC2GeN+PST4Yz1HW9PdWMhIypj3P6qFw8ht
         FecDX5zK2Od4xQATCS3xdxIFf6AOO/bKxyNsDv8H8GV0xzUtmZDpVVb+wLa8FZKIUgHX
         JbEXeAH7WURAoXARISxbycymvzYB0Y/43F5yyPMX0tJ5X82Ds3Cbz5/mB8Aa0ai33jQ6
         Frwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960680; x=1726565480;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuS9MAxsmvjSgFrYtBO34391Uw04VZwdaHe4kRwnHIs=;
        b=pWJ3+ecXkSqU5Zd1HMH1opzJt0eHsIUT4TgkYckvOYw+MO6nL5ns/J30n3mYRJWXlw
         YG9sXUiHULwbR7s4LaMSiPaTAvO8PEo7KS2W5vAwwGhaYibpG1wHQpTVYSDZlYFiW2VR
         m/6QwnRcnSXi9f0u+IiO5XuwECUqPf7E9YkZjVmVRFw16QBXxvGS7qL0upIlHTfwUZ6Y
         vJe5vsMKKandeDqy+DbJBclPRedPw3fD/lg8kTsgrefiH4FMUTINhcBtpIQpLWHc+3WI
         LnfdCl3mlfNfyGDgCLBX6HRk+U67kIdDkf5fnDkMa/dtsyS8nRiZDlGMsY3W/joPMaQj
         ZZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUn1c/BK8RbC06YvIC9ITJmuOU0HX0P25hPgwpuRIt06VMWBV3kEZOqwXRiBdA1nl3ohQCP4bG0sSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcO6IcUIchys+9TB9JMm1BX9N1ud25mKhuOFpE9ZBHV6AfbWrp
	p9g+p4jX5uFTuvtroF/BYvalh69ISQwTnS4Vk0PhmYJ1ow2sbAns+T9+FOz1rlM=
X-Google-Smtp-Source: AGHT+IHWU9Nsx/+0aSjXLCuH8M7pxPwtBJFXd4QA9DnNUUZvDz4yyjRr1z1CDQ306/ZYKfm0hlNraQ==
X-Received: by 2002:a5d:54c2:0:b0:374:bb00:31eb with SMTP id ffacd0b85a97d-378895c5c5amr7565976f8f.6.1725960679056;
        Tue, 10 Sep 2024 02:31:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564aef9sm8353891f8f.5.2024.09.10.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 02:31:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,  Guenter Roeck <linux@roeck-us.net>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: add ti tps25990
 documentation
In-Reply-To: <3efbzcys4762rhx2h2cbhqvi6dgik7pfrxcziccdko34pb5z54@joodcym6c3s4>
	(Krzysztof Kozlowski's message of "Tue, 10 Sep 2024 09:48:34 +0200")
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
	<20240909-tps25990-v1-1-39b37e43e795@baylibre.com>
	<3efbzcys4762rhx2h2cbhqvi6dgik7pfrxcziccdko34pb5z54@joodcym6c3s4>
Date: Tue, 10 Sep 2024 11:31:18 +0200
Message-ID: <1jzfofsvmh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 10 Sep 2024 at 09:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Sep 09, 2024 at 05:39:03PM +0200, Jerome Brunet wrote:
>> Add DT binding documentation for the Texas Instruments TPS25990 eFuse
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 73 ++++++++++++++++++++++
>>  1 file changed, 73 insertions(+)
>>
>
> A nit, subject: drop second/last, redundant "documentation". The
> "dt-bindings" prefix is already stating that these are bindings/docs.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
>> new file mode 100644
>> index 000000000000..e717942b3598
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>
> Drop blank line.
>
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments TPS25990 Stackable eFuse
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +
>> +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
>> +  The TI TPS25990 is an integrated, high-current circuit
>> +  protection and power management device with PMBUS interface
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,tps25990
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,rimon-milli-ohms:
>> +    description:
>> +      milli Ohms value of the resistance installed between the Imon pin
>> +      and the ground reference.
>
> Ohms is not enough? We don't have mOhm in property units.
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
>

Same discussion as we've had on the driver change.
At the moment Ohms is enough for the cases I've seen.

Will it be, not sure.
Using mOhms is' way to avoid "S**t, R is 80.2 Ohms, I
need another digit to not loose precision " kind of situation and
introduce a second property just for that.

No idea if Rimon will get that low. Probably not.

I'll switch to Ohms.

>> +
>> +  interrupts:
>> +    description: PMBUS SMB Alert Interrupt.
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    description:
>> +      list of regulators provided by this controller.
>
> You have just one regulator, so drop "regulators" node and use directly
> vout here.

Just took the example the other pmbus device and did the same for
consistency.

In that case, there other (possible) regulator called gpdac1 and gpdac2.
I haven't even tried to implement the support for those.

Since it would not break old DTs to add that later, I thought it would be OK
to add them later. Should I add them now ?

>
>> +
>> +    properties:
>> +      vout:
>> +        $ref: /schemas/regulator/regulator.yaml#
>> +        type: object
>> +        unevaluatedProperties: false
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ti,rimon-milli-ohms
>> +
>> +additionalProperties: false
>
> Best regards,
> Krzysztof

-- 
Jerome

