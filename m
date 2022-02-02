Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043FD4A70D7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 13:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344158AbiBBMdq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 07:33:46 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:37984 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiBBMdp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 07:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643805226; x=1675341226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYU5FQ/JJWkjarXsj92sSCMadMJ6TFecm/dnACqqyys=;
  b=XJNBjWNWSZB9fQ/E0rpFfjmNrrp0ea9rbpaon2mTmMQu5guOcTpiYjY+
   RxacYqUsOdAl+70DPikpvcW0VOQ/z5YM+xA4kI70B9TQfY7ZidJOgF2HN
   8uc7Q/YlNoXa3SP68nW5LRjMyw5IqDXhaqWF5tlkc26r3wpAvRmu2De1h
   mak22qW9nngDIoOmTVDZJQzeYlHood7G9wSSXc3NwyM97M4HJ50wrN9uK
   Mz2RuA+mxQVgl6hAYcNUBsReP+ry7AXyNvb7Uzf5nqSxC+uODupv/j8ol
   8coXc1cac7MxfTpVzBDjPUiwUiY+gZPsGsSKVQgg+VSQQY7z1+c/XcbWs
   g==;
IronPort-SDR: 7qsMJQHHrSrSYB0Ug6RqvefqkDO/1rpW2F8FImVYsrFCggq/PkQsFp8t6dqRd793Kkh+LWK/Kx
 qJXzVACrhS7xv/wVVLoS2LiyrKVuVh7XRkqovfvSC8NmWk9AZVkD7hgU8ORzs24uvg1+tCcRP0
 3kgF7T7W3YW5ZI+F46sXem9DOtP+QJx0gOi3hhbzJa+P6kHf2loRnmb6sWeeDjwp6buaByh7dD
 Rm1M8H30CQxwbJU9Oo5HQCOgTRQQ81sfpKjgKI94BPJx1XCeA8loaeg6ZsYTTopbeOMsXxsHB8
 IiSzX6vH01VBzn4LwAK/KCL7
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="147376453"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2022 05:33:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 2 Feb 2022 05:33:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 2 Feb 2022 05:33:39 -0700
From:   <conor.dooley@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <aou@eecs.berkeley.edu>, <atishp@rivosinc.com>,
        <bin.meng@windriver.com>, <brgl@bgdev.pl>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
        <devicetree@vger.kernel.org>, <geert@linux-m68k.org>,
        <heiko@sntech.de>, <ivan.griffin@microchip.com>,
        <jassisinghbrar@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <lee.jones@linaro.org>, <lewis.hanly@microchip.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
        <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Date:   Wed, 2 Feb 2022 12:35:44 +0000
Message-ID: <20220202123542.3721512-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>On 01/02/2022 07:58, Uwe Kleine-König wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the Microchip fpga fabric based "core" PWM
>> controller.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++

<snip>

>> +  microchip,sync-update:
>> +    description: |
>> +      In synchronous mode, all channels are updated at the beginning of the PWM period.
>> +      Asynchronous mode is relevant to applications such as LED control, where
>> +      synchronous updates are not required. Asynchronous mode lowers the area size,
>> +      reducing shadow register requirements. This can be set at run time, provided
>> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
>> +      to the device.
>> +      Each bit corresponds to a PWM channel & represents whether synchronous mode is
>> +      possible for the PWM channel.
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint16
>> +    default: 0
>
>I'm not sure I understand this correctly. This is a soft-core and you
>can synthesize it either with or without the ability to do synchronous
>updates or not, right? All 16 channels share the same period length and
>in the simple implementation changing the duty cycle is done at once
>(maybe introducing a glitch) and in the more expensive implementation
>there is a register to implement both variants?

Correct. If the IP is instantiated with SHADOW_REG_ENx=1, both
registers that control the duty cycle for channel x have a second
"shadow reg" synthesised. At runtime a bit wide register exposed to
APB can be used to toggle on/off synchronised mode for all channels
it has been synthesised for.

I will reword this description since it is not clear.

>> +  microchip,dac-mode:
>> +    description: |
>> +      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
>> +      a minimum period pulse train whose High/Low average is that of the chosen duty
>> +      cycle. This "DAC" will have far better bandwidth and ripple performance than the
>> +      standard PWM algorithm can achieve.
>> +      Each bit corresponds to a PWM channel & represents whether dac mode is enabled
>> +      that PWM channel.
>
>In the last sentence a "for" is missing?

It is missing, thanks.

>These two properties are not detectable in software?

Unfortunately not. THe configuration for these options are only
accessible in the fpga design. You make a good point however & they
really should be visible to software. I'll suggest that for future
revisions of this IP that both configurations are accessible over APB

Thanks,
Conor.
