Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B8328EB0D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 04:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbgJOCTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 22:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgJOCTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 22:19:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED28C0251BD
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 16:51:48 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d6so533057plo.13
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 16:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=uBbZr11mw4WidmSmEPUV+Rv91ZWFoxwir4BwBeo4XdE=;
        b=OhsUUZulx04+NPqHFKh4cNVOb6COSfzza1sKYEUQMT55OJT7N737cRgfdJ2Fu+hx9g
         aVZ4iQwfX2sJoiXroqbXk1NYAQB9p2Tk4GL2zUN1741GWx7sVtTud9MfUivD5oi8oJgI
         alf9XroK/wVoyDxL8HBgUfjRcr4wgaN6cel8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=uBbZr11mw4WidmSmEPUV+Rv91ZWFoxwir4BwBeo4XdE=;
        b=PqS5EnqWgryK5TemHLTQh4O6nq6ygkJOGPAkUWINAN2FaH2axvQ+47Lt7uDWQiJJLx
         zJjabR8bX2fLLI6FO+cObJfk9FVDvl7zZkuJucMMmalysPzELs2PBRirsLTZk9/MKuoM
         Q0mTk+lGgpgxDNq9gXidUUzgwJnCqBLdUHX28CtcjJTQS+KFNTYm6xejnJV2CzH7L2qQ
         NLwKkEBDa9swYYQzhQp4on3y63DEuQr0dqneF3XswSUFJdWDvZmnzg/jlVzOvj33BPkQ
         TO5bylNdxa24vLQT4OXl4bI3f2J2XOfu6auai1qbdq87wiZlzPTDMxzXjvoE2pR/bJVt
         1ewA==
X-Gm-Message-State: AOAM5306F3qKy8QMOXTMMU3KCsg/anNs83EtW34zaODdfaQIFq0NcoGh
        oe1ibkIOVIa42H0hz7TEIHDpY+57mrP/Gg==
X-Google-Smtp-Source: ABdhPJzrEn4DONFMaK+L5v+LMEvQtiviIAXWfq6jfI7v/ttFoOfNReKX37l5T1VEPqLj/GhS9KezWw==
X-Received: by 2002:a17:90b:4b08:: with SMTP id lx8mr1572130pjb.211.1602719507766;
        Wed, 14 Oct 2020 16:51:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z21sm782070pfr.43.2020.10.14.16.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:51:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201013142448.v2.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid>
References: <20201013212531.428538-1-dianders@chromium.org> <20201013142448.v2.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid>
Subject: Re: [PATCH v2 3/3] soc: qcom: geni: Optimize/comment select fifo/dma mode
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
To:     Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Date:   Wed, 14 Oct 2020 16:51:45 -0700
Message-ID: <160271950551.884498.16923971197445593875@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Douglas Anderson (2020-10-13 14:25:30)
> The functions geni_se_select_fifo_mode() and
> geni_se_select_fifo_mode() are a little funny.  They read/write a
> bunch of memory mapped registers even if they don't change or aren't
> relevant for the current protocol.  Let's make them a little more
> sane.  We'll also add a comment explaining why we don't do some of the
> operations for UART.
>=20
> NOTE: there is no evidence at all that this makes any performance
> difference and it fixes no bugs.  However, it seems (to me) like it
> makes the functions a little easier to understand.  Decreasing the
> amount of times we read/write memory mapped registers is also nice,
> even if we are using "relaxed" variants.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
