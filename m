Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9CDDAC897
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2019 19:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbfIGR4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Sep 2019 13:56:47 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35046 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfIGR4r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Sep 2019 13:56:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id t50so9517153edd.2;
        Sat, 07 Sep 2019 10:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zalOqhrzZjyM0szPnIsJnTUBwf5okfg7WLnC8WBo7yI=;
        b=mUjnKe4VamKX9mZq66OYWYkL9RJlpPEx7iEctLbc6KAIeyBLzVRgN+x6esdVIDRsC6
         r/m92aVEMepxVMadoPx0qmFWEekAr1cy/jKT25zsnrS7sfXlO5ashty8sN7KS8zZgR5f
         EqKYRY1g0XEmi8QdnbcdGzjmmw/1zmT4gdKk7QSSrLD55G/yt8pKucS93K5MiUH7HM5i
         T+kB7MtLgAQq+IOEUQ913dfRBCA05knU3yELhCsjurkbm97RGAVyjhv/B8bTtMjzkqmg
         rPBLzIJCz4hxsk88GwWB4PrIBtBiuFncYSfY3lmNoPLfZPuUartFUPN6TqS0Dy86UdUe
         H12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zalOqhrzZjyM0szPnIsJnTUBwf5okfg7WLnC8WBo7yI=;
        b=QZO527l1+UShwZ+7x7NN/6blZFbE6n5OT5bs+MNB75FvtRt6XdBNhNGWuRL+0b5vQ0
         1YgBbqjl6rfesmaXF7Dl8X1fsRpt+hV0FOAyfHpkjrs/GKsrhGskhtsqoMicH7k9vPFF
         EKv/lXlDTXJ7WVxpRqAydwg5wo5qaHAVKp6tODYtjN4EmHvZ9iJTWDLZVkVI3FJ1UnMs
         XVUtJVaOfpjyb1WI4byq+kVHNkkHpkJRk0W7XDiC3v9bCHx0ZmwpCiQBMdgSVqVTLZaY
         Xz+vuK6yCgtNGidS1alibdi1xhua2Ovo9d7puBiADjy7sSbYhd41ncmGhn12LnDAn2wj
         ygHw==
X-Gm-Message-State: APjAAAV/stdvTj3GvVdnoTsrOPvarERRkumFkmK9eK2nvDZgauZdDjIV
        raDdexgi6RG7nA2Ucf1Tbu3wbpOI+IsBJf6OXE8=
X-Google-Smtp-Source: APXvYqwp5ohaeMF8qrS3a8WlCgEazpTw0TY9tn1AkEqK60bHKJw5lI2Jw6EVMrnBBxhYRvz5Caev7csiqO8tq3OmNLc=
X-Received: by 2002:a17:906:d7b5:: with SMTP id pk21mr12541296ejb.174.1567879005378;
 Sat, 07 Sep 2019 10:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190905192412.23116-1-lee.jones@linaro.org> <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell> <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell> <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell> <20190906183139.GB19123@kunai>
In-Reply-To: <20190906183139.GB19123@kunai>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 7 Sep 2019 10:56:34 -0700
Message-ID: <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > Does this mean you plan to have this merged for v5.4?
>
> Only if the machine DTS is expected to land in 5.4. But Stephen said it
> is not in liunx-next yet?
>

It appears to be in arm-soc for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next

BR,
-R
