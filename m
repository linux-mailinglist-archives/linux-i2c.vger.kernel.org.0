Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2394188DC3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 20:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgCQTJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 15:09:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40606 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgCQTJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 15:09:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id 19so24176404ljj.7
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=WBBI5+Fk6wbTGUQap4Fu6dRsazuD8ff8Gu5e+6AmXv7XDo742Zy9lrXGtOEjOpQ/7s
         Cip6Ty0dP3Ku+FzFfqT1DYN7Wr/tDh0ULC5Me0NCdG0TvwtkKB+CXrk5SN4IYPafjx2N
         fbbtkOKGR7y/cFKVvyGFODV5onhx7IGXNfDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=QOIiOLsEz14SYTo8mLlprPpJqNnXhVonUu1BQNxWss8s5vqvSYlzr6YjFTcaFVbr5y
         ayRI9MspYqUdg9m5SSG/EhxfMYFlg0X2voMn7Kw6bSR7qnYovl0ByIqR/ZOajSLdER6H
         jlR5+9YxjgM4NwiUGK4WarpAOoGKI2ZiAt+ewnmbhjDw2yo3d55BUT+Ef3u3hymXzdmN
         Phli4znbnGgkiBwv1KYukZj1slPHdr8JJsgxiOkJnc6I2Gly97AJPlE1+e0dmlrjJest
         Hzt16+741GwFu7FfuaOdrwWBg1agYJ1yO5Z0FaFmcEVWStuY+lhpfC2bd6YbyGmj2vP7
         RaKg==
X-Gm-Message-State: ANhLgQ3eB3nE1++HhQEvO1jcgmW/b4WB1y1qZjOY4jK8O/rBLfCtWTSB
        rFSs3w5b+YPn1bZxz53rUtDhrKykX44=
X-Google-Smtp-Source: ADFU+vsdx0Y/b7fh/GG78semW5DtLpoNDMJaAjRMaJmtLeGTXqxShGyw/ITyAdXwpPUM89j3Tw7jDA==
X-Received: by 2002:a2e:a493:: with SMTP id h19mr141588lji.67.1584472177197;
        Tue, 17 Mar 2020 12:09:37 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id r7sm2948655ljc.3.2020.03.17.12.09.35
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:09:36 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id j11so18204246lfg.4
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 12:09:35 -0700 (PDT)
X-Received: by 2002:a19:ec08:: with SMTP id b8mr536794lfa.34.1584472174941;
 Tue, 17 Mar 2020 12:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com> <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
In-Reply-To: <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:08:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 5:13 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Matthias,
>
> On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> > Hi,
> >
> > On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
> >> Get the interconnect paths for QSPI device and vote according to the
> >> current bus speed of the driver.
> >>
> >> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >> ---
> >>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
> >>     path handle
> >>   - As per Matthias comment, added error handling for icc_set_bw call
> >>
> >>   drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 45 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> >> index 3c4f83b..ad48f43 100644
> >> --- a/drivers/spi/spi-qcom-qspi.c
> >> +++ b/drivers/spi/spi-qcom-qspi.c
> >> @@ -2,6 +2,7 @@
> >>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> >>
> >>   #include <linux/clk.h>
> >> +#include <linux/interconnect.h>
> >>   #include <linux/interrupt.h>
> >>   #include <linux/io.h>
> >>   #include <linux/module.h>
> >> @@ -139,7 +140,10 @@ struct qcom_qspi {
> >>      struct device *dev;
> >>      struct clk_bulk_data *clks;
> >>      struct qspi_xfer xfer;
> >> -    /* Lock to protect xfer and IRQ accessed registers */
> >> +    struct icc_path *icc_path_cpu_to_qspi;
> >> +    unsigned int avg_bw_cpu;
> >> +    unsigned int peak_bw_cpu;
> > This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> > On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> > of a geni SE specific struct, however adding a generic convenience struct to
> > 'linux/interconnect.h' might be the better solution:
> >
> > struct icc_client {
> >       struct icc_path *path;
> >       unsigned int avg_bw;
> >       unsigned int peak_bw;
> > };
> >
> > I'm sure there are better names for it, but this would be the idea.
>
> Yeah, I think introducing this to ICC header would be better solution.

+Georgi

I'm not as convinced this structure is generally useful and belongs in
the interconnect core. The thing that strikes me as weird with putting
it in the core is now we're saving these values both inside and
outside the interconnect core. In the GENI case here, we only really
need them to undo the 0 votes we cast during suspend. If "vote for 0
in suspend and whatever it was before at resume" is a recurring theme,
maybe the core should give us path_disable() and path_enable() calls
instead. I'm thinking out loud, maybe Georgi has some thoughts.

Akash, for now if you want to avoid wading into a larger discussion
maybe just refactor to a common structure local to GENI.


-Evan
