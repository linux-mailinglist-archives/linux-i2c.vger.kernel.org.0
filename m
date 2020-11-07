Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2908D2AA422
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Nov 2020 10:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgKGJHL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Nov 2020 04:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbgKGJHK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Nov 2020 04:07:10 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B77C0613CF;
        Sat,  7 Nov 2020 01:07:10 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id ie6so634447pjb.0;
        Sat, 07 Nov 2020 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RW4r/t8cWsM2QI2eaMKZPfD/c5BaeuF1WMlenTu7Oxo=;
        b=SN9s+ArdbfrEYSu1VlGpsgxbFE/wnSAOocVWaTB1sr99W4UcBdABbJhHO2d8ownBOm
         Bx0bBtlUEY5B1tgcLM7+9PBLvPZ6TqKLHHAN+le48nB2QY3svSK4QgOCeFilmCKK6StH
         WgvyQutyQSw52pKvR1acUPbxIqAa+yrgYpwBhbZ3sTXElXThpBFNSqYYquwM9PK42G77
         0gJz5EJREETkdkaFZfnsd7Mbe3RfJYZE5Kd0UY67+fQcXcEK5jUoNv44n7jenZDOiAqY
         8N7k11o8GzUmbLVbs0CqnedXDP7a0Gmmsp4VEQlLbFKcYL9E+QmcnAhz3Fvbycfwg9+E
         mM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RW4r/t8cWsM2QI2eaMKZPfD/c5BaeuF1WMlenTu7Oxo=;
        b=GTWxrp9mAJ0Czs3lZVECCtKbD6ox9f1YjCj0b6HSjcoSb0B3qlojV9NN/klmHCYFjx
         bADuF+2UQQetqQFjJnd3b0kTIpTX65/78uo2Me+C22OIwX/wqDGZeqdvM0Z+lXKfhdVS
         GRV0w+rilkmldSJ+UASqWoUEMt6e9BK2X5HifjtEJ0xeWUdfmvSV8Nr7EviIuB6OP/2i
         kXDXqYhZr8HBbv9yAXyF23YZ4VlYwbLchBg4z9UvkgKZroe6A91phnbe/DBywlax2UC2
         LQUuYLhQ8wcksuuFqRRShtwalguc/N9Ud8ldktxSwWWjWjmni/hmKPLc++yHW+DJF0GP
         T3dA==
X-Gm-Message-State: AOAM531XyH8WB29VDoTfcufFIzdcMrWIW9KBRWmxLI4/8GDMxU2e09Y0
        xVd6O1u0S6argrXMC4cmScg=
X-Google-Smtp-Source: ABdhPJyxufHOqc6m6gxXEsP3lbi1HPHz0P0D9ZPKMkKjXG/fFxl+ZWkJoLKLOAcz6wV4DPfVcc/mww==
X-Received: by 2002:a17:902:728f:b029:d6:fcbe:99c5 with SMTP id d15-20020a170902728fb02900d6fcbe99c5mr4903814pll.20.1604740029581;
        Sat, 07 Nov 2020 01:07:09 -0800 (PST)
Received: from gmail.com ([223.179.149.110])
        by smtp.gmail.com with ESMTPSA id t85sm4098072pgb.29.2020.11.07.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 01:07:09 -0800 (PST)
Date:   Sat, 7 Nov 2020 14:34:42 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
Message-ID: <20201107090442.GA107675@gmail.com>
References: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Nov 07, 2020 at 01:51:51PM +0530, Vaibhav Gupta wrote:
> After the commit c5eb1190074c ("PCI / PM: Allow runtime PM without callback
> functions") we no more need empty stubs for runtime-pm to work.
> 
> The driver has no device specific task(s) for .suspend() . The stub was
> placed just for runtime-pm, which can be dropped now.
> 
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/i2c/busses/i2c-nvidia-gpu.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index f9a69b109e5c..6b20601ffb13 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -353,15 +353,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
>  	pci_free_irq_vectors(pdev);
>  }
>  
> -/*
> - * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
> - * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
> - * Documentation/power/pci.rst also insists for driver to provide this.
> - */
> -static __maybe_unused int gpu_i2c_suspend(struct device *dev)
> -{
> -	return 0;
> -}
> +#define gpu_i2c_suspend NULL
>  
>  static __maybe_unused int gpu_i2c_resume(struct device *dev)
>  {
> -- 
> 2.28.0
> 
The patch is only compile-tested.

--Vaibhav
