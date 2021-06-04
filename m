Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD12F39C2F8
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 23:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhFDVxD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 17:53:03 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:33385 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhFDVw5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 17:52:57 -0400
Received: by mail-oo1-f54.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so2599226oot.0;
        Fri, 04 Jun 2021 14:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RablGP30AWym6iX311SHiz1tVC3w/+g5lgfSDAXTcog=;
        b=qNfjNkXcHzG8u9HSavAcOpi8O3AHbFmEUmiGNbCZm4JZSW8ukDSnHSb5KeN8W58QFH
         YJ8j3uI19/oip3xOlJIoDqDyYR9QHXYWgrcKwmwYiI3Q7fRmxhSf9RdAgGxhqIBVlBmd
         RPUWeblIvRA903i0hgrGqDCfkcVgGjNUY3YsntRVJHk1+44QrVO3du+fFMukDAwWy6Z/
         b8jiiNzyTIOxQNDH0+onN/MVGNVscvQzG43QndnWNgvVhTbnyG++mFAgOoNYgr9zImmg
         1YLB1aCO8gGvH6UP9f3PkgjgM/DE+jfKUTpxPSdsOB9M/JuwcXm1/pis6vccoiKcRysL
         9CLw==
X-Gm-Message-State: AOAM530DdGttVJYg0TLwzo2dX5WQGid1Wl4Y04UHJrF5DvPDT416bI0z
        1IXgpn60y2o4t14OguV2dg==
X-Google-Smtp-Source: ABdhPJy+5KLpJ+PqBF8N3RxF+W0QEpeQ2BkwoGqc/1cJSpZt/cxNXfzm9ZuR3bsuLIH7dRU4dac7CQ==
X-Received: by 2002:a4a:55c1:: with SMTP id e184mr5319694oob.74.1622843457146;
        Fri, 04 Jun 2021 14:50:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g24sm727252otp.17.2021.06.04.14.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:50:56 -0700 (PDT)
Received: (nullmailer pid 3987100 invoked by uid 1000);
        Fri, 04 Jun 2021 21:50:55 -0000
Date:   Fri, 4 Jun 2021 16:50:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: ce4100: Replace "ti,pcf8575" by
 "nxp,pcf8575"
Message-ID: <20210604215055.GA3985497@robh.at.kernel.org>
References: <cover.1622560799.git.geert+renesas@glider.be>
 <9b560b7f5ded90430c989a211f2aee009aefc595.1622560799.git.geert+renesas@glider.be>
 <YLqMsCPSCvisGyGF@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLqMsCPSCvisGyGF@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 04, 2021 at 10:27:28PM +0200, Wolfram Sang wrote:
> On Tue, Jun 01, 2021 at 05:25:44PM +0200, Geert Uytterhoeven wrote:
> > The TI part is equivalent to the NXP part, and its compatible value is
> > not documented in the DT bindings.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I'd think I pick this individually? Or shall it all go via some tree?

Yes, you can take it.

Reviewed-by: Rob Herring <robh@kernel.org>
