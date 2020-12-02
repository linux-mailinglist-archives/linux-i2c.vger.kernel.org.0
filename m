Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBB22CC288
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389150AbgLBQgr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 11:36:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389146AbgLBQgq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 11:36:46 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8290AC0613D4
        for <linux-i2c@vger.kernel.org>; Wed,  2 Dec 2020 08:36:23 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id j21so2180704otp.8
        for <linux-i2c@vger.kernel.org>; Wed, 02 Dec 2020 08:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P7hmM1tissJj2yPjhe+PqhvR3xfSKGv9uE8kLqD386k=;
        b=zozlhoiZY38HuWdwtw0EfFSCY/OnO0dJNjplv+Wu5YUiRfHnruVzxTVgzgN6nwkYP1
         GB9YAV/5ZDbvc784xCjvRk06nPguoODsuKONeC0zl8MQ3VOhdkt7x3nLPpQ9s/SlS55h
         qjBkoN8MEzGQ0Gxpz9Dag8mEaE5ezwrI89MCZRutQfwYH4VsUck5Cn2preFqChUCVULy
         GJ1BZXwMHWWd5Flkhc7RZq9Kjm3WFA/rsXSgonGhWzsEnLK+hTV7kwhDZE3Aw7YvCVsS
         zNdFsIcH0EEkIyh+M3I0nKba2VEYCG2VnwOvLewHB/OlJni9XoJOqeNrMgppGit/cjxk
         wFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P7hmM1tissJj2yPjhe+PqhvR3xfSKGv9uE8kLqD386k=;
        b=cSLzn2XQRESQq/YLTFj46c4nDhiKkq+5S7OzamhNS5FFX8f/W9djLRbIcmfDWTIbhz
         SuLjhgTRa/U1L7y68yAk8wj+GFWc1mU8ZSCI6r+2zCNJt3odrFrFoD+OofXzcZENp0fU
         ou9AQPiPBds4ayD9PkvUO6lJnBBubUA+SVYcNm9xn5yOCcgc2D4UUiJjMIuw0ZIA6qGQ
         i/jBLZqK1kO7zJOjRcqkFSHfaF8kmtDN6fZ5rJEpG4YP438znlCrHii4wAWpvsAT4uAu
         hj+uXTmorW8bTtVcxzivTdzymgQpGDtqEtqKhoXIuLBmh2fVGW8ySYOKcgWZenl8CQxX
         7ITw==
X-Gm-Message-State: AOAM531M8h5o/pFiRzC2liPlknrwJujp22W98c8+LrneUqXxHosqP19w
        tFvCP7p3DSXZhRdLUuFFT/EJsQ==
X-Google-Smtp-Source: ABdhPJyoz7We9E/K/HbiLH7uRNCn/0K2tMkzPEZdiv92j8yFvsEWmTTv7jYaaRZvjzCCMQprxSC2sA==
X-Received: by 2002:a9d:6752:: with SMTP id w18mr2554816otm.256.1606926982858;
        Wed, 02 Dec 2020 08:36:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm459554oof.16.2020.12.02.08.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:36:22 -0800 (PST)
Date:   Wed, 2 Dec 2020 10:36:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6
 devices
Message-ID: <X8fChCDbfLfdNoZL@builder.lan>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-6-caleb@connolly.tech>
 <20201122034709.GA95182@builder.lan>
 <72a37c8c-12e4-eb51-2644-3436d19cf314@connolly.tech>
 <20201202153949.GI874@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202153949.GI874@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed 02 Dec 09:39 CST 2020, Wolfram Sang wrote:

> 
> > >> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> > >> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> > >> +	    !of_machine_is_compatible("oneplus,oneplus6"))
> > > This hack seems to have been working around two separate issues. First
> > > with iommu active the GENI wrappers needs to have their stream mapping
> > > configured. Secondly there was a bug in the transaction setup that was
> > > recently fixed by Doug Anderson.
> > >
> > > So can you please give the following patch a go? I've yet to test it on
> > > the Lenovo machine, but I think it allows us to remove the quirk.
> > >
> > > https://lore.kernel.org/lkml/20201122034149.626045-1-bjorn.andersson@linaro.org/T/#u
> 
> Please don't top-post. I fixed it this time.
> 
> > It looks like I still have the same issue even with this patch applied.
> 
> So we still need your patch, am I reading correctly?
> 

With Doug's recent fixes in the DMA handling and the introduction of
proper iommu configuration, which Caleb tested [1], I think we're good
without this on the OnePlus. Caleb, please confirm.

If I understood Caleb's report he saw exactly the same problem that Lee
Jones did that lead to the workaround for the Lenovo Yoga C630, and with
the two changes the i2c-hid keyboard came up nicely on my Yoga. So I
posted [2].

[1] https://lore.kernel.org/linux-arm-msm/3ba39a64-122b-ebe9-04b3-3a23478334a4@connolly.tech/
[2] https://lore.kernel.org/linux-arm-msm/20201124185743.401946-1-bjorn.andersson@linaro.org/

Regards,
Bjorn
