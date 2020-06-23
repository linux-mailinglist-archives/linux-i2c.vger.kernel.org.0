Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFCB2048FF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 07:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgFWFMn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 01:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbgFWFMk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 01:12:40 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114FDC061573
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jun 2020 22:12:40 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id t132so10992632vst.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jun 2020 22:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7oiDqnOGO+TssYLUtaiAkGZqbTLTe8VBFV4/hAXcsaU=;
        b=GyM4fscQ4q5oq3dAVNcL2LKqjcJve7N0SZ8ZZHhGKk95SJESE5mehZloXDB+bNh5tp
         eD5Q2sXcgazzYyaHEaIXxhs4bl/B9ZozpMBCMbM9FGCgjMOGrLh5IWUNBHtQBXkGEfTQ
         01Z4/4we8JqKj06ttdbLoGxTzqNX9heQz4EGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7oiDqnOGO+TssYLUtaiAkGZqbTLTe8VBFV4/hAXcsaU=;
        b=i+5E4KAjN9AlNWDaVhz0VLBJ8pmOn+e7pvAyZc/uNbm2+mRuw+iXZslDdo8k+VZ7Bu
         4zeIMcYJt/pXQ0mDPFoGTmVkMR/r9np3j/jJS1cR09L1vyfLaI9WDDplzSj/Xs908vaF
         htn0b/vQ/VtUd/g+Uz7JYY7FPARaPjDRw5Tbl9sEQevcIm2NzNBNqoNe0cXpkj60g6uu
         KYvK2nTm6AmyrhzVPvAi3wCvgKb8sGpsFrwpRDQvOa3yGlodr2Af1SAQR0U67c5yjIJE
         DsZVMuYAXEF7012mD2nri88PEN8XNSb+XkklVzZoXUY3Ffxr6s85OqtqabNscbJRV3W1
         rJvQ==
X-Gm-Message-State: AOAM533N6SV263dCOFLYmompKNdHxDFThBGU6gR1q5sgtQiqsIbJ+N0d
        BnldrCldl4XUW5smNY7AOO66eoKfPeM=
X-Google-Smtp-Source: ABdhPJxYWrseyKszEOy7e2PjDpO0Hq/Oe3FUi2SemTVkz5DHHtfxudRuKkCojr+bTMiyGn3siNaPUQ==
X-Received: by 2002:a67:fc08:: with SMTP id o8mr19354486vsq.188.1592889158567;
        Mon, 22 Jun 2020 22:12:38 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id v201sm2550748vkv.2.2020.06.22.22.12.38
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 22:12:38 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id y123so10989866vsb.6
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jun 2020 22:12:38 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr18647007vsm.73.1592888819511;
 Mon, 22 Jun 2020 22:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org> <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Jun 2020 22:06:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
Message-ID: <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
Subject: Re: [PATCH V7 RESEND 4/7] spi: spi-geni-qcom: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>, msavaliy@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jun 8, 2020 at 10:57 PM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
>
> Changes in V3:
>  - As per Matthias's comment, use helper ICC function from geni-se driver.
>
> Changes in V4:
>  - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>    to ICC core.
>
> Changes in V5:
>  - Use icc_enable/disable in power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value. No need to call icc_disable after BW vote because
>    device will resume and suspend before probe return and will leave ICC in
>    disabled state.
>
> Changes in V6:
>  - No change
>
> Changes in V7:
>  - As per Matthias's comment removed usage of peak_bw variable because we don't
>    have explicit peak requirement, we were voting peak = avg and this can be
>    tracked using single variable for avg bw.
>
>  drivers/spi/spi-geni-qcom.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..2ace5c5 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -234,6 +234,12 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>                 return ret;
>         }
>
> +       /* Set BW quota for CPU as driver supports FIFO mode only. */
> +       se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
> +       ret = geni_icc_set_bw(se);
> +       if (ret)
> +               return ret;
> +

I haven't done a deep review of your patch, but a quick drive-by
review since I happened to notice it while looking at this driver.
You should probably also update the other path that's adjusting the
"mas->cur_speed_hz" variable.  Specifically see setup_fifo_xfer().

For bonus points, you could even unify the two paths.  Perhaps you
could pick <https://crrev.com/c/2259624> and include it in your series
(remove the WIP if you do).


-Doug
