Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E17F342298
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 17:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCSQ4q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 12:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhCSQ4N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Mar 2021 12:56:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF82EC06174A;
        Fri, 19 Mar 2021 09:56:09 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id r12so10823609ejr.5;
        Fri, 19 Mar 2021 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/VmleSCrLgheGad/OHCbIUFWqkUsgdIsg5YZ45xE/q4=;
        b=vhcZf7UMBVvcPSvWpJhDYGV3g/zQGTijf4xMSNB93FAsJ3ksm9qacxnz3hSi9Qof2c
         5ohi1A6v02hpqXKyrZcfYVtTIXA+2pjRLksotXL0I4IiBejCswwAj9UmhfAtId0UaeVL
         58tSpf4gUSat+7qeYl0fp8M+xQfXSIceaUiNBQ/6lwcMOHr+jkgqg67FQAWgsppoZNd/
         4ve23FhMzA3zV7o9or/ijNEWcyY3iOLy7at4AsQteVfglVu34GoKas6HlwKNcc8OEu8s
         SBAABhsma7AYIC1SORPDzgFs6lD5Fi5oGFzIK4hsiUaGzwQLcNgtUyRq6OwjuONMrsk/
         BzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/VmleSCrLgheGad/OHCbIUFWqkUsgdIsg5YZ45xE/q4=;
        b=rVAqCExglIL5sxbLz7YjQPlCMWsJEwhRwJh5lun5rsFLbv5C9L3rrCgKILcpeQYPGL
         O2q2Me3Z4xpGfZeQ3CBVDzPZouYhrXfU/pwlFds1N2hO1pGZ3+iwJxNHfabxcLv7FlFw
         Zb6jMNtcLHOtriJaIALH3mYF8jRXe4XHzRNCW4H5LE1v0l9ISaUiTs7dXr+zr7VqLR1s
         Mv7GvYKO+MmdNVgJlWakgmtAGvfs9ytobQ2U2xVG7OwB293rEQpqh9/iIrYPDfypKqf4
         EqZW5sKcpOw85lW9B9jTSR4Dx+5Yki+fsQAn784G63SRi8xuGbA49SNPGohDipP+ozsG
         qk2Q==
X-Gm-Message-State: AOAM530EQd8NGsmlxVDeT53GmmIaKEYGKjQRcRfaq4Xs8dbOvLIJNltR
        Jp9kQ1VCMaWF+tK0zwJ5fqo=
X-Google-Smtp-Source: ABdhPJzsGoQn+ofDbqpLeOcD3uCa6dMRaUP2MeEHdG0Zu1uOIYCfz1gW0RjSR9wv/pM0aHYsr5bGJg==
X-Received: by 2002:a17:906:1fd2:: with SMTP id e18mr5668469ejt.49.1616172968598;
        Fri, 19 Mar 2021 09:56:08 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id mc2sm3945781ejb.115.2021.03.19.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 09:56:08 -0700 (PDT)
Date:   Fri, 19 Mar 2021 18:56:05 +0200
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: Re: [PATCH] HID: ft260: fix an error message in
 ft260_i2c_write_read()
Message-ID: <20210319165605.GB1940@michael-VirtualBox>
References: <YFMt5pml1voGQkUy@mwanda>
 <nycvar.YFH.7.76.2103191426350.12405@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2103191426350.12405@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 19, 2021 at 02:26:43PM +0100, Jiri Kosina wrote:
> On Thu, 18 Mar 2021, Dan Carpenter wrote:
> 
> > The "len" variable is uninitialize.
> > 
> > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/hid/hid-ft260.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > index 047aa85a7c83..a5751607ce24 100644
> > --- a/drivers/hid/hid-ft260.c
> > +++ b/drivers/hid/hid-ft260.c
> > @@ -512,7 +512,8 @@ static int ft260_i2c_write_read(struct ft260_device *dev, struct i2c_msg *msgs)
> >  	struct hid_device *hdev = dev->hdev;
> >  
> >  	if (msgs[0].len > 2) {
> > -		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__, len);
> > +		hid_err(hdev, "%s: unsupported wr len: %d\n", __func__,
> > +			msgs[0].len);
> >  		return -EOPNOTSUPP;
> >  	}

Dan, thanks for that quick fix.

> Applied, thanks Dan.
> -- 
> Jiri Kosina

Jiri, thank you for applying it.
