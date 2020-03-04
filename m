Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84D1179926
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 20:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbgCDTot (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 14:44:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36747 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728614AbgCDTos (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 14:44:48 -0500
Received: by mail-oi1-f196.google.com with SMTP id t24so3368997oij.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Mar 2020 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3D4fZa42k0mvwy6uEnxeFx+9hq0HpiKAlktrmbHFK0=;
        b=IZ6rnHRUshcTSSK0Lrh3yYkTNgAne8KQhkjiWzqWnZ4O07U+nuYzFwI95uaa4/5PYH
         vTT6O2bLwA7q/txzrRIBtig0fHqDDyhwpOWa+eF0VLZikinclCLGoLzgsY8OE0eLWeGD
         Zur0DLMqqAY/gMWw7/qpi6aUDmoJ9LuL1/PnfxnJ98FieqI6hrGmH8Ks/+fN778IFgjf
         m9Pduk6swKe+bjdJnN4N7iyG/0d81Vo8JNKn4l95PGrTzSpYd3XL89XL27n2n0CwK6nD
         u5Uo3gf8jyGr/GlM5rWjyxC7BsxmYax/FeGHFzUp2fFqrf93K+07SpyWYYUCKObnYayp
         7l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3D4fZa42k0mvwy6uEnxeFx+9hq0HpiKAlktrmbHFK0=;
        b=il+VBzrQWtuUZVsifBXDrTaivoxjE3OK+El7E9KFEStLEZlqrgo2o4u3cBDYcVOm51
         WvbLY/kz+eJ8LK3up2Twvvtcrw6CMG+55GsN5AA1k0YxA1HBFaBi/AtfSrbRwcOTvqzZ
         6Ka+bdnu/JGMHbyJLmVD011UqBoHi/bnHvNrgVmXOSFFjJRGeO+S7ucDi8mWtIQh2SKl
         ViQBCsZNoUu98ncIAssaMMBqZFwK4B1MsvOTlRYuuPiDoabWdXnfq5c7pmMaZ/g7w+cQ
         ANoESwQItir0+bO7G6BzFJz8SH5SRnQFtstpzI3JUN0JPUsCmP4qPWFoF/4Me5pVTa1p
         hYuw==
X-Gm-Message-State: ANhLgQ3KPjOoduraWkx4/z2JKGriC3GTKFfbdyyAiulXqujTKIS4kXYO
        wPsxQLoL0yLxis2BZk4cLHnIF0XN0Ys4z+IbwMgaMQ==
X-Google-Smtp-Source: ADFU+vuX18eP8iUKOslFu9FGrEue1UsnuvICD0y10CBlano9eE73YfK3Svv1jM0K7kdJb6o+wTYlBS1B3eOVPSCm2tk=
X-Received: by 2002:a05:6808:2c4:: with SMTP id a4mr2999344oid.176.1583351086363;
 Wed, 04 Mar 2020 11:44:46 -0800 (PST)
MIME-Version: 1.0
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
 <1583340776-27865-2-git-send-email-loic.poulain@linaro.org> <CAG3jFyvjQ_rAe_UkBc5Ha-sSK5ERTCaO+r2FS5n9RiLFRTikig@mail.gmail.com>
In-Reply-To: <CAG3jFyvjQ_rAe_UkBc5Ha-sSK5ERTCaO+r2FS5n9RiLFRTikig@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 4 Mar 2020 20:44:35 +0100
Message-ID: <CAG3jFyvrL_To_cm3jzYzLRVOZWjBeRDiXJkV5AjmBZB_28UipA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let me revise that, feel free to add by r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 4 Mar 2020 at 20:05, Robert Foss <robert.foss@linaro.org> wrote:
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> On Wed, 4 Mar 2020 at 17:49, Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > From: Todor Tomov <todor.tomov@linaro.org>
> >
> > Add DT binding document for Qualcomm Camera Control Interface (CCI)
> > I2C controller.
> >
> > Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  v2: Fix subnode properties, remove mandatory clock names
> >  v3: Add sdm845 compatible string
> >
> >  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> > new file mode 100644
> > index 0000000..c6668b7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> > @@ -0,0 +1,92 @@
> > +Qualcomm Camera Control Interface (CCI) I2C controller
> > +
> > +PROPERTIES:
> > +
> > +- compatible:
> > +       Usage: required
> > +       Value type: <string>
> > +       Definition: must be one of:
> > +               "qcom,msm8916-cci"
> > +               "qcom,msm8996-cci"
> > +               "qcom,sdm845-cci"
> > +
> > +- reg
> > +       Usage: required
> > +       Value type: <prop-encoded-array>
> > +       Definition: base address CCI I2C controller and length of memory
> > +                   mapped region.
> > +
> > +- interrupts:
> > +       Usage: required
> > +       Value type: <prop-encoded-array>
> > +       Definition: specifies the CCI I2C interrupt. The format of the
> > +                   specifier is defined by the binding document describing
> > +                   the node's interrupt parent.
> > +
> > +- clocks:
> > +       Usage: required
> > +       Value type: <prop-encoded-array>
> > +       Definition: a list of phandle, should contain an entry for each
> > +                   entries in clock-names.
> > +
> > +- clock-names
> > +       Usage: required
> > +       Value type: <string>
> > +       Definition: a list of clock names, must include "cci" clock.
> > +
> > +- power-domains
> > +       Usage: required for "qcom,msm8996-cci"
> > +       Value type: <prop-encoded-array>
> > +       Definition:
> > +
> > +SUBNODES:
> > +
> > +The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996 and
> > +sdm845), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
> > +
> > +PROPERTIES:
> > +
> > +- reg:
> > +       Usage: required
> > +       Value type: <u32>
> > +       Definition: Index of the CCI bus/master
> > +
> > +- clock-frequency:
> > +       Usage: optional
> > +       Value type: <u32>
> > +       Definition: Desired I2C bus clock frequency in Hz, defaults to 100
> > +                   kHz if omitted.
> > +
> > +Example:
> > +
> > +       cci@a0c000 {
> > +               compatible = "qcom,msm8996-cci";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               reg = <0xa0c000 0x1000>;
> > +               interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
> > +               clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
> > +                        <&mmcc CAMSS_TOP_AHB_CLK>,
> > +                        <&mmcc CAMSS_CCI_AHB_CLK>,
> > +                        <&mmcc CAMSS_CCI_CLK>,
> > +                        <&mmcc CAMSS_AHB_CLK>;
> > +               clock-names = "mmss_mmagic_ahb",
> > +                             "camss_top_ahb",
> > +                             "cci_ahb",
> > +                             "cci",
> > +                             "camss_ahb";
> > +
> > +               i2c-bus@0 {
> > +                       reg = <0>;
> > +                       clock-frequency = <400000>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +
> > +               i2c-bus@1 {
> > +                       reg = <1>;
> > +                       clock-frequency = <400000>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +       };
> > --
> > 2.7.4
> >
