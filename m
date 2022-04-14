Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E52E501C12
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 21:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345722AbiDNTnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Apr 2022 15:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345719AbiDNTnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Apr 2022 15:43:01 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC00549FBD;
        Thu, 14 Apr 2022 12:40:34 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so6278304fac.7;
        Thu, 14 Apr 2022 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sTjycxzZ7F3dCMSb/aO9ZF1TYGmB9SbVtqQIGpu1O+I=;
        b=bSyw+jcovvIvJVR8k0GeVz668v2UTDf3H5QBgq5+yr5nC+xSeiSPcZRinVQ2yIufJU
         mzoeiVpSkCu+u1kbGxUcsxmklI8JayjwW7pXYBgi6/Yog2Lbm02J5X2BS35c+Y29iUEu
         hkCiJsqLs0Ei4xDGw2e6xFLa4dGK5+Ron0ycpAsLWlH3OTH+7C4+VzwSmRsUuQhpKvLU
         higIF45djJMlpYFq6ITCPkRabc0ylMuMmJUeG7MYILz3Lo0AY42l7nj93m0tP54f1DCW
         lyykKnhfkHrlPCrKhz3cand1rlduRnUj+bTdf4BGrZGYK7ERLU0MPzVZrWZUTG/nWcwG
         AxuA==
X-Gm-Message-State: AOAM533Ya7PBWCiviJmNiHuxS0hX+dmGIBd3M6gea17wsZB5xw+YlkY3
        gz5xsM42sGwJAa9L6vBxFg==
X-Google-Smtp-Source: ABdhPJx9v0RohJWr9Vyjc3wW8aOTrcqcjT0BSZkNb82DuBUGbueEBvvS9/T8yJ4L8A5ev+ToOzNApg==
X-Received: by 2002:a05:6870:2216:b0:e2:9dea:4611 with SMTP id i22-20020a056870221600b000e29dea4611mr79826oaf.122.1649965234241;
        Thu, 14 Apr 2022 12:40:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p22-20020a056870831600b000ccfbea4f23sm1095357oae.33.2022.04.14.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 12:40:34 -0700 (PDT)
Received: (nullmailer pid 2513925 invoked by uid 1000);
        Thu, 14 Apr 2022 19:40:33 -0000
Date:   Thu, 14 Apr 2022 14:40:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "wsa@kernel.org" <wsa@kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Message-ID: <Ylh4sexTQhAjU3NW@robh.at.kernel.org>
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <YlXtobiXIyObF/7+@robh.at.kernel.org>
 <20220414085539.GA7392@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414085539.GA7392@axis.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 14, 2022 at 10:55:40AM +0200, Vincent Whitchurch wrote:
> On Tue, Apr 12, 2022 at 11:22:41PM +0200, Rob Herring wrote:
> > On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> > > index fc3dd7ec0445..960d1d5c9362 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > > @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
> > >  	this information to adapt power management to keep the arbitration awake
> > >  	all the time, for example. Can not be combined with 'single-master'.
> > >  
> > > +- no-detect
> > > +	states that no other devices are present on this bus other than the
> > > +	ones listed in the devicetree.
> > 
> > This belongs in the schema instead:
> > 
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> OK, thank you, I've sent a PR[0] now, but I must admit I don't quite
> understand how this property differs from the other ones in this file
> which aren't documented there.

Thanks.

The issue in general is we need permission to relicense anything in the 
kernel tree to move it. In some cases, the schema is written, but the
descriptions have not been moved (as that's the part needing to be 
copied. If we missed properties, I'm not sure what happened but they 
should be in the schema too. Maybe they were added around the same time 
the schema got written.

Rob
