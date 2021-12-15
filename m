Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAEB4760F0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 19:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343904AbhLOSmf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 13:42:35 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40904 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343895AbhLOSmf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Dec 2021 13:42:35 -0500
Received: by mail-oi1-f173.google.com with SMTP id bk14so32927981oib.7;
        Wed, 15 Dec 2021 10:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3OtsKeW4PGTLYhUwIW/0xDZ0rCoZLq4u4StGZiPBa7E=;
        b=M6Ha8N60acEWIsAcZ6nJuL/DjpFU5uGlrwah+EM1jCBKeX2WzurzMsGC1AmmBDCqmM
         BASyKlwrR+xFBRWb+XOzfYhG3n2Yvbq0oTRT3xH3B1GYDCGV9dWoqudtE0yjf8Ajo8h7
         HoSW0u4k9YAgvwb2ZI5Cmqwr/mgOdnCteISnDtZk9K/mnQlfyPgprXigPVmHZ9fvQNEv
         XVejnTrEx7wnmb0URVk0bKMcxOmrdCPaIDbEl/yXJSap0KeeCNkz0fpG50QQG/gWMfF2
         m30JBFjo3HlpJyFbr9yBhMr5tBVQern1OKnT5Ij7zMUkZj5utA6xgl02avDEqp15j0Az
         SOTQ==
X-Gm-Message-State: AOAM5313zR9Fs0TQg71ZhLII2vwnANG1FzYNpTrihE426nxtsJ225LIx
        ARoHwZGgGclzJMR6+A7rRA==
X-Google-Smtp-Source: ABdhPJx1sPX5taOobDhPw0965b4z+Q5nH2DK3vahPxmFwzz1WnIT0pXUH6ue1ficuD1LEggwFjRtjw==
X-Received: by 2002:a05:6808:114f:: with SMTP id u15mr1117524oiu.74.1639593754429;
        Wed, 15 Dec 2021 10:42:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v12sm571493ote.9.2021.12.15.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 10:42:33 -0800 (PST)
Received: (nullmailer pid 1622209 invoked by uid 1000);
        Wed, 15 Dec 2021 18:42:32 -0000
Date:   Wed, 15 Dec 2021 12:42:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SMBus features to Tegra I2C
Message-ID: <Ybo3GNYSZ9HLIwqj@robh.at.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
 <YbMWPGMcHEQXGkHf@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YbMWPGMcHEQXGkHf@orome>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 10, 2021 at 09:56:28AM +0100, Thierry Reding wrote:
> On Thu, Dec 09, 2021 at 07:04:30PM +0300, Dmitry Osipenko wrote:
> > 09.12.2021 18:05, Akhil R пишет:
> > > Add support for SMBus Alert and SMBus block read functions to
> > > i2c-tegra driver
> > > 
> > > Akhil R (2):
> > >   dt-bindings: i2c: tegra: Add SMBus feature properties
> > >   i2c: tegra: Add SMBus block read and SMBus alert functions
> > > 
> > >  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
> > >  drivers/i2c/busses/i2c-tegra.c                     | 54 +++++++++++++++++++++-
> > >  2 files changed, 57 insertions(+), 1 deletion(-)
> > > 
> > 
> > How this was tested? This series must include the DT patch. If there is
> > no real user in upstream for this feature, then I don't think that we
> > should bother at all about it.
> 
> This is primarily used by a device that uses ACPI and the driver uses
> the firmware-agnostic APIs to get at this. However, it also means that
> the driver effectively provides this same support for DT via those APIs
> and therefore it makes sense to document that part even if there are no
> current users of the DT bits.

Then definitely a NAK.

> One big advantage of this is that it helps keep the ACPI and DT bindings
> in sync, and document this on the DT side also allows us to document the
> ACPI side of things where no formal documentation exists, as far as I
> know.

I have no bandwidth to review ACPI bindings and don't think the whole 
use DT bindings in ACPI is a good idea either. If someone wants this to 
be a thing, then they need to step up and review bindings.

Rob
