Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646581FBDCC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 20:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgFPSRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 14:17:14 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54697 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgFPSRO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 14:17:14 -0400
Received: by mail-pj1-f65.google.com with SMTP id u8so1788790pje.4;
        Tue, 16 Jun 2020 11:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yolgGMb95dP+gYToCtafiZ644tKzzstcDIk6VxrD4LE=;
        b=Kn6eTqtIZ3jx0IszbGtnukfg23ZHGI2ovLTySePpnDfYfI3aiLmxZlw40TbyfBnlUY
         36IJh5zOvTqtFAEO9W/MGFTswJBMsY7Sa3F6lE2n3RDg/my5W7vmbI3190QkYUBcckOR
         EOh4WiNvMOvYp4ePJeQRwa97HMmCEN8HBhQDS7uxe6F8UGbV/RkTaBHaq5BuwktHDEE0
         hSuyRbxMNNNjXXLgB2emh1FmpPynEoGa9yb134t/XCUKvwVN/HBWa135/H3QNTIRlbjw
         cL6GzhvSkH8FE0kU5TsSWxv2dQYfNUPEDLo3VKsa32inysmCO7VnnVLeoEizvDN9z3tT
         YL3w==
X-Gm-Message-State: AOAM533EJXdtlObaVlW4/dzN1AuY32OXNp+MvUHCiCbv29o5sw+3gsA0
        H7cdMogxShOVKFEii+cOF6IWqRDE
X-Google-Smtp-Source: ABdhPJx1AQB9zeLGAW1c7WR2NXgeldh76+fn8duRjngXlIl06QWFuNVYlkuSaMtPkTpu+HGNWQ71UA==
X-Received: by 2002:a17:90a:64c9:: with SMTP id i9mr4079798pjm.135.1592331433306;
        Tue, 16 Jun 2020 11:17:13 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id y7sm3216854pjm.54.2020.06.16.11.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 11:17:12 -0700 (PDT)
Date:   Tue, 16 Jun 2020 11:17:09 -0700
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
Message-ID: <20200616181709.GA1768@sultan-box.localdomain>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <20200616164101.GY2428291@smile.fi.intel.com>
 <20200616171854.GA1415@intel.intel>
 <20200616173258.GA5266@sultan-book.localdomain>
 <20200616180254.GB1415@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616180254.GB1415@intel.intel>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 16, 2020 at 09:02:54PM +0300, Andi Shyti wrote:
> Hi Sultan,
> 
> > > > > so the only strategy available up until now has been to always retrieve
> > > > > the maximum possible report length over i2c, which can be quite
> > > > > inefficient. For devices that send reports in block read format, the i2c
> > > > > controller driver can read the payload length on the fly and terminate
> > > > > the i2c transaction early, resulting in considerable power savings.
> > > > > 
> > > > > On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> > > > > touchpad causes psys power readings to go up by about 4W and hover there
> > > > > until I remove my finger. With this patch, my psys readings go from 4.7W
> > > > > down to 3.1W, yielding about 1.6W in savings. This is because my
> > > > > touchpad's max report length is 60 bytes, but all of the regular reports
> > > > > it sends for touch events are only 32 bytes, so the i2c transfer is
> > > > > roughly halved for the common case.
> > > > 
> > > > > +	/* Try to do a block read if the size fits in one byte */
> > > > > +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
> > > > 
> > > > AFAIR SMBus specification tells about 256. Why 255?
> > > > 
> > > > Andi, am I correct?
> > > 
> > > Actually the SMBUS 3.0 protocol from 2015[*] says 255:
> > > 
> > > "
> > > D.6 255 Bytes in Process Call
> > > 
> > > The maximum number of bytes allowed in the Block Write-Block Read
> > > Process Call (Section 6.5.8) was increased from 32 to 255.
> > > "
> > > 
> > > But why does it matter... I see the patch is detatching itself
> > > from smbus.
> > > 
> > > And, actually, I wonder if this is the right way to fix it, isn't
> > > it better to fix smbus instead?
> > 
> > I think the best solution would be to modify the i2c api to allow passing in a
> > function pointer and a payload size length, to specify how to interpret the size
> > of the incoming payload, so the adapter could handle both the HID over i2c
> > transfer spec and SMBus block reads without needing to read more bytes than
> > needed.
> 
> Can't you do that by specifying the xfer function?
> 
> When you use smbus_read/write in block or byte or whatever, smbus
> always checks if there is an xfer function specified and uses
> that.
> 
> If it's not specified it uses the default smbus functions with
> the limitations that come with it.

The xfer functions are specified on a per-adapter basis. In the case of i2c-hid,
we need to tell the adapter to interpret the payload size in a specific way,
which I *think* is only specific to HID over i2c (i.e., using 16 bits to store
the length and then checking it for device quirks).

> > For example, for an SMBus block read, the payload size is specified in the first
> > byte and it is limited to 32 bytes. However, for HID over i2c, the payload size
> > is specified in the first two bytes, and there are also some device quirks
> > involved to reinterpret the reported size.
> 
> which is wrong. The 32 bytes limitation is outdated: in the link
> that I gave before (i.e.  this one [*]), the new SMBUS specifies
> 255 maximum for read/write block.

Oops. But still, for SMBus block reads, the size is limited to 8 bits. For HID
over i2c, it can be 16 bits. I don't see how we can handle this without some api
cooperation to tell the adapter what the caller is expecting to see.

> > A nice solution would be to pass in how many bytes the i2c payload size can
> > contain, as well as a function pointer to evaluate the reported payload size in
> > a way that the caller wants. This would require modifying every i2c adapter
> > driver to add this functionality, but it would fix the efficiency problem faced
> > by i2c-hid and perhaps others.
> > 
> > > I have a patch ready that fixes the smbus transfer size, perhaps
> > > I should rebase, test and send it.
> > 
> > For the i2c-hid driver?
> 
> No, sorry, for smbus.
> 
> Now... here you are replacing "i2c_master_recv" with
> "i2c_transfer_buffer_flags". I do not really like this change,
> although I understand it's necessary, because we are bypassing
> the real issue that is that the smbus implementation is outdated.
> 
> I have a patch for that that for a matter of time I never sent.

Can it handle block reads (8 bit size) and HID over i2c (16 bit size)?

Sultan
