Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDD315008D
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 03:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgBCCZc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sun, 2 Feb 2020 21:25:32 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55338 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbgBCCZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Feb 2020 21:25:32 -0500
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1iyRQZ-0001fj-68
        for linux-i2c@vger.kernel.org; Mon, 03 Feb 2020 02:25:31 +0000
Received: by mail-wm1-f70.google.com with SMTP id p2so3419836wma.3
        for <linux-i2c@vger.kernel.org>; Sun, 02 Feb 2020 18:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MCdHi1sSzeqjuGVNoILQw+c9Cnh9dsR9P/24qc/D4sU=;
        b=HWmlmFr+WsyD/SyoTByo1aVbPI7j3CNCsbv+EVMn9JULTd+2dAStXHLyUnUcthYFhu
         TDrBlu+Iune3gU71IYt7ku90IcqSFiImfkSS0a3abuXJ1g+FAADiSd5Qtb1bjHQKlxBu
         jAy4f8BXiMatMz8v1E42vRBSahcag+eGb1wOGxs4XTFG4eYWUEerO3ajSYITiia4Y4nz
         /8YPConAKJTuPDia1LWIMuMfPdGygaQAbQ6B27aqJ9tCvz6VNY9rSQlnjBJTWNcpO4bx
         kyDC2gvyK1LsqYpiO8v++FFogH1449EY08EiRTsxTnvpFs4t9CjMm2IM7GpzA456Ny6H
         V2tA==
X-Gm-Message-State: APjAAAWxJvItGJjaDuK06xWbukW2FSrSaDpyDtxhEcLt8IslAoUJ07fF
        FgfVPBUKgGpI269W7aGw+wsH+cL4ywVBxM5p576n6WcXnGmxEmrAKAXsyfIkfjCFFrvqx5ECBXS
        fTKTaHyqeL6YMwH2lltIIfBeJJuBZceHoYqwToISCWtao6vkgFSzvOw==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr11767686wrm.66.1580696730685;
        Sun, 02 Feb 2020 18:25:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzoLmEWiXTmzV9lC917U2/awTmLJYxJMgyNibw8uLNORMr/aj8uSVK7ST9/Mi+QNPtomJnWwY9BjD8gbi/PfFA=
X-Received: by 2002:adf:cd11:: with SMTP id w17mr11767673wrm.66.1580696730463;
 Sun, 02 Feb 2020 18:25:30 -0800 (PST)
MIME-Version: 1.0
References: <CAFv23Qnh2AD-Mgr=v1Ojxaob4aBjUTD+-oLdmyXzBPe0oS6vtw@mail.gmail.com>
 <BYAPR12MB27274DD4157E0CC0EB26CD98DC0E0@BYAPR12MB2727.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB27274DD4157E0CC0EB26CD98DC0E0@BYAPR12MB2727.namprd12.prod.outlook.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Mon, 3 Feb 2020 10:25:19 +0800
Message-ID: <CAFv23QmEh4mCT6JX50OFnAGN=Zwt27OCPprKZ5ZrRKccJ+0FWA@mail.gmail.com>
Subject: Re: In power saving mode i2c_nvidia_gpu modules affect power
 consumption a lot
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ajay,

I tested it with  v5.5-rc1 kernel at that time.
After i2c_nvidia_gpu is loaded, it stuck PC state at PC3 during short idle.

Please let me know what kind of logs you need or anything you want me to try.
Thanks.

Best regards,
AceLan Kao.

Ajay Gupta <ajayg@nvidia.com> 於 2020年1月25日 週六 上午3:51寫道：
>
> Hi AceLan,
>
> > -----Original Message-----
> > From: AceLan Kao <acelan.kao@canonical.com>
> > Sent: Thursday, December 19, 2019 4:53 PM
> > To: Ajay Gupta <ajayg@nvidia.com>; linux-i2c@vger.kernel.org
> > Subject: In power saving mode i2c_nvidia_gpu modules affect power
> > consumption a lot
> >
> > External email: Use caution opening links or attachments
> >
> >
> > Hi all,
> >
> > We encountered an issue that while switching to power saving mode(use
> > iGPU), the power consumption goes up to 40 Watt, and after removed
> > i2c_nvidia_gpu, it becomes 5 Watt.
> >
> > I've tried to check the driver to see if it can tell it's under power saving mode
> > and found that the first time you call gpu_i2c_check_status(),
> gpu_i2c_check_status() is not right place to check if driver is under power saving
> mode. You can check lspci output and looks for "Status" field in Power Management
> Capabilities.
> gpu_i2c_check_status() reads I2C_MST_CNTL register to know the status of i2c
> transaction (START, READ, WRITE, STOP)on the bus. This register doesn't have
> status of power saving mode.
>
> > it got 0 from
> > readl(), and the second and the following readl(), it returns 0xe0000000. It
> > looks like an error code combined with I2C_MST_CNTL_STATUS_NO_ACK and
> > I2C_MST_CNTL_STATUS_TIMEOUT.
> A value of 0 means last I2C transaction on the bus was successful.Value
> 0xe0000000 means I2C bus is still busy doing the transaction
> (refer I2C_MST_CNTL_STATUS_BUS_BUSY).
>
> >
> > Moreover, i2c_nvidia_gpu module seems depends on intel_lpss driver since it
> > provides i2c interface. So if we can to use the above behavior to check its
> > status, the system have to load intel_lpss first. But currently, it seems not
> > possible to load modules in our order.
> >
> > So, I'm wondering if we have other method to check and not load
> > i2c_nvidia_gpu module or if it's possible to check why loading i2c_nvidia_gpu
> > affects power consumption a lot.
>
> Which kernel version do you see the issue with?
> Power management related changes were merged in mainline kernel v5.3.
> If you are using older kernel then need to pull runtime PM related patches
> from latest kernel.
> https://marc.info/?l=linux-usb&m=155994544705901&w=2
>
> thanks
> >  nvpublic
> > Thanks.
> >
> > Best regards,
> > AceLan Kao.
