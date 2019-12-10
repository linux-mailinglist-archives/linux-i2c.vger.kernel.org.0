Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7B7118F95
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 19:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfLJSPs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 13:15:48 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43453 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfLJSPs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 13:15:48 -0500
Received: by mail-pg1-f195.google.com with SMTP id b1so9255703pgq.10
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 10:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=kfLit8LCSQ20powxSKYWCP8N8M+8XWObHNOV3Cp5ZFE=;
        b=FwUBWi9X6lnjaJWijeU8P6xQR2Yp703scW9SLcH8NgPLyKR/nUa8y4eOqMcVaRTSk4
         tcvmrhzkqYkS8gpG+GVfApk07EkDCKXveshyGFCdzPWWOsUOOu5tV3DS3LXnxD3QRB+m
         bZrv45p67LNVj/kJTeKbtMT3wdS3ewyDaRbSiw+weCRaMrSD2ttdqr1VKNOnHk0ewkTL
         NsDbcRNLkRIk8bPKhl3CylU/tCFIocywzPTKj/ZlQBT0Tl6XHmo6DECLYUYfUHKvAkai
         u1igvJdm9ZujDZNoRpz0k6oiOYkjyr/mxpOEQr/iw0EFosNHKmcKqsLwNrwSMw0hWN6M
         hIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=kfLit8LCSQ20powxSKYWCP8N8M+8XWObHNOV3Cp5ZFE=;
        b=mGKVUpWEwb67utDTP4CrjoKOkDwETxfSZxBa7ZOz2YkdKrlNVOxMj8yTUHyePs9FmT
         ChXhvsEbaxcFa9C077V52hjCP9MWdUBe2VPT0TpoyLKd33oOfKKYPwMBJToGmNKr1zLd
         oY+Nbyw5kZ/PfETDfDvEdDIqZJq2/KO/WjcgdU5PvS0uzYsfZywRxShLDAHoov1Sd+Gb
         YvawfWfU73nrIRzg30VecJx27vRQp647MlEWw4DGePT68VMPP1AiGnt+JDWTmeVrjm1Y
         Be/R/6MG89rdW+pXEKBlSTmtUVKDsDBsFv1NbxmMIj21NOz9KJXFK3eKrw6GWNN+S7J0
         dZ8w==
X-Gm-Message-State: APjAAAXc3cC8I6NUfcP/YkXFX9POiVqsPjVXDNndj1uXHBOHkgZSbszf
        alNTRZ/IzfLgCujRUYBvKQTwxg==
X-Google-Smtp-Source: APXvYqwpRGFP81NCx9NWPduL64oaXvGdMHqxm0bX+hBAxyEfO2ttMxw7y0Q9JTow9L1V6Lb4JcuPPw==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr37703857pfa.163.1576001747315;
        Tue, 10 Dec 2019 10:15:47 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 17sm4363066pfv.142.2019.12.10.10.15.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 10:15:46 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <e90e00e1-c868-ce09-6f79-deb62da72b43@amlogic.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com> <7hsgltqfdx.fsf@baylibre.com> <e90e00e1-c868-ce09-6f79-deb62da72b43@amlogic.com>
Date:   Tue, 10 Dec 2019 10:15:45 -0800
Message-ID: <7hblsgqc6m.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jian Hu <jian.hu@amlogic.com> writes:

> Hi Kevin
>
> Thanks for your review
>
> On 2019/12/10 6:54, Kevin Hilman wrote:
>> Hi Jian,
>> 
>> Jian Hu <jian.hu@amlogic.com> writes:
>> 
>>> There are four I2C controllers in A1 series,
>>> Share the same comptible with AXG.The I2C nodes
>>> depend on pinmux and clock controller.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>>   1 file changed, 149 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> index eab2ecd36aa8..d0a73d953f5e 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> @@ -16,6 +16,13 @@
>>>   	#address-cells = <2>;
>>>   	#size-cells = <2>;
>>>   
>>> +	aliases {
>>> +		i2c0 = &i2c0;
>>> +		i2c1 = &i2c1;
>>> +		i2c2 = &i2c2;
>>> +		i2c3 = &i2c3;
>>> +	};
>>> +
>>>   	cpus {
>>>   		#address-cells = <2>;
>>>   		#size-cells = <0>;
>>> @@ -117,6 +124,46 @@
>>>   				};
>>>   			};
>>>   
>>> +			i2c0: i2c@1400 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x1400 0x0 0x24>;
>> 
>> The AXG DT files use 0x20 for the length.  You are using 0x24.  I don't
>> see any additional registers added to the driver, so this doesn't look right.
> In fact, For G12 series and A1, the length should be 0x24. A new 
> register is added, And it is for IRQ handler timeout. If the 
> transmission is exceeding a limited time, it will abort the 
> transmission.Now the function is not used, There is completion to deal 
> the timeout in the driver. I will set the length 0x20 becouse of the new 
> register is not used.

Yes, we can extend it to 0x24 when support for the new register is
added, because that will mean adding a new compatible string also.

>> 
>>> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c1: i2c@5c00 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x5c00 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c2: i2c@6800 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x6800 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c3: i2c@6c00 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x6c00 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>>   			uart_AO: serial@1c00 {
>>>   				compatible = "amlogic,meson-gx-uart",
>>>   					     "amlogic,meson-ao-uart";
>>> @@ -171,3 +218,105 @@
>>>   		#clock-cells = <0>;
>>>   	};
>>>   };
>>> +
>>> +&periphs_pinctrl {
>>> +	i2c0_f11_pins:i2c0-f11 {
>>> +		mux {
>>> +			groups = "i2c0_sck_f11",
>>> +				"i2c0_sda_f12";
>>> +			function = "i2c0";
>>> +			bias-pull-up;
>>> +			drive-strength-microamp = <3000>;
>> 
>> Can you also add some comment to the changelog about the need for
>> drive-strength compared to AXG.
>
> OK, Drive strength function is added for GPIO pins from G12 series.
> So does A1 series.

Yes, that's what I assumed.  Please add that to the changelog as one of
the new features in A1 compared to AXG.

Thanks,

Kevin
