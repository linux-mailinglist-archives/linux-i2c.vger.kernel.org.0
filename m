Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BE852623
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfFYIMO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:12:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36091 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfFYIMO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:12:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id u8so1907962wmm.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2019 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ksquared.org.uk; s=google;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oL96/Du7deB/ZV39ekmD0RrvXFDh84PxwT74AUOoIWc=;
        b=Qk5s5OrycXnwdm+ZvHW+ujVtnil2jwEF5p7LcM7YqUlseChSPSraqweOAzXIgqgUse
         DlakmCO2O1yCtY65Mqsqx9xZ4dghAhdgKQHdUaRqNK5Keml1j5LrNKV3qu3hajZZsalf
         ZmPEMSZaouW3dGJi0i1w/EYPNtkxI73+ZqwiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oL96/Du7deB/ZV39ekmD0RrvXFDh84PxwT74AUOoIWc=;
        b=HrPJYCYRYmKkwR2VtA2mKqc/4vnsJBduBJ0EoCEbwm4sJMlKmVxim1Sg0FvKkCuSfD
         Z0JEE3PKn2tLe6w0orwG75e3yyGC00noS0UOtdOD+wgjv0bWmYms7R4srDD5AWNfmupS
         iagjIH/33hAkFgD+cPcA5I5juxXZn0PNMQwcv7xpXKy6zMs2qaQma2fkm+CpHLi/h+/4
         AWC1lyEsckbm18pxh7sNgNF8fpzIBM25ZNGzc9m7zakqC5MebXqi2ZtIOhAv4G8w3LhN
         47xNmBSwj/Q653RbxI/I8Ts5ezX6Il57uWxM+JfbbBIGMSy5mDVHKI/vDp9wh6g4oy/N
         mvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oL96/Du7deB/ZV39ekmD0RrvXFDh84PxwT74AUOoIWc=;
        b=WGNRSXIAD6qsFwHVHAHEKVybxgGpkPoOJlnA4gn7kccHP9NcuLIyY8Q09+ZNb0iA6c
         vfr+xXp0O7z4X0xM7g+Tpr14BJW0iPDx9HVZoBWJlx3T6nkB2PFl3yJ/I5CLTzBRBMoI
         X6GhvSFqgTvLsDvVVwG3/6Qg9ILCQVo+FLIV3+loLi6BwMH3rvkviNaGBBffJKjqbs4O
         yGTlSsf6LLnfFaaLU/gqlq/EnGftgl0EEtbGqFWNiztWEeMn0kD/nbuYrc7AYDxJiPNf
         a0CVZd0OxbybyTQTEL16ikn8PuV6JBkSddpwA0HIh97LImuCzhDiwkLcYWVurb7FzEXK
         p3RQ==
X-Gm-Message-State: APjAAAWEZkfEfY82EJDF0jLTMqedDk6FP7P33u/YkBNnN3ML8fgQp/ej
        vrxt7ms7y+KbpJKh0OY0su3OsA==
X-Google-Smtp-Source: APXvYqyaCJewS00jv9ZSmW+bUvswGqT14VS1aeNEkPVOEMbHY68uwcTNyt72eWVmqvDWV7HttQ05Vw==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr19711341wmc.62.1561450330909;
        Tue, 25 Jun 2019 01:12:10 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id j32sm31063755wrj.43.2019.06.25.01.12.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 01:12:10 -0700 (PDT)
Subject: Re: [PATCH] i2c: add newly exported functions to the header, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
Message-ID: <eb180e10-eb84-26a3-2943-c0c0a3bc256e@bingham.xyz>
Date:   Tue, 25 Jun 2019 09:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 24/06/2019 18:04, Wolfram Sang wrote:
> Nobody (including me) noticed that these functions were exported but not
> added to the header :/
> 

A small, minor detail :D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Fixes: 7159dbdae3c5 ("i2c: core: improve return value handling of i2c_new_device and i2c_new_dummy")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 5 ++---
>  include/linux/i2c.h         | 6 ++++++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9e43508d4567..4ef44fa7e36b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -721,7 +721,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
>   * This returns the new i2c client, which may be saved for later use with
>   * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -static struct i2c_client *
> +struct i2c_client *
>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  {
>  	struct i2c_client	*client;
> @@ -887,8 +887,7 @@ static struct i2c_driver dummy_driver = {
>   * This returns the new i2c client, which should be saved for later use with
>   * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -static struct i2c_client *
> -i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
> +struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
>  {
>  	struct i2c_board_info info = {
>  		I2C_BOARD_INFO("dummy", address),
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 1308126fc384..79f0d4fd5036 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -436,6 +436,9 @@ struct i2c_board_info {
>  extern struct i2c_client *
>  i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>  
> +extern struct i2c_client *
> +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
> +
>  /* If you don't know the exact address of an I2C device, use this variant
>   * instead, which can probe for device presence in a list of possible
>   * addresses. The "probe" callback function is optional. If it is provided,
> @@ -457,6 +460,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapter *, unsigned short addr);
>  extern struct i2c_client *
>  i2c_new_dummy(struct i2c_adapter *adap, u16 address);
>  
> +extern struct i2c_client *
> +i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
> +
>  extern struct i2c_client *
>  devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
>  
> 

