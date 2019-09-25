Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C43BDE7F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 15:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405839AbfIYNEu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Sep 2019 09:04:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43319 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405791AbfIYNEu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Sep 2019 09:04:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id v27so3183198pgk.10
        for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2019 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zVxRPQ90qFcVa5LrwP3xfzVW4n2lVkDSv3vxIakrKU0=;
        b=sTjouQxVMpUz3p0DaHlR7sDLkSk8r4PhKkrwWoj0WNlmZkfsyeFB9rSIBu2WjAXPbH
         D5fkeH296WYSBCVogQcl1FQv/jBweC/K2FYfxXxtFWn09EpioqzfL2TRerwg4zmU22X2
         8Ey0j+pRugK9eSnavUcq4vEj9a7mn/Sp3aNwkvSTBigG3dOaPAJYrM9nrr7lkmU85xXh
         eB5Ld/8eFtbPS05yFnMhsMGn5PFR95yATOp5xrvNZea7ZjZIdzOLnAMx4e/vwuq458zx
         8P07mwoDBxCVGG+qU0YjdpCtCtqNdgQHPNKy9rpp6a760OxFXwrsKzFtFt1RNKKaMYT6
         zL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zVxRPQ90qFcVa5LrwP3xfzVW4n2lVkDSv3vxIakrKU0=;
        b=fNNPxxEZi6+c/e7szaIg9SbvXa6DaUbxUzEQVtjX0yMMocAPLNo9YcUpToheRLyP+H
         o1aHLEgymeGnIeiPls/w+FUP93BvQB0hWYSCV4dhopQ1jpT+nqH1csVFwZkNT59dLAJD
         7Y6nhmq7N5BCoUd2Erx/1f9W/qcIfqtkA0AbqjwM68vomxXcSzWCi8gJP9Mm6ITqxbGD
         Ryi9Htz/JFL37yPsOAPIFb7SA63LByoUL8DDZN2TmCZ8RjGiHsKOKjlS8pS/k6iZ9eUs
         O6m7+m5tZthl+QRdM9vj1/wggr0jcU8aPZ3OLtdU4cJuWXMqCa2w7nIBIQ5XNu/QiTI2
         qVeA==
X-Gm-Message-State: APjAAAU4eTsKQYrCeyElTKPPPDXVRo5UO0gM68MtgTulNb1gwnVrSHu5
        2RwPdwpQMTZJ/17gtj6tdbaf+/4its8=
X-Google-Smtp-Source: APXvYqwwEt7mIPVzgCV7FCT41UGPyaHJ4qAoK6rEv+4XLIYfGLUboUFJvST6p56vfD+Dv3z19UK2bQ==
X-Received: by 2002:a17:90a:ff18:: with SMTP id ce24mr6225746pjb.123.1569416689732;
        Wed, 25 Sep 2019 06:04:49 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id y2sm8228333pfe.126.2019.09.25.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 06:04:48 -0700 (PDT)
Date:   Wed, 25 Sep 2019 23:04:43 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Convert parameter to __le32
Message-ID: <20190925130443.GA19073@gmail.com>
References: <20190921125804.GA10910@gmail.com>
 <20190922132502.GA18273@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190922132502.GA18273@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 22, 2019 at 06:25:02AM -0700, Guenter Roeck wrote:
> On Sat, Sep 21, 2019 at 10:58:04PM +1000, Adam Zerella wrote:
> > The assignment of `serial` is using le32_to_cpu() without
> > first converting the parameter `dev->ibuffer` to __le32.
> > 
> > This produces a Sparse warning of:
> > 
> > `warning: cast to restricted __le32`
> > 
> > Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-diolan-u2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
> > index 382f105e0fe3..32de47eda950 100644
> > --- a/drivers/i2c/busses/i2c-diolan-u2c.c
> > +++ b/drivers/i2c/busses/i2c-diolan-u2c.c
> > @@ -289,7 +289,7 @@ static void diolan_get_serial(struct i2c_diolan_u2c *dev)
> >  
> >  	ret = diolan_usb_cmd(dev, CMD_GET_SERIAL, true);
> >  	if (ret >= 4) {
> > -		serial = le32_to_cpu(*(u32 *)dev->ibuffer);
> > +		serial = le32_to_cpu(cpu_to_le32(*(u32 *)dev->ibuffer));
> 
> This doesn't make sense. Converting the data from cpu to le32 and
> then back to le32 would be a no-op, not a conversion, and the code
> would then be wrong on big-endian systems.

What I was trying to achieve was to resolve the semantic warning that
Sparse was generating. I figured if serial le32_to_cpu() was expecting
a __le32 variable type then it would be ok to convert it, looking at
the code a second time I see my mistake, BE systems would be hella 
confused.

> Not that it matters much here - it would just display a wrong serial
> number. However, if you are making that kind of changes elsewhere to
> the kernel, you are trying to mess it up really badly.

I'll admit I'm trying to get into kernel development and have heard Sparse
warnings can be something to fix, though I might ask around on
kernelnewbies to clarify my understanding on what I'm doing :)

> Guenter
> 
> >  		dev_info(&dev->interface->dev,
> >  			 "Diolan U2C serial number %u\n", serial);
> >  	}
> > -- 
> > 2.21.0
> > 
