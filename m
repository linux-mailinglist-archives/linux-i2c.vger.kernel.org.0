Return-Path: <linux-i2c+bounces-5338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D25950688
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 15:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E38B7B21689
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6938F19B3E1;
	Tue, 13 Aug 2024 13:32:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A041E517;
	Tue, 13 Aug 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723555973; cv=none; b=Zst2lApAfUj8Fk2kaEbpkjerhf8+zE+Mac+ShX0lHMLk5zf1d2Ibwqo2Z42g4TFxeu6hiEkMAacgr6eJhYmooVuN1sISbw5VPr9woexcOzsJiElERhX4O3VW5zRSp9ZERUYBPxP0nq2+vUcSPTCd6YSP7dyCikVVvwRchxMuTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723555973; c=relaxed/simple;
	bh=q0f3s8C+w6gFHW9rQgBtdyv9AkulcqMJnxrASxFgx2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmxHjHtH6WKVHbdQ3a/p8HQOhEPCiPadfiR9XeQQ+/wKDqlpSlM7SzaGsY/8GWH3oeTrFWhpcVWiHAVhgC1tOfjdcEb3PBUsMw1zudTwGwePLoyZ3+kVfnG9pH6FIGUhNBF/rlN5Zx2QLsD+J16SgLva3JnxAg614FdGMGYORIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so10337630a12.1;
        Tue, 13 Aug 2024 06:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723555970; x=1724160770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epsK62fLlKIcu9yHQhnXJ//JRyvJEjXogoukWxR8MKY=;
        b=X2fmqLfq5uXYidvKn2T3rL6yLCEuus7LUdryZFLtgl3x5UJo1i6jIVQwXuRwgh3H9N
         wLCLDWdb/NJRSIzmVNiQpmEtUYs9WAlpWJSNr2xrrL1U6dpHioiKL40lPAA3420jVP2N
         WCMZADaGISWPh0f6kw6SalS5udCFgfnayBOXT1khpP7dOzna25iP7QLOPIVGvVKOOOkm
         XfxI4o/fhksM7OSB/mj1RWw8E+Hr8hRI1v/Nuf6RR9UuNqNqAU0KQMD6HELn/RWuAnPd
         dJ+oPppO8isd601SUU/gHvQjozpUjA7j5GO1E4MPruUyLAns7IO4kd8m3PfcHIuJ/UIE
         V55g==
X-Forwarded-Encrypted: i=1; AJvYcCV35a85r6y41VwAmLz+fG60r8w6RClv1lpCdnKN9I61toe8QOSIGBosNhjUYDPOHfbsxYOAZ1pJQ8KT0OPGLUqWzu9hZT+iO/YSHmI6vANMfr0rnlDyxQiTNpSPNGvXXPL/JxHwEaCdGeoQKkYWCI7cfl9Svq31+fRZIWG0CXsoxw24YqI=
X-Gm-Message-State: AOJu0Yya5y+wjiQuUnFtNZpVfAaB5UHJOG5faHXVwvqjeJBCr+xZ2cH3
	p3NCmadDE2iWrwNY+lmnK4I+K1/a+o5kPVAq7lcLuFUMlvcEQ0tm
X-Google-Smtp-Source: AGHT+IHdcgoO700Tt+PAinCiGtz7kDD7cKzFzIvM1FE3Iov0eh7VTjP13G/OMHk/oyb1MtWQgfOsoA==
X-Received: by 2002:a17:907:c1e:b0:a77:d9b5:ad4b with SMTP id a640c23a62f3a-a80f0aa1b3bmr297311466b.9.1723555969294;
        Tue, 13 Aug 2024 06:32:49 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-114.fbsv.net. [2a03:2880:30ff:72::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bbfcsm70139666b.135.2024.08.13.06.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:32:48 -0700 (PDT)
Date: Tue, 13 Aug 2024 06:32:46 -0700
From: Breno Leitao <leitao@debian.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	dmitry.osipenko@collabora.com
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
Message-ID: <ZrtgfkzuCbNju3i9@gmail.com>
References: <20240808121447.239278-1-leitao@debian.org>
 <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>

Hello Andy,

On Fri, Aug 09, 2024 at 02:03:27PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 9, 2024 at 2:57 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Aug 08, 2024 at 05:14:46AM GMT, Breno Leitao wrote:

> > > The problem arises because during __pm_runtime_resume(), the spinlock
> > > &dev->power.lock is acquired before rpm_resume() is called. Later,
> > > rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> > > mutexes, triggering the error.
> > >
> > > To address this issue, devices on ACPI are now marked as not IRQ-safe,
> > > considering the dependency of acpi_subsys_runtime_resume() on mutexes.
> 
> This is a step in the right direction

Thanks

> but somewhere in the replies
> here I would like to hear about roadmap to get rid of the
> pm_runtime_irq_safe() in all Tegra related code.

Agree, that seems the right way to go, but this is a question to
maintainers, Laxman and Dmitry.

By the way, looking at lore, I found that the last email from Laxman is
from 2022. And Dmitry seems to be using a different email!? Let me copy
the Dmitry's other email (dmitry.osipenko@collabora.com) here.

> > > +     if (!IS_VI(i2c_dev) && !ACPI_HANDLE(i2c_dev->dev))
> >
> > looks good to me, can I have an ack from Andy here?
> 
> I prefer to see something like
> is_acpi_node() / is_acpi_device_node() / is_acpi_data_node() /
> has_acpi_companion()
> instead depending on the actual ACPI representation of the device.
> 
> Otherwise no objections.
> Please, Cc me (andy@kernel.org) for the next version.

Thanks for the feedback, I agree that leveraging the functions about
should be better. What about something as:

Author: Breno Leitao <leitao@debian.org>
Date:   Thu Jun 6 06:27:07 2024 -0700

    Do not mark ACPI devices as irq safe
    
    On ACPI machines, the tegra i2c module encounters an issue due to a
    mutex being called inside a spinlock. This leads to the following bug:
    
            BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
            in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1282, name: kssif0010
            preempt_count: 0, expected: 0
            RCU nest depth: 0, expected: 0
            irq event stamp: 0
    
            Call trace:
            __might_sleep
            __mutex_lock_common
            mutex_lock_nested
            acpi_subsys_runtime_resume
            rpm_resume
            tegra_i2c_xfer
    
    The problem arises because during __pm_runtime_resume(), the spinlock
    &dev->power.lock is acquired before rpm_resume() is called. Later,
    rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
    mutexes, triggering the error.
    
    To address this issue, devices on ACPI are now marked as not IRQ-safe,
    considering the dependency of acpi_subsys_runtime_resume() on mutexes.
    
    Co-developed-by: Michael van der Westhuizen <rmikey@meta.com>
    Signed-off-by: Michael van der Westhuizen <rmikey@meta.com>
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85b31edc558d..1df5b4204142 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1802,9 +1802,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * domain.
 	 *
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
-	 * be used for atomic transfers.
+	 * be used for atomic transfers. ACPI device is not IRQ safe also.
 	 */
-	if (!IS_VI(i2c_dev))
+	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);


