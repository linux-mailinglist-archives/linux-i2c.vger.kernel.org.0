Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FAB1E0E70
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 14:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390488AbgEYM2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 08:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390512AbgEYM2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 May 2020 08:28:52 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A098C05BD43
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 05:28:51 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d24so14838365eds.11
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4brhUMvajhqCMbsLZet6vC1Qy3ztqFVBNLV1y3fJ0Ok=;
        b=hnhOWAjqAv1GZGWkwmr90o7yeD20DdB7e42yX7ajg/ZCxiJyFkeAtysH96F8mWj0a5
         qEFDLtEu+h64FvqQnCfWlsaHd7VhN7vI5fg/UDW8ngyxV4/2boMBDLWOkkSzWgBV1vEH
         zAGhmm2uShjKSYCQN2/RgtBN47hewG1wCB47Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4brhUMvajhqCMbsLZet6vC1Qy3ztqFVBNLV1y3fJ0Ok=;
        b=peZiL9vxCIiGGxFf5VbzLv5qvCWvprL/D8+Zd4YuwUNfGcDivMVxHDv7HlKcwo23GI
         q3zNDCvSCg46EydhoDU+YqiFG1oRHIASpZPQEebQbFRKhbDGkt/CVV/b1lm03BTA5nsf
         ysi/wOTGc42Ci2WxE2zPkk3s8ui75Ef7r5PC17JBu1mif9cSfSc+9xiyzAqRxHPfKsli
         ifDqMD6EAN1tmxvvJTesUjeGbnnzpM6ewawsaf9qigNe0LT7F3lmqGJyD3lQrQhLH8Mj
         z4Hp77SG2pdWVQ/plW/K9N+MGbE+G6cEsB0Tzln8muS2ROAeQcmBVLIxr+i0kOA5RwQ/
         eHTw==
X-Gm-Message-State: AOAM5312JCdUBs2Zv5yeyqtW0xhC4mFPvR7K2EESHfbcwyJBvmmOuIoC
        Njai5inUTawcReYGlMrr7TkOjQvhvfvisA==
X-Google-Smtp-Source: ABdhPJz78/LCx8gc2It5yiSBFwROSe6RC8UTX9HnslEVM7grkE23bXVsmS8SPmDSh9Hxv/5f+2utBw==
X-Received: by 2002:a05:6402:1ca6:: with SMTP id cz6mr5705492edb.381.1590409729944;
        Mon, 25 May 2020 05:28:49 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id c23sm15326224ejm.116.2020.05.25.05.28.49
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 05:28:49 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id x6so3307534wrm.13
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 05:28:49 -0700 (PDT)
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr14649696wrw.17.1590409728561;
 Mon, 25 May 2020 05:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
 <20200522101327.13456-1-m.szyprowski@samsung.com> <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
In-Reply-To: <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 14:28:36 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Message-ID: <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: fix NULL pointer dereference in suspend/resume callbacks
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Fri, May 22, 2020 at 1:15 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi All,
>
> On 22.05.2020 12:13, Marek Szyprowski wrote:
> > Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
> > adapter") added generic suspend and resume functions for i2c devices.
> > Those functions unconditionally access an i2c_client structure assigned
> > to the given i2c device. However, there exist i2c devices in the system
> > without a valid i2c_client. Add the needed check before accessing the
> > i2c_client.
>
> Just one more comment. The devices without i2c_client structure are the
> i2c 'devices' associated with the respective i2c bus. They are visible
> in /sys:
>
> ls -l /sys/bus/i2c/devices/i2c-*
>
> I wonder if this patch has been ever tested with system suspend/resume,
> as those devices are always available in the system...

Sorry for the trouble and thanks a lot for the fix. We'll make sure to
do more thorough testing, including suspend/resume before relanding
this change.

Since the patch was reverted, can we squash your fix with the next
revision together with your Co-developed-by and Signed-off-by tags?

Best regards,
Tomasz
