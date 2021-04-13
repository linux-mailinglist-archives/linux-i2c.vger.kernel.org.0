Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A985835E018
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345991AbhDMNbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 09:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244372AbhDMNbk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 09:31:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053EDC061574;
        Tue, 13 Apr 2021 06:31:21 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so1315128pjb.1;
        Tue, 13 Apr 2021 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=d7SRXKUibZnzq89IaQCUmAaqMQMd1BaYf0mdT/6jAuE=;
        b=U8UScOzphX7puk41TCEETPpWsABtZ5rLCl4xQRXAfsIj3/n1ovZDFMuenMmxNIi1R5
         Cscx/azsm/2eHDBGtc7z0hehI9xv+H0bHBLxjuks+echsiYT1fuCWZyqO774YAh6Z7Wk
         iyEfXA5lBbGcizhjtPcCcyip/6Ox7gFVXTl6L+NCDSmFlrpnJjEzEEz8gnFwMeM14Tdd
         Q1Fk49G7DdNG/tmMXkyR0MtoSPFE9N7MEvbzjIC1O7mV8Gh4uLtGN2jKQcuf1QnvrLNE
         o2h/uxELUxRsTUKjQhBvoWLiHMt1yU1j6ifnrzIJrppXiEtQ6OT9S7KZ3mI84qLdgHDs
         hscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=d7SRXKUibZnzq89IaQCUmAaqMQMd1BaYf0mdT/6jAuE=;
        b=TndQV0EOJbSv1JS854hZJaGwWvcExEd9+iRjHifjQWM9X1MtTz2oqZvSOSXnhxDcIW
         rVWzPzvvQKaVNjrPo4oQ9sIkcoYx4X7ihIz1jWtfFHKxqAcknvNyV6BZr/zh11jDtoIS
         QKc85es85PJfGajPAvVYadiaNf8/eT9eaTXa0aV1h8sktOvOM1KmYQHM+ZD/vgISC7fg
         L6Pyd8TjfCS5KSMwEtfMAvHF/cRga8qlSDNfsFBlZaEMLgxBwv2OMtoj29Lcebn8bRMC
         nDv/iYAyFHHVFHVtWvkWJSQcUKCWLADT5XtCd+EBXvlVVyUhIN/FUf4wgwwofV79iWz4
         eCvg==
X-Gm-Message-State: AOAM533sgPXXqneEbmYeBhArVEk0I1iydsWsYN0et89M4h19S4VwL80q
        sd0J6x6ucge7hUoCk/eb2Gaf5UJM3vz1DLRzI+4=
X-Google-Smtp-Source: ABdhPJx7FxH6uqlmf25h5hK4pxDbP8u10JEmEMGB4/q15d7A49uIxtX1MpuN695kLSWt4OTh3XLGXvcL2+b42PBRPi4=
X-Received: by 2002:a17:90b:1e0a:: with SMTP id pg10mr19032pjb.129.1618320680551;
 Tue, 13 Apr 2021 06:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-2-chris.packham@alliedtelesis.co.nz> <20210413122113.GB1553@kunai>
In-Reply-To: <20210413122113.GB1553@kunai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 16:31:04 +0300
Message-ID: <CAHp75Vc0F7zm47h94Pnh-dZJXG770UwR9za+GQP0eCr78qPgtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] i2c: mpc: use device managed APIs
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 3:21 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> >       Yongjun[1] into the original patch. If Wei's patch is applied on top
> >       of whats already in i2c/for-next then this patch can be ignored.
>
> I applied Wei's patch instead. It was easier.

Where is it? i2c/for-next shows the v2 of this series being applied.

-- 
With Best Regards,
Andy Shevchenko
