Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FE42E815F
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Dec 2020 18:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgLaRNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Dec 2020 12:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbgLaRNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Dec 2020 12:13:34 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751D2C061799
        for <linux-i2c@vger.kernel.org>; Thu, 31 Dec 2020 09:12:54 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id i7so13348266pgc.8
        for <linux-i2c@vger.kernel.org>; Thu, 31 Dec 2020 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=7hwCMHPUw8k2tez5UN8MrGomr410FrSH66vnoa/gs8k=;
        b=DzVZ6cS/WPYndni2FAhHfs6v8YyCxlPtCjiNHuBzc6ObXYrPpjy65EYNo7mQlXQ7S1
         KL8jRcXg70EhlUzq8m7xewLdVcoQnFHohAunGv0vLTiWvucY3DMDRSxjFhERXZGg3h8/
         qNEoDC2CJlIxRJttmjpRm9xBYYSO/7IaGnBcr+16zONVJagMnzK25TDF22diOe/T0AZH
         oJPIfJKIpTnHG1l2cqEN6iip3kL5XPD45oca5a8jQc2Tj7dvCjbGtHPn+o2wmM3xvobV
         4/4jWOMHvKXONDKO4A0BeFXMZLeuce6O840geX9mBrNlI2ehUaRfN0dNpeHpsmlb+ljp
         R9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=7hwCMHPUw8k2tez5UN8MrGomr410FrSH66vnoa/gs8k=;
        b=eXyGqcU5Y2TBadCx5rG/0jxMqlg2YWXZUlcH5MpDVU7KX0R/R79Qs1g1Hw9FD2w7hj
         9/N8asZlX5BLABqwSwwXO8c+H5wt78Da+Qbwc84ibv+6iTqmAc4W/m6cjRCGB8cr+wgH
         JUnAFy+Wvn4aZXKhEguxZJa1KTFnPN0RDkZvcUWi4YERyr49nlcCGacPlc7vllm2YszE
         nDh/DASi0qz/hW3coS5JfmTUHCd8FtSg7i3fFyYuyOcYnDgX2Sfal+knvEi9jmTe6RIX
         0TC3gqt4bMg19N+S1SxgJmFSlcrNr0rjzV7FLnCAR+Oxj/mhia9OgUo5qBhi1H7iIWkA
         tIsg==
X-Gm-Message-State: AOAM530NUiiIiDGHgwcvn6rRAoewNnsWrAt/nLKS/roXD17R5SKTpRmi
        xiprxdZLoC5TAtdwqFawaUOZ
X-Google-Smtp-Source: ABdhPJybDRQx7oYIX3ts8hYbGDZuPzkEURTCULUexr4yEQUuhgTkltP8lytioXqGHbsfT9rkE1854w==
X-Received: by 2002:aa7:97b9:0:b029:1ae:2731:a769 with SMTP id d25-20020aa797b90000b02901ae2731a769mr2426901pfq.46.1609434773569;
        Thu, 31 Dec 2020 09:12:53 -0800 (PST)
Received: from ?IPv6:2409:4072:6c88:26c1:e5d9:a3a9:ff41:ef69? ([2409:4072:6c88:26c1:e5d9:a3a9:ff41:ef69])
        by smtp.gmail.com with ESMTPSA id a1sm46382527pfo.56.2020.12.31.09.12.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Dec 2020 09:12:52 -0800 (PST)
Date:   Thu, 31 Dec 2020 22:42:47 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20201231091202.GB916001@ubuntu2004>
References: <cover.1609263738.git.cristian.ciocaltea@gmail.com> <20201231075435.GG7345@thinkpad> <20201231091202.GB916001@ubuntu2004>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/13] Add CMU/RMU/DMA/MMC/I2C support for Actions Semi
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <F54F3DEA-C1FD-444F-8C15-C8127D61D6EA@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 31 December 2020 2:42:02 PM IST, Cristian Ciocaltea <cristian=2Eciocalt=
ea@gmail=2Ecom> wrote:
>On Thu, Dec 31, 2020 at 01:24:35PM +0530, Manivannan Sadhasivam wrote:
>> On Tue, Dec 29, 2020 at 11:17:15PM +0200, Cristian Ciocaltea wrote:
>> > Hi,
>> >=20
>> > This patchset brings a series of improvements for the Actions Semi
>S500
>> > SoCs family, by adding support for Clock & Reset Management Units,
>DMA,
>> > MMC, I2C & SIRQ controllers=2E
>> >=20
>> > Please note the patches consist mostly of DTS and
>bindings/compatibles
>> > changes, since all the work they depend on has been already merged,
>> > i=2Ee=2E clock fixes/additions, pinctrl driver, sirq driver=2E
>> >=20
>> > For the moment, I have only enabled the features I could test on
>> > RoseapplePi SBC=2E
>> >=20
>>=20
>> Applied all patches except the 2 dmaengine patches for v5=2E12=2E
>Andreas, please
>> let me know if you want to do the PR this time=2E Else I'll proceed=2E
>
>Thank you, Mani!
>The dmaengine patches should be picked up by Vinod, right?
>

Yes! Vinod is just back from vacation, so he will :)=20

Thanks,=20
Mani

>> Thanks,
>> Mani
>>=20
>> > Thanks,
>> > Cristi
>> >=20
>> > Changes in v3:
>> > - Squashed 'arm: dts: owl-s500-roseapplepi: Use UART clock from
>CMU' with
>> >   'arm: dts: owl-s500: Set CMU clocks for UARTs', according to
>Mani's review
>> > - Rebased series on v5=2E11-rc1 and dropped the already merged
>patches:
>> >  * dt-bindings: mmc: owl: Add compatible string for Actions Semi
>S500 SoC
>> >  * dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a
>schema
>> >  * MAINTAINERS: Update entry for Actions Semi Owl I2C binding
>> >  * i2c: owl: Add compatible for the Actions Semi S500 I2C
>controller
>> >=20
>> > Changes in v2:
>> > - Added new bindings/compatibles for S500 DMA, MMC & I2C
>controllers
>> > - Added support for the SIRQ controller
>> > - Added new entries in MAINTAINERS
>> > - Updated naming of some patches in v1
>> >=20
>> > Cristian Ciocaltea (13):
>> >   arm: dts: owl-s500: Add Clock Management Unit
>> >   arm: dts: owl-s500: Set CMU clocks for UARTs
>> >   arm: dts: owl-s500: Add Reset controller
>> >   dt-bindings: dma: owl: Add compatible string for Actions Semi
>S500 SoC
>> >   dmaengine: owl: Add compatible for the Actions Semi S500 DMA
>> >     controller
>> >   arm: dts: owl-s500: Add DMA controller
>> >   arm: dts: owl-s500: Add pinctrl & GPIO support
>> >   arm: dts: owl-s500: Add MMC support
>> >   arm: dts: owl-s500: Add I2C support
>> >   arm: dts: owl-s500: Add SIRQ controller
>> >   arm: dts: owl-s500-roseapplepi: Add uSD support
>> >   arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
>> >   MAINTAINERS: Add linux-actions ML for Actions Semi Arch
>> >=20
>> >  =2E=2E=2E/devicetree/bindings/dma/owl-dma=2Eyaml      |   7 +-
>> >  MAINTAINERS                                   |   1 +
>> >  arch/arm/boot/dts/owl-s500-cubieboard6=2Edts    |   7 -
>> >  =2E=2E=2E/arm/boot/dts/owl-s500-guitar-bb-rev-b=2Edts |   7 -
>> >  =2E=2E=2E/arm/boot/dts/owl-s500-labrador-base-m=2Edts |   7 -
>> >  arch/arm/boot/dts/owl-s500-roseapplepi=2Edts    |  97 +++++++++++-
>> >  arch/arm/boot/dts/owl-s500-sparky=2Edts         |   7 -
>> >  arch/arm/boot/dts/owl-s500=2Edtsi               | 140
>++++++++++++++++++
>> >  drivers/dma/owl-dma=2Ec                         |   3 +-
>> >  9 files changed, 239 insertions(+), 37 deletions(-)
>> >=20
>> > --=20
>> > 2=2E30=2E0
>> >=20

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
