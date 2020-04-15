Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A5F1A9126
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 04:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgDOCyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 22:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgDOCya (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 22:54:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DDAC061A0C;
        Tue, 14 Apr 2020 19:54:29 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m16so722254pls.4;
        Tue, 14 Apr 2020 19:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w/ObdyZe4SYG+GH7RWaWC1pUzVlokN24AFVwo6IaPaI=;
        b=Kp+mBxf2fNINBhbwQWCKOZAD5VoFyYa7d66LOf524g5ye4u9NKUoyOc81NsFILYD/u
         gPF8ritxsYzD9aLSGnmDeqeN66slmkDVnGqok3i2R/bJLhXRAnrFYYnRyjTCqp3gkdMZ
         0pJv53bbzRVLVv7gFQLW7y2VnaMLadI6gRzt5KgQlnWR+i38rf2bS4Z1XsqkhoxdX0vG
         aWlOZ9dhfgIoPFCgOpM6azK8iRONiRv5ze+lqrJ0282/hG5hmKuJRDJivo6bFytre6No
         mnpzBUTEvuJMavD8VPgAlUIJXD0LSu0fSITiZNc0eMN1OlQ9ekbw0F5QuSWkskB1eaYW
         EIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w/ObdyZe4SYG+GH7RWaWC1pUzVlokN24AFVwo6IaPaI=;
        b=ocUSyidBrOYaPLdhcZ6ZZ8qYHXPfj9nennzbW7oRJ0UsFUpwC8NIGltcIxpe16tTP7
         UJCOozvKdMpVyGsJHLtbGkn6G4vi4LO0cBz5oegCVY8XLf90k5O/mgIo51FJvGoidCkH
         43domTGGSBeuy5e4FQQN3kbT1nDq7hjPVRNSliDI0Wvb77zwHJjGtueDWMVa+xaN+/Kk
         2VHncG45g+oR2i+lm0Zs95vpFLRv6BT5dsKxVCnVQvU+tf3pkzYsvUHhp7WXLHPOtJqj
         gFbXXD6QbOI8pncZV3z6iZLyrei0+jgGdx8prZpRDxl2BirOPiISyMWk9PflBkKjDXEM
         voaA==
X-Gm-Message-State: AGi0PuaQKsbWwWklefJptW9dk9HtgAyD/dIOwdJB9+xcm9gxRcNaoRw7
        MbVGxYgRjdPwuXTXrDMOY0Y=
X-Google-Smtp-Source: APiQypJnPJv53UlIGNvRX9jheZlHTaxQ05f+cPcg6FOMpCteH6TPHZwCBybS1X+TqkslpYskeJw9Jg==
X-Received: by 2002:a17:90a:c401:: with SMTP id i1mr3513270pjt.131.1586919269043;
        Tue, 14 Apr 2020 19:54:29 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id y18sm12100818pfe.82.2020.04.14.19.54.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 19:54:28 -0700 (PDT)
Date:   Wed, 15 Apr 2020 10:54:26 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200415025426.GB14300@nuc8i5>
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 14, 2020 at 05:48:41PM +0200, Markus Elfring wrote:
> > it will print an error message by itself when platform_get_irq()
> > goes wrong. so don't need dev_err() in here again.
> 
> I suggest to improve the change description.
> Can you get any further inspiration by previous patches from
> other contributors according to the presented transformation pattern?
> 
> Would you like to adjust any more source files in the mentioned
> software area?
>
Hi Markus:

Thanks for your comments, and maybe we can use coccinelle tools for
more source files do this change in the mentioned software area.

BR,
Dejin
> Regards,
> Markus
