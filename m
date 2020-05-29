Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2451E873E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 21:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgE2THe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 15:07:34 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33076 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgE2THe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 15:07:34 -0400
Received: by mail-il1-f193.google.com with SMTP id y17so3589422ilg.0;
        Fri, 29 May 2020 12:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AmmoIynqErhFkuRJwlx52xsY8NmsJqOG5Lk1cUQU3YE=;
        b=GgbmgnNu7q2Fd90aqtO+/RHlYlMytUjL+EaG5B8hds8iTELapA/rGSD5pAvX+Ny9EN
         VIto+SKDZwviXqkEpNttD8zTXonxDLExDm4xhezgLQDzREHdIRz9YWTSSwNSV3RoLdR5
         3awXnL+gInDODu5jfHCVj1XFILdquVV4K+ZPLajaFKo6CcEOcn4gSuDrwp8cY/VM1Rmz
         olxfhrPYnROG+DBCxbzxxRVkqv46ATV02KgaCmNQ/98sf3N9m7eeAr8eH1uz+pQ7h8y1
         9gOgf0qes2LXmWKx0k243VxZg/xbypowOMn46PjVzr3oU00M85zIM7qmR53JjpcwsV5x
         y/kg==
X-Gm-Message-State: AOAM530mmcf2T26GX+MZEbyX0GcHh8aWG1DjFyVJEEE5A5SZSHZrsgH1
        ++iYUw7HhpGTSU8TOtOdxA==
X-Google-Smtp-Source: ABdhPJzkLLdu5roIJcHsxHt0QxtA8mUuU5tAWtM9q7Hr970zjZQbkaIVDDN9GVpaVGM0KZrpYm8IKw==
X-Received: by 2002:a92:c78b:: with SMTP id c11mr2843313ilk.56.1590779253823;
        Fri, 29 May 2020 12:07:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p11sm758817ioo.26.2020.05.29.12.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:07:32 -0700 (PDT)
Received: (nullmailer pid 2767944 invoked by uid 1000);
        Fri, 29 May 2020 19:07:31 -0000
Date:   Fri, 29 May 2020 13:07:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     venture@google.com, yuenn@google.com,
        andriy.shevchenko@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, ofery@google.com,
        openbmc@lists.ozlabs.org, brendanhiggins@google.com,
        benjaminfair@google.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kfting@nuvoton.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        avifishman70@gmail.com, wsa@the-dreams.de, tmaimon77@gmail.com
Subject: Re: [PATCH v14 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C
 controller
Message-ID: <20200529190731.GA2767581@bogus>
References: <20200527200820.47359-1-tali.perry1@gmail.com>
 <20200527200820.47359-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527200820.47359-2-tali.perry1@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 27 May 2020 23:08:18 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
