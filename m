Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564904B11BB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 16:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243642AbiBJPdW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 10:33:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240898AbiBJPdV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 10:33:21 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041431DC
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:33:22 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id bs32so5197606qkb.1
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 07:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FL/C4Z8yVwITrvLePD7PW2Jh2OQUiy4zpTquT5szMek=;
        b=qeouTAFQBSLpoh8wkQn7kXpOttRk9Gv3ezXt7zdNPmb9P5eqkcvquLwiOSj+NY0O39
         jExbqpUz6GTIgvr7F/SNKwhxlIaddLakzvNgGipS9nQPQD/FUFbmaG/KyqZNIEVuyRCS
         KsQBGYv/RmF8VclP+Wwo0RYy+LWTRyLfMSWDzdaqeDV5s3JubMvBq0+/A4UuFhXBpfKx
         oSWFDteSho1x3i7f7d3rRIQ1JlTRrNXp6O1NcEcyfY7M9xARz78qi33mBj74rVBKPMP6
         5k4d/oO7hUo4a9LJSy4h7muGwin3Woq6P6oBN8NWcfzTFgp6MWNfT7dp/VEqViTIsF1m
         kt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FL/C4Z8yVwITrvLePD7PW2Jh2OQUiy4zpTquT5szMek=;
        b=6d6nt4I7he+RiZqiRUcdMNlijKiRSfiUL6FP9gwSZ2WqkoGMjldYfBA3nws4wBxcop
         3cdOmFqlgBthXlU3bnC8hoJ64rjn6AuDKCTDzY+0eHdA333NHvsMQHRtG1EbZH0djGaR
         s2e84VU+oJ8Oqjh4H1tRy3O1JD+bfdsQkxLcMV4QZf9WliRL33oyYoHOdRHmYw3Onpu5
         MhvewDRTokxAlla2z7XkZSm4dco8YwXqfJAq2nwB/Cni9JaHYiOc2f8wCEAqCj5XRU6l
         /hvhhoKImLzla4MkFy4jRnjqKII4Er5tNu3WyFMkVUpwihHN6QhASCjz72kXzJYy2/lp
         lxrA==
X-Gm-Message-State: AOAM533sLWg0L9G7I5MODLvjhKvFH/NOH9iaAH807sba7v2Xm8SYs75F
        JEzcI1CiCRcWdPOQEHJKbnCQpo1WXe+cM39Ph4atdg==
X-Google-Smtp-Source: ABdhPJyHyx35eqG+mDoZXo+4b0lEDjXxuVtsuUbpESl7ZzUT3JUOOliWvKZ4XFvW9Lywzp2UQZCzw2j854aPgD09pf0=
X-Received: by 2002:a05:620a:1664:: with SMTP id d4mr4053644qko.363.1644507201150;
 Thu, 10 Feb 2022 07:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org> <Yf1q+wlXo2LAeZX+@ripper>
 <Yf1zhojUSxlMNZgV@sirena.org.uk> <Yf14LADJ26G9ByZu@ripper>
 <Yf1/X1rXm4QbyoFN@sirena.org.uk> <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk> <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
 <YgJoX+Ajgt4dweQJ@sirena.org.uk>
In-Reply-To: <YgJoX+Ajgt4dweQJ@sirena.org.uk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Feb 2022 18:33:09 +0300
Message-ID: <CAA8EJppEjFqPUBXtdkTsx2U2CjsrjNsXEmrx_DkAS9a9jmB9cg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Mark Brown <broonie@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Feb 2022 at 16:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Feb 07, 2022 at 08:31:30PM +0200, Vladimir Zapolskiy wrote:
> > On 2/7/22 4:39 PM, Mark Brown wrote:
>
> > > The bindings are ABI, it doesn't seem like a good idea to add new ABI as
> > > a temporary bodge.

It's not a temporary bodge. The i2c-core piece was reverted, but not
the mediatek driver code/bindings.
Vladimir has provided a replacement for the i2c-core code handling the
vbus-regulator. When thee code will be back, the code from i2c-cci can
be removed. The bindings will be the same.

>
> > The bindings are supposed to describe hardware, thus it's natural to extend
> > them, I believe there is a trilemma in this particular case:
> > 1) add optional vbus-supply property to all I2C master controllers or I2C
> >    busses in case of multiple I2C busses managed by a single controller,
> > 2) add optional vbus-supply property to all I2C slave devices,
>
> If you add a named supply to all I2C controllers or devices then if any
> of them have an actual vbus supply there will be a namespace collision.
>
> > 3) ignore peculiarities of particular (multiple in fact) PCB designs and
> >    a necessity of adding a regulator finely described as a pull-up for I2C
> >    bus lines.
>
> There's also the option of representing this as a separate thing on or
> part of the bus.

4) (which you have implemented in your patch). Add support for  the
vbus-supplies property for the I2C CCI controllers.

This is the option I'd vote for.

-- 
With best wishes
Dmitry
