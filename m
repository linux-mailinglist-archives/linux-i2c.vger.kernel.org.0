Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F5D26ACD2
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 21:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgIOS7P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 14:59:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727586AbgIOS66 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Sep 2020 14:58:58 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3727206A2;
        Tue, 15 Sep 2020 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600196337;
        bh=juSKAG7syOLlUYOT/UKl355JCRZZOGDkrasKdEEz39E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e2w5Hqi9JkBpUnlrN5XfE/k2m6h+fKQEj8q6iT8EZjet+xs78hLa9RwQzL8ocMMTV
         0IY43wpGOPpuARr9YTm8piLOmfRA5PTuA7ukhAyc+M2WIs1nQZ8d6Am6TUYKnzzQMY
         RueIR/ZYkX4ncjWgBfJrMGQ99j5Oz93RMrZ9u0F0=
Received: by mail-ot1-f44.google.com with SMTP id g10so4262340otq.9;
        Tue, 15 Sep 2020 11:58:57 -0700 (PDT)
X-Gm-Message-State: AOAM533m8fAlEL1ty8lM5dXFmilB7q2AEnHcM1rMK0V4V2D5wwgNV4N8
        K75ynTv1n3iN/DUkIYj1GbNkct12uirBSmWr1Q==
X-Google-Smtp-Source: ABdhPJwxLB1kpbhsA7tycgvi/wQZ1bmGZ7Ya81h12b8iMN2Ulxr/O/tPMFAVeA5YU7PbFFwr6ajyqH978MziIm2iLbU=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr12931310otp.107.1600196337137;
 Tue, 15 Sep 2020 11:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200904131152.17390-1-paul@crapouillou.net> <20200904131152.17390-3-paul@crapouillou.net>
 <20200914221230.GA349829@bogus> <CS2PGQ.I4UMQBYTB15I2@crapouillou.net>
 <CAL_JsqLUSZFf_3zgFrapc7vJETG9+XDTZPtD_yEBvi4GO3xPSA@mail.gmail.com> <EGJPGQ.QVHGTYQDQR872@crapouillou.net>
In-Reply-To: <EGJPGQ.QVHGTYQDQR872@crapouillou.net>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 15 Sep 2020 12:58:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+O7YD+WuABOMvWT-uyuDvt6L9wQmeFunR-z4RpXLFo2A@mail.gmail.com>
Message-ID: <CAL_Jsq+O7YD+WuABOMvWT-uyuDvt6L9wQmeFunR-z4RpXLFo2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 15, 2020 at 10:07 AM Paul Cercueil <paul@crapouillou.net> wrote=
:
>
>
>
> Le mar. 15 sept. 2020 =C3=A0 10:03, Rob Herring <robh@kernel.org> a =C3=
=A9crit :
> > On Tue, Sep 15, 2020 at 4:07 AM Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >>
> >>  Hi Rob,
> >>
> >>  Le lun. 14 sept. 2020 =C3=A0 16:12, Rob Herring <robh@kernel.org> a
> >> =C3=A9crit :
> >>  > On Fri, Sep 04, 2020 at 03:11:52PM +0200, Paul Cercueil wrote:
> >>  >>  CONFIG_OF is selected by CONFIG_MACH_INGENIC, therefore we don't
> >>  >> need to
> >>  >>  handle the case where Device Tree is not supported.
> >>  >
> >>  > What about COMPILE_TEST? If not supported, why not?
> >>
> >>  What about it? It will still compile fine with COMPILE_TEST.
> >
> > CONFIG_OF could be disabled in that case, so the above reasoning
> > doesn't hold.
> >
>
> CONFIG_OF can be disabled in that case, correct, but why should we
> care? The driver will still compile fine.

Indeed, because jz4780_i2c_of_matches isn't within a CONFIG_OF ifdef
as is sometimes done and is when you need of_match_ptr(). IMO, the
commit msg should have something like "The driver is only used with
CONFIG_OF enabled, so of_match_ptr() is not necessary.
jz4780_i2c_of_matches is always defined."

Rob
