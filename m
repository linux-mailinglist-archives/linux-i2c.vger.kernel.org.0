Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CB973463B
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jun 2023 15:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjFRNIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Jun 2023 09:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFRNIJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Jun 2023 09:08:09 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB8AB0;
        Sun, 18 Jun 2023 06:08:08 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4QkY9J6FFsz9sq0;
        Sun, 18 Jun 2023 15:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1687093684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UEYGb76FFpCH3VvdAihjEP00oTFhKJZ92WOIg9ErGZo=;
        b=G4QWYfxQAmEx2waUZWevykuIDbHdpQ4PgvrthOgCKa3NLusQHSOqK2f7QWv9DRf30Tyc/V
        dtPrSbn/3yjpJuY+xMs90x42VRJcGjzec52IbkT/0reUFKVTaxxfcHo5/lj4bX8sC1IkF3
        sNLcwdBGxUcOhAf0iI80GpvfxnmKepKl4YCOkXSl5ZJUWTbiOf8oBZ2U8oi+AAVtPO0U+v
        JTzaukBnZgBxuH2ePEESl5oMTMmxTQZcEYctvtQSAtmEJ0Wl5gjtlngmDN1j+I93BNqmGr
        se6m2xQStWXJAFjYLBaABYHjo+15b4wX4IqAXbBhBoYykSW5FOJisF9t1VS/9Q==
Message-ID: <2648642f-3078-aebf-7920-7eceed044dc8@mariushoch.de>
Date:   Sun, 18 Jun 2023 15:08:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230514103634.235917-1-mail@mariushoch.de>
 <20230514103634.235917-2-mail@mariushoch.de>
 <20230604163855.5b7ea1e0@endymion.delvare>
From:   Marius Hoch <mail@mariushoch.de>
In-Reply-To: <20230604163855.5b7ea1e0@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4QkY9J6FFsz9sq0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On 04/06/2023 16:38, Jean Delvare wrote:
> On Sun, 14 May 2023 12:36:33 +0200, Marius Hoch wrote:
>> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
>> but also claims that the SMBus uses IRQ 18. This will
>> result in:
>>
>> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
>> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
>> i801_smbus: probe of 0000:00:1f.3 failed with error -16
>>
>> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
>> we fall back to polling, which also seems to be what the (very
>> dated) Windows 7 drivers on the Dell Latitude E7450 do.
>>
>> This was tested on Dell Latitude E7450.
>>
>> Signed-off-by: Marius Hoch <mail@mariushoch.de>
>> ---
>>   drivers/i2c/busses/i2c-i801.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index ac5326747c51..5fd2ac585160 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1624,6 +1624,20 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>>   	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>>   }
>>   
>> +/**
> As reported by the kernel test robot, please don't start a comment with
> /** unless it's a kernel-doc-style comment.
>
>> + * These DELL devices claim an IRQ for the SMBus (usually 18), but we can't use
>> + * it, as its actually for the I2C accelerometer.
>> + */
>> +static const struct dmi_system_id dmi_force_no_irq[] = {
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E7450"),
>> +		},
>> +	},
>> +	{} /* Terminating entry */
>> +};
>> +
>>   static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   {
>>   	int err, i;
>> @@ -1657,6 +1671,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   	if (!(priv->features & FEATURE_BLOCK_BUFFER))
>>   		priv->features &= ~FEATURE_BLOCK_PROC;
>>   
>> +	if (dmi_check_system(dmi_force_no_irq)) {
> If the problem is caused by dev->irq being 255, and now that we know
> that this value is special on x86, wouldn't it make more sense to
> restrict this quirk to CONFIG_X86 and simply check for dev->irq ==
> 0xff? This would save us the extra effort of maintaining a list of
> machines which need the quirk.
>
>> +		/* Force no IRQ for these devices, otherwise pcim_enable_device will fail */
>> +		dev->irq = IRQ_NOTCONNECTED;
>> +		dev->irq_managed = 1;
> This field is undocumented so I have no idea what it does. Is it not
> sufficient to set irq to IRQ_NOTCONNECTED?
If irq_managed is not set our irq value will be entirely ignored it 
seems (thus leading to the same code path/ failure initially outlined).
>
>> +	}
>> +
>>   	err = pcim_enable_device(dev);
>>   	if (err) {
>>   		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
>

