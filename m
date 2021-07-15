Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4193CA3AA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 19:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhGORQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 13:16:07 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:34559 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbhGORQH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 13:16:07 -0400
Received: by mail-io1-f49.google.com with SMTP id g22so7338147iom.1;
        Thu, 15 Jul 2021 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UsmnHH1R20y4QhVMi3pI7HitDhrJiPutY7rarWLdy9U=;
        b=kg7kOm22AI+tclZ94rVUNi2BnVvjKqPY0g6Q7UH4+eKj1JIMD7NOb/br68AU4kG/qN
         IO1wzakzy+Tm8/RLuFsUM+cOUSgwewYU7IOhdDeDvMIFgVbhR5Vd1kgbOcFPUQUnswuR
         xbAUYKkxPkfzFWLyeMiHBN2wmrCDuR2TlG3nD4RbkBU03ROAHw6ZqtieJruUtUSinSrB
         iHKene6souZY1Gvk9VzQ3TvHnTPnIdnEqdTMhK7jR8jzMtBI55guyP8oU/QOhcgte9M4
         1JMDkg7aVAiDV9HH4dPbsinndOsAL6ffQdLSPd/NhMC/dnv4SMZuZoeb8mJalhtJvFEV
         c5yw==
X-Gm-Message-State: AOAM531WeYCMng2Qh7nljknctFoFfNHUhj8X0NOun3hwpenV/3f1EDaK
        PMSDKigCv7CAPfA8UDNe6g==
X-Google-Smtp-Source: ABdhPJzlfRyG9qRBnzm4ridy94plL9cJfOddhDqzb+BlnBMpRWWerff0577EGmmHSWFqC/sDXDRpUA==
X-Received: by 2002:a5e:9602:: with SMTP id a2mr4015229ioq.146.1626369192650;
        Thu, 15 Jul 2021 10:13:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm3618053ioi.42.2021.07.15.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:13:11 -0700 (PDT)
Received: (nullmailer pid 1261924 invoked by uid 1000);
        Thu, 15 Jul 2021 17:13:08 -0000
Date:   Thu, 15 Jul 2021 11:13:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: i2c: brcm,iproc-i2c: convert to the
 json-schema
Message-ID: <20210715171308.GA1261646@robh.at.kernel.org>
References: <20210713093155.1752-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713093155.1752-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 13 Jul 2021 11:31:55 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Introduced changes:
> 1. Added arm-gic.h include
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> RESEND: commit 11480dbfe1d5 ("ASoC: wm8750: convert to the json-schema")
> is part of the 5.14-rc1 so Rob's bot should be happy this time.
> ---
>  .../bindings/i2c/brcm,iproc-i2c.txt           | 46 ------------
>  .../bindings/i2c/brcm,iproc-i2c.yaml          | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
> 

Applied, thanks!
