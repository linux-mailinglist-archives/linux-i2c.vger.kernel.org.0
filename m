Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C4D3D0F03
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jul 2021 14:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhGUMFs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jul 2021 08:05:48 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59734 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbhGUMFs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jul 2021 08:05:48 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9FB55223D5;
        Wed, 21 Jul 2021 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626871583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kGYv/XH5SItJdJ4gdrsWaqRzajuA84U6SRy0z9ECkfY=;
        b=JNqrhxSCKPjoisQlTXjFFRlUZvS6N6f6lbE3585asH+TngzvMsrgBcza+vU2Ps+YaZ9KIE
        bUJZfAcLIl1tF3HnRdRU5TtPUoK+ILIKQR6GDiCRcm/FuDdaZ/EKZ2ZZu7otPQy/1KhVda
        iyyvZhfzCdizqzgRtEaTxXuV1eDb0Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626871583;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kGYv/XH5SItJdJ4gdrsWaqRzajuA84U6SRy0z9ECkfY=;
        b=J8wFeiCY7zt5NGxJJMEHM+9zw/tzpGwozVIvno4c+NWpYe27YCucznJYiIFXjlxbqYBcPe
        64aSv2OWAOmxFjDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6812E13BDC;
        Wed, 21 Jul 2021 12:46:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id Ii9aFh8X+GB7fwAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Wed, 21 Jul 2021 12:46:23 +0000
Date:   Wed, 21 Jul 2021 14:46:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
Message-ID: <20210721144620.00671c3d@endymion>
In-Reply-To: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
References: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Mon, 21 Jun 2021 23:08:40 +0200, Heiner Kallweit wrote:
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

I don't think so. One of the conditions for stable branch acceptance is
that the patch must fix a real problem that bothers people. Here we
have an issue that is present for 20 years and nobody ever reported.

I'm all for fixing it upstream, but not in stable kernels.

As for testing, I also don't have a PEC-cable device at hand. However,
we may still be able to test this change:
* If you have a device at 0x69 on the i801 SMBus of any of your system,
  that would be a clock device, which almost always support PEC.
* If you have EEPROMs on your i801 SMBus, you may be lucky and find a
  sequence of bytes where the PEC computation leads to exactly the
  value of the following byte. I remember doing that years ago, sadly I
  can no longer find the script I wrote at that time. Be careful when
  accessing SPD EEPROMs, you want to read from them, not write to them
  ;-) Incidentally i2c-tools was just improved to allow arbitrary SMBus
  block read commands so i2cget can be used for easy testing from
  user-space.

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

This can be simplified further. xact no longer needs to be initialized
here, you can set its value directly below instead of using bit masking.

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

A comment like /* Disable software PEC */ could be added here.

>  	hstcfg |= SMBHSTCFG_HST_EN;
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  


-- 
Jean Delvare
SUSE L3 Support
