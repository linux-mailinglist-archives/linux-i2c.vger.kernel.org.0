Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E511322AC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAGJkl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:40:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44638 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGJkl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:40:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so14169279wrm.11
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tM6ITMXFKwvSMK5d/Q2P3omIxnLnErtLVVmZWiZShJk=;
        b=t/rjqJ4XQPg9AdpPRZAkiETuSlG5sjlWEsqXmAy7qliN2dXjK3GEsqRQEVkUBkycx0
         iKsCMUA0sKLt62ACQjQJsuq2kB6FM1qyAre90/ExIMxGPlydARBLQcOClwwEotvhsEkE
         z9umU1YQ9PN0Bn0b/2JG6znTr8D+EwI4nvtGczV/BWnH+/1cm+vdPFRh+8asFz1WhPK0
         DCzAGulFRF9/pSzO2UnfisZghi5Y7uQ/vO63LOPRqVNjKNo5lVWnV58BrXlQNGBT5ndN
         V7tRzYRc9zABzcVjZ+FNxx2KabOfFtMTltE6VP0skYBlV7jryocJnLkoav7agumMtxJh
         C6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tM6ITMXFKwvSMK5d/Q2P3omIxnLnErtLVVmZWiZShJk=;
        b=B6B0YuuntfX60IUMSYE/JEcwsrd/oYtLR6LgIGngqBkg5EE41q15AtCpL0Uh3qWtk3
         KMWs1EYuQKG799m++14UGxwiUhHhIJ1qmgNd/LFwm8SXxYxy4qZAtRDeSap8vQCnoRbG
         egAbVOlk/17X3aEzxLhnaHvzjd3gFLzyPD42H6L10RsO2aWJIp4MlfRM/7mT++8AoCU9
         QLOMpi/iYH1P9qMT3nAMuTHbgTZuVK3I/6bVn504mxx05lI3enK3J3yfoy+Gfv3S6Pu9
         Pr1bbVmyB7TlapdfcVRJzX2hURjzZuGp0qug5hMof2M+U93CMyNcQZFp5S4OK6Sdr/qm
         glQw==
X-Gm-Message-State: APjAAAWg7j03wo3++b7BEZBNQpXWXwE8u2fyn+7mzQHtEWWd+YnGq1w5
        y+5y1UWFSNGXVYChvZ8EURwqmdghhlM=
X-Google-Smtp-Source: APXvYqyth0uv1pRL4lL7yTwso78bAXGU7uj1eMP1E1mHeSMqIn+GhG4NDXdkh83LYYs8iR8z26Yy7Q==
X-Received: by 2002:adf:b648:: with SMTP id i8mr109960217wre.91.1578390037440;
        Tue, 07 Jan 2020 01:40:37 -0800 (PST)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id v62sm26239561wmg.3.2020.01.07.01.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 01:40:36 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
Date:   Tue, 7 Jan 2020 09:40:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 31/12/2019 16:13, Wolfram Sang wrote:
> Some devices are able to reprogram their I2C address at runtime. This
> can prevent address collisions when one is able to activate and
> reprogram these devices one by one. For that to work, they need to be
> assigned an unused address. This new functions allows drivers to request
> for such an address. It assumes all non-occupied addresses are free. It
> will then send a message to such a free address to make sure there is
> really nothing listening there.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
>  include/linux/i2c.h         |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 51bd953ddfb2..5a010e7e698f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>  	return err;
>  }
>  
> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
> +{
> +	struct i2c_client *alias = ERR_PTR(-EBUSY);
> +	int ret;
> +	u16 addr;
> +
> +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> +
> +	for (addr = 0x08; addr < 0x78; addr++) {
> +		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);

Are all 'known' devices on a bus (all the ones declared in DT etc)
marked as 'busy' or taken by the time this call is made? (edit, I don't
think they are)

Perhaps this is a constructed corner case, but I'm just trying to follow
it through:

I.e. if say the adv748x had in DT defined aliases at 0x08, 0x09,
0x0A..., but not yet probed (thus no device is listening at these
addresses) ... and then a max9286 came along and asked for 'any' spare
address with this call, would it be given 0x08 first?

If so (which I think is what the case would be currently, until I'm
pointed otherwise) do we need to mark all addresses on the bus as
reserved against this some how?

I'm not sure how that would occur, as it would be up to the adv748x in
that instance to parse it's extended register list to identify the extra
aliases it will create, *and* that would only happen if the device
driver was enabled in the first place.

So this seems a bit 'racy' in a different context; not the i2c_lock_bus,
but rather the probe order of devices on the bus could affect the
allocations.

Perhaps that is unavoidable though...

--
Kieran


> +		if (ret == -ENODEV) {
> +			alias = i2c_new_dummy_device(adap, addr);
> +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
> +			break;
> +		}
> +	}
> +
> +	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
> +	return alias;
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_alias_device);
> +
>  int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
>  {
>  	return i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f834687989f7..583ca2aec022 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -441,6 +441,8 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>  struct i2c_client *
>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>  
> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap);
> +
>  /* If you don't know the exact address of an I2C device, use this variant
>   * instead, which can probe for device presence in a list of possible
>   * addresses. The "probe" callback function is optional. If it is provided,
> 

