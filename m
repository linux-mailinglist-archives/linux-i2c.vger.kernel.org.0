Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB9E118FEE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 19:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfLJSnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 13:43:08 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35796 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbfLJSnI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 13:43:08 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so9306347pgk.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 10:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=cXgeofGslOi+RjL/J6mEqJJEbNd8kJE15RHzG972FUQ=;
        b=SfH4rbV9YZ1hWUHfo6cMIDDXDMylmGSkT93R4GTh+Vcu9RUxPGbiNBkAG3NbdHpxLv
         G1SKn9dJ2jYhaRCFo3u55A1kll1ZmyWpn4zM876CL3bjaHxBuPO16j48vc4Eamz3b/k1
         K2RPNZft07rIOQeGIXjppjTzrLmt28J4ZXLxwcsdCt1AxZ4CGFaTm/Y/wbPnPG71pkIw
         GRKkwd5rks5xS9URrQMyPKsIEowX25fbB4RuXFxGhqmoGv39UtNs0dWn79kCP+ec1XLo
         hNxzRCHUIR3xk7YRLPXCX9yEIBs86nu0PTIHkJ84zHzuJ4p4qhBV+Ga6CCnNwEp974ba
         klHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=cXgeofGslOi+RjL/J6mEqJJEbNd8kJE15RHzG972FUQ=;
        b=qP9TxGT7S3IuFmsqDmL2gCv8WGA2BgtgS3V3VbbNFs9I4uHkTVB9JA4Dz6xIL1q5nv
         Lyq+/WBmZ3Flz05qjAdrMEf1wKEcPIQjseWSV03GsU+MJRsT8UpXz0tqRXO3csynuiPM
         v3MYhy6C70l7kaspWqIZHRNp2jwX0CrcqsxErfIWFS9+HAtbNQZ3pCKER8cBjcfjmYY0
         tYAVzJ3EtEaPgE0HvmzATnJETng1Vf9N4YvVCXu4dRjhuzwXPiI8KW97t9bJr3g3pfge
         A66AROBw6fJnDXBXLLabErr4KDZlUOdzOtTnDsDKF8JbXEcW36+jdLoeeTgpSCFxBWXy
         UPFA==
X-Gm-Message-State: APjAAAViy6pUTDK+TqKIdmZ6TknSulJ+iMkcOb9ED3l91Vaj6BuzkQfv
        aAGFnUl606tSs2ShpUj/NhJkPw==
X-Google-Smtp-Source: APXvYqxAch1OM+Hj+dyhmaGulL00rkkcafPXofsHFHUk6+pyjE/E1S2dK7Z5HJ8gaKs6VYJkuFVJkA==
X-Received: by 2002:aa7:8d4d:: with SMTP id s13mr14405829pfe.18.1576003387448;
        Tue, 10 Dec 2019 10:43:07 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id k15sm4313480pfg.37.2019.12.10.10.43.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 10:43:06 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com> <1j8snkh4cz.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 10 Dec 2019 10:43:06 -0800
Message-ID: <7hwob4owcl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon 02 Dec 2019 at 12:12, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> There are four I2C controllers in A1 series,
>> Share the same comptible with AXG.The I2C nodes
>> depend on pinmux and clock controller.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>  1 file changed, 149 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index eab2ecd36aa8..d0a73d953f5e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -16,6 +16,13 @@
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
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

Agreed.  I don't think SoC-wide aliases are a great idea.

Kevin
