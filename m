Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374631BC22C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 17:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgD1PCv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 11:02:51 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:40001 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgD1PCv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 11:02:51 -0400
Received: by mail-oo1-f66.google.com with SMTP id r1so4736788oog.7;
        Tue, 28 Apr 2020 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cagbOAxFCCrUsMPh8ZyjipuoHC6QvYSHfoN2T04bZkE=;
        b=rMBFxQGoVM6N6Iao2Fb1R6wfkrik/70GGGxrd3ksldzUeM1e1kV9JIB3bOHoWDRj3z
         +Phi3GUd6Yy5g/8eDXFdYeLpJ0qM2LQ2lG4FJ8M1hfRohxkgvhHPQXsJiyqIxVsX47lj
         4rctQMMkcob+HRUOmGDogefOOeqxTVKamg6zzH6znwCD2767MiFJKLbGT/9zFKUyjdPA
         GnWYHckN4pge/WXloGFmfXYspPcpedubr+HZD/NtDZ7vFaecrgFxyOwiPC0udXBZWUpp
         Ibelu3ECoHionTtDthcSHWvPn2am+XUv6ZOnvRCPVdfQdVwg06BTMaA9cR1tysT2ehmC
         kgOA==
X-Gm-Message-State: AGi0Pub4LCGTClWphQ0M79/xk2sVQK191MObCpQsHg793QojOBWp6k8A
        m6MdAAhrryljlX6rb95/Iw==
X-Google-Smtp-Source: APiQypLFbUsEitU1zALK/1KF3a4D3Vi53WvuTSDo6YOFLWA1xNoxfsYtho5rrWk1suw6STl+w95wHQ==
X-Received: by 2002:a4a:ba0b:: with SMTP id b11mr23625812oop.44.1588086168402;
        Tue, 28 Apr 2020 08:02:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q20sm4653078ota.65.2020.04.28.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 08:02:46 -0700 (PDT)
Received: (nullmailer pid 20921 invoked by uid 1000);
        Tue, 28 Apr 2020 15:02:46 -0000
Date:   Tue, 28 Apr 2020 10:02:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v14 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200428150246.GA20429@bogus>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428061813.27072-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 28 Apr 2020 14:18:12 +0800, Bibby Hsieh wrote:
> In some platforms, they disable the power-supply of i2c due
> to power consumption reduction. This patch add bus-supply property.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
