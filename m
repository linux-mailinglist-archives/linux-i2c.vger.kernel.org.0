Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9561FBD12
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 19:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbgFPRdE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 13:33:04 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:34623 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730978AbgFPRdE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 13:33:04 -0400
Received: by mail-pj1-f67.google.com with SMTP id a45so1365566pje.1;
        Tue, 16 Jun 2020 10:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTlodo8W+7IZCNOxUc98tNEtc14F+hi5VzzRB8qcV8k=;
        b=iZDt9CsfmJFr2UV7Iy1RixHn6g3hAhbYj/t6cADVwTc6OoNKBDokDRsyIT+lbOeUim
         dNiRvxP+Pc56Rxz9uYFoOtL2iT/TTGuMUq6zgefIbF5jD1IGaAv+yZvKf0NP4qHtMYHC
         g5uNsAApe6HDXu6AtuYl0TcDuhLE+N6wF3GO8fH0co+UuklN/SeuvNvwx1uOk05WDRXj
         6mDmD0GLmzQ0I+1hN4+AyjhQsM5rv+iBzciZuU8FyVST4URaQ/hFmpwBkH0gQHhF8Ny/
         ac9i+Mv0UMJ66WgP+O8BEY/2Xtoig1M4rvd54haJg8nESdCGPJhbnQfyPO2tu7Jvum8G
         oiVA==
X-Gm-Message-State: AOAM5336AUBEE1RnwbbAlvNBvUyHk+RAxXR3lH3qIApshEvpvXCH+D59
        iqLB/fRS90Yo8xW8krXgHsU=
X-Google-Smtp-Source: ABdhPJzn5/Pk4Zg7dHMupWkqizhxoXwW3gfU2LBGKuCnaoK0mzNGSY/Mlvy0XJpGUJGPUYCaEiBmzw==
X-Received: by 2002:a17:90b:3544:: with SMTP id lt4mr4097717pjb.19.1592328783265;
        Tue, 16 Jun 2020 10:33:03 -0700 (PDT)
Received: from sultan-book.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id h3sm15304253pgd.0.2020.06.16.10.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 10:33:02 -0700 (PDT)
Date:   Tue, 16 Jun 2020 10:32:58 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Andi Shyti <andi.shyti@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        jarkko.nikula@linux.intel.com, aaron.ma@canonical.com,
        admin@kryma.net, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
Message-ID: <20200616173258.GA5266@sultan-book.localdomain>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <20200616164101.GY2428291@smile.fi.intel.com>
 <20200616171854.GA1415@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616171854.GA1415@intel.intel>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 16, 2020 at 08:18:54PM +0300, Andi Shyti wrote:
> Hi Andy,
> 
> > > so the only strategy available up until now has been to always retrieve
> > > the maximum possible report length over i2c, which can be quite
> > > inefficient. For devices that send reports in block read format, the i2c
> > > controller driver can read the payload length on the fly and terminate
> > > the i2c transaction early, resulting in considerable power savings.
> > > 
> > > On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> > > touchpad causes psys power readings to go up by about 4W and hover there
> > > until I remove my finger. With this patch, my psys readings go from 4.7W
> > > down to 3.1W, yielding about 1.6W in savings. This is because my
> > > touchpad's max report length is 60 bytes, but all of the regular reports
> > > it sends for touch events are only 32 bytes, so the i2c transfer is
> > > roughly halved for the common case.
> > 
> > > +	/* Try to do a block read if the size fits in one byte */
> > > +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
> > 
> > AFAIR SMBus specification tells about 256. Why 255?
> > 
> > Andi, am I correct?
> 
> Actually the SMBUS 3.0 protocol from 2015[*] says 255:
> 
> "
> D.6 255 Bytes in Process Call
> 
> The maximum number of bytes allowed in the Block Write-Block Read
> Process Call (Section 6.5.8) was increased from 32 to 255.
> "
> 
> But why does it matter... I see the patch is detatching itself
> from smbus.
> 
> And, actually, I wonder if this is the right way to fix it, isn't
> it better to fix smbus instead?

I think the best solution would be to modify the i2c api to allow passing in a
function pointer and a payload size length, to specify how to interpret the size
of the incoming payload, so the adapter could handle both the HID over i2c
transfer spec and SMBus block reads without needing to read more bytes than
needed.

For example, for an SMBus block read, the payload size is specified in the first
byte and it is limited to 32 bytes. However, for HID over i2c, the payload size
is specified in the first two bytes, and there are also some device quirks
involved to reinterpret the reported size.

A nice solution would be to pass in how many bytes the i2c payload size can
contain, as well as a function pointer to evaluate the reported payload size in
a way that the caller wants. This would require modifying every i2c adapter
driver to add this functionality, but it would fix the efficiency problem faced
by i2c-hid and perhaps others.

> I have a patch ready that fixes the smbus transfer size, perhaps
> I should rebase, test and send it.

For the i2c-hid driver?

Sultan
