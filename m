Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35721F7AA2
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 19:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfKKSTp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 13:19:45 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32937 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfKKSTo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 13:19:44 -0500
Received: by mail-pf1-f195.google.com with SMTP id c184so11243314pfb.0;
        Mon, 11 Nov 2019 10:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jX2O/vKYNIETofpupKgShpkIa+uMhR52xikufcmTAOU=;
        b=PmTcSwuNFN0ANsYg99msOFYBbWX3/gPLfhXcq1/ayFI+yyRNnd2UIGbL33S9OsGQcP
         ky30fQin/j7I2U48kSRELal9ipYKEsvoQj2Bu2BoPT8i2pZ1tUg1is6E5DNi4mUCGVo9
         lSErVD2dC7ApT55RqnZQPkB8Hrsgp/6BZXy1l7JSb1Bf8di2Bk57okFHQbmoZ5rWJg+v
         +j2ddlmPsJT1YajFZLz5eXIbTGa4vdI+6x+C4hB2Qw0DWYFS4hHTjTxDkek0tSxBh6q7
         7Z6j5zXz7S1Gdh3eafDJUoXJmNk7TBnk8d0t6zSLJYrxZBeljCjZZkCedbApDSVnIbhV
         l9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jX2O/vKYNIETofpupKgShpkIa+uMhR52xikufcmTAOU=;
        b=PDqyPhn4DfM/UsSrRc9GEI/oLJc/ibjUaZtmWSADrXkz9SITFYTdJsMEzJUIHtT8ez
         zlyijg6TpvmEIe49P3K2RYgb03//ugIXpbd888dTLamsjFMtoEYOa5GdujiT2XfSKB1m
         pmJtzN9gqbyartSQ0gTNqOaSOC0x+R328cpA4yEYn9OSf3NW0YyP9luA1nKFD7LrGAFb
         JdetGDxPyyjw33w/T4hLmTH49t8qaKy0pCBZEfd585a1SL9JXXG+T81LLbquvC2YlJ0k
         CTnG1VtUKVfACbOP6k7JaFJ/LN6SiyRc+Kq/t0YjJzSYTjHe0w4KyLh7iV9nMunan7ee
         BF8w==
X-Gm-Message-State: APjAAAUMsLddQT1S/zIpe8j/Yv5UTnXwOQZTOchTQcQWCo2ZHruFWrFs
        zcA9eWBHU5QM6sjhwjAbUMV5cEdG
X-Google-Smtp-Source: APXvYqzIusQcc/jtLfLo2OLT/206L/1VnLLVKd8NIyvl+WAoDVRJvzdef/IwjugoVXQXN/fnfBkHNA==
X-Received: by 2002:a17:90a:741:: with SMTP id s1mr409417pje.107.1573496383715;
        Mon, 11 Nov 2019 10:19:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f19sm10846264pfk.109.2019.11.11.10.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 10:19:43 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:19:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 06/12] input: mouse: convert to i2c_new_scanned_device
Message-ID: <20191111181941.GB57214@dtor-ws>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-7-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 06, 2019 at 10:50:24AM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/input/mouse/psmouse-smbus.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
> index 027efdd2b2ad..35bf50a871d2 100644
> --- a/drivers/input/mouse/psmouse-smbus.c
> +++ b/drivers/input/mouse/psmouse-smbus.c
> @@ -198,10 +198,12 @@ static int psmouse_smbus_create_companion(struct device *dev, void *data)
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
>  		return 0;
>  
> -	smbdev->client = i2c_new_probed_device(adapter, &smbdev->board,
> -					       addr_list, NULL);
> -	if (!smbdev->client)
> +	smbdev->client = i2c_new_scanned_device(adapter, &smbdev->board,
> +					        addr_list, NULL);
> +	if (IS_ERR(smbdev->client)) {
> +		smbdev->client = NULL;
>  		return 0;
> +	}
>  
>  	/* We have our(?) device, stop iterating i2c bus. */
>  	return 1;

I'd prefer postponing assignment until after we get valid value. I.e.

	client = i2c_new_probed_device(...);
	if (IS_ERR(client))
		return 0;

	/* We have our(?) device, stop iterating i2c bus. */
	smbdev->client = client;
	return 1;

Thanks.

-- 
Dmitry
