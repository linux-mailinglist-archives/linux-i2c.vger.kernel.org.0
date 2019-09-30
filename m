Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F99BC2AD3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 01:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732405AbfI3X1P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 19:27:15 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45578 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732394AbfI3X1O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Sep 2019 19:27:14 -0400
Received: by mail-qt1-f194.google.com with SMTP id c21so19240782qtj.12
        for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2019 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pl9Uoj87Ji8fhmMmVA6l1LGr0jFQ4KuWKIrFbIh3wWY=;
        b=NAWE7s0qtdMAJiZamX3V6xokEA3BihpvGiwij4I9RhrSrs1/+NcFnC19kIYC2+VXm+
         mw4JB/DlOtISetTBRNDx9DFrMSVyR1OwEHYcnM7fyiodpHUy35LKFF+/IykPa/76nTNi
         oq4scSmcMmXkNJXm9at4/0G+We9rQDvDXAya0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pl9Uoj87Ji8fhmMmVA6l1LGr0jFQ4KuWKIrFbIh3wWY=;
        b=gya+G+Lo9iXo+TZi3ELqS576T5+KB5Ur33ItSVscS1+iEtlOibDG64T60cCFd7TUnb
         ZlWMDCr4D1N3D9NniQbY1rKyeMbRQjEWrk4/rscJ4T4Dbz/N/Wk4VV4Letdvv+1SFWCt
         AOUNEjBvLxdx+xtpYj3xPOnMBAcdYSevbXZJu2gz7qbCe5+1/Dp9nQVTnobUmcM4NgPU
         GC1lRGklAKIZuWoIByPONtHs9nfmF1rXrGxIgBBwgn1WtEh2jXE02Mu6yylygN80sBZq
         h5n05WtkgkNiuIntRfQT/iGu0in2Gplwyw0if2Dpbm9m/OydTJ1DB3lmEGCPH1zv01b+
         BaYg==
X-Gm-Message-State: APjAAAUXNCMGbCoUwrUAcNgF1doBRU1c4GNDrTX2GlMdcccxD1d3hfIZ
        bdSQQLkKSqucFIOh0Gpp9pGh6l1G1USPPzNqVo42AA==
X-Google-Smtp-Source: APXvYqzPlXIhfWnlF8sLl3jj8HRowIb8xLOPox6pz/DpeJE7rRAz9Qj8GEZSq7zX8V31/1SFTHD3X0AT7ZutVfrWEtc=
X-Received: by 2002:a05:6214:11b4:: with SMTP id u20mr20478355qvv.200.1569886032025;
 Mon, 30 Sep 2019 16:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190930152846.5062-1-fparent@baylibre.com> <aa0487c21e1f9f04402f209358b18c75@kernel.wtf>
In-Reply-To: <aa0487c21e1f9f04402f209358b18c75@kernel.wtf>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 30 Sep 2019 16:26:46 -0700
Message-ID: <CAJMQK-g_PaNsfvX-H4_BA86aUOdyqpDt9oK86O7_mRWTjWSjHQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-mt65xx: fix NULL ptr dereference
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-i2c@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 30, 2019 at 2:20 PM Cengiz Can <cengiz@kernel.wtf> wrote:
>
> On 2019-09-30 18:28, Fabien Parent wrote:
> > Fixes: abf4923e97c3 ("i2c: mediatek: disable zero-length transfers for
> > mt8183")
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
>
> Reviewed-by: Cengiz Can <cengiz@kernel.wtf>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

Thanks!
