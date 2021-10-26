Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D979743B760
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 18:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhJZQkt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 12:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbhJZQks (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Oct 2021 12:40:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE836C061745
        for <linux-i2c@vger.kernel.org>; Tue, 26 Oct 2021 09:38:24 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id s19so20264393wra.2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Oct 2021 09:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WuPcL/TraXQxXjuy153HuYH5ClxTu9+L1x6kfuYvrWk=;
        b=TX8kU1VtbTcmVo/H2g3hpw72CiiaExDjl2cnycNsOuNfS5MMx9W5u0Pgf0MU8bvuMA
         HgHlMCGw6cBXm1AnEOAHiJINtHekSJYKPqOKqsZiJjFnDJiAMvrrvrr9Ez6QYFlyVybM
         otynUfInWTQLW9BIDKlckEwhqN/XzQJ0dX49CKo6vyVtuHXKNNbYTDzDTBwsiMihQZL9
         dGxVv1gzE87Ia1p1WOAprnw467ZAr/JcRgvICW14I5Sz5d6+oovyz01tyhbygjA6vQ8v
         sje8xPZE2ZlLVNu6UDYxQxUAs13BDEmZN90QHEvPYk7n0NhAu6Pe5KrV4vsCGVa3/Sa6
         woOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WuPcL/TraXQxXjuy153HuYH5ClxTu9+L1x6kfuYvrWk=;
        b=SBh4HJ6G+e6GWDZ8xcyi51pucZznqk6PvE+Ku4EKz58T1Swkj/uN4FIkI2CNhCZv3r
         kZbBtzh4qRoBFDfWDNrqdeJImNg/1uAQ4YuJKh6nazjvWZK0B6gBc4lXvbR9rNwqG9LW
         HTo9872uRn8sZq/x6eRh4+OADf7g7Gg3jqoW04dqexXL+wTUHZVybX2ngv0+LP0GY7qS
         wPMCciOa0YZ4pWVbg288hum/Bnsq96KXl9tp/nt/FBZGyXwVoCu+zRo2A+MHEEMJskHc
         WvidcMHaLc8LSN0iZ9TJyt4j1zV1fA0/ypUo5dguBTpQe1j0GxIQPqDxZXKjdcPn+oOF
         EWLw==
X-Gm-Message-State: AOAM532t6VGE67bXrHGUKCXHIEdyhiPCyEsmiZ1kMNK7Hv595qnocqro
        tFW9Bhs5DtqNIZVT6c3zVow=
X-Google-Smtp-Source: ABdhPJwWZHX2yoY7x+PIE/TT86Dn/LYHRHKavzOO/Nky/+1K70/URhfE+uRRcivBN2eZsQp4aiCLNQ==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr33869820wrd.73.1635266303319;
        Tue, 26 Oct 2021 09:38:23 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1a:f00:e55a:faaa:6d21:5183? (p200300ea8f1a0f00e55afaaa6d215183.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:e55a:faaa:6d21:5183])
        by smtp.googlemail.com with ESMTPSA id p188sm1049036wmp.30.2021.10.26.09.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 09:38:22 -0700 (PDT)
Message-ID: <ce0a6953-ad4c-b03c-8dd2-d8d4f7f6669d@gmail.com>
Date:   Tue, 26 Oct 2021 18:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] i2c: i801: Fix incorrect and needless software PEC
 disabling
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>
References: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.10.2021 16:39, Jarkko Nikula wrote:
> Commit a6b8bb6a813a ("i2c: i801: Fix handling SMBHSTCNT_PEC_EN")
> attempts to disable software PEC by clearing the SMBHSTCNT_PEC_EN (bit 7)
> in the SMBus Host Control register (I/O SMBHSTCNT) but incorrectly
> clears it in the PCI Host Configuration register (PCI SMBHSTCFG).
> 
Indeed, my bad. Mixed up HSTCFG and HSTCNT here.

> This clearing is actually needless since after above commit the
> SMBHSTCNT_PEC_EN is never set and the register is initialized with known
> values.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> I didn't add Fixes tag and Cc stable@vger.kernel.org since I don't see
> this causes any real issues. A few platforms I checked the PCI Host
> Configuration register bit 7 was reserved 0.
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 115660dce722..b6048a571543 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1657,7 +1657,6 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>  	unsigned char hstcfg = priv->original_hstcfg;
>  
>  	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> -	hstcfg &= ~SMBHSTCNT_PEC_EN;	/* Disable software PEC */
>  	hstcfg |= SMBHSTCFG_HST_EN;
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  }
> 

