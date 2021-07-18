Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4F93CC965
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jul 2021 15:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhGRNyb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Jul 2021 09:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbhGRNya (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Jul 2021 09:54:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6960FC061762
        for <linux-i2c@vger.kernel.org>; Sun, 18 Jul 2021 06:51:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso8787030wmj.4
        for <linux-i2c@vger.kernel.org>; Sun, 18 Jul 2021 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WS1t2jUvvcZQli38Bpp1X/pe4QWfwRFEzeHjp/8UNgQ=;
        b=QJltSSDb+bxqCbe6eGoIelHF2lucNuP7kAAhJwWj2xu73+/aTrczQk5ZkHYruSCErq
         gESIFxXVqtqiLHDLrB7vODHqVUEn8lIqFtF7yJ6jhPbBhxKSCCrdaKM+Kz7lVR93oti6
         y1H6vtz5h0oAC00ITp9jL4ldQj4/5uL0wcBtptOZjDb4NqbbkHZMO06Ox5BfiIQOvFoE
         Ws53gDQEJcjXBI+RNZ1JGWg2IhoEWzWsqhARb/qnAWmbJ4LchGgd85MsewEvPl51nQqX
         RzeJtCvJKVP2725x6+dzH9VM3Vjk1JqV4H3Eob+CODeXj7J86eq7HtIxniI5eEc4QWwX
         O7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WS1t2jUvvcZQli38Bpp1X/pe4QWfwRFEzeHjp/8UNgQ=;
        b=quluwrvTNSSS2XFJNpaquPyTKB22+yJI8VV73DbhQwJcUbDRvrCMT2/A37f6+ANJno
         pVkc4+ko3krrEX6g4F80RM18cwTxooUlNAov97FfjLp2/NlUBauwZkgxMx0IszhaZwfd
         m1SIiHKtYrcifTwEnbmul16SllyAwQkannsBdctSigW+Wj6hjxpUQvmauIJIlY7yqzeU
         oKoO6qK+xjgINGvXuni3KV3Sk9lJoLHbkJWSAqqMQyxiaVYHbFRSOYplFctL1T/IEnEN
         8B5riX6HHIa7xbQ9a6Pn2Xm/9ltO71PKWFfpLzQtUlAodQzSUp2Fz9lfyGrqpfvGgGm6
         A4NA==
X-Gm-Message-State: AOAM530j6LEFp6IbG5UaRMRz746WZiSh69rWq9gJpt6aNS9HPZkBbcQh
        XrR0LLGJtucDxXuuoJkKaAiynQAtO5PGSg==
X-Google-Smtp-Source: ABdhPJxrl7B435HXFF2xWh4EAl4GPMjZjjzmXH2c6raLl6f7aJFqvri1KkVxpKhh/qxkYe5t8b+lJg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr27345459wmc.88.1626616290814;
        Sun, 18 Jul 2021 06:51:30 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:d8e0:a881:e986:53be? (p200300ea8f3f3d00d8e0a881e98653be.dip0.t-ipconnect.de. [2003:ea:8f3f:3d00:d8e0:a881:e986:53be])
        by smtp.googlemail.com with ESMTPSA id f130sm16899274wmf.23.2021.07.18.06.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jul 2021 06:51:30 -0700 (PDT)
Subject: Re: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
Message-ID: <634382bd-b7b7-3a77-757c-b44fc070c7e8@gmail.com>
Date:   Sun, 18 Jul 2021 15:51:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21.06.2021 23:08, Heiner Kallweit wrote:
> Bit SMBHSTCNT_PEC_EN is used only if software calculates the CRC and
> uses register SMBPEC. This is not supported by the driver, it supports
> hw-calculation of CRC only (using bit SMBAUXSTS_CRCE). The chip spec
> states the following, therefore never set bit SMBHSTCNT_PEC_EN.
> 
> Chapter SMBus CRC Generation and Checking
> If the AAC bit is set in the Auxiliary Control register, the PCH
> automatically calculates and drives CRC at the end of the transmitted
> packet for write cycles, and will check the CRC for read cycles. It will
> not transmit the contents of the PEC register for CRC. The PEC bit must
> not be set in the Host Control register. If this bit is set, unspecified
> behavior will result.
> 
> This patch is based solely on the specification and compile-tested only,
> because I have no PEC-capable devices.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> This patch may be a candidate for stable (with a little bit of fuzz)
> once somebody with a PEC-capable device has tested it.
> ---
>  drivers/i2c/busses/i2c-i801.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 0153a21f4..161176fcd 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -516,12 +516,9 @@ static int i801_transaction(struct i801_priv *priv, int xact)
>  
>  static int i801_block_transaction_by_block(struct i801_priv *priv,
>  					   union i2c_smbus_data *data,
> -					   char read_write, int command,
> -					   int hwpec)
> +					   char read_write, int command)
>  {
> -	int i, len;
> -	int status;
> -	int xact = hwpec ? SMBHSTCNT_PEC_EN : 0;
> +	int i, len, status, xact = 0;
>  
>  	switch (command) {
>  	case I2C_SMBUS_BLOCK_PROC_CALL:
> @@ -678,8 +675,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>   */
>  static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  					       union i2c_smbus_data *data,
> -					       char read_write, int command,
> -					       int hwpec)
> +					       char read_write, int command)
>  {
>  	int i, len;
>  	int smbcmd;
> @@ -777,9 +773,8 @@ static int i801_set_block_buffer_mode(struct i801_priv *priv)
>  }
>  
>  /* Block transaction function */
> -static int i801_block_transaction(struct i801_priv *priv,
> -				  union i2c_smbus_data *data, char read_write,
> -				  int command, int hwpec)
> +static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> +				  char read_write, int command)
>  {
>  	int result = 0;
>  	unsigned char hostc;
> @@ -815,11 +810,11 @@ static int i801_block_transaction(struct i801_priv *priv,
>  	 && i801_set_block_buffer_mode(priv) == 0)
>  		result = i801_block_transaction_by_block(priv, data,
>  							 read_write,
> -							 command, hwpec);
> +							 command);
>  	else
>  		result = i801_block_transaction_byte_by_byte(priv, data,
>  							     read_write,
> -							     command, hwpec);
> +							     command);
>  
>  	if (command == I2C_SMBUS_I2C_BLOCK_DATA
>  	 && read_write == I2C_SMBUS_WRITE) {
> @@ -936,8 +931,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		       SMBAUXCTL(priv));
>  
>  	if (block)
> -		ret = i801_block_transaction(priv, data, read_write, size,
> -					     hwpec);
> +		ret = i801_block_transaction(priv, data, read_write, size);
>  	else
>  		ret = i801_transaction(priv, xact);
>  
> @@ -1625,6 +1619,7 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>  	unsigned char hstcfg = priv->original_hstcfg;
>  
>  	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> +	hstcfg &= ~SMBHSTCNT_PEC_EN;
>  	hstcfg |= SMBHSTCFG_HST_EN;
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  
> 

Jean, do you have an opinion on this patch? It's been pending for quite some
time and I have few more patches that I'd like to submit.
