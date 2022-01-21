Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805BF496039
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 15:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350862AbiAUOBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 09:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350404AbiAUOBe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 09:01:34 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B847DC061574;
        Fri, 21 Jan 2022 06:01:33 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id a18so43027442edj.7;
        Fri, 21 Jan 2022 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9LTBp5vkY79duEpNu6aTdNwyNfzwBSGPXSUUTrcyFG4=;
        b=F4JVFEjginla84nSrVB5uLEpIThaFDl+gxjJZP32sGhdXxF0CJ0zBG29I4Pfg7QO/2
         AhC02R1HSQVVhAAvzpR8X/IZxL22pEba5A+HRJ3L6oCFcv/khgsGTvdXZ+b3dbBlvOYF
         EcQVUfKvxJGtbRBze/jzV9xjPoWoHYp41nghMF/jt6/nhpZ+3b87rr38gAtSJ4f5B+PU
         15R/gli/wB4At9nacP5l533FDvnseTYLVchxBjGvI5MKEPy+EpMXIVf3M/jy9kMYYETq
         nQfx1GKb3WBGnkPXg85sy7irQGVXf2izbquIGulEa2XzgpjSwbxHKNatbWUchNQQhwES
         reLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LTBp5vkY79duEpNu6aTdNwyNfzwBSGPXSUUTrcyFG4=;
        b=2bmxfFjuTvYqwojtFo97G4pYBm3/Y//9ruS1EZusf2u2RgZDPm32a6PZWwdyf23C/e
         +biw+kcIqzOydIGLLmjTADKUkzxJpfc2gx234bCxpUXVFrkAx9GG3lktm5Lc3h8kih1t
         oHV+wF1eMseiKqPkspZcj2RqFvcX9viBLcsFJ4iJKB3FnijINUGVVLLdo96qD/04z6wv
         GV9ggaq0VP7RwC6c3X2R2ln0BfMSPBi+jlDYVZgN3CB3F3Ll5/QwiAVN045CGIhmIMLv
         070s7/71va737uJ/Gu5SY2qYARefY2VDATYm38RRwa9Y2NBKqpuJ9JhYZErLODREWq5i
         qshQ==
X-Gm-Message-State: AOAM532rhfSi/kh0lF87J2/GJqrEwtQWy1cpnpjFFM3McWhrHWcbNXsi
        04RdPxJ6CI4pLSVpKa/1pmFlc3Z7+rKDIrq2DBU=
X-Google-Smtp-Source: ABdhPJx5Pp2UzuQirEk8OyBqp3klASmn+aLZNa86EMZpGcFkwKTxbxRjbCTLpfigsTUFJulER0Wggx62vOT3C9vIViw=
X-Received: by 2002:aa7:c0c9:: with SMTP id j9mr4307547edp.270.1642773692183;
 Fri, 21 Jan 2022 06:01:32 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VehSCxszDV3UQCEnPk7OCXRabRMJEStjpCamBG6X1iaCw@mail.gmail.com> <DM5PR12MB18501911339A0274CBE20BB4C05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB18501911339A0274CBE20BB4C05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 Jan 2022 16:00:56 +0200
Message-ID: <CAHp75Vcs3raid6rHk0AJOomgSKJ1T-cF_qbcq_Yksitz_sE=3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 21, 2022 at 2:50 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> > > Added details and example for named interrupts in the ACPI table.
> >
> > Added details and example for --> Add a detailed example of the
> >
> > ...
> >
> > > +            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
> > > +                0x20,
> >
> > I would think of splitting this to two separate entries in between of which the
> > GpioInt() resource is provided. It will explicitly show that you describe the case
> > only for Interrupt(). Something like
> >
> >   Interrupt (...) { 0x20 }
> >   GpioInt(...) { ... }
> >   Interrupt (...) { 0x24 }
> >
> > But it's up to you.
> Instead, would it be good to add a statement mentioning this explicitly. Something
> like -
>
>     The interrupt name 'default' will correspond to 0x20 in Interrupt()
>     resource and 'alert' to 0x24. Note that only the Interrupt() resource
>     is mapped and not GpioInt() or similar.
>
> I feel mixing these in the example would add a bit of confusion to the reader.

That's why I added "up to you" in my previous reply. I also thought
about the example being a bit confusing for a reader who is
non-familiar with the ACPI.

-- 
With Best Regards,
Andy Shevchenko
