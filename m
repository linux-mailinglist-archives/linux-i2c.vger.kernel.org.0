Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EFD1223F3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 06:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfLQFlp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 00:41:45 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44844 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfLQFlp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 00:41:45 -0500
Received: by mail-ed1-f65.google.com with SMTP id bx28so3846838edb.11
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 21:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pBEQ27rUPB5Ji325yzVtRJwNpSWsHvdv/pG0UUzVVvw=;
        b=HM3fZp9vKp8JOjdG7QdxKZHs4JSAhtiaJkhlgOcs9mpn2hYmjqt77ZlIPjUFVwWiK8
         Xiae6uCwAzFbblPtokhp3F/KbrJaFM0TNkBYS7JEFWjn0QLKktPm4UbxUiaVnr4EtQmS
         Wm0whp4IkaZCbpeW6GHMRjmPx5/em1qSXtusA42o7mQn2dl3cXqDuNFAr/jI5ePoJjg8
         lh6lk2jdjCL4jmpd6oA/w6oPU2Hl7kkZoDGMrJ3VfM0JrJa70vTwjHavvDmNtwAxKsZx
         sS/VDzq5C3F2rJ/XFT+eVaJDzyoHDYxmiVaO72iElog8S+6BCrwK3m/kfhl9/5SKdsDj
         h+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pBEQ27rUPB5Ji325yzVtRJwNpSWsHvdv/pG0UUzVVvw=;
        b=jJzVLH4GNgpysOP15mvT8JcqXeXs6aCE5glXPUpTpsTHI2iFqte3vUmg+SgbDxuUyd
         beYfpKNKRU/+kK7t63JGJAgS9Hh7xm0o12O9yoH/1GEkOicPwEcuvMHbu6zIxW+pB0m8
         B0NIKXuvp0kFs6Dt1VxY5QNNswh038In6LF90j86La64fUk1/Q6fSlSMjY6A9JmwpKQb
         5eBs0nmtxjMXt+vXrkKEAty5tOxZIWZc2DjPE1Zr1Bpf6UwIUzYuUjV8R52EOb5vsF7o
         d5J/Yw2+GYlvmVRhgmKn6S9vrjyajGUZ+aZzOuzhogZsEEeCiUeV56LY6vj2j9fu1FWv
         dekg==
X-Gm-Message-State: APjAAAUfpUv2c+ZMTZGaKmCQayh2Ot0o8PNo9rrLAPzfVuvVqNJ7ynQO
        p/TdmreKQ9XtJ0nC5cr/tpsRDwvQuI+n0MKRazc=
X-Google-Smtp-Source: APXvYqwMoMibDqrnBBLdFBlqoyXkIi7+yhcQYvKuMjQ+wFwuyvc8Nq0/66W5ZtGzMS61ync+lWEAT2pRvycydfZ6uFg=
X-Received: by 2002:a17:906:a394:: with SMTP id k20mr3089647ejz.216.1576561303142;
 Mon, 16 Dec 2019 21:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20180416012248.25891-1-amworsley@gmail.com> <20180416012248.25891-2-amworsley@gmail.com>
In-Reply-To: <20180416012248.25891-2-amworsley@gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Tue, 17 Dec 2019 11:11:31 +0530
Message-ID: <CAKfKVtFmGmef1AwK9XKccZDP0f+gCjNfmAhFpPcCObeuKvbU+w@mail.gmail.com>
Subject: Re: [PATCH] Further cadence i2c buffer overrun fixes
To:     Andrew Worsley <amworsley@gmail.com>
Cc:     harinik@xilinx.com, APANDEY@xilinx.com, asarkar@xilinx.com,
        =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

On Mon, Apr 16, 2018 at 6:55 AM Andrew Worsley <amworsley@gmail.com> wrote:
>
> After this set of changes ran over 2 days 17 hours with no i2c failures
> at 200kHz.
Can you explain this speed why you need it.
why not the standard ones.

>  Previously would lock up with BA (Bus Active) bit set
> continously with in a few hours
>
