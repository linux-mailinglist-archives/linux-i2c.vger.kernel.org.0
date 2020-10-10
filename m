Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71803289CBB
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 02:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgJJA3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 20:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729049AbgJJA0p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 20:26:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C93C0613D2
        for <linux-i2c@vger.kernel.org>; Fri,  9 Oct 2020 17:26:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q123so8247477pfb.0
        for <linux-i2c@vger.kernel.org>; Fri, 09 Oct 2020 17:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=931+7FHZXAAV0rm1idrhZ1WwOql8Y19KgPOMFI4H7xQ=;
        b=EMKUv+0Yt3Tdmuj9FPYqLLkhAnTXo8ttooKPYhl5WbecohuCJPwMsZ9bHTvp0gPCTz
         QnVDkw6cef84BxPu/4TZW2RN9hfCYB3fViNggPvllqAcfI3se+HZBmA53wow3R7sTJ+V
         jHKxfWJiQizpDyF4tHwNhrHI6HfiIIn91SBg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=931+7FHZXAAV0rm1idrhZ1WwOql8Y19KgPOMFI4H7xQ=;
        b=lYpkQahrLTmp7o6fB452+qWOWkWa+0liuFEIpQlJG98mIzMKtsETOeKcmCTdVKKqOR
         pVg9u5rSstyaQ6lIP0kKZ7nV8t85wRO/Qf5s9LOho0vE69lnjtqknXJ5PCFkqQKWqfI1
         SnE6W1kmx8mBX+MYc9O8k4sRTC+FMyiyNFuWdywXr0el29W/cFabniyoNBqU6luhdd10
         RDTFOzEeR6vvgdz8EugH8EEt17/ld7nbNtFXsjmQQJIV2JShZNmL5vgYbAs7UA+VrwEh
         iItBlYY+zdKLRoRqKiDSprcj9u4La51mT9D5lyGrSjAFn2zIew/AszAyZrsLSUTjrEe/
         K1JQ==
X-Gm-Message-State: AOAM531kdrxptxEzaypyZ2UYXwJ2zTaa2xKfUeeWbtdkTJv+zbVtleuR
        a4q8SSgT9TPb/E5RzX1uYKmt0Q==
X-Google-Smtp-Source: ABdhPJxCNtNYBWgGnGMesDhbQSNpl7RdGdCmB5U0BdvhbWAVdok6SHme4WK0I4s6nm+x5MhGrLxDqg==
X-Received: by 2002:a62:bd05:0:b029:142:2501:3a02 with SMTP id a5-20020a62bd050000b029014225013a02mr13726318pff.81.1602289600806;
        Fri, 09 Oct 2020 17:26:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 8sm4556029pge.7.2020.10.09.17.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 17:26:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
References: <20201008225235.2035820-1-dianders@chromium.org>
Subject: Re: [PATCH 0/3] i2c: i2c-qcom-geni: More properly fix the DMA race
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Date:   Fri, 09 Oct 2020 17:26:37 -0700
Message-ID: <160228959768.310579.3696247619283748151@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Roja

Quoting Douglas Anderson (2020-10-08 15:52:32)
> Previously I landed commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA
> transfer race") to fix a race we were seeing.  While that most
> definitely fixed the race we were seeing, it looks like it causes
> problems in the TX path, which we didn't stress test until we started
> trying to update firmware on devices.
>=20
> Let's revert that patch and try another way: fix the original problem
> by disabling the interrupts that aren't relevant to DMA transfers.
> Now we can stress both TX and RX cases and see no problems.  I also
> can't find any place to put an msleep() that causes problems anymore.
>=20
> Since this problem only affects i2c, I'm hoping for an Ack from Bjorn
> and then all these patches can go through the i2c tree.  However, if
> maintainers want to work a different way out to land that's OK too.
>=20
> NOTE: the 3rd patch in the series could certianly be squashed with
> patch #1 or I could re-order / rejigger.  To me it seemed like a good
> idea to first fix the probelm (and make the two functions as much of
> an inverse as possible) and later try to clean things up.  Yell if you
> want something different.
>=20
>=20
> Douglas Anderson (3):
>   soc: qcom: geni: More properly switch to DMA mode
>   Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
>   soc: qcom: geni: Optimize select fifo/dma mode
>=20
>  drivers/i2c/busses/i2c-qcom-geni.c |  6 ++--
>  drivers/soc/qcom/qcom-geni-se.c    | 47 ++++++++++++++++++++----------
>  2 files changed, 34 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.28.0.1011.ga647a8990f-goog
>
