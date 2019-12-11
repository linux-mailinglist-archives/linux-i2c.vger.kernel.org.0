Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1237811A134
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 03:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfLKCQp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 21:16:45 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:10885 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfLKCQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 21:16:44 -0500
Received: from [10.28.39.99] (10.28.39.99) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 11 Dec
 2019 10:17:13 +0800
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
 <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
From:   Jian Hu <jian.hu@amlogic.com>
Message-ID: <be7f27d2-5601-0d0c-9c62-7206e7de0411@amlogic.com>
Date:   Wed, 11 Dec 2019 10:17:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.39.99]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi jerome

Thanks for your review

On 2019/12/10 18:17, Jerome Brunet wrote:
> 
> On Mon 02 Dec 2019 at 12:12, Jian Hu <jian.hu@amlogic.com> wrote:
> 
>> There are four I2C controllers in A1 series,
>> Share the same comptible with AXG.The I2C nodes
>> depend on pinmux and clock controller.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index eab2ecd36aa8..d0a73d953f5e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -16,6 +16,13 @@
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	aliases {
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +	};
>> +
> 
> I wonder if assigning i2c bus alias in the SoC dtsi is such a good idea.
> 
> Such aliases are usually assigned as needed by each board design:
> meson-a1-ad401.dts in your case.
> 
You are right, I will set i2c bus alias in dts file.
> .
> 
