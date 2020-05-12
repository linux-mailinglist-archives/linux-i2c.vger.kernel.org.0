Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4171D007F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 23:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgELVO3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 17:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELVO3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 17:14:29 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA61C061A0C;
        Tue, 12 May 2020 14:14:29 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id v128so2724751oia.7;
        Tue, 12 May 2020 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mX8ky5JN8pgBa+YKDvrjatRwVe22JYdHF5VmHIVTBlE=;
        b=iV2RPOe2FrnU+h8+Up/ExtrRpnFvfhk+w+IzXzJ1UdFrcVHhC8Q2KU+oNoZrgCVVVj
         UfWmpR8Xrv6YcwnZD7Q/sg/X8UlJpMIXb4/5VzUTAvEDFkYqpOT1/7IALm93B646bOGP
         RQf8yWvZRpLlmbdgE3IgHH1sGeGCbD0y3zslRYAujjoQtxn36UV5NCsTnuQIJzBiN+VL
         ILuab/8Rs5aitKxV6no/fefi31Y4PLJPcDQxnWtGw2NYAKnq/7HgawJVyuFY+NFaMxUN
         pYlfguUMgdRyGrFSjS+3VGExqgpGKsu89IK8ReVUAaE2X5L5B3RneXsIckDYZ5C0d4n8
         kxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=mX8ky5JN8pgBa+YKDvrjatRwVe22JYdHF5VmHIVTBlE=;
        b=Pvcg0aLazuX5z23YN0PVn6rrnCB6Zolr5L5NW4Lnh70NYyVX6NJaaQMCBDT9biJPG3
         a2pvodkeXKEg05lt9UgwTeuFx+F/LB6H74N5UlHaeL7j9XJcqSsy+F/CHpRbcG/Moa2K
         NGMY3BABmwAl/Wd70jKicsjAdUwnsyc+Llnd95UgjmZggKbwSVxiM8QW1/YnfdhtIGaA
         YcBSzl8ZqqQko78Gtg6rgQZkx36C1ISKMSiBzVCEyodzFezIaYNjZ0qBp0kQoSdS1ZwS
         5mOl4puBgsb2ESrPH5iPHciWZDVjGK3acVpqF4yoCmM307Vk+RVe4g8z5IS/XPTO3HIp
         nqdw==
X-Gm-Message-State: AGi0PuY+mvCuT/nSTj06dc/XWPlzmj0EehJim7fhHrL5yV6gFBw2Ibvp
        nxhH1w50OFvfYu2bQybcGw==
X-Google-Smtp-Source: APiQypJN7RiCdIUjHWyYpUVmDqReWQY+dqrjR9QQhXITyIFORnps2wrSQiLn3qpmQpwZwzhff2vhDg==
X-Received: by 2002:aca:4ac3:: with SMTP id x186mr16258452oia.81.1589318068467;
        Tue, 12 May 2020 14:14:28 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id d19sm2168689ooa.48.2020.05.12.14.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:14:27 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
        by serve.minyard.net (Postfix) with ESMTPSA id 7C54C180051;
        Tue, 12 May 2020 21:14:26 +0000 (UTC)
Date:   Tue, 12 May 2020 16:14:25 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200512211425.GQ9902@minyard.net>
Reply-To: minyard@acm.org
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API.

Well, I should have looked a little closer first... comment inline

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/char/ipmi/ipmi_ssif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 8ac390c2b514..2791b799e33d 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1945,8 +1945,8 @@ static int ssif_adapter_handler(struct device *adev, void *opaque)
>  	if (adev->type != &i2c_adapter_type)
>  		return 0;
>  
> -	addr_info->added_client = i2c_new_device(to_i2c_adapter(adev),
> -						 &addr_info->binfo);
> +	addr_info->added_client = i2c_new_client_device(to_i2c_adapter(adev),
> +							&addr_info->binfo);

i2c_new_client_device returns an ERR_PTR, not NULL on error.  So this
needs some more work.  I'll send something out soon.

-corey

>  
>  	if (!addr_info->adapter_name)
>  		return 1; /* Only try the first I2C adapter by default. */
> -- 
> 2.20.1
> 
