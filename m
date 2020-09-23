Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CF127542A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 11:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWJPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 05:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgIWJPP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 05:15:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37036C0613CE
        for <linux-i2c@vger.kernel.org>; Wed, 23 Sep 2020 02:15:15 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so26798790eja.2
        for <linux-i2c@vger.kernel.org>; Wed, 23 Sep 2020 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+orPivdtkIhi2/+DCsb0aHIGGKlk58BwIbkL2c8OXE=;
        b=b0cXVGoWMxMSjUmBe73Ir2VHt6b6HeMPDg9ITy0nlxfvt+nfGcH6ULy6Yfb05m6b9R
         V7rNup5xQ3sHSRcvEltzMhS6dOBGwvW/+7FubHmwPSGMBsGqxrgqfupptvgSd7409oAN
         QZY79fEXqt7oCMUbZCHSIRvumBxJL29lx7PwwXwwe9qMuHH5rSnovTKOYkIShJu3UJ/C
         8WVW+4VDlIIEidOrZ+tF0Lk63N0VOs01IcgypBeVllQBiGD/8vzr1WUjUR1iwBHiaA5E
         Gvdw7QsBb0+YP7PYOawpRUn0KcWC05Nrbw+UNV0pv99XG7TzaMzP82cs2lnYm3EfpGAO
         pBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+orPivdtkIhi2/+DCsb0aHIGGKlk58BwIbkL2c8OXE=;
        b=L4QwoDzChAoMa3oF8pHCnNecZTMloW00kB3LHyZVpnIRfkFWqL8i2iuyIbqXbk+EQo
         MM4KqjJpSWQG3Lc1gJsVhB614gSR6uOlT2vb4nCquyoqoiViIo1jqBgPFscYbdROFiBe
         w+JjSpjczTgZOyFYqbBlM/A5lqlZpPpGMcweabmnO1mn9/CovcilJQra3JWDz2rVrYBc
         vdnHJYEqOdtmpol6LpbQZvLd7uRcOuCC6AiyV5Ksyy/2l9RxVlwa4djuhkrVpSa9ySRQ
         xgFRSsCGnn5Lc70DOW+QV9Dx99lkW+W75HBUAPYvG94OdF0KBC+JJ+5hEEIzt0mJPuL8
         qkgw==
X-Gm-Message-State: AOAM5327cNBes7rXj6ruYc7AKSVPfXgrlaiDjBE6ZagBAoOkxBggH2Uy
        TLcyfFm+4PUuMvh6THgTPBuO1OcmZPpMAxtSqlITMA==
X-Google-Smtp-Source: ABdhPJxsj1SgC5CPIZrwIKGez9btT0ZoBj+Syo+tSKXy5WrWFEci2o5Lpgfk6iCFKLomUXGGSKtqoLQ5WAlzeul68PU=
X-Received: by 2002:a17:906:7489:: with SMTP id e9mr9120634ejl.154.1600852513787;
 Wed, 23 Sep 2020 02:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094952.458003-1-jonathanh@nvidia.com>
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 23 Sep 2020 11:15:03 +0200
Message-ID: <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
Subject: Re: [PATCH V2 0/5] Add support for custom names for AT24 EEPROMs
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> For platforms that have multiple boards and hence have multiple EEPROMs
> for identifying the different boards, it is useful to label the EEPROMs
> in device-tree so that they can be easily identified. For example, MAC
> address information is stored in the EEPROM on the processor module for
> some Jetson platforms which is not only required by the kernel but the
> bootloader as well. So having a simple way to identify the EEPROM is
> needed.
>
> Changes since V1:
> - By default initialise the nvmem_config.id as NVMEM_DEVID_AUTO and not
>   NVMEM_DEVID_NONE
> - Dropped the 'maxItems' from the dt-binding doc.
>
> Jon Hunter (5):
>   misc: eeprom: at24: Initialise AT24 NVMEM ID field
>   dt-bindings: eeprom: at24: Add label property for AT24
>   misc: eeprom: at24: Support custom device names for AT24 EEPROMs
>   arm64: tegra: Add label properties for EEPROMs
>   arm64: tegra: Populate EEPROMs for Jetson Xavier NX
>
>  .../devicetree/bindings/eeprom/at24.yaml      |  3 +++
>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  1 +
>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  1 +
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  1 +
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  1 +
>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 14 ++++++++++++
>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 16 ++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  1 +
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  1 +
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 ++
>  drivers/misc/eeprom/at24.c                    | 22 ++++++++++++++++++-
>  11 files changed, 62 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>

Just FYI: I'm fine with the at24 part. I can take them through my tree
for v5.10. Who is taking the DTS patches for tegra? Thierry? I can
provide you with an immutable branch if that's fine. I can't just ack
the at24 patches because they conflict with what I already have in my
tree for v5.10.

Bartosz
