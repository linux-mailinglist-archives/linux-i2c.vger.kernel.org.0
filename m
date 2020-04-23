Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9675E1B5839
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Apr 2020 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgDWJbR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Apr 2020 05:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgDWJbQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Apr 2020 05:31:16 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3660C02C444
        for <linux-i2c@vger.kernel.org>; Thu, 23 Apr 2020 02:31:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 188so5659387wmc.2
        for <linux-i2c@vger.kernel.org>; Thu, 23 Apr 2020 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O26z6wOk23INqulcDtAkwlfLrc079plGrt7LpzYNlIM=;
        b=r2VXwUE9Svk3QiEBGBKAWJ8Cm5d65tBjhNru6zO9YbS+FD8b1nlIRR1fG26t5GxpFk
         FJ8QWdlgJVHqPw5m4NSaWw29OStIwP298O3wnZ+Y7YfDnmo7Wu0jwAHlrNsENex6RpKa
         OG2iKzQnglKldPkctBNoK1foc0IdklQ/7f6Pe3AvoTCUEKQeR8HCJR+D/LVVB4eC//bC
         HAwjmbpaoEBsuIi8mUfNEWYu/GQrNrb2TiUJWi/kaY+7OP0RL2GqQdnQKIYmjk3R6MzR
         MMLRo4yNCT38fmrGxw5FQcMNbmBJN3e+y5sdszlEu/59Mpsu0cP0MRBFb2CkVSq1S1o2
         0Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O26z6wOk23INqulcDtAkwlfLrc079plGrt7LpzYNlIM=;
        b=Hmp4VxaJJlnxsppdmNYjaSdBU8MB9H2+sPtCj5DADFRwO38JFMtuYfofCzHYYQGdEP
         4GBY7kteak5i/eGIrR1D3yJy0mtWa4w9SuZVt3VaBroUWP8LkUGKSPGXRdwdq++vOVgE
         U1kMSI2TFtRAiqiqk7rEgSDqd6FpnBV1Z9ye7l+MGGJaXcQVtp7XPCRjAQ5kLoeARJ3U
         fTm+fHWac9LsXhAQnYeAjtOlrjPBbeFLa40XLozQsnSik79ORRdlg13WIsOjVToskTOj
         Tck6mi+ulJVfMmQL5od5F9UOsb1XlpR123Z7NdtvB2imQTTrmBuZ1vrh7sn8vdINe+6P
         AsPQ==
X-Gm-Message-State: AGi0PuZU0Z8j9e2wePcnjhBJw0q+iKRadVESoQj2vJ5eul54ENQOfzTu
        gsXebDrH8bWi+8VcjBl23CFx2g==
X-Google-Smtp-Source: APiQypKq50R8cweRl+GxccEmBu6i9qOFRnn+sD3w+viq7DNxgjg+A6RewEEgPj/G9AjZ5NSRpoz1Sg==
X-Received: by 2002:a1c:ac44:: with SMTP id v65mr3192173wme.33.1587634273995;
        Thu, 23 Apr 2020 02:31:13 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id o7sm2703512wmh.46.2020.04.23.02.31.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Apr 2020 02:31:13 -0700 (PDT)
Subject: Re: [PATCH V4 2/9] interconnect: Set peak requirement as twice of
 average
To:     Akash Asthana <akashast@codeaurora.org>, broonie@kernel.org
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        Linux PM list <linux-pm@vger.kernel.org>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-3-git-send-email-akashast@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <58b91dc1-6ce3-49b8-88c8-259be9af1dbd@linaro.org>
Date:   Thu, 23 Apr 2020 12:31:11 +0300
MIME-Version: 1.0
In-Reply-To: <1586946198-13912-3-git-send-email-akashast@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On 4/15/20 13:23, Akash Asthana wrote:
> Lot of ICC clients are not aware of their actual peak requirement,
> most commonly they tend to guess their peak requirement as
> (some factor) * avg_bw.
> 
> Centralize random peak guess as twice of average, out into the core
> to maintain consistency across the clients. Client can always
> override this setting if they got a better idea.

I am still not convinced that this is a good idea. If the factor is a random
value, then i think that the default factor should be 1.

According to your previous reply, it seems that from geni we are requesting
double peak bandwidth to compensate for other clients which are not requesting
bandwidth for themselves. IMO, this is a bit hacky.

Instead of requesting double peak bandwidth, IIUC the correct thing to do here
is to request peak_bw = avg_bw for geni. And instead of trying to compensate for
other clients "stealing" bandwidth, can't we make these clients vote for their
own bandwidth? Or if they really can't, this should be handled elsewhere - maybe
in the interconnect platform driver we can reserve some amount of minimum
bandwidth for such cases?

Thanks,
Georgi
