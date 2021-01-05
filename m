Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23482EA33F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 03:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727713AbhAECOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 21:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbhAECOr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jan 2021 21:14:47 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EB9C061796;
        Mon,  4 Jan 2021 18:14:06 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id e25so1011904wme.0;
        Mon, 04 Jan 2021 18:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=40GzxaNwwxkSMXNQB32SQeWYrAuv6Ok0Sq4KbJWmJx0=;
        b=FRUF0l+vR9KEZSQ3HiGDCOVCU4krSX8z/glTCByHV8Z0LBB6YIMcbAfJWVfq75fk9U
         TEZ7a6QLKbyfjzERg4FeFiXuZ+tBsODetU3AP2n64qi8/wotrsGMSs5wTkuLtLD6470n
         lAAVFVS//BnCNtAtjc4G2XlyWJdE0c4DQuN4Hstoq489QHvNpIMTj7EwWib9OLaGL6Yn
         aOD8Fz72/v3pTDN7+A6YfQB0VwVPYGqyUJl3EBEaGkGVMMMcW2QivAmWsMXUzz5Eu5y8
         NKPeqTNUkvq3vhC2NHWhSvX6XKZTGkChavi/+iQSvn8rQDpgmjXxeBg7Ay6IC1i9PHGs
         cE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=40GzxaNwwxkSMXNQB32SQeWYrAuv6Ok0Sq4KbJWmJx0=;
        b=YYmtPTolBFCZNdUlEBPYWiqvvzm9a9JMRtHhDLMzBz8gENKQTdyxbodG6qqHb//QOb
         XxGT1ZPewSNE/6fODQWI2eAvpM1KR0HqjYU1hAqQV6U+J8SX6UYz/hC1EPm/0iX+Zmsl
         qfmtD1RJlI8gliZS5K3+MGCzpWrRdkPY4WwJectq5mEEU9OttGDeONAMDs1yQRtfrdT9
         bWhHox16hj0LYM9Flo5+fEeWgEsleZ8/e52e6P/bHsaL8AHbh4SERCzOiiYZkO7JgEGN
         YGvVQ7DnTV5G/SJ0Pnu2FuIXqtefjNod4E5TaHVnrbhA0K5NkDyKjM9LIQ9GrAmGZwlD
         fC2g==
X-Gm-Message-State: AOAM533JbEPJirIfoUtpgm1eXfo4EaeOlyJatD1Kf6TZORL2hy+W26De
        ouoCsNob3cIapT4zzns26gaucC/Hn+u2BRmspCRQxlr+
X-Google-Smtp-Source: ABdhPJzrQvjv+X0my5Z8aP3SiM0nbGWCeKhFNCrEJp/qhHsPnZe2xNZeP4GfvVxeDu2S4z5qSzwqiKpg/42fbjzvZf8=
X-Received: by 2002:a1c:2646:: with SMTP id m67mr1352850wmm.81.1609812845558;
 Mon, 04 Jan 2021 18:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20201214045850.1026293-1-zhang.lyra@gmail.com> <20210104182353.GA935@ninjato>
In-Reply-To: <20210104182353.GA935@ninjato>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 5 Jan 2021 10:13:29 +0800
Message-ID: <CAAfSe-t-J3ckbwKjNuRpcm0wq7gme7YFG7fiHqLHk-Pu44jwZQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: sprd: use a specific timeout to avoid system hang
 up issue
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 5 Jan 2021 at 02:24, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Mon, Dec 14, 2020 at 12:58:50PM +0800, Chunyan Zhang wrote:
> > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> >
> > If the i2c device SCL bus being pulled up due to some exception before
> > message transfer done, the system cannot receive the completing interrupt
> > signal any more, it would not exit waiting loop until MAX_SCHEDULE_TIMEOUT
> > jiffies eclipse, that would make the system seemed hang up. To avoid that
> > happen, this patch adds a specific timeout for message transfer.
> >
> > Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> > Signed-off-by: Linhua Xu <linhua.xu@unisoc.com>
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
>
> Took the liberty to change the errno to ETIMEDOUT and applied to
> for-current, thanks!

Thanks!

Chunyan

>
