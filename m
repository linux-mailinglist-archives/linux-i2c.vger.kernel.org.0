Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C35E38ADC6
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbhETMQO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbhETMQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:16:07 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3F4C00366D
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 03:56:43 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id k16so16099302ios.10
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZggdLxEioYSmHsAN6HdiHwkaCdjjLY0f9eAD0updRrw=;
        b=gwOq7/3pH8V/2gE94ERMNXP3mpo89c0EaBoRdYiv3gQh0NZ5AsxXUlDYWYADOZtuiZ
         AlzMofkhhVaVjJ70OpmgP0FVwr7nsJnfFINio4WNaXSn3f5ULLZUP3fRrz6qWMb+4xnr
         7+bOE3u0k24UY8a0FiD3P94RywWnjtlyjXWaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZggdLxEioYSmHsAN6HdiHwkaCdjjLY0f9eAD0updRrw=;
        b=psXL1/OhiYlhkIyxxLY0QYjDD84/OJ68Bp3i/o5C5C2mWL5ccqL9iPb/59TsEn0wJs
         PU5KrnzZRQKtbHqL1jCpWQBlTrSWHTs3QJYaDGCW9uQTtkgZWnoqA5wwssCxP64/VvHS
         GSOUelYt7D2fOGIJgPkTPg2qns9IYSeTuHNyN7oKV60vRHkUJu5xVXYOKqs+oicB0MkZ
         nwWTbhtvFHdYJVngIunBDUl72HoQwtLnpOq9dbzkdfBuC9Le7KRfx5sV9vQDyNGGEGFF
         42W+LTwV+bWcMPG8Ma16x1qHr5mdsY+ZIg5y+Sr+Vo+RwDYl8wVGTwzkh/PL/H1tKYiH
         hFQA==
X-Gm-Message-State: AOAM533pj9E/NlxzEKvn5Ij6fa2nR3ToPbkOwDtw0N0h3w+DsJyBKbMN
        r+PR/o99rYpLephD1tM8LAJbcFpd4NvjRocmiscBIQ==
X-Google-Smtp-Source: ABdhPJwsRXryrVBLrnfEAhDRXkJWRvO5y68qKTU37qReKB6ekDFRs2lFm7STxXVQpa9ZsaRZSseo6EjW/Uv6Q9RgDH0=
X-Received: by 2002:a5e:c742:: with SMTP id g2mr4887060iop.40.1621508202940;
 Thu, 20 May 2021 03:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210507131406.2224177-1-hsinyi@chromium.org>
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 20 May 2021 18:56:16 +0800
Message-ID: <CAJMQK-is=wOWGL-bETEcp=shcnrGdWFh4FbzHWCTEYjg-Zk0Dw@mail.gmail.com>
Subject: Re: [PATCH v21 0/5] add power control in i2c
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 7, 2021 at 9:14 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Although in the most platforms, the power of eeprom
> and i2c are alway on, some platforms disable the
> eeprom and i2c power in order to meet low power request.
>
> This patch add the pm_runtime ops to control power to
> support all platforms.
>

Hi maintainers,

Gentle ping on the thread. (the 4th patch is already picked) Thanks.

> Changes since v20:
>  - fix regulator check logic in suspend/resume.
>
> Changes since v19:
>  - resend v19 with fix tag added.
>
> Changes since v18:
>  - Fix a function name conflict with drivers/gpu/drm/i915/selftests/i915_gem.c
>
> Changes since v17:
>  - Add a patch to fix unbalanced regulator disabling.
>  - Add dts patch.
>
> Changes since v16:
>  - request regulator in device instead of in the core.
>  - control regulator only if it's provided.
>
> Changes since v15:
>  - Squash the fix[1] for v15.
> [1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/
>
> Changes since v14:
>  - change the return value in normal condition
>  - access the variable after NULL pointer checking
>  - add ack tag
>
> Changes since v13:
>  - fixup some logic error
>
> Changes since v12:
>  - rebase onto v5.7-rc1
>  - change the property description in binding
>
> Changes since v11:
>  - use suspend_late/resume_early instead of suspend/resume
>  - rebase onto v5.6-rc1
>
> Changes since v10:
>  - fixup some worng codes
>
> Changes since v9:
>  - fixup build error
>  - remove redundant code
>
> Changes since v8:
>  - fixup some wrong code
>  - remove redundant message
>
> [... snip ...]
>
>
> Bibby Hsieh (1):
>   i2c: core: support bus regulator controlling in adapter
>
> Hsin-Yi Wang (4):
>   dt-binding: i2c: mt65xx: add vbus-supply property
>   i2c: mediatek: mt65xx: add optional vbus-supply
>   misc: eeprom: at24: check suspend status before disable regulator
>   arm64: dts: mt8183: add supply name for eeprom
>
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
>  drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
>  drivers/i2c/i2c-core-base.c                   | 95 +++++++++++++++++++
>  drivers/misc/eeprom/at24.c                    |  6 +-
>  include/linux/i2c.h                           |  2 +
>  8 files changed, 121 insertions(+), 2 deletions(-)
>
> --
> 2.31.1.607.g51e8a6a459-goog
>
