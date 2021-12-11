Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8995471748
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Dec 2021 00:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhLKXXI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 18:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhLKXXI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 18:23:08 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1206DC061714
        for <linux-i2c@vger.kernel.org>; Sat, 11 Dec 2021 15:23:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so20921050wru.13
        for <linux-i2c@vger.kernel.org>; Sat, 11 Dec 2021 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=63LdywA6Fzb9Ph+cdue7STT0iTxxghvEq9GfnjKO6BQ=;
        b=h30aU3XTIq4RTenlwCdXGqyEteXzhIk4zf7r2v6ejJwmNkpJAYg8tKR4142VFVG8us
         A5DJPf/LVLws0CfTSbxsXa7HOFpBOmXDakTX26fnuEE29tttmIOut4NhuY4CmZZSsGSL
         SR/9N3BAQGXgkYyJ3lZPvjILnXQc/HK9TrAsjDg2sfjYzB/I+iFQpsVtW9c1+GCYeQaW
         6GwsKfwL8n+KfZd7LhVikNH3tbUX2lEjxWCC5n20hH43Lg5X4A0IG7PkVaz7nfGgYwHT
         RRIczZ5F8ZTwRngnNQl5sFhvqajUeN20y2IrEQ1RYwQ45meHqLd1poDhJL6CD80FPBIR
         dGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=63LdywA6Fzb9Ph+cdue7STT0iTxxghvEq9GfnjKO6BQ=;
        b=EcLN3tfzFNdI3snhoTVbjek7HB+IIu/L4pQqSE+jS/oEgQaLNN99+YSpK/969Odx02
         /LHl9QofBXOgiLxegp5n+XPOqtcIymRQUtG8fa64EkaJgzK/gQ7qn7NBwr7kjXC9HACr
         mTRUEPMLVy7lgb0aSjwrTzKGhYcEL+QlXaTNZkOpfpolSjk0KfvmaKMmROMsudnFw7oU
         fE7HY83d/AgrY7OU6wjvpoCTKOBeEe2qHchqptyepytOj2ZIDG+qzMqB7R0DpIbt+7FB
         gbuayk5n/TapD/JTswL6O49ie6K3L5AnWFzuqCC3qVXym2sYlKg4/Rh0vYtWFJVBWorh
         JnAA==
X-Gm-Message-State: AOAM530d/gm3usBh8AuQfwz/E4VPVh0Wxo1f9U7PRBqYaASvFX9Xk4X2
        RLQ3SGyLJ+w3eJQJvDSpw0dL8YuMBm8=
X-Google-Smtp-Source: ABdhPJy3mrlQuVuyGZJb3dE0aeUQ9wnV3d06Qj1jaCRhFO6le6IASSHLhMDF6p0rCsYRP75WsI5E/Q==
X-Received: by 2002:a05:6000:250:: with SMTP id m16mr22304796wrz.459.1639264986421;
        Sat, 11 Dec 2021 15:23:06 -0800 (PST)
Received: from ?IPV6:2003:ea:8f24:fd00:41e7:8952:1031:d2bc? (p200300ea8f24fd0041e789521031d2bc.dip0.t-ipconnect.de. [2003:ea:8f24:fd00:41e7:8952:1031:d2bc])
        by smtp.googlemail.com with ESMTPSA id a1sm7733534wri.89.2021.12.11.15.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 15:23:05 -0800 (PST)
Message-ID: <f11fbfad-4c94-7080-d1d2-c11d17e863ba@gmail.com>
Date:   Sun, 12 Dec 2021 00:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: i801: I2C block read should be usable also on
 ICH/ICH0/ICH2/ICH3/ICH4
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
In-Reply-To: <b4cb50db-7226-282f-e04a-02fbe0b605a0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06.12.2021 22:18, Heiner Kallweit wrote:
> Currently we use the following feature definitions. However, according to
> the respective datasheets, also ICH/ICH0/ICH2/ICH3/ICH4 support I2C block
> read. The implementation we have should work also on these chip versions.
> 
Basically the same I found for interrupt support. It's available on all
chip versions. Any specific reason why driver uses interrupts from ICH5
only?


> The commit message of 6342064cad7a ("i2c-i801: Implement I2C block read
> support") states that i2c block read is supported from ICH5 only.
> This doesn't seem to be true. Or is this feature broken on older chip
> versions? 
> 
> To me it seems we could remove FEATURE_I2C_BLOCK_READ because all chip
> versions support this feature. Below is an experimental patch, for the
> ones with test hw. A test case could be to use decode-dimms that
> uses i2c block read to read the EEPROM content.
> 
> * Supports the following Intel I/O Controller Hubs (ICH):
>  *
>  *					I/O			Block	I2C
>  *					region	SMBus	Block	proc.	block
>  * Chip name			PCI ID	size	PEC	buffer	call	read
>  * ---------------------------------------------------------------------------
>  * 82801AA (ICH)		0x2413	16	no	no	no	no
>  * 82801AB (ICH0)		0x2423	16	no	no	no	no
>  * 82801BA (ICH2)		0x2443	16	no	no	no	no
>  * 82801CA (ICH3)		0x2483	32	soft	no	no	no
>  * 82801DB (ICH4)		0x24c3	32	hard	yes	no	no
>  * 82801E (ICH5)		0x24d3	32	hard	yes	yes	yes
> 
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 930c6edbe..fd9a19a80 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -294,7 +294,6 @@ struct i801_priv {
>  #define FEATURE_SMBUS_PEC	BIT(0)
>  #define FEATURE_BLOCK_BUFFER	BIT(1)
>  #define FEATURE_BLOCK_PROC	BIT(2)
> -#define FEATURE_I2C_BLOCK_READ	BIT(3)
>  #define FEATURE_IRQ		BIT(4)
>  #define FEATURE_HOST_NOTIFY	BIT(5)
>  /* Not really a feature, but it's convenient to handle it as such */
> @@ -780,10 +779,6 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  			pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
>  			pci_write_config_byte(priv->pci_dev, SMBHSTCFG,
>  					      hostc | SMBHSTCFG_I2C_EN);
> -		} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
> -			dev_err(&priv->pci_dev->dev,
> -				"I2C block read is unsupported!\n");
> -			return -EOPNOTSUPP;
>  		}
>  	}
>  
> @@ -956,11 +951,10 @@ static u32 i801_func(struct i2c_adapter *adapter)
>  	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>  	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>  	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
> +	       I2C_FUNC_SMBUS_READ_I2C_BLOCK |
>  	       ((priv->features & FEATURE_SMBUS_PEC) ? I2C_FUNC_SMBUS_PEC : 0) |
>  	       ((priv->features & FEATURE_BLOCK_PROC) ?
>  		I2C_FUNC_SMBUS_BLOCK_PROC_CALL : 0) |
> -	       ((priv->features & FEATURE_I2C_BLOCK_READ) ?
> -		I2C_FUNC_SMBUS_READ_I2C_BLOCK : 0) |
>  	       ((priv->features & FEATURE_HOST_NOTIFY) ?
>  		I2C_FUNC_SMBUS_HOST_NOTIFY : 0);
>  }
> @@ -997,7 +991,7 @@ static const struct i2c_algorithm smbus_algorithm = {
>  	.functionality	= i801_func,
>  };
>  
> -#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
> +#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | 				  \
>  			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
>  			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
>  #define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \

