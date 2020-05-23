Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3983A1DF7AE
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 15:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387763AbgEWNgc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 09:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387529AbgEWNgb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 09:36:31 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F157C061A0E;
        Sat, 23 May 2020 06:36:31 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so6213265pjh.2;
        Sat, 23 May 2020 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ii2tfPDbICPIbAX80VgxFGRLNNHttHydSq8bO/SDJ2E=;
        b=RN8BwmiM+CA/4AX37RLN5GteJNCnpNgrL01C+K8PE69yAMuNAhvz+WsGDngrBMWf7n
         a0KUe3ZYNmOM4phj2wNcNgINr14+O/YFXeVIzRg0Yk1zNYgLNCC5IpbAdkqC5Wwi/1a6
         Xkc5HB00AaUAKd8PNiO3lcusJooyE21wsHGxGyi8moE+95LV7F4iydfyyfsaNxPQDIT1
         5EzSlOVyWEq+OszTWVHETj0DEjUvKIzu41z3B84gZWnY23bXnQXJJnQ591YN4OtW+tkL
         VT/w4cW0tzIRrxlxDTNoWo4AYG8yWrJANJCseXV0BUV+35JafLx05yl5fYq+iUGg0Dg2
         bIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ii2tfPDbICPIbAX80VgxFGRLNNHttHydSq8bO/SDJ2E=;
        b=uY11WUmOPsZ1ZTFtwMY6vmGLZgYSFA8H+boQ2KmGurkxSDelICABN833d8rNOQQA68
         HQ6sjghjm4+YZ9XjtXOsMV2QNuFrvOYgveuAbtfha4Kzm8tRyNp/XDrGK0fUTnIJdbuj
         yiSaX2J4hGEqeiGuIKEjA3LxWQMNMZFH27zhZWAdzKDnn9Yh+51zDKRDQv09w9+bxefL
         uniYb4G1GJfI9i1l1oDTW3a7ZGQhLYY9ZEz1xPjuOJFW49zBBizs3XrZAWSYVWz1IDzp
         wNR3ZSue8q7GLRPkV+bl9J5jKRBK+DcVkYkX5O2t05vYUjRrAeEUFj3lTqkwAazXjdDD
         ltCA==
X-Gm-Message-State: AOAM532RNARucmQVxKeP8BypZCOsb3y6Cup2rUBTgkJHm1Zi0HpuHF8F
        KQmRle1QpGkDrsnXWjXFAnBDxqmB
X-Google-Smtp-Source: ABdhPJy8p7lJlKxI4aRRHJ86l83k3hGC2L5VR6CX/tbZiOOHrNeqEKtEyPIFn8F6d9rhiyuLDLGPnQ==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr19415096plp.184.1590240990972;
        Sat, 23 May 2020 06:36:30 -0700 (PDT)
Received: from localhost (176.122.159.134.16clouds.com. [176.122.159.134])
        by smtp.gmail.com with ESMTPSA id gd1sm9112654pjb.14.2020.05.23.06.36.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2020 06:36:30 -0700 (PDT)
Date:   Sat, 23 May 2020 21:36:26 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Michal Simek <michal.simek@xilinx.com>, harinik@xilinx.com,
        soren.brinkmann@xilinx.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
Message-ID: <20200523133626.GA27369@nuc8i5>
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
 <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
 <20200522151459.GK5670@ninjato>
 <7763d79e-3a44-2dbe-a4d3-45d40a3a1e02@xilinx.com>
 <20200522201956.GB21376@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522201956.GB21376@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 22, 2020 at 10:19:56PM +0200, Wolfram Sang wrote:
> 
> > You know about
> > devm_platform_get_and_ioremap_resource()
> > usage.
> >  Maybe that's the way to go. Because as of today there is no way to pass
> > position of irq resource.
> > 
> > But I expect it will come in near future.
> 
> Has been tried, has been nacked:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/patch/20200518155304.28639-3-zhengdejin5@gmail.com/
> 
Wolfram and Michal, Thanks very much for your comments, I will resend
devm_platform_request_irq() again. 

BR,
Dejin


