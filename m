Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29BF17992F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 20:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgCDTp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 14:45:57 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37742 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgCDTp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 14:45:57 -0500
Received: by mail-oi1-f196.google.com with SMTP id q65so3363171oif.4
        for <linux-i2c@vger.kernel.org>; Wed, 04 Mar 2020 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kWadfq8n8ikaE2sXK+q86ewOa5j024o4aErlzhHndBQ=;
        b=m4r8iyrMAamzXCnb2lZMRyTtM/hTKf3l7sZ7ddSOdS8x52JLndDvYF7xWolz3fSZrk
         Hr5fEGsIUgcpdPWGTTzgvbKDMnV8FNUWFO6AE27zoLCYHfBjFw6P6ypjhUq45wXDwllp
         TBklAVvg/6PYB25ZTCs08MIR65bOA7532AFzuWc1w6UXc+RGiBDvNBHNLYoCSMV6XhQC
         OmtXJTfXuaCNEDQo79oJ9fG4Pxd1kf4wcALNnR/3Fjo7AME30qsgslBJJkcxKJvRM92P
         fHi8XAmM3b7qoxgY7T1XFMcAeR0zm7YxK3z0X5USkSoPQ4WR56h6aaxky6B3l2h0ddxA
         WK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kWadfq8n8ikaE2sXK+q86ewOa5j024o4aErlzhHndBQ=;
        b=KKth3Mfy0y4QjFHVfQ/kTl6pF80Dy9SB+FKAqvtVVZoHw2owagLtoqz2pBS3OQiCM+
         6tAAovt+nJoR6z16lfcTtGK+j+X0BbEMkM3cgAg9HUJU3K9hMh+DwgwuOkJNOXnPyZeW
         nqHmz1Yl0s9YoUBTmSQHYuSNU/jryVGbkH9CcnxCiFqRMTaF+/VAqs8VJZjhbk5k2rFt
         WxetTOpjEmeAvUiGvVZbP4zivk+Kmj4zcPMWXQ70oNoJ0EV4wgh7Q6p98EUXnXi6F5kp
         URdb50oAvWQS1CxZcwF0nPODkaHv5FnFQ/ZPSotDMODSSDHsvhtw/tovfxNzWtfR688m
         LHKg==
X-Gm-Message-State: ANhLgQ2Xe8ngUF1uUKSuNrQDOavN+XPWHvaJ858IN2iusSCX/NTTb0r4
        kYFZJb4z3sxn0WBrL8eLYFM4MWXeyvllt0kv+n2X+w==
X-Google-Smtp-Source: ADFU+vvP/kJS5QIqrc3c2ZcZy+r4g4xv4xVM67XXhSm6q2TnLWIxJxF0xjAmXobu9J6khjNZY5dkmfD4dHdIUKIuB2w=
X-Received: by 2002:aca:5194:: with SMTP id f142mr3041130oib.100.1583351157037;
 Wed, 04 Mar 2020 11:45:57 -0800 (PST)
MIME-Version: 1.0
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
 <1583340776-27865-3-git-send-email-loic.poulain@linaro.org> <CAG3jFys_2zwsZw_khUP2Vp4rPF42=Ammd+0UPpAo8T7FCqm0tw@mail.gmail.com>
In-Reply-To: <CAG3jFys_2zwsZw_khUP2Vp4rPF42=Ammd+0UPpAo8T7FCqm0tw@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 4 Mar 2020 20:45:45 +0100
Message-ID: <CAG3jFytLfK-1Ss9zBF6OqrSp_Z25rBopoPkOk00U9tzZD24F=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: msm8916: Add CCI node
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I've had looked this too, and please ignore my sob, and feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 4 Mar 2020 at 20:08, Robert Foss <robert.foss@linaro.org> wrote:
>
> Due to lack of suitable hardware, I currently can't test the msm8916,
> but I have written similar DT nodes for the sdm845, which indeed work properly.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> On Wed, 4 Mar 2020 at 17:49, Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > The msm8916 CCI controller provides one CCI/I2C bus.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: add this patch in the series
> >  v3: add only cci node for now
> >
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 8686e10..985cb5f 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -1451,6 +1451,33 @@
> >                         };
> >                 };
> >
> > +               cci@1b0c000 {
> > +                       compatible = "qcom,msm8916-cci";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0x1b0c000 0x1000>;
> > +                       interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> > +                       clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> > +                               <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> > +                               <&gcc GCC_CAMSS_CCI_CLK>,
> > +                               <&gcc GCC_CAMSS_AHB_CLK>;
> > +                       clock-names = "camss_top_ahb", "cci_ahb",
> > +                                     "cci", "camss_ahb";
> > +                       assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> > +                                         <&gcc GCC_CAMSS_CCI_CLK>;
> > +                       assigned-clock-rates = <80000000>, <19200000>;
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&cci0_default>;
> > +                       status = "disabled";
> > +
> > +                       cci0: i2c-bus@0 {
> > +                               reg = <0>;
> > +                               clock-frequency = <400000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +               };
> > +
> >                 camss: camss@1b00000 {
> >                         compatible = "qcom,msm8916-camss";
> >                         reg = <0x1b0ac00 0x200>,
> > --
> > 2.7.4
> >
