Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A088D23EFF2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 17:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgHGPXe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 11:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgHGPXd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 11:23:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D5BC061756;
        Fri,  7 Aug 2020 08:23:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x6so1036099pgx.12;
        Fri, 07 Aug 2020 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uY95saK5XujgpJakESvzncs2nStqyQPwuBeJZVnrXEw=;
        b=LGcIZJR7DP3BaD/IKHyK5hm1TaePqGnDegaOXcnW3Pe55Fm3XjE5hyIrsk0x4m4mtX
         wMCz9uZTB+FuUHwLA5++Rinw7qCHT/6rOGZ88pdglXHAbykhDtbEBlfZj/pXwttIAPQV
         ++MUsWMLJ17/cH106didjhSN/KNBvG/iQKV/O7ip/BuUGjsvWt6WnJEGTrp2Sr20PWEL
         niU1wt3G4WtWu5QtW0ZqwDFwWPNZjr1XHF6vQ1IldXJn2/Xsj7dZ6u62LS9rHUpplRvY
         CLiau8WDZxbM5D0bX8twEHmjXlgPgEO4I0jQ4ANnK5F7+S7pOuOBg04XtO6xYxaShlBG
         NXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uY95saK5XujgpJakESvzncs2nStqyQPwuBeJZVnrXEw=;
        b=qV0C6uE5taYV4OUnkms/pDIBwg20/xi6QB4Mk26MnUoQisRsLGNhAcFOoBCdQW2kdo
         0cSp2O7V2r6Up6CXn0gqrmggRz4MPvGvNhnmiyDz77KrlsSd3hxDFPx8o7n9xeA8QNpn
         2m9mJYuao+pAGj4V+RvlBXjr7YbV33EqSxerjMqF7e0DcioFsNUDrw76/aqGkLsuL5yw
         5CD8CWHJM18Teju8aI3wk5k9iHu0HAxzIXJgAn5fTnqpQnbnn2uHc7PlsGQ/Jayrb6GA
         n2xoNoIdX3T85ce/GIhctzxSjO+t1FETTxndDCIZ8J2ss+dzm+8jrxVtxf2jx60ZimZZ
         vRzA==
X-Gm-Message-State: AOAM533iV4Fvl9hdKB4svMQbcekiWw0iKopH8yWXTujHQEr3TNzLcJlB
        +bZKy8OiPpRijKcJTAutf72CVZ+U
X-Google-Smtp-Source: ABdhPJwQC0DUbbPpKDKpZiqtM081qsoHYQoRUrdI6bNiMuriHX6JVTlVYdqFXxIpn19f1+I32VblXQ==
X-Received: by 2002:a63:210c:: with SMTP id h12mr11904202pgh.152.1596813812432;
        Fri, 07 Aug 2020 08:23:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k125sm12298004pga.48.2020.08.07.08.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 08:23:31 -0700 (PDT)
Subject: Re: [PATCH v2] hwmon/pmbus: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200807074526.14334-1-steve@sk2.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <caf1963d-860f-1b46-49e5-ad3acc8d7877@roeck-us.net>
Date:   Fri, 7 Aug 2020 08:23:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807074526.14334-1-steve@sk2.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/7/20 12:45 AM, Stephen Kitt wrote:
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

Please also update the documentation.

Documentation/hwmon/pmbus-core.rst:  int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
Documentation/hwmon/pmbus.rst:  return pmbus_do_probe(client, id, &ds1200_info);

Also, please fix the checkpatch issue reported by Wolfram.

Thanks,
Guenter
