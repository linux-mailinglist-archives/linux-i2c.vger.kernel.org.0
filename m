Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29BAD53B0CF
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 02:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbiFBAct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 20:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbiFBAcs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 20:32:48 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8415A5DBE5;
        Wed,  1 Jun 2022 17:32:47 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i66so4719921oia.11;
        Wed, 01 Jun 2022 17:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=sh16xGe/echtR67o8EYAV8ZtQjoNwgsJwYaCJqxIORY=;
        b=QPOHKu2JZdnGBtC7fmTtjOSE9oopRqCnfZOiDgt6Xq8NaeFj5LEpiNC4MBvSny6XAZ
         tP23yYoSibaO17BC+tN/4ndFzeu3y9sAlpFxVrvR46zGNkrmktR82tsnRYao912mVlgu
         sFnMmIo/6tg4Mf1sU3/boIWlqZvWGKl6F7TtFJWoKmbeKgyEm9YDB5EQd+wNDBuGyvTX
         E9bkmD/dKERVdm2JsF9okxmr6y9B2DO2czXcmSta8JmSRNupjJh1aMt94eWuHQdZiOYP
         kpQk2+ruD30huk1PRYNfV17WxAzjzkzOE8Zn/WugahtBCADPO8Sj5PlPfroNmHZkNiyY
         469Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=sh16xGe/echtR67o8EYAV8ZtQjoNwgsJwYaCJqxIORY=;
        b=F++qXuQQwR1Myzh9YyNYyadQVcs0ynuJkkgdSuVlDM35DGi72tv5lkLRZ+DoL5UOSZ
         rpC7LGgx/F21/SEQJ0ChBLm6BcXkfeANUg9oxwEDcyNwoB9zLlIYkrQ01NJvn4a8hcZz
         0iZDi2xMOwxHQ5oysx/840+kwlIXugkZp0ktE7HYb2hZRYDrFcDXwCE6LS565FrbOR7b
         R7KGevhMKHqDCXeu1ODzsR7Qr3jeGcUl+yy9Qc3LZ2yWmu/y4d7v8AXF58A7gKKmUxRV
         Zd3EeovIwSCjbXZCzsJxLQodkm5UYQD+G3hLkC4NDqPFc2ApLEp25b6WLLD3fx8eJfDc
         s1vg==
X-Gm-Message-State: AOAM532bsUG2WxyvNUO8FQuQvJKicmgZ/2APlmNYnKj17hfeAzhHkWlE
        dZoQ8rUvkprNDwbrarEABg==
X-Google-Smtp-Source: ABdhPJzvSVAppomg02HmNv/mcRsuQs1poeKeWSDg8cjkuwsPJmAtobRPluwWod2pXyfwLfpU1Gm0fQ==
X-Received: by 2002:a05:6808:2196:b0:32b:492a:3b4d with SMTP id be22-20020a056808219600b0032b492a3b4dmr1200787oib.255.1654129966739;
        Wed, 01 Jun 2022 17:32:46 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id 12-20020aca120c000000b00325cda1ffa5sm1542462ois.36.2022.06.01.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 17:32:46 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:cca5:4cab:9a61:6930])
        by serve.minyard.net (Postfix) with ESMTPSA id 423751800BB;
        Thu,  2 Jun 2022 00:32:45 +0000 (UTC)
Date:   Wed, 1 Jun 2022 19:32:44 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openbmc@lists.ozlabs.org,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kernel@vger.kernel.org,
        Phong Vo <phong@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        Open Source Submission <patches@amperecomputing.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
Message-ID: <20220602003244.GK3767252@minyard.net>
Reply-To: minyard@acm.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
 <20220504120631.GE3767252@minyard.net>
 <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 01, 2022 at 03:23:11PM +0700, Quan Nguyen wrote:
> On 04/05/2022 19:06, Corey Minyard wrote:
> > On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
> > > > 
> > > > I seem to remember mentioning this before, but there is no reason to
> > > > pack the structures below.
> > > > 
> > > 
> > > The packed structure is because we want to pick the len directly from user
> > > space without worry about the padding byte.
> > > 
> > > As we plan not to use the .h file in next version, I still would like to use
> > > packed structure internally inside ssif_bmc.c file.
> > 
> > Packed doesn't matter for the userspace API.  If you look at other
> > structures in the userspace API, they are not packed, either.  The
> > compiler will do the right thing on both ends.
> > 
> > > 
> > > > And second, the following is a userspace API structures, so it needs to
> > > > be in its own file in include/uapi/linux, along with any supporting
> > > > things that users will need to use.  And your userspace code should be
> > > > using that file.
> > > > 
> > > 
> > > Meantime, I'd like not to use .h as I see there is no demand for sharing the
> > > data structure between kernel and user space yet. But we may do it in the
> > > future.
> > 
> > If you have a userspace API, it needs to be in include/uapi/linux.
> > You may not be the only user of this code.  In fact, you probably won't
> > be.  You need to have a .h with the structures in it, you don't want the
> > same structure in two places if you can help it.
> > 
> 
> Dear Corey,
> 
> Is it OK to push the structure definition into the
> include/uapi/linux/ipmi_bmc.h ?
> 
> Or should it need to be in separate new header file in uapi/linux ?

I think a different file, like ipmi_ssif_bmc, to match the file and
operation.  Unless you need the things in ipmi_bmc.h, which I don't
think is the case.

-corey

> 
> Thank you,
> - Quan
> 
> 
