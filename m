Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAE123F1F8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 19:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgHGRci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 13:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHGRce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 13:32:34 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBFAC061756;
        Fri,  7 Aug 2020 10:32:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 17so1360475pfw.9;
        Fri, 07 Aug 2020 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=j0PtF8UeW2JMfBJSFYN8MSFrjhqC5IGfPsG3kkWWGuM=;
        b=UWj0ousnn6Qs0lXhh43orig3Q/9CutWD1tdaP8c6EklXbs5nAR5p8STS83VCnQ3mop
         5xx/tai+v35SntfFj2yQoodaREOtRMsdDt0C9VQfJRc+vJ5U8FI7Lx+6RhMWT9z9ENGj
         QCy8MRUQ2XHS+u8EXVcHVuGhnn5AbU+5DZ371/6kR/ya1MvYLhgaQmwDg1vi5B+dFwlt
         e96ovKOK+piPIoUFBp04hoS0Rej1DLOkVanbkvjxcGZeSCkF2j4MaTT7zUwXzsEo7WxP
         IP54umPsh5jvsWRvngX7omqdXKMsBftwMFUrPiwak1Iky73ms0kd2hC/4w1kb/+Nvvh0
         hSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=j0PtF8UeW2JMfBJSFYN8MSFrjhqC5IGfPsG3kkWWGuM=;
        b=TMKdEu7sTIPTb8V6VGzgiNO8mLDE08XyrT7d49ZF8oMD46KI0Phf6R7IqtUnwPide9
         aBob8Y/RENqbItxipruVzFghofX0YDgrHLTP4DdL61rnL/Z2e2yog6JipCM8B9gqFS2F
         dONhGKP2Eor4ChqkO/wQFMGPix6ysv9zlLZ3YjpJ3Fm6ZkdwEv5UIa/XiKzZ6ToE23Dy
         R+QmMQ9btWYpSZXarA7BaW502QkaA/nxVT37PuEGfQaax+GBSmirD3+UatRE2sOec27m
         mqUPNYw3Q/tZ6MzUEhlNOfVKAdwiDk1J/ZQl7hnOLnQMaRcACQ9qiamGWZa6EQu1jK5L
         ibpw==
X-Gm-Message-State: AOAM532oj8FtRNEVjV4OfNM3tN14zLd+VDivIAJEYYQqg3RU415RDl+U
        gMPX1DvU8l7w51HvdWneY8M=
X-Google-Smtp-Source: ABdhPJykcoMNcoXKXPMIGg4/VNmdiDpBj1nlUMTyuqeUvIz7bIU6uxTEawTLHTtqLZpiOgEBpn3G3g==
X-Received: by 2002:a63:3d06:: with SMTP id k6mr12862975pga.316.1596821553329;
        Fri, 07 Aug 2020 10:32:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gn13sm11228445pjb.17.2020.08.07.10.32.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 10:32:32 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:32:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200807173231.GA47449@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 07, 2020 at 06:28:01PM +0200, Stephen Kitt wrote:
> pmbus_do_probe doesn't use the id information provided in its second
> argument, so this can be removed, which then allows using the
> single-parameter i2c probe function ("probe_new") for probes.
> 
> This avoids scanning the identifier tables during probes.
> 
> Drivers which didn't use the id are converted as-is; drivers which did
> are modified as follows:
> 
> * if the information in i2c_client is sufficient, that's used instead
>   (client->name);
> * configured v. probed comparisons are performed by comparing the
>   configured name to the detected name, instead of the ids; this
>   involves strcmp but is still cheaper than comparing all the device
>   names when scanning the tables;
> * anything else is handled by calling i2c_match_id() with the same
>   level of error-handling (if any) as before.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
> Changes since v1:
>   - i2c_device_id declarations are left unchanged;
>   - all drivers are converted, using client info or i2c_match_id().
> Changes since v2:
>   - updated the documentation;
>   - fixed unbalanced braces around the modified else in ibm-cffps.c.
> 

[ ... ]

>  
> -static int ltc2978_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int ltc2978_probe(struct i2c_client *client)
>  {
>  	int i, chip_id;
>  	struct ltc2978_data *data;
> @@ -670,10 +669,10 @@ static int ltc2978_probe(struct i2c_client *client,
>  		return chip_id;
>  
>  	data->id = chip_id;
> -	if (data->id != id->driver_data)
> +	if (strcmp(client->name, ltc2978_id[data->id].name) != 0)

I was about to apply this patch, but this is problematic: It assumes that
__stringify(id) == ltc2978_id[id].name and that ltc2978_id[id].driver_data
== id. While that is curently the case (as far as I can see), it is still
unsafe. I think it would be much safer to use i2c_match_id() here.

Thanks,
Guenter
