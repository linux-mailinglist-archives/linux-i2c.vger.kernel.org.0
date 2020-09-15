Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D2626AB15
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 19:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgIORtI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 13:49:08 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43163 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgIORsz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 13:48:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id t14so2353689pgl.10;
        Tue, 15 Sep 2020 10:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GJrc7L7xARd/cJ7B9yfEoRZLcez5mWpcMvPXZidt6iA=;
        b=s65f5R5D6oK5jK3wNnIGS8HxEY4gvSLTGUYUf5MHntFN8OmRPtMUxZ3OpQZtf42ZvZ
         CnSN+Lmz4RCf64qBezeluntYJyvWR2VMM+Ub6JByz9uxZOCg9tAnnYwWyACiRar+Fduq
         7NNNcyTfAmVTfyT6g5G8pbzq1qM9KW83Q+kJvBgvq95TEiP3zME9lYkzcDWDZr/Dwlv/
         iugYgxSFrMCAm1sAhAmKO8fJIxo+xJYFACXlL/0UQP/uuHvHR8wtZ5Pp4vFXsI+IsIgA
         ZG8r/qCuyAZv366Ftx8HFJlR2LQ03ZSmw7hdXXgaJRoV1VCz/pCvlr5LoVh21+D+YcLR
         PSfg==
X-Gm-Message-State: AOAM531lRhtWQ4kKW1lt5Tv8G3iH4KVSN/B+JjI8JXm8DiUIVdEvziRq
        C0V6JPO6VmmgbNYMz9wkQo4=
X-Google-Smtp-Source: ABdhPJw9WGc1oMLtS3osJmujvSGkASamKyr07Nky9A099oUnOhXcHEUdpeT6YtaegTT2qflCJ3WasA==
X-Received: by 2002:a62:14d2:0:b029:142:2501:39f2 with SMTP id 201-20020a6214d20000b0290142250139f2mr3014851pfu.65.1600192127276;
        Tue, 15 Sep 2020 10:48:47 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.212])
        by smtp.gmail.com with ESMTPSA id il14sm143693pjb.54.2020.09.15.10.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 10:48:46 -0700 (PDT)
Date:   Tue, 15 Sep 2020 10:48:44 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v3] i2c: Squash of SMBus block read patchset to save power
Message-ID: <20200915174844.GA16807@sultan-box.localdomain>
References: <b3b751fc-668d-91e2-220b-0d7edd231e01@linux.intel.com>
 <20200914001523.3878-1-sultan@kerneltoast.com>
 <bcf9cd02-13d1-8f87-8ef9-2f05f0b54808@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcf9cd02-13d1-8f87-8ef9-2f05f0b54808@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 15, 2020 at 02:55:48PM +0300, Jarkko Nikula wrote:
> Hi
> 
> On 9/14/20 3:15 AM, Sultan Alsawaf wrote:
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > This is a squash of the following:
> > 
> > i2c: designware: Fix transfer failures for invalid SMBus block reads
> > 
> > SMBus block reads can be broken because the read function will just skip
> > over bytes it doesn't like until reaching a byte that conforms to the
> > length restrictions for block reads. This is problematic when it isn't
> > known if the incoming payload is indeed a conforming block read.
> > 
> > According to the SMBus specification, block reads will only send the
> > payload length in the first byte, so we can fix this by only considering
> > the first byte in a sequence for block read length purposes.
> > 
> > In addition, when the length byte is invalid, the original transfer
> > length still needs to be adjusted to avoid a controller timeout.
> > 
> > Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
> > 
> > The point of adding a byte to len in i2c_dw_recv_len() is to make sure
> > that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
> > controller know that the i2c transaction can end. Otherwise, the i2c
> > controller will think that the transaction can never end for block
> > reads, which results in the stop-detection bit never being set and thus
> > the transaction timing out.
> > 
> > Adding a byte to len is not a reliable way to do this though; sometimes
> > it lets tx_buf_len become zero, which results in the scenario described
> > above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
> > the issue.
> > 
> > Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > i2c: designware: Allow SMBus block reads up to 255 bytes in length
> > 
> > According to the SMBus 3.0 protocol specification, block transfer limits
> > were increased from 32 bytes to 255 bytes. Remove the obsolete 32-byte
> > limitation.
> > 
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > HID: i2c-hid: Use block reads when possible to save power
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
> > Hi Jarkko,
> > 
> > Sorry for the delayed response. Life gets in the way of the things that really
> > matter, like kernel hacking ;)
> > 
> > I fixed the issue with the i2c block reads on 5.8. I've squashed all 4 of my i2c
> > commits into this email for simplicity; please apply this patch on either 5.8 or
> > 5.9 (it applies cleanly to both) and let me know if it works with your i2c-hid
> > touchscreen. If all is well, I will resubmit these patches individually in one
> > patchset, in a new thread.
> > 
> I tested this on top of fc4f28bb3daf ("Merge tag 'for-5.9-rc5-tag' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux") and seems to be
> working fine. What was the key change compared to previous version that was
> regressing for me?

This change fixed your issue (and my issue with 5.8):
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -395,8 +395,9 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	 * Adjust the buffer length and mask the flag
 	 * after receiving the first byte.
 	 */
-	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
-	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
+	if (flags & I2C_CLIENT_PEC)
+		len++;
+	dev->tx_buf_len = len - min_t(u8, len - 1, dev->rx_outstanding);
 	msgs[dev->msg_read_idx].len = len;
 	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;

I've attributed this change with the following commit message:
"i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads

The point of adding a byte to len in i2c_dw_recv_len() is to make sure
that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
controller know that the i2c transaction can end. Otherwise, the i2c
controller will think that the transaction can never end for block
reads, which results in the stop-detection bit never being set and thus
the transaction timing out.

Adding a byte to len is not a reliable way to do this though; sometimes
it lets tx_buf_len become zero, which results in the scenario described
above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
the issue."

Does the patch series look good to submit?

Sultan
