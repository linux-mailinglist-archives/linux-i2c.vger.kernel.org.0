Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3E3BE176
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 17:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfIYPiS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Sep 2019 11:38:18 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35796 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfIYPiS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Sep 2019 11:38:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id y10so2625220plp.2
        for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2019 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WFyqEgFIXxDXsQf02spjWBC+c1Pk2Y/AZt1ZdKS3tA0=;
        b=tWn/kRPqMPGbuXIzsOQ3jYnu0K8MkMr7J/sgCjQyg6vQG8W3iTJTBPN9qn1qlHbmiN
         UutdLyvi6XCwK0nucSF4RTb6iPVQ6+PIqBvpF2ylnBKKKrWUUMncHU3E+uCfyLpPeAmV
         T4kIAK5iNhiGkmpQ0pe/02JJaiyr6yJCgzPPUTIIWtk+FRdJ0UK4k3BiKBiIt8dCQ6p/
         mtUMbrrhaxAhH5a7xAioNHKGHpMnNMamS/HKvuaCKmstAEYkW2+2VjnAW/mcZ7mfrAoi
         1nF3NtVAt3TYcgiyF3jgxeK++/wEiO/ZcKZat+SAXpKRU6j9TpGHkj126isvZrSJJG4L
         CDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WFyqEgFIXxDXsQf02spjWBC+c1Pk2Y/AZt1ZdKS3tA0=;
        b=lF0M/lgZPVfvpGV9hk+U3CmeJeNAcP9yjH+TWIfPlPsYWcjg0y7BT8dh8gx15kiHH1
         DZhnr8n85PKzf8bJvNbgHghoyXT25N1/QTREeS2r1zNaDhoz2FVXc3lFkbzsJuVn3Mzu
         VerhF6HxamHDP1KaAPB4gso8+MqZC9LTBU7t4WN6AUwlyBzOwxLRFwLtIK0Lg6qRpEjY
         Gh2vSl3eVJ44XzMF/8nvKDKVLQOW0lvcs9yl1/AxtvUssgm495hmGsnQtRHwNHZwcZCf
         6MADMpHYH7ZU13biDtGnZRqgVv10NnhWD4EIOc8xU95afpVCHF+mksCDM7ttNhuoeYvG
         revw==
X-Gm-Message-State: APjAAAUHI6GsPqsOMWenpzW6v2fXuQLEmll8GFCT/mX4s9IUhlu+ZqAq
        c3FY924MkL5lT8GIbqXgN6YnHA==
X-Google-Smtp-Source: APXvYqyft+7qNq+VTiDUPPC3DvrO2fmyWnYZPaP16bOgVGDreSGRpYghqu73A1VZ3op5y0JgX4nOag==
X-Received: by 2002:a17:902:ab89:: with SMTP id f9mr9627821plr.295.1569425897030;
        Wed, 25 Sep 2019 08:38:17 -0700 (PDT)
Received: from dell ([12.157.10.118])
        by smtp.gmail.com with ESMTPSA id g202sm11313147pfb.155.2019.09.25.08.38.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:38:15 -0700 (PDT)
Date:   Wed, 25 Sep 2019 16:38:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190925153813.GD4469@dell>
References: <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai>
 <20190913161345.GB8466@tuxbook-pro>
 <20190913161748.GF1022@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190913161748.GF1022@kunai>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 13 Sep 2019, Wolfram Sang wrote:

> 
> > It seems linux-next is now pulling from the soc.git, rather than
> > arm-soc.git, but Arnd is still pushing patches to arm-soc.git.
> 
> Can you ask them to fix this?
> 
> > Arnd says that the patch will be in v5.4 and I merged Arnd's tree and
> > gave it a spin here and this patch makes it boot. So please merge this
> > patch for v5.4 as well.
> 
> No worries, this is clearly a bugfix. So it will easily go in with the
> same release as the DTS file.

DTS file now upstream (44acee207844).

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
