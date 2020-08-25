Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF7D251A10
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgHYNqq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 25 Aug 2020 09:46:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:37714 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgHYNqn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 09:46:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BFBE8AE92;
        Tue, 25 Aug 2020 13:47:10 +0000 (UTC)
Date:   Tue, 25 Aug 2020 15:46:39 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <volker.ruemelin@googlemail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH resend] i2c-i801: fix resume bug
Message-ID: <20200825154639.01a92ff2@endymion>
In-Reply-To: <a2fc5a6d-a3bf-eaf0-bb75-1521be346333@googlemail.com>
References: <a2fc5a6d-a3bf-eaf0-bb75-1521be346333@googlemail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Volker,

Sorry for the late... very late answer. What can I say...

On Sun, 3 Dec 2017 16:42:42 +0100, Volker Rümelin wrote:
> On suspend the original host configuration gets restored. The
> resume routine has to undo this, otherwise the SMBus master
> may be left in disabled state or in i2c mode.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
> 
> I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
> doesn't intitialize the SMBus master. After 1s of SMBus inactivity
> autosuspend disables the SMBus master. To reproduce please note QEMU's
> ICH9 SMBus emulation does not handle interrupts and it's necessary
> to pass the parameter disable_features=0x10 to the i2c_i801 driver.
> 
>  drivers/i2c/busses/i2c-i801.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 9e12a53..ebd81bc 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1489,6 +1489,13 @@ static void i801_acpi_remove(struct i801_priv *priv)
>  static inline void i801_acpi_remove(struct i801_priv *priv) { }
>  #endif
>  
> +static unsigned char i801_setup_hstcfg(unsigned char hstcfg)
> +{
> +	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> +	hstcfg |= SMBHSTCFG_HST_EN;
> +	return hstcfg;
> +}
> +
>  static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	unsigned char temp;
> @@ -1592,13 +1599,10 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		return err;
>  	}
>  
> -	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &temp);
> -	priv->original_hstcfg = temp;
> -	temp &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> -	if (!(temp & SMBHSTCFG_HST_EN)) {
> +	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &priv->original_hstcfg);
> +	temp = i801_setup_hstcfg(priv->original_hstcfg);
> +	if (~priv->original_hstcfg & temp & SMBHSTCFG_HST_EN)

Took me some time to figure out what you were doing here, and while the
result is correct, I think this is needlessly convoluted. We already
know that "temp & SMBHSTCFG_HST_EN" evaluates to "SMBHSTCFG_HST_EN"
after i801_setup_hstcfg(). So The above can be simplified to:

	if (~priv->original_hstcfg & SMBHSTCFG_HST_EN)

or to the IMHO more readable:

	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))

>  		dev_info(&dev->dev, "Enabling SMBus device\n");
> -		temp |= SMBHSTCFG_HST_EN;
> -	}
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, temp);
>  
>  	if (temp & SMBHSTCFG_SMB_SMI_EN) {
> @@ -1709,7 +1713,9 @@ static int i801_resume(struct device *dev)
>  {
>  	struct pci_dev *pci_dev = to_pci_dev(dev);
>  	struct i801_priv *priv = pci_get_drvdata(pci_dev);
> +	unsigned char hstcfg = i801_setup_hstcfg(priv->original_hstcfg);
>  
> +	pci_write_config_byte(pci_dev, SMBHSTCFG, hstcfg);
>  	i801_enable_host_notify(&priv->adapter);
>  
>  	return 0;

I had to adjust the above section as the context changed meanwhile, but
nothing to worry about.

Thank you for your contribution, I'll resend the updated patch later
today. All credits to you.

-- 
Jean Delvare
SUSE L3 Support
