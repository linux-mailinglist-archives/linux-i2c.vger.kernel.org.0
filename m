Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F441F3F8F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 17:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbgFIPiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 11:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgFIPiF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 11:38:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE28C05BD1E
        for <linux-i2c@vger.kernel.org>; Tue,  9 Jun 2020 08:38:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id d6so1571206pjs.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jun 2020 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zNXPTuPYITPlXUf9e7kBdBv6V29pBmsp1U+7kcfXIt0=;
        b=KP3OHZBJkKR3Lj6uCMOBqyToXZJQKsuReIBf8UJe/AqNMp7qafeDSi5CBzpGfzbAuH
         +XLPg+AkiDaSsSMQDhSD/m1nySLMmUDcScF+LdeMcknzD5SFbN4tf7DSgGFZw1/NwKuV
         4jKKzu0BsDeptbc5+jmKEGCb59pJrM6wLEh1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zNXPTuPYITPlXUf9e7kBdBv6V29pBmsp1U+7kcfXIt0=;
        b=bPJPvv33BZUx2sM3jiE+ISMzYO8Sc2nv3cPuk0EauE1qi9tkLD5Hyh84vID+zc6TKr
         rYehBPV6RIYApbSchKo+IOyAqNxlb8hlDiv45RcXmqCkVT67n7H3RQsjxXRne+mKmLzj
         Q8NxbIoDaAImEAG2KPlkogmSI2oxCjwqIEJuWRAUEVwmTqT6sdCXniP6p+voNRSop866
         N0p39pZtfaXOLMWXS9AvLy2Y4aH/yH1B8hMGiBR5vTAUrbodIcHczxB725J22COSgjVB
         hG/NH2qRsdEjbpk0M9m7oZISN2QjNIhX7d+Lrr4JgZy3LRBN4KABQA40TEST4oJgRpvY
         8v0Q==
X-Gm-Message-State: AOAM532uAl1PG5ASecOG8cXfPdHVmIRKZa9FDHdsYNBCXpCiuojjhXOK
        Cm7GmYw7PMQbiFPFQ9TptlepWg==
X-Google-Smtp-Source: ABdhPJyLZg1krDhLm4HG19/WnYesweBfZBwBFVjHitwsKq7GU5d3/yfPS2CEYvHEXWAL2zbkqjxZEA==
X-Received: by 2002:a17:902:aa48:: with SMTP id c8mr3979439plr.128.1591717084665;
        Tue, 09 Jun 2020 08:38:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q6sm10170213pff.163.2020.06.09.08.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 08:38:03 -0700 (PDT)
Date:   Tue, 9 Jun 2020 08:38:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, msavaliy@codeaurora.org
Subject: Re: [PATCH V7 RESEND 0/7] Add interconnect support to QSPI and QUP
 drivers
Message-ID: <20200609153802.GS4525@google.com>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Jun 09, 2020 at 11:26:27AM +0530, Akash Asthana wrote:
> This patch series is based on tag "next-20200608" of linux-next tree.

Great, I was concerned there would be conflicts without a rebase.

> Resending V7 patch with minor change in patch 6/7 (QSPI).

It's not a pure resend, since it has changes in "spi:
spi-qcom-qspi: Add interconnect support":

  Changes in Resend V7:
   - As per Matthias comment removed "unsigned int avg_bw_cpu" from
      struct qcom_qspi as we are using that variable only once.

Please increase the version number whenever you make changes or rebase.

Maintainers tend to be busy, before doing actual resends folks often
send a ping/inquiry on the original patch/series, and only resend it when
they didn't receive a response after some time.

Thanks

Matthias

> dt-binding patch for QUP drivers.
>  - https://patchwork.kernel.org/patch/11534149/ [Convert QUP bindings
>         to YAML and add ICC, pin swap doc]
> 
> High level design:
>  - QUP wrapper/common driver.
>    Vote for QUP core on behalf of earlycon from probe.
>    Remove BW vote during earlycon exit call
> 
>  - SERIAL driver.
>    Vote only for CPU/CORE path because driver is in FIFO mode only
>    Vote/unvote from qcom_geni_serial_pm func.
>    Bump up the CPU vote from set_termios call based on real time need
> 
>  - I2C driver.
>    Vote for CORE/CPU/DDR path
>    Vote/unvote from runtime resume/suspend callback
>    As bus speed for I2C is fixed from probe itself no need for bump up.
> 
>  - SPI QUP driver.
>    Vote only for CPU/CORE path because driver is in FIFO mode only
>    Vote/unvote from runtime resume/suspend callback
>    Bump up CPU vote based on real time need per transfer.
> 
>  - QSPI driver.
>    Vote only for CPU path
>    Vote/unvote from runtime resume/suspend callback
>    Bump up CPU vote based on real time need per transfer.
> 
> Changes in V2:
>  - Add devm_of_icc_get() API interconnect core.
>  - Add ICC support to common driver to fix earlyconsole crash.
> 
> Changes in V3:
>  - Define common ICC APIs in geni-se driver and use it across geni based
>    I2C,SPI and UART driver.
> 
> Changes in V4:
>  - Add a patch to ICC core to scale peak requirement
>    as twice of average if it is not mentioned explicilty.
> 
> Changes in V5:
>  - As per Georgi's suggestion removed patch from ICC core for assuming
>    peak_bw as twice of average when it's not mentioned, instead assume it
>    equall to avg_bw and keep this assumption in ICC client itself.
>  - As per Matthias suggestion use enum for GENI QUP ICC paths.
> 
> Changes in V6:
>  - No Major change
> 
> Changes in V7:
>  - As per Matthias's comment removed usage of peak_bw variable because we don't
>    have explicit peak requirement, we were voting peak = avg and this can be
>    tracked using single variable for avg bw.
>  - As per Matthias's comment improved print log.
> 
> Akash Asthana (7):
>   soc: qcom: geni: Support for ICC voting
>   soc: qcom-geni-se: Add interconnect support to fix earlycon crash
>   i2c: i2c-qcom-geni: Add interconnect support
>   spi: spi-geni-qcom: Add interconnect support
>   tty: serial: qcom_geni_serial: Add interconnect support
>   spi: spi-qcom-qspi: Add interconnect support
>   arm64: dts: sc7180: Add interconnect for QUP and QSPI
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi  | 127 ++++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-qcom-geni.c    |  26 +++++-
>  drivers/soc/qcom/qcom-geni-se.c       | 150 ++++++++++++++++++++++++++++++++++
>  drivers/spi/spi-geni-qcom.c           |  29 ++++++-
>  drivers/spi/spi-qcom-qspi.c           |  56 ++++++++++++-
>  drivers/tty/serial/qcom_geni_serial.c |  38 ++++++++-
>  include/linux/qcom-geni-se.h          |  40 +++++++++
>  7 files changed, 460 insertions(+), 6 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
> 
