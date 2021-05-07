Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8F7376BDF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 23:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhEGVo1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 17:44:27 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:38579 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhEGVo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 17:44:27 -0400
Received: by mail-ot1-f45.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so9151555oth.5;
        Fri, 07 May 2021 14:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1jPYaiJ3mpOsE5i/q/eUuwCFtgMQJcQzg5PuBr/sjHs=;
        b=HfIj4r8ONjBXYl30I1cj8QvuoHjTvW5VbZTCSml/fskrofCabVCmzBJD1EHEZU+x+6
         kMZqkC9NDbFsNVnAgiytMlp1VJ7a+CkGsC+4lapjJFkfhVq6wmaafqLo1QUwQpOTGxmV
         uvR4rc2mwI1pQWQ4mCucArGjgxYif6E+HGcldA1qCq24CB+J5X1RRV0D6fhIi3CmHwb7
         a5mAVbsg+uinkbMYMY/29I5SGmqVAEUOW5fUzQHE3kYtJehXqtKUw5w+wTZR7g9YvvkA
         8ZJF7qE1UnYnXLGy9bJMkeXSP9O5AftrXFkAwqRe5HdUnEihOhH66UWihiDkogvSjMlo
         7G9A==
X-Gm-Message-State: AOAM532ZOQh/fbLmp6cDYTYQfvK6ZZAUFli1RHVrfgXKLVWThmZwtDIy
        lWGDC8d00ViizBTdZqss7Vx36OLGvQ==
X-Google-Smtp-Source: ABdhPJyTQdRZg+46DJaHovSc+DGA9RXAMHaPE7FDnBU2Ww/Sph47kxo0hyCvh1ofVKV3FbagEmTENQ==
X-Received: by 2002:a05:6830:1450:: with SMTP id w16mr9903118otp.305.1620423805659;
        Fri, 07 May 2021 14:43:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c65sm1202316oia.47.2021.05.07.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:43:24 -0700 (PDT)
Received: (nullmailer pid 2942658 invoked by uid 1000);
        Fri, 07 May 2021 21:43:23 -0000
Date:   Fri, 7 May 2021 16:43:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210507214323.GB2902038@robh.at.kernel.org>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
 <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
 <20210507163602.219894f4@aktux>
 <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 07, 2021 at 08:24:59PM +0300, Grygorii Strashko wrote:
> 
> 
> On 07/05/2021 17:36, Andreas Kemnade wrote:
> > On Fri, 7 May 2021 19:45:45 +0530
> > Vignesh Raghavendra <vigneshr@ti.com> wrote:
> > 
> > > On 5/7/21 12:24 PM, Grygorii Strashko wrote:
> > > > 
> > > > 
> > > > On 06/05/2021 17:00, Vignesh Raghavendra wrote:
> > > > > Convert i2c-omap.txt to YAML schema for better checks and documentation.
> > > > > 
> > > > > Following properties were used in DT but were not documented in txt
> > > > > bindings and has been included in YAML schema:
> > > > > 1. Include ti,am4372-i2c compatible
> > > > > 2. Include dmas property used in few OMAP dts files
> > > > 
> > > > The DMA is not supported by i2c-omap driver, so wouldn't be better to
> > > > just drop dmas from DTBs to avoid confusions?
> > > > It can be added later.
> > > 
> > > Will do.. I will also send patches dropping dmas from dts that currently
> > > have them populated.
> > > 
> > hmm, we have
> > - DO attempt to make bindings complete even if a driver doesn't support some
> >    features. For example, if a device has an interrupt, then include the
> >    'interrupts' property even if the driver is only polled mode.
> > 
> > in Documentation/devicetree/bindings/writing-bindings.rst
> > Shouln't the dma stay there if the hardware supports it? Devicetree
> > should describe the hardware not the driver if I understood things
> > right.
> 
> True.  But my above statement is also valid - it introduces confusion from user point of view.

In my OS, 'robOS', the driver supports DMA.

> More over, 'dmas' is not part of original binding and were randomly added to some SoCs.
> And it's much more easy to extend binding (in the future) then remove something after.

In this case, probably given that how it would be extended is already 
known, but it depends how you extend a binding. My above statement was 
born out of incomplete MFD and system controller bindings for the most 
part.

> I leave it to Vignesh, Tony to decide.

Fine with me.

Actually, for DMA with I2C I'd like to see someone show a usecase 
and data where it's actually beneficial. 

Rob
