Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694AA35E330
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 17:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbhDMPxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 11:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345974AbhDMPxT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 11:53:19 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97BFC061574;
        Tue, 13 Apr 2021 08:52:58 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id g66-20020a1c39450000b0290125d187ba22so8677029wma.2;
        Tue, 13 Apr 2021 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1fRMYRlU1zkDxOhEU/7l2PavvaQEOmk+7tLW+jlnzBY=;
        b=PXa8BO4Zl8fopeEmLTGYm70CRn/3V/s3V/347dk7DdoPdoo+EYtji9keGCeAMQcYiE
         MdaUNwlBMo7OZRxDD0Dhj57iwISAN6OALq8aQrEvt/Baen1ZapmGFXutXAVn9EETv4M+
         36tAv2VZ+VTP3L6LJsAFHjt6TBtpBPqg2IH0RZr7VyDup1kwCrSgJKdF7SmW7D0daeXM
         evzJPW1oEezNgOgmlM0VXcliv5+uaSKmi08jgiWvnX4j/cS6N9fFLEQsnURL5cv6Wjmj
         ha3ECY9LEreKGo3sRKtYIkEPfLbppsDhrvtoD1RwZNYpAAgE//ki27yXyS61WdCHPxZ7
         7uSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1fRMYRlU1zkDxOhEU/7l2PavvaQEOmk+7tLW+jlnzBY=;
        b=eH5p7N3o+wZk3r0oW+DQsYAnjX7lufekDbMg5C3DcZZAYAL3AW7k9W3qEKoccawsX8
         BSfhuQJ+1+0OnGNQeZ8WGxyfXcN8qHGOXKuQvbCINjX/UmHbNWNJNjyFQcXjYYSmofjI
         0RcQ3zgT1nNa4amFkRJJWiTNULwxT7zZxuDG84BAXJ9FW8x76cDcLU0SltTubt7gjTXX
         ikH3kyo8j2PT13FYAiwv7SFU/RX+YXACVbFcR17oeI+6pP3tXi2tl/gH9cEwVgIbDEwa
         7ZFjugCn/hqTsy6Fe6oCa4z2H4o2gLkPnSD8+XQeIWnoe07SYzPUK5PLMG0PNOvxmnFW
         jpBg==
X-Gm-Message-State: AOAM5306CXDdNYF9J6dLp/39uBuJNQ+iNgvgKFh5D7FM9JECeYi+6/t2
        63a8IIMcBKqXgyPopmj3RsE=
X-Google-Smtp-Source: ABdhPJzxP1/myp3YE5dwBaeE/lMzu2yIuICTKk7pUlEFZe/Z7nA2Mrf++puZOoiSHPokweVTOYdXLg==
X-Received: by 2002:a1c:6356:: with SMTP id x83mr635040wmb.169.1618329177604;
        Tue, 13 Apr 2021 08:52:57 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id b14sm1445974wrf.75.2021.04.13.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:52:56 -0700 (PDT)
Date:   Tue, 13 Apr 2021 18:52:54 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210413155254.GA2470@michael-VirtualBox>
References: <YHBJRvcOSaM/b0RL@mwanda>
 <20210410122729.GA6136@michael-VirtualBox>
 <20210410153712.GQ6048@kadam>
 <20210410210425.GA4073@michael-VirtualBox>
 <20210412091151.GV6048@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412091151.GV6048@kadam>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 12, 2021 at 12:11:51PM +0300, Dan Carpenter wrote:
> On Sun, Apr 11, 2021 at 12:04:25AM +0300, Michael Zaidman wrote:
> > 
> > Oh, you are right. Despite that the SMbus block transaction limits the maximum
> > number of bytes to 32, nothing prevents a user from specifying via ioctl a larger
> > data size than the ft260 can handle in a single transfer.
> > 
> > I am going to fix it in the ft260_smbus_write (with your Signed-off-by), but
> > perhaps we should fix it in the first place, in the i2cdev_ioctl_smbus routine?
> > What do you think?
> 
> Could you just give me a Reported-by tag?  Thanks!
> 
> regards,
> dan carpenter

Done, thanks!  
