Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7921322BA
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgAGJmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:42:17 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40871 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgAGJmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:42:17 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so53109246wrn.7
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vSAjKVl0ui0bRIZJfR4tWOo/0bR753xuMEY20h0km+Q=;
        b=SRD6R1ZvqKlhjrRh6tEW7z5P4bDiGu/QP8qPHsAdBd+cLBICqaC4bTIQN3/AfnJzaa
         +IXFGVK+L4WLr7zuGtZrbIZHYk7toSEUFe4YByELlMEtQ9/vqXE1+Abe3YiJxefuYtJp
         M0XmPKoV8pU4EoYbukwXIsEJbYPe6dVh2o2Qat2K5GK4wS6oSztmV/ZnfV3k9D9NpGYd
         5Y2zMNY+kWikP1g7jsGOwyXX8QKrBXAo0wG/yRJMxTp+vQhzI+ls7BMaSjuTlAF5aPV2
         hvCefGAklZFvSaGFtbUQB9JxP7yBKa5BWTJcsEz5lZG094kw3YaxpG+iAVLp8YYWNuW+
         atrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vSAjKVl0ui0bRIZJfR4tWOo/0bR753xuMEY20h0km+Q=;
        b=Vm253LfuNUyaQ9Jw97NSMt8awRo49a5OCyfWkbC46IwHiAlxZCMhiHnHqhulM8Ow8r
         Zhd0EgS8gvwB2jSJfCHzl0Pkrt9KM2Y08vyDKzMd000w9bAsxhHJp++EVpPCoLz3Wodu
         cuWAL3c3ynLbpy/Fl7MzeG+5dn9u3J7Sn2VAhHslm/5b3MpTFxdHwSm0wYsTtO9R+30g
         HucV11cAazOxnL4/2RIIFVzf+HXQkjojf2Ymh10dgMgTCdHp2QHPLffVtZ0R2R47dJ5Y
         0gCGqvhh8QhYea/R2xCpTqZBF+plkZ7S4zp6JnhG7lQp7Z+GSyY1FZbQ/rKRGaAa1coZ
         zlaQ==
X-Gm-Message-State: APjAAAWoXZ5Po8of+83m5lPDGEWMJC1dp2JCNqet+TXjQBFuPUp8gdGT
        pI4NJ18hfVGltuqnkFvDud8+Qw==
X-Google-Smtp-Source: APXvYqyLvh5kWmU1R21fi39UY2v9hjUQEIBtO791Hzvk/qV+O8bYX1pIRuFjlTlJBPNaHDB2C+13sQ==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr37473014wrj.357.1578390134496;
        Tue, 07 Jan 2020 01:42:14 -0800 (PST)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id h17sm79272088wrs.18.2020.01.07.01.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 01:42:13 -0800 (PST)
Subject: Re: [RFC PATCH 2/5] i2c: core: add new variant to check for a client
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-3-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <790fd412-f540-8a02-2c34-853cd110f47a@bingham.xyz>
Date:   Tue, 7 Jan 2020 09:42:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231161400.1688-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 31/12/2019 16:13, Wolfram Sang wrote:
> For the new 'alias' feature, we need to scan for devices while holding
> the lock. We focus on read_byte transactions for now to keep things
> simple. Requesting an alias will be rare, so there is not much overhead.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 20a726dc78db..51bd953ddfb2 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2108,6 +2108,23 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
>  	return err >= 0;
>  }
>  
> +static int i2c_unlocked_read_byte_probe(struct i2c_adapter *adap, unsigned short addr)
> +{
> +	union i2c_smbus_data dummy;
> +	int err;
> +
> +	if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_READ_BYTE)) {
> +		err = __i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> +				     I2C_SMBUS_BYTE, &dummy);
> +	} else {
> +		dev_warn(&adap->dev, "No suitable probing method supported for address 0x%02X\n",

Laurent has already pointed out the format issue here, and that this
function might be squashed into 3/5 anyway,

But otherwise it looks good to me, so if you keep it separate:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +			 addr);
> +		err = -EOPNOTSUPP;
> +	}
> +
> +	return err >= 0;
> +}
> +
>  static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
>  			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
>  {
> 

