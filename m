Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EA120D46C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 21:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgF2TIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 15:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbgF2TCn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:02:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9E3C031C5D;
        Mon, 29 Jun 2020 10:43:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 35so7387270ple.0;
        Mon, 29 Jun 2020 10:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wwO/+1x3ujsY+tBQxjynuoHG+S+oW8bGQ0JEGfkKl18=;
        b=q6VTKnjrIQ9GZwtHp6W8lnaBCt0D7cnVX6zRR8zbRsgPRvWzkckmhVQnxhqhf2SztQ
         +rk54A5VZ9T4y8tgIPDQb2TK0x30Gc2bxIHNeCV0+k/5JB2Qr8S31+9nzkZBv4H8B1dZ
         S7Nx4knFUO5IYs75LGDNQGVYwC5/HUd+5nFVLyNwxvBUTDWBLKcOMr+cfrw2308dlldI
         WrqpGGQ1IqKJYywRAR3S7h1nqCGSB1qKSb+phXXH60lUsIejGQpbomdqL9cK9Pvyslbk
         Bs7T7ZU5e11Xcs+YQNk7qBcKT8bG04FCbxH16bkFyZa/Mw58JAhLh7JMcLNIom4umbOz
         8tYg==
X-Gm-Message-State: AOAM531FeqTpQdRePUJND4B+dv1KI7Dv6qrhGRy6ZmJ4M4L9UEoNnusq
        4lvR0Io1hgJZb7GOeKItGzSoD7l6
X-Google-Smtp-Source: ABdhPJwBT8x6FA0IDZEkNk2enlT2SeUgMHnfKY6ICLSCwyeYI5Ca9yC95pTwUTqHMsvKBPHYnrf8pw==
X-Received: by 2002:a17:90a:70c6:: with SMTP id a6mr16987836pjm.16.1593452612181;
        Mon, 29 Jun 2020 10:43:32 -0700 (PDT)
Received: from sultan-box.localdomain ([89.46.114.241])
        by smtp.gmail.com with ESMTPSA id m14sm353976pgn.83.2020.06.29.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:43:31 -0700 (PDT)
Date:   Mon, 29 Jun 2020 10:43:28 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
Message-ID: <20200629174328.GB1646@sultan-box.localdomain>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 17, 2020 at 02:17:19PM +0300, Jarkko Nikula wrote:
> On 6/16/20 6:49 PM, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > We have no way of knowing how large an incoming payload is going to be,
> > so the only strategy available up until now has been to always retrieve
> > the maximum possible report length over i2c, which can be quite
> > inefficient. For devices that send reports in block read format, the i2c
> > controller driver can read the payload length on the fly and terminate
> > the i2c transaction early, resulting in considerable power savings.
> > 
> > On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> > touchpad causes psys power readings to go up by about 4W and hover there
> > until I remove my finger. With this patch, my psys readings go from 4.7W
> > down to 3.1W, yielding about 1.6W in savings. This is because my
> > touchpad's max report length is 60 bytes, but all of the regular reports
> > it sends for touch events are only 32 bytes, so the i2c transfer is
> > roughly halved for the common case.
> > 
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > ---
> > Jarkko, could you try this?
> >   drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index 294c84e136d7..739dccfc57e1 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -472,11 +472,14 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
> >   	int ret;
> >   	u32 ret_size;
> >   	int size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
> > +	u16 flags;
> >   	if (size > ihid->bufsize)
> >   		size = ihid->bufsize;
> > -	ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
> > +	/* Try to do a block read if the size fits in one byte */
> > +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
> > +	ret = i2c_transfer_buffer_flags(ihid->client, ihid->inbuf, size, flags);
> >   	if (ret != size) {
> >   		if (ret < 0)
> >   			return;
> 
> This still causes a regression for me.

Hmm, for some reason in 5.8 I get the same problem, but 5.7 is fine. Could you
try this on 5.7 and see if it works?

In the meantime I'll bisect 5.8 to see why it's causing problems for me...

Sultan
