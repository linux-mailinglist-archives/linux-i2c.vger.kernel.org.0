Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BD338BC29
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 04:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238099AbhEUCCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 22:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238093AbhEUCCB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 22:02:01 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42C4C061763;
        Thu, 20 May 2021 19:00:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n8so4915191plf.7;
        Thu, 20 May 2021 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9fB9txKIQZNMl67yv7ERq72Q+6wcnvrLhnIU26tnTf4=;
        b=An1xKWU/mWO08cY0cP24LyKkNnOv5zCCLUdnglRtraCTvQQzxVh9tTfYP1YanUjoR8
         gFtYTxBnypDtTZJxyxQ1tMDJtzdMMTs5rHApnAEd/aQWzVn+hLHmzuypSaML2xrdpRCW
         +atdTnZ2DCoPjdD9qdm1EhlEDGaoVnmocolZmRF7sErnz5ofewaQGpXASxT8QxwUiUai
         nj86+/F36GPfLpYIIDyoKPdhyetIbbr07I+lFT1YwrnBmgBe0t2Svn7GZ5BNKqRlLY2/
         CGzlvZ+aIKnYSNNGv4xYAR9uUG2Ao2Igzhd1uppZXRCZB6hTlZNwDp4EPHaQ6nKsT/a/
         loIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9fB9txKIQZNMl67yv7ERq72Q+6wcnvrLhnIU26tnTf4=;
        b=rGDRJXOnkNPwOFcApTQTF4Rik5rpOF5f5VX5RGPBomGki5XoA9LO/x8nFPHMPFAell
         lH+OYtMX6j7EqntVxFRCYfsgjmpqXAtVSHMfCAsTBVyjGESzMe8e0KcGLnnpHvVjwF7+
         6xGKOO4LblKmkjb2gaOX9JIOu+Z0DWeygM4AuWBP27kAApEKJhTyrLnzWtB1meIDCMfR
         u6BGW3q6q21E1yYvQ1h8JsrszPWtpsos8h3kIjOt+IhIQVRFqYXaoU9w327qPmPGZxDa
         W7xFQeAV9rZGptnmpXmU/8UqXet0WEqwxrYZ86T/A4akD530eC9n9K3kt0Nd5WlbFPuZ
         Mw3w==
X-Gm-Message-State: AOAM53199GkBLg4N9iRGWnv27o9l/XKa3/iT6PG36TxTc7d/Y9MVbY7b
        KneKbwIDzCDBrD/3FcM+JJY=
X-Google-Smtp-Source: ABdhPJwBofzBAXoo5pDmXX4ye8/TsvSpB7pKcMIb3pVYhLkIdagqbQ5wvHtXHUJZRNsbTl2FgNx8tA==
X-Received: by 2002:a17:90a:f811:: with SMTP id ij17mr8130069pjb.63.1621562439317;
        Thu, 20 May 2021 19:00:39 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id w74sm2869555pfd.209.2021.05.20.19.00.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 19:00:39 -0700 (PDT)
Date:   Thu, 20 May 2021 19:00:34 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Steven Lee <steven_lee@aspeedtech.com>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of
 AST2600
Message-ID: <20210521020033.GB19153@taoren-ubuntu-R90MNF91>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
 <20210520033140.GA3656@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520033140.GA3656@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jamin,

On Thu, May 20, 2021 at 11:31:41AM +0800, Jamin Lin wrote:
> The 05/19/2021 22:59, Joel Stanley wrote:
> > On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> > >
> > > The register definition between AST2600 A2 and A3 is different.
> > > This patch avoid new registers definition of AST2600 to use
> > > this driver. We will submit the path for the new registers
> > > definition of AST2600.
> > 
> > The AST2600 v9 datasheet says that bit 2 selects between old and new
> > register sets, and that the old register set is the default.
> > 
> > Has the default changed for the A3?, and the datasheet is incorrect?
> > 
> > Does the A3 still support the old register set?
> > 
> We suggest user to use the new i2c driver for AST2600 and we will sumbit
> it. This driver is used to AST2500 and AST2400 SOCs. Change this
> driver to check global register of i2c to avoid user build the wrong driver. 

If I understand correctly, the answer implies old register set is still
supported in A3 although aspeed suggest people using the new driver/mode?

Can you please share more context behind the suggestion? Such as new
register mode has better performance? Or some known issues that were
deteted in old mode are fixed in new register mode?


Cheers,

Tao
