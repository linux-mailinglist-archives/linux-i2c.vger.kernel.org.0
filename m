Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF301614C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 11:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfEGJqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 05:46:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42910 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbfEGJqW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 05:46:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id w23so11332606lfc.9;
        Tue, 07 May 2019 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D8a9oNQdj9sLJi+F+nMv/MThx6/XEnKYS+mGh47evN0=;
        b=RpdJ2K2vxo1jWmpNoQaV0ZwYm0EpykGsmQpfdSE6egrM5eJDsHBZeYua0jFLOqB8Qc
         qP7YbPwDn45z2U+BU4nkpArGTvT4k0/9BYcaWPK8iS1GhthbVeEBq3Vxc6edZI1UiEdu
         4SY4+tvur+HuIfOl1hvj8+wgRGMnpmjNs/QplqmX3UWgDgtE1j1Ewwp5I2xeh35QEB3E
         +OME9+w6MdXeL/6qz/wqZT1HnRW/U7dxCmQ6N45WQFloU5XzH3H5PRIBjoqlrhWaeOhL
         H4fzstia9T07SnclSY8VhLQFkBaGlHzS2z5cgeyRD3hoisQ68Zi/7WEjzxoIU4bPf9bl
         yRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D8a9oNQdj9sLJi+F+nMv/MThx6/XEnKYS+mGh47evN0=;
        b=a3HkL7Bwwb3I4I5/jChBQtr0EQMuqicrKyRBRdSlGf+2T5EdH394209tq9VcWvYzeY
         kWg4brTna3VLsGt3V6FadlxCsOEwahfVzAUcHAA5nnzLQ/MMOEPFS3MtayfBqj+G8KvD
         2/yFK56VzSmjjmKUhK7A6JhKaJMH62kBSEUW+rr3AJ911kFBVxvA5TtxrYIKPZgcE4cp
         BXJK3oA4/5hvWi4+a0KyAhnZL+/C4ZuyDlVSpsxbFZdjYtrwmwiLoYH26x9SW2xM15ds
         PL99C4ar31NUqQtItIWXvvv+Q8Kv2KPt7G1joJm8zGb+id82iADKu+Iy2wp8wArVJj69
         t+lA==
X-Gm-Message-State: APjAAAVHRpEuLXH640e3MASFnLz3wDNvFfRcVZ9cGaHoxd2eTuKRIGG/
        QZsCzMHKT0EYHA+vWupIrZkDldYA
X-Google-Smtp-Source: APXvYqzLziWk+NPBxeyV+TCjsY781CuWWPdyHmFKdCUA3piyO9FUbxtTSRvYZvZKnJW8bIaMQf7xig==
X-Received: by 2002:a19:a40f:: with SMTP id q15mr14682357lfc.121.1557222380205;
        Tue, 07 May 2019 02:46:20 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id y20sm3257665lfe.8.2019.05.07.02.46.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 07 May 2019 02:46:19 -0700 (PDT)
Date:   Tue, 7 May 2019 12:46:16 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] i2c-mux-gpio: Split plat- and dt-specific code up
Message-ID: <20190507094615.xrmuaokro3ll4ghg@mobilestation>
References: <20190424123414.25311-1-fancer.lancer@gmail.com>
 <20190425232028.9333-1-fancer.lancer@gmail.com>
 <20190507090210.hn6vgcjg2q6tysbp@mobilestation>
 <689e1a7b-8544-6bbf-2fa1-a5845895a917@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <689e1a7b-8544-6bbf-2fa1-a5845895a917@axentia.se>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Peter

On Tue, May 07, 2019 at 09:17:38AM +0000, Peter Rosin wrote:
> On 2019-05-07 11:02, Serge Semin wrote:
> > Hello folks,
> > 
> > Any updates on this patchset status? I haven't got any comment on v2, but
> > instead a notification about the status change was sent to me:
> > 
> >> * linux-i2c: [v2,1/3] i2c-mux-gpio: Unpin a platform-based device initialization
> >>     - http://patchwork.ozlabs.org/patch/1091120/
> >>     - for: Linux I2C development
> >>    was: New
> >>    now: Superseded
> >>
> >> * linux-i2c: [v2,2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs request code
> >>     - http://patchwork.ozlabs.org/patch/1091122/
> >>     - for: Linux I2C development
> >>    was: New
> >>    now: Superseded
> >>
> >> * linux-i2c: [v2,3/3] i2c-mux-gpio: Create of-based GPIOs request method
> >>     - http://patchwork.ozlabs.org/patch/1091121/
> >>     - for: Linux I2C development
> >>    was: New
> >>    now: Superseded
> > 
> > I may misunderstand something, but how come the v2 patchset switched to be superseded
> > while it is the last patchset version I've sent?
> 
> That was my mistake. Patchwork got confused when v2 was sent as a reply to
> something in the v1 tree, and marked all 8 patches as "v2". Then I in turn
> got confused by that, and changed status on the wrong set. Sorry!
> 
> So, thanks for the heads up, it should be fixed now.
> 
> As for comments on the patches, I'm personally buried in work and others
> may have the merge window to focus on...
> 
> Cheers,
> Peter

No worries. Glad everything is clear now. Thanks for the quick response.

Regarding the patchset comments. Lets wait for the merge window being closed.
Then if no comments will have been received in one-two weeks after that I'll
ping this patchset mailing-list again .)

Cheers,
-Sergey
