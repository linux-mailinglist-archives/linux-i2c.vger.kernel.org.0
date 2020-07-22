Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BC122940F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 10:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgGVIxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 04:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgGVIxL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 04:53:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E50AC0619DC;
        Wed, 22 Jul 2020 01:53:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k1so818346pjt.5;
        Wed, 22 Jul 2020 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ka/5B4XRoVBmAt67iPN2Z7sgxTFm48YODme+2RimFZE=;
        b=s87Z385hZ5l+b/oIspabCEyqUEkKhQIX9Wi1g6CN5r/JNB/21zVc6tOvcl0oGU/2TD
         Z8kDRye9okGm1naX3gouEQEEga5gL+JG7U8E2PPOEMmkg38RmacKXJzdIziq3/6wGIrr
         Aoe+msfaONNAq1j2rjQrUcNp3aruR7G6Wv0ucg1o9NOpdcZRR58lef0jE9Fz26orzynH
         /5Coy0NXwu9cFTmSNNEYEjU0DA1YdXG9+ixBE6Vj6jo8iSSsecFsz1xomgrxa4VhSDF8
         t92CIABEwTp+IxUgBDPme+XbXH4Ig8z+8Y5Q7Nqjr2CqsEXwjOemP4xa+ccigTddWaXY
         SD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ka/5B4XRoVBmAt67iPN2Z7sgxTFm48YODme+2RimFZE=;
        b=EpD8P3WsOKKfzB/Pc2RsNbZiViTCWLwNTHwR69OFurIVMuKFqJs3zYBvJS2qh9gPIA
         705DgoOFW8rQjYgZp4uxm+i1MQnQypEuW7oJiAii86hLdoeCjvkPelcXwd3F7r6D+ICb
         bpdmjh7TTnFByI1V8cQ3GUmCIP/npgFOUbEGrhdlC6wBvh9z7P1roa3BiN0BwYhP1c0p
         ym6teo3l+7I2LiY1DaDkDFCen3ciw3WfwfHgs53JNA1KTCDCyY9hp7CAM6yOWSKgE2AE
         Rrc/EfZmCG3zm7f735BPD0ViUeIDv5+WbN/r5ukgT/L/u4eIkxT+fnj6dwRLvQuW4a1s
         Bgyg==
X-Gm-Message-State: AOAM530pNDAPhgyyBRFb1SqxUFNV4dBzRpcxqWz+eRL1cPhTQUFQlwFH
        MkL4pul2Qs10iJ8qkJlIPSfH7LK+Fb8JMWlq1F0+fvXJ
X-Google-Smtp-Source: ABdhPJxz0ZAJ0aHy5furHHpzY9F5tAklILXmF9Mb3Ra2G6CiJicgkp19/NfrXFg7rW6Ht6NEGCeYyxG8FMpQUaTeEOY=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr25751245plv.255.1595407990982;
 Wed, 22 Jul 2020 01:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200721233814.GA3058@embeddedor>
In-Reply-To: <20200721233814.GA3058@embeddedor>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 11:52:56 +0300
Message-ID: <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
Subject: Re: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 22, 2020 at 2:48 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Perhaps you may do it as Link: tag?

> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 8522134f9ea9..55c83a7a24f3 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -90,7 +90,7 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>         switch (pdev->device) {
>         case 0x0817:
>                 dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> -               /* fall through */
> +               fallthrough;
>         case 0x0818:
>         case 0x0819:
>                 c->bus_num = pdev->device - 0x817 + 3;
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
