Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB27105F00
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 04:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfKVD10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 22:27:26 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40627 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfKVD10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 22:27:26 -0500
Received: by mail-ot1-f68.google.com with SMTP id m15so4971763otq.7
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 19:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b/Dcf8pDO9tMSTb+cRGvVhJZRISn3wWHzyPqIE4zIyY=;
        b=FgP5lOj2snOX/5lbCgXBruuzhJz7Z1fCshjhW2MaKxvrxn+eh1jIphRf9YB2sXGRYw
         8KV4qjVtxl6Dd5aFlqtBi06QoHqa45CRiCshmTOLZDNzX7ZUkKYKMHxgKYDmYNNfZcOX
         ikTAxONC1K+H7q2RvOT6Nt40i0nCjU06L5Ry6S5E4gmsdf6/xCYOSFaEht81HA5t3Uqy
         lKpUHHMvUNK6sJnWF/AXbhblAOUST3d7G14B+ncrBpxrO0HIjFKjEfs8Gb23b8tmnGDe
         429zZRWHOX8A1z9EvTLdBj2QmN4R7ye5bfUqHNiwwgFWW1JxMOvIoNaouO2/RGp0Xtwa
         /0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=b/Dcf8pDO9tMSTb+cRGvVhJZRISn3wWHzyPqIE4zIyY=;
        b=Ep7WLaiJRtQD26H7keal9KnewPFEMaI3N+odPv26MN/9Tu5b1t/IR2rkSB7TdCbuGs
         ILAwGyOenNo1tRgcHcGM8YDxEpSANa1fd3imLMnWIRDIv817d0YfUEH8G/G4Pw3Cx2Lg
         NLkzrjbqeW8J2jjwWUPSo6VYs4uOovacUkPzP2G9E1y+rhRrvgCqPjfo+Zax2qNcvzxD
         i4QW5P955H6oX2M2uh4IriILkPhGOuTWapKKTW7z3r7XgE1bFiG2pVozx9ipnMVdOUY9
         7RIn2kch0wixE8H2I7BHmICS28BzIK9I1wwXrFfMyRJk8zHXzyN1zO95yRklOMDWX4Ok
         XNAQ==
X-Gm-Message-State: APjAAAWzR14b1YwOEZ/SZZ755a4hPXd5DCPXXo4GP/AA+3shASALe5cQ
        KF2xoXrKUbr3tZGuvxcjFdHBMg==
X-Google-Smtp-Source: APXvYqwtgV82teZU4J1EtdUtfI/zYzvyeLGuP6vcyVhcg7gE3h64BCEaWI8CBneRrEiembIudd+K9g==
X-Received: by 2002:a9d:7098:: with SMTP id l24mr8845977otj.207.1574393241314;
        Thu, 21 Nov 2019 19:27:21 -0800 (PST)
Received: from minyard.net ([47.184.136.59])
        by smtp.gmail.com with ESMTPSA id i12sm1770558ota.10.2019.11.21.19.27.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 19:27:20 -0800 (PST)
Date:   Thu, 21 Nov 2019 21:27:19 -0600
From:   Corey Minyard <cminyard@mvista.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] i2c: i2c-smbus: Don't filter out duplicate alerts
Message-ID: <20191122032719.GQ3556@minyard.net>
Reply-To: cminyard@mvista.com
References: <20191121101051.71859534@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121101051.71859534@endymion>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 21, 2019 at 10:10:51AM +0100, Jean Delvare wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Getting the same alert twice in a row is legal and normal,
> especially on a fast device (like running in qemu).  Kind of
> like interrupts.  So don't report duplicate alerts, and deliver
> them normally.
> 
> [JD: Fixed subject]
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> That's a 4-year-old patch from Corey which I stumbled upon this
> morning. I was supposed to test it on my ADM1032 evaluation board but
> never got to it. Sorry about that. It turns out that I no longer have
> any system with a parallel port to test it.

Thanks.  This hasn't been a huge deal, since the only system that is
affected at the moment (AFAIK) is the qemu test environment that I use.
But it will be nice to have this for when something real actually uses
this.

-corey

> 
> I think the patch is correct and whatever the problem was on my ADM1032
> evaluation board, it should be fixed differently. Maybe it was a wrong
> trigger type, or alerts must be disabled temporarily during processing,
> or the hardware is actually bogus and it would be up to the device
> driver to ignore alerts for some time after receiving one. Whatever,
> let's apply the fix now and deal with this problem later if/when it
> resurfaces.
> 
>  drivers/i2c/i2c-smbus.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 94765a8..cecd423 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -75,7 +75,6 @@ static void smbus_alert(struct work_struct *work)
>  {
>  	struct i2c_smbus_alert *alert;
>  	struct i2c_client *ara;
> -	unsigned short prev_addr = 0;	/* Not a valid address */
>  
>  	alert = container_of(work, struct i2c_smbus_alert, alert);
>  	ara = alert->ara;
> @@ -99,18 +98,12 @@ static void smbus_alert(struct work_struct *work)
>  		data.flag = status & 1;
>  		data.addr = status >> 1;
>  
> -		if (data.addr == prev_addr) {
> -			dev_warn(&ara->dev, "Duplicate SMBALERT# from dev "
> -				"0x%02x, skipping\n", data.addr);
> -			break;
> -		}
>  		dev_dbg(&ara->dev, "SMBALERT# from dev 0x%02x, flag %d\n",
>  			data.addr, data.flag);
>  
>  		/* Notify driver for the device which issued the alert */
>  		device_for_each_child(&ara->adapter->dev, &data,
>  				      smbus_do_alert);
> -		prev_addr = data.addr;
>  	}
>  
>  	/* We handled all alerts; re-enable level-triggered IRQs */
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
