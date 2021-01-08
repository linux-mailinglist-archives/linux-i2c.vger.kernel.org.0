Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D419A2EEFC9
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 10:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbhAHJke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 04:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbhAHJkd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 04:40:33 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFACC0612F9
        for <linux-i2c@vger.kernel.org>; Fri,  8 Jan 2021 01:39:53 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id 73so3226514uac.8
        for <linux-i2c@vger.kernel.org>; Fri, 08 Jan 2021 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKIqx1+T0s1Uz0l5lnlu8sHB7ChPsrqsSGBnv7F9PHA=;
        b=UBXFpKBPQH3ou6FxAvLQLc27q5ERw+zDe12JgeEF0sc1yNF5yd8c8SKpHNRNRBvrHE
         Ujl/yKitGr6inPulvKBnpcvgvMiJj5MgM6fTHHoJJKGyi1RxmEJEoweFLnwuAmeGOTcr
         q55XMeoeroQzwVquOumpNkBczYuG6X1H3plxHx78ZX6F0enhhVfWKgcssOcgxp8Og7ok
         XLAoN43AJuYjR60BMZRzVfWlgj4tfUSSo6zgyzlo49F+YFhXpTZE98gbnWEAggHU8N3N
         6dwT+PoQZHJaWEMzmO7mSboGqOb/d+Jn8MX1JzBu2sov7DP4U6qXpZEsvnnUhvd8YL+J
         BXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKIqx1+T0s1Uz0l5lnlu8sHB7ChPsrqsSGBnv7F9PHA=;
        b=E5G8omIYgUwh1JMMxsiFx2oMT+UF7sA7p0p2uGy2gH7M6ubVN6lf3nwFo5if5J4Nlq
         eVWPNwMdD2Zbeya7e7uoJ5VGLS6Us4MAAVI5ty8zKWUajvVVZj2+2VNgz4SLJYZRYfx8
         NDXRjSet97+8Sm3N8zP4Ag4FIl/FBnaJ34YMBoQlPfZ/md3wO7igIGlQuZL+/YiSoAqz
         AYOAkMDtKqT7KUByKKbYwtMKIYzoVeCQya1tZ5aEZimVzuoeLorSEmqo6BoEnj1S2x+8
         sZMPquZ7SM5YuTeClVxkM0QZ6xHy8ZfV2j0hmvx+Za0BXbDbBBP/xr5Iz7PTcaCcyKDi
         YZdA==
X-Gm-Message-State: AOAM531uGVccufQLMp6HoHTVB/lVlS600UEDmjZIf2y/DHRSzpRhBP09
        zTkAw7Twm27BocinFI0wtrB7KZYjS+VlTuLmAFcKyg==
X-Google-Smtp-Source: ABdhPJyO9MNZw7maYb1cVWdBXnv9cfRCWkRHXPDTUPH7WUCo66etmetwEj+m+TRNoV3tGPk704BJrjZLHzt3rOmWixU=
X-Received: by 2002:ab0:4597:: with SMTP id u23mr2241423uau.100.1610098792062;
 Fri, 08 Jan 2021 01:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20201224111210.1214-1-rojay@codeaurora.org> <20201224111210.1214-2-rojay@codeaurora.org>
 <20201231154929.GA1846089@robh.at.kernel.org>
In-Reply-To: <20201231154929.GA1846089@robh.at.kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Jan 2021 10:39:15 +0100
Message-ID: <CAPDyKFp_mZOW45RFN6_2P8skjY4_1PfVun6YZ_6a+edKHmBOeg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states'
 property
To:     Rob Herring <robh@kernel.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 31 Dec 2020 at 16:49, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 24, 2020 at 04:42:08PM +0530, Roja Rani Yarubandi wrote:
> > While most devices within power-domains which support performance states,
> > scale the performance state dynamically, some devices might want to
> > set a static/default performance state while the device is active.
> > These devices typically would also run off a fixed clock and not support
> > dynamically scaling the device's performance, also known as DVFS
> > techniques.
> >
> > Add a property 'assigned-performance-states' which client devices can
> > use to set this default performance state on their power-domains.
> >
> > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > ---
> >  .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> > index aed51e9dcb11..a42977a82d06 100644
> > --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> > +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> > @@ -66,6 +66,18 @@ properties:
> >        by the given provider should be subdomains of the domain specified
> >        by this binding.
> >
> > +  assigned-performance-states:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +       Some devices might need to configure their power domains in a default
> > +       performance state while the device is active. These devices typcially
> > +       would also run off a fixed clock and not support dynamically scaling
> > +       the device's performance, also known as DVFS techniques. Each cell in
> > +       performance state value corresponds to one power domain specified as
> > +       part of the power-domains property. Performance state value can be an
> > +       opp-level inside an OPP table of the power-domain and need not match
> > +       with any OPP table performance state.
>
> Couldn't this just be an additional cell in 'power-domains'?

Right. Some SoCs already use the cell to specify per device SoC
specific data [1].

Although, I am wondering if we shouldn't consider
"assigned-performance-states" as a more generic binding. I think it
would be somewhat comparable with the existing "assigned-clock-rates"
binding, don't you think?

[...]

Kind regards
Uffe

[1]
Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
