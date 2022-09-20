Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41505BEB13
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 18:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiITQYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 12:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiITQYw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 12:24:52 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64FB73056E
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 09:24:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so2994055pjo.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6gVYvFcz3HJ8Ur/Jc505NNOjoEZfULZsJ3zBfdb4mwo=;
        b=Xuvfpt5pdS6sww8q8x+rsruT4pezEx/lnYyQufNt0xGBfFVy5CHWOY419fhBCxJUlr
         vtjnX9Hh5rsZH/nVQDA6qMSKNZHvkdn+7rwajdKVMr3bfLPUerLGl6WcfVh90KTRteQC
         L7emWJKfFo20lx5EI8eLdkC5gkw43GwWXkFE5Rpn2m3IgaGzdRwIjC7El7j9c/e+IJgR
         lb++2XMs2AkYpe0YUGJEtKuLxlX3fulrYDNxEG7XK30YlTOq/5syI344eqAnvE3ICNgs
         rsbFKFuwrIwv1TB20M6YAJXz7j39VqCW3TmjNgfO08DrL71HtlPKk8kk4rOVLTiob4Lb
         kb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6gVYvFcz3HJ8Ur/Jc505NNOjoEZfULZsJ3zBfdb4mwo=;
        b=zxqVLm272q3ZTj3uxqYEeCmHINjPOZwHEA4mdbMtIhdsJ2sh9ZqgRO6VzUX8jFuYZg
         mYRdkZqscXsC1YR2gQsnRhhNY+LGJeIp3BZvdE5quia0f/EouZwW5/3tpufne3vj77U2
         wiy7Il50+EwSorZAbKyYYlqYOhY5nx3c8gTEW51ZuK9F8LYiXLA5Tyd2nSrb8LYiFFbi
         vKOa9dng5urqG/GbkbK2IDVglxzztL04NBQyKAugGVM8/fQCxNeQXqu8jTjQw+UUFqsu
         qucQXTkQg0zWoCg9hrUMl8hY16UuMiB6xznZK3nD7BrzNc5fAD0MPj65o0hakzWO2kGV
         voKA==
X-Gm-Message-State: ACrzQf1rfxvikneXFbIZIxfgr+ouUrt379s8sa/NROMsto45S8tbsMpP
        eaTvkdRzKZoUr6YIO9mjP8rqrdBtn0zTPnlSuxEPig==
X-Google-Smtp-Source: AMsMyM4H+L/I1RktijKVCOwPL/mNrKvqurBBAh+pYZhRCNaRSsgjEHouzXkRkSLCk7Zdt6DA1KO87JJ6q2WLApASCFA=
X-Received: by 2002:a17:90a:fd8c:b0:200:8cf9:63f4 with SMTP id
 cx12-20020a17090afd8c00b002008cf963f4mr4671916pjb.201.1663691090876; Tue, 20
 Sep 2022 09:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220916131854.687371-1-jsd@semihalf.com> <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
In-Reply-To: <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 20 Sep 2022 18:24:39 +0200
Message-ID: <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

(...)

> > @@ -303,6 +303,7 @@ static int amd_cache_northbridges(void)
> >
> >       return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(amd_cache_northbridges);
> >
>
> I feel changes to amd_nb.c/amd_nb.h should stand on their own patch in
> the series rather than being in this patch.

I was thinking about this initially, however I wanted to avoid a
situation where we are exporting a symbol without actually using it
(since this will be done in consecutive patch). It is also way easier
for me to explain why I'm doing this in the context of
i2c-designware-amdpsp.c changes.
That being said, if you think this should be a separate patch, that's
fine with me - I don't have that strong feelings about it.

(...)

> > @@ -31,6 +30,10 @@
> >   #define PSP_MBOX_FIELDS_RECOVERY    BIT(30)
> >   #define PSP_MBOX_FIELDS_READY               BIT(31)
> >
> > +#define PSP_MBOX_CMD_OFFSET          0x3810570
> > +#define PSP_MBOX_BUFFER_L_OFFSET     0x3810574
> > +#define PSP_MBOX_BUFFER_H_OFFSET     0x3810578
> > +
>
> Just in case these offsets change for a future program, I think you
> should leave a comment here on the two APU programs they're valid for in
> case you need to special case it later.
>
> Another approach is that you can have a lookup function and match some
> PCI device like the root device or the CPUID and then when another
> program comes along explicitly add it to this list.
>
> This is what is done in drivers/platform/x86/amd/pmc.c for example.

Yes, I see your point. I assumed that this will _not_ change and the
new APU will just work out of the box - without a need to introduce a
new ID to the table.
Bad thing with my approach is if this _will_ change, then it may not
be that obvious for the developer what the issue actually is.

Considering your next comment - new PCI ID will anyway needs to be
added to arch/x86/kernel/amd_nb.c - let's be consistent with this
approach and I will introduce a list of supported CPU IDs.

>
> >   struct psp_req_buffer_hdr {
> >       u32 total_size;
> >       u32 status;
> > @@ -47,14 +50,8 @@ struct psp_i2c_req {
> >       enum psp_i2c_req_type type;
> >   };
> >
> > -struct psp_mbox {
> > -     u32 cmd_fields;
> > -     u64 i2c_req_addr;
> > -} __packed;
> > -
> >   static DEFINE_MUTEX(psp_i2c_access_mutex);
> >   static unsigned long psp_i2c_sem_acquired;
> > -static void __iomem *mbox_iomem;
> >   static u32 psp_i2c_access_count;
> >   static bool psp_i2c_mbox_fail;
> >   static struct device *psp_i2c_dev;
> > @@ -64,47 +61,43 @@ static struct device *psp_i2c_dev;
> >    * family of SoCs.
> >    */
> >
> > -static int psp_get_mbox_addr(unsigned long *mbox_addr)
> > +static int psp_mbox_probe(void)
> >   {
> > -     unsigned long long psp_mmio;
> > -
> > -     if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> > -             return -EIO;
> > -
> > -     *mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> > -
> > -     return 0;
> > +     /*
> > +      * Explicitly initialize system management network interface here, since
> > +      * usual init happens only after PCI subsystem is ready. This is too late
> > +      * for I2C controller driver which may be executed earlier.
> > +      */
> > +     return amd_cache_northbridges();
>
> When a future program is added even if SMN addresses are the same and no
> special casing needed there is an implicit dependency on the PCI IDs
> being in arch/x86/kernel/amd_nb.c now.  In order to make your life
> easier to debug in the future, suggest that you capture the return
> variable and emit a specific error message if amd_cache_northbridges()
> fails.

Very good point, thanks!

Best Regards,
Jan
