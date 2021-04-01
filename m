Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5EA351CE2
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237238AbhDASW6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 14:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239699AbhDASQr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Apr 2021 14:16:47 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13075C031178;
        Thu,  1 Apr 2021 10:09:39 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id n140so2443399oig.9;
        Thu, 01 Apr 2021 10:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+aXNjJuVUumi5TRfsImw8Zt0yNPvfmonu1KMDych7KE=;
        b=bsKpMqDArH3IKklMaeKoURaLp4jrZj8Qm2GRNbx1pyJrRQ9PY4t2DuObUD0WbcmmVF
         YI/B+TfsS3VucSts2J78A9x0feiMxC7KE9MF74OyceydekNUkmu0zw1Yg49C/Wf81ulM
         naJiFMn0GnMvMU14NoQHoRYC2/Wjv2TSWQ4/bX4xjBJ4X7+eLw82g6HwEm3UwMwnfr1J
         bgsphZATRsTvELWFxAnrjOldSCLpg1SlRkhZPISpUI6O0qms6SsXTivQmZ2NR8u8ENpn
         fttNL8Onj2N4aS/x453oEDdGhI5k901V32nzfrIPUr9C6LH4td4HjApBxM2rKJFGTf6L
         v6Gg==
X-Gm-Message-State: AOAM530eN2JKUi9utcJ1fC0mTsqIB3TzuDHbxoQs1CURQAIG/XwQw4GB
        KY+7roAJogiJ7nJXv6gVtQ==
X-Google-Smtp-Source: ABdhPJx8VdMpHnlAiOBeHsNkwA82OIfkMjQjd799V7gJHykNelnxJL3Z4wK3Gyo/lsR35Rm1qdYsig==
X-Received: by 2002:a05:6808:146:: with SMTP id h6mr6901775oie.118.1617296975408;
        Thu, 01 Apr 2021 10:09:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g21sm1219961ooa.15.2021.04.01.10.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:09:34 -0700 (PDT)
Received: (nullmailer pid 623796 invoked by uid 1000);
        Thu, 01 Apr 2021 17:09:33 -0000
Date:   Thu, 1 Apr 2021 12:09:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>,
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
Subject: Re: [PATCH v2 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
Message-ID: <20210401170933.GA622142@robh.at.kernel.org>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210330141029.20412-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330141029.20412-4-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 09:10:29PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt

Same comment as you ignored on v1.
