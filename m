Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B128356E94
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 16:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242482AbhDGO2n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 10:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDGO2m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 10:28:42 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCBEC061756;
        Wed,  7 Apr 2021 07:28:32 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso18245169otq.3;
        Wed, 07 Apr 2021 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=jOETYTM8063hIe+H5kFUr3hMwnez+idh/fGpidnkrFU=;
        b=LareH35xQvx6q7WindtheaqOLJg6+SkWSAntFgw7HjS3Tk4qDPoemJ1YOk85nmgPvg
         9mZw56tpm53uQl29e+NuknOwYdP0xUGUxUvEzj64/Y7PD4nxPHMwswMAL8E4iHbcAhMx
         h0MdSnsyeyH4HD8RzChFdMtN/SVH7ahCvfGaZEIguKsC0HUgs97KIN7GkKUfnrLM2q+p
         MiRkxAMy9OTppt3tkoTAy1Zc4dPeODYOUi9GXRMbSxlEeRbbwdMytDy+G8hVjD1aj6yC
         LVzR9U89e8uevanQxmVqNCGOgMvZJvLBAuD6ahPOCf7aN31WHqeQdfIWyETLDQl2tc04
         +zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=jOETYTM8063hIe+H5kFUr3hMwnez+idh/fGpidnkrFU=;
        b=O+sUwYEZLXGk49XvVpKky91ioIhwz2qmw7xSIcuyDmrianZedtloujq91tX7IKOabl
         I54ipugZrY5xl1HCaTUFz6c9MHo42qOyvOoey3+O6unZoiVv5S0/CsxHj3u2DMwGHsdf
         5gNF3l4N6B+qj+rKgW7uAmY8b7lAThGr6jrWD1Vpc4JCKzNri+Wh9pThJ2wf7sO9b6Dq
         Wtq6mmUn6Hf292eK8Gny9XNgLfUZG14Sbot0jQ3+I79Ufkbgvc0B2WmkpRbiVOlTQtRq
         SPfNcNZv3qMFwY4MPHLfe5bK+aXzmZRS/gOwL7FwCLH7b+JqFSp0EvdBDXuzKZ4yUPRY
         hlng==
X-Gm-Message-State: AOAM532sewWqvpfSCiC4FZuswdJc4+55524+tS5YatmwCyXtKg8OmaFo
        mwZE6em8CGWGgphSSNNw+1GSd70SfsCr
X-Google-Smtp-Source: ABdhPJxYDEUlP0EObBbm9VfamGrvC+u2TKkp/NeoRSzuuBtqMWkEEaA6ECIMT4B8dpnH6MIjEYoYqQ==
X-Received: by 2002:a9d:37b4:: with SMTP id x49mr3212457otb.237.1617805711619;
        Wed, 07 Apr 2021 07:28:31 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id h24sm5501853otg.20.2021.04.07.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 07:28:30 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:f036:ecd9:2bd0:ef09])
        by serve.minyard.net (Postfix) with ESMTPSA id 89595180570;
        Wed,  7 Apr 2021 14:28:29 +0000 (UTC)
Date:   Wed, 7 Apr 2021 09:28:28 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/3] Add Aspeed SSIF BMC driver
Message-ID: <20210407142828.GE7166@minyard.net>
Reply-To: minyard@acm.org
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210402142124.GV507977@minyard.net>
 <0e7fceff-4a01-5cb0-72eb-8b47d598f1c3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7fceff-4a01-5cb0-72eb-8b47d598f1c3@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 07, 2021 at 08:09:50PM +0700, Quan Nguyen wrote:
> Hi Corey,
> 
> Thank you for reviewing
> I'll put my respond inline below.
> 
> -Quan
> 
> On 02/04/2021 21:21, Corey Minyard wrote:
> > On Tue, Mar 30, 2021 at 09:10:26PM +0700, Quan Nguyen wrote:
> > > This series add support for the Aspeed specific SSIF BMC driver which
> > > is to perform in-band IPMI communication with the host in management
> > > (BMC) side.
> > 
> > I don't have any specific feedback for this, but I'm wondering if it's
> > really necessary.
> > 
> > Why can't the BMC just open the I2C device and use it?  Is there any
> > functionality that this provides that cannot be accomplished from
> > userland access to the I2C device?  I don't see any.
> > 
> > If it tied into some existing framework to give abstract access to a BMC
> > slave side interface, I'd be ok with this.  But I don't see that.
> > 
> 
> The SSIF at the BMC side acts as an I2C slave and we think that the kernel
> driver is unavoidable to handle the I2c slave events
> (https://www.kernel.org/doc/html/latest/i2c/slave-interface.html)
> 
> And to make it works with existing OpenBMC IPMI stack, a userspace part,
> ssifbridge, is needed (https://github.com/openbmc/ssifbridge). This
> ssifbridge is to connect this driver with the OpenBMC IPMI stack so the IPMI
> stack can communicate via SSIF channel in similar way that was implemented
> with BT and KCS (ie: btbridge/kcsbridge and its corespondent kernel drivers
> (https://github.com/openbmc/btbridge and
> https://github.com/openbmc/kcsbridge))

Dang, I don't know why there's not a generic userland interface for
the slave.  And I've made this mistake before :(.

Anyway, you are right, you need a driver.  I'll review.

-corey

> 
> > Unless there is a big need to have this in the kernel, I'm against
> > including this and would suggest you do all this work in userland.
> > Perhaps write a library.  Sorry, but I'm trying to do my part to reduce
> > unnecessary things in the kernel.
> > 
> > Thanks,
> > 
> > -corey
> > 
