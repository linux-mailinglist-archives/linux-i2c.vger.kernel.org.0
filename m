Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9B83C9856
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 07:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238919AbhGOF0v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 01:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhGOF0u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 01:26:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AE5C061762
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 22:23:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x25so7631345lfu.13
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 22:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gHi8C85J19Z/buybEtbR7DxC+/60ag6de4D5gu0A4s=;
        b=TfwneCGKNPpYSyMgTbwLjXIVq/VuCm7QkyuoeUAOKk34NKwSLSvfuumyE2Tn5vcnhf
         Tq1R1u4BlNAy4HcyQLVmse3G5iI9aKNHs5YBXdVGpV4jZggqG9W4piFHQgJwvptXZXSM
         A2bCx760it7lS+DmEQzq5Z1TBJaNGZgDHKdqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gHi8C85J19Z/buybEtbR7DxC+/60ag6de4D5gu0A4s=;
        b=PCSbWr13i1jH0+ZQYoOcMHCTu/h711QNEJgyctmEeHuQ5Jt2cOKukGjjmKMh+agHqQ
         Kk0TagtKNeCP5yP6kw6uS5O8bFHkxATj9XEiVqrgFD4TMIrj/RFpOJJ1gonf1/sclNWR
         oeFRjqVs1T8sBJiAfeAUp10eMXloTfqqFkB+dj+Q6E9HVIA9FKGcuW2kDepq4iSaeH6t
         1eqBK3zcK0HHf7AcpwRUIAVnAaAhFK0SQ4SkyigDYjE9RFNxQxICj7rc0YdGlJ33foE5
         rjMJYia7rAFzaiLfMRAabNnaD0ld3RjfM7p2K7wMKBMTZem2EeHRpMtbVdxptDSbR3ok
         GQKQ==
X-Gm-Message-State: AOAM532U228cEBzPl/nK1SzxZrgEzauaUdfNW5QEK4vQIdv0CUNqILpS
        NY7/RFGPG4EKLM3EXS65VBCoHFLv6pWHG0ag8k9W2Q==
X-Google-Smtp-Source: ABdhPJxyzZdXZbHnyDFU0e2E2xXXk9NuHsijUMcorMgs2GSg8C6hPxXb3FRaE5BAUxs943DBYUCs6RGDAffpPPVO4Cc=
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr1809482lfh.479.1626326635394;
 Wed, 14 Jul 2021 22:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com> <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 15 Jul 2021 13:23:44 +0800
Message-ID: <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
Subject: Re: [PATCH 3/8] i2c: mediatek: fixing the incorrect register offset
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
> the correct value.
>
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

This needs a fixes tag:

Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
