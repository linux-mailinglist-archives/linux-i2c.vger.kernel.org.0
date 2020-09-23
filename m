Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7A0275BE5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 17:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgIWPcv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 11:32:51 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:38078 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWPcv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 11:32:51 -0400
Received: by mail-il1-f193.google.com with SMTP id t18so2445ilp.5;
        Wed, 23 Sep 2020 08:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DtoDYlIgkJM6C+Ai6LhWBQbNLvk60GPVee6qi+q1BVA=;
        b=WKy8TeQmAneDalsPGyG8D0I+sOlPitd7OiCYqdNMheiC1x4MEyXbRLnmaWmiESAhGN
         o72HVNYCkyRnL+g1j+KoEeGa8zQPPkrRjxY8QVQllYlwxomocPunPbFZlANqhVzQkjwK
         XfQ6ORjMLlu7tSH00kVNk8C1KHRYYHpD7sbz+4NynqVdJk/wEK3nE2Lo4xe53IIyx+Bw
         JW+2EcAo+43znMi5ExygBxhkz35rMe4a99n+XTPDMGc4tzMYZnhR9a4VCBMfUY+nov0b
         FJKzPDeyxw8Xk5jJ86Y52PTm7KvVwEPGWqP0jfDKLivzPOBHqr9S1PsLjGj8ah7f77Mi
         aFbQ==
X-Gm-Message-State: AOAM531CxpLYMBsE0Xm9BigRK/Hrod08G/DGCLR672JsdLHKUZsCCguV
        4zyC359CLo/O/SyiLwLjZ4MkFPYdteMvgTA=
X-Google-Smtp-Source: ABdhPJzoWPKxdJIWJBysTOwFw0i31FN6iTt9hOPtV7z+rEba3hOi6SYuHEcViMiAy4vfbjm5FYdeEQ==
X-Received: by 2002:a92:b602:: with SMTP id s2mr266105ili.299.1600875169920;
        Wed, 23 Sep 2020 08:32:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm8046160ilo.21.2020.09.23.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:32:49 -0700 (PDT)
Received: (nullmailer pid 787283 invoked by uid 1000);
        Wed, 23 Sep 2020 15:32:48 -0000
Date:   Wed, 23 Sep 2020 09:32:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 2/5] dt-bindings: eeprom: at24: Add label property for
 AT24
Message-ID: <20200923153248.GA787205@bogus>
References: <20200916094952.458003-1-jonathanh@nvidia.com>
 <20200916094952.458003-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916094952.458003-3-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 16 Sep 2020 10:49:49 +0100, Jon Hunter wrote:
> Add a label property for the AT24 EEPROM to allow a custom name to be
> used for identifying the EEPROM on a board. This is useful when there
> is more than one EEPROM present.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
