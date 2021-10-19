Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDED43387E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhJSOkG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 10:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJSOkE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 10:40:04 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E7BC061746
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 07:37:52 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n11so13812848plf.4
        for <linux-i2c@vger.kernel.org>; Tue, 19 Oct 2021 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CIecaATj4T4Z7qYQY+MZOASityIhhLivg5T3isTLezg=;
        b=K+IX3Vwyw6PvNlEeKvoJECnjpAQ+tkGq8g2/R/3Z48+kM7c1VCYYreHnYbMVVFcOof
         uXLGvd/NkaIadqfUYAMerkL7JOTWBdXxnwHN7h2Q5GQSyoNPRzoHwNqVWloSN3/255CH
         SP+rJfm7Ec4Y32ZlfD/ieoW6c9JqcgMHE748Rudvu0cIPIwrwVPmY5kp6mDGOs7ZssjT
         MHByEPF1i2tmet0mT3njVAbtQdJTuVPG0vVYKccX49R5xQcEDuUXQKy5OSyz3fMXSUfJ
         iXsbXp/yXl77AovgvglF9qZ1jTiCaV71XNAaektdjAcWYR6d5TgCJbG8TnkAb7Onn7xJ
         7JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CIecaATj4T4Z7qYQY+MZOASityIhhLivg5T3isTLezg=;
        b=PsdgmPRpBEqoaXgd+IudyLFbRVmEw3mmxLRjIUYDRnmQHd+VLWQc/Tx+wAS5OVsAlk
         6wT0lnAMFUf7MbfNBLJ7nMTLgiN7QIe99cg89cKSM/d+El4RUH802TKQ4Or1x3ZtsCGK
         RhoUVyRaMLOqbBrDRGwiWaVFN9BJe/jZXlo23kec62+UiHdCTlhSPxTuvhn6lBVkGVhQ
         SO3ZACo6NhoeoqkEmBDe1CIhEyvPaLiz6/EX9WpziwbdOw4vi5PMjDGtAmS6qLbx97CD
         XHXa4mRW74tqjgzulfIvz/Q8oE947187txL2HW7iaKDrLGeJlCoOuq4rgKSNw5AMegpS
         H5uQ==
X-Gm-Message-State: AOAM531k8+vdKfIWq4fJEonGUX8J951cwAgmITFLjY2pIp+AQk5YU4eE
        DhYd6oUut+HP7pxWLPpvWLUAow==
X-Google-Smtp-Source: ABdhPJwi1zRSay/RiMuygWybe3OJlMn3edmEEKlLPd7Fpn5/Gz2ZpgAXfHwv4popfZhhKukTBL9uFg==
X-Received: by 2002:a17:90a:f292:: with SMTP id fs18mr128645pjb.229.1634654271626;
        Tue, 19 Oct 2021 07:37:51 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id s20sm2167476pfk.131.2021.10.19.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:37:51 -0700 (PDT)
Date:   Tue, 19 Oct 2021 20:07:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
 <YW6pHkXOPvtidtwS@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW6pHkXOPvtidtwS@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19-10-21, 13:16, Greg KH wrote:
> On Tue, Oct 19, 2021 at 03:12:03PM +0530, Viresh Kumar wrote:
> > On 19-10-21, 11:36, Greg KH wrote:
> > > What is the "other side" here?  Is it something that you trust or not?
> > 
> > Other side can be a remote processor (for remoteproc over virtio or
> > something similar), or traditionally it can be host OS or host
> > firmware providing virtualisation to a Guest running Linux (this
> > driver). Or something else..
> > 
> > I would incline towards "we trust the other side" here.
> 
> That's in contradition with what other people seem to think the virtio
> drivers are for, see this crazy thread for details about that:
> 	https://lore.kernel.org/all/20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com/
> 
> You can "trust" the hardware, but also handle things when hardware is
> broken, which is most often the case in the real world.

That's what I was worried about when I got you in, broken or hacked :)

> So why is having a timeout a problem here?  If you have an overloaded
> system, you want things to time out so that you can start to recover.
> 
> And if that hardware stops working?  Timeouts are good to have, why not
> just bump it up a bit if you are running into it in a real-world
> situation?

I think it is set to HZ currently, though I haven't tried big
transfers but I still get into some issues with Qemu based stuff.
Maybe we can bump it up to few seconds :)

-- 
viresh
