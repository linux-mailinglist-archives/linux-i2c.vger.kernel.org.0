Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1697E32316D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 20:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbhBWT1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 14:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231594AbhBWT1r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 14:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614108379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0gF07ODBMYlnEh288xpLipdlztpVmS3XNZj0lur9ofM=;
        b=T3iCUSX4ALDGLbwTuarPKb6UDCtU4I0q1hIrRfhFO8dt8c+iopaeI2EMbVQqH8LmDzNXm2
        gDOrL+TdK+mdtdWc13C0oRmQJeuyf3+HpTSWRRsLoePymCLgOub2dAE0AY4aE9aagFI+lN
        hkVHMZvZc2VwyM9jfkfsAd8BNpzUn3A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-DG_F2_gdMa-_uch-4qmYFg-1; Tue, 23 Feb 2021 14:25:38 -0500
X-MC-Unique: DG_F2_gdMa-_uch-4qmYFg-1
Received: by mail-ed1-f70.google.com with SMTP id i21so9167572edq.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 11:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0gF07ODBMYlnEh288xpLipdlztpVmS3XNZj0lur9ofM=;
        b=S1QEVfsU55LcylyTylpXceMRrfKnzteJuXbj/qxtI4FAIWPJPbmfVExyqt4Y7qupqB
         EBriEHx2JhT6YsYV8o3oynZuohFfrYaO5zqmzYVJW9gwBw2uajRC2A3ckx+Z7CmaPMzA
         5EbJkJjzdt0K28dHy1nnRFw88ddykevXuMyEcjiISOuj6o5rpwxw5SDoT6HDPWuYtaER
         M3k0M8NIle5qBUkTk2w/Xqxh3QGVNUITnLJ1XUz1AMkDDxOHrxcPow71IaaX7w8uIB5M
         khX/GX1qIN/gQ+sxROCjMjRZb6s4idxjAuxd9P49DRTf08+Kl2PabGofBy1Uzc+Jk64o
         BZWg==
X-Gm-Message-State: AOAM532tHZB28gW5+iU/hyVTo9lFET8EdMpgr646VnP1Tg38GaRtUD5N
        RXWP3Boo+DwBxgXG/IHaomCCMLND3rFOa1wk3P7neVjvSanA1GkmW0Lz9d9qQ4CmDgbgX6K8vVh
        9ZwssbO7cKDjY6P7mluDK
X-Received: by 2002:a05:6402:355:: with SMTP id r21mr16286917edw.194.1614108336829;
        Tue, 23 Feb 2021 11:25:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWcPpeB6vm7SJ/8b7K5wQR1A6syQqw41+Kt4UW3gE783g1E2ce6DqZP2zIl32r1WrZPkPD/Q==
X-Received: by 2002:a05:6402:355:: with SMTP id r21mr16286901edw.194.1614108336649;
        Tue, 23 Feb 2021 11:25:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n12sm6013934edq.21.2021.02.23.11.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 11:25:36 -0800 (PST)
Subject: Re: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and IRQ
 domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com>
Date:   Tue, 23 Feb 2021 20:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 2/23/21 6:22 PM, Andy Shevchenko wrote:
> It's better to describe the I²C controller and associated IRQ domain with
> fwnode, so they will find their place in the hierarchy in sysfs and also
> make easier to debug.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Hans, unfortunately I have no device at hand with INT34D3. This is only compile
> tested in that sense. Also I would like to hear if you like the idea in general.
> 
>  drivers/i2c/busses/i2c-cht-wc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index f80d79e973cd..dbf55842b0dc 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -303,6 +303,7 @@ static struct bq24190_platform_data bq24190_pdata = {
>  static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  {
>  	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);

So this will point to the ACPi-companion fwnode of the CHT Whiskey Cove PMIC
controller.

>  	struct cht_wc_i2c_adap *adap;
>  	struct i2c_board_info board_info = {
>  		.type = "bq24190",
> @@ -333,6 +334,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  	strlcpy(adap->adapter.name, "PMIC I2C Adapter",
>  		sizeof(adap->adapter.name));
>  	adap->adapter.dev.parent = &pdev->dev;
> +	set_primary_fwnode(&adap->adapter.dev, fwnode);

So now we have the main PMIC device i2c-client, the platform-device instantiated
for the MFD-cell for the PMIC's builtin I2C-controller; and the device instantiated
for the adapter-device all 3 share the same ACPI-companion fwnode.
>  
>  	/* Clear and activate i2c-adapter interrupts, disable client IRQ */
>  	adap->old_irq_mask = adap->irq_mask = ~CHT_WC_EXTCHGRIRQ_ADAP_IRQMASK;
> @@ -350,8 +352,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Alloc and register client IRQ */
> -	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
> -						 &irq_domain_simple_ops, NULL);
> +	adap->irq_domain = irq_domain_create_linear(fwnode, 1,
> +						    &irq_domain_simple_ops, NULL);

Hmm, not sure this is right, admittedly the old code looks weird too, but now we
are creating a second irq_domain at the same level as the irq_domain created for
the IRQ-chip part of the PMIC. But this is really more of a child-domain of just
the I2C-controller MFD-cell. The IRQ-CHIP part of the PMIC has a single IRQ for the
I2C controller which gets raised both on i2c-transfer completions and when the
pin on the PMIC which is reserved as input for the IRQ coming out of the charger-chip
gets triggered.

IOW we have this:


               PMIC
                 |
    ------------------------------
    |       |        |           |
   IRQ1   IRQ2      IRQ3       I2C-IRQ
                                 |
                   ----------------------------------
                   |        |         |             |
                 READIRQ   WRIRQ    NACKIRQ     CLIENT-IRQ

Where READIRQ, WRIRQ and NACKIRQ are directly consumed
and the CLIENT-IRQ is being represented as a single IRQ on
a new irqchip so that we can pass it along to the i2c-driver
for the charger-chip which is connected to the Whiskey Cove's
builtin I2C controller.

But doing as you suggest would model the IRQs as:

               PMIC
                 |
    --------------------------------------------------
    |       |        |           |                    |
   IRQ1   IRQ2      IRQ3       I2C-IRQ           CLIENT-IRQ

Which is not the same really. I guess it is better then what we
have though ?

Note I can test any changes made here, but I'm not 100% convinced that
the current version of this patch is correct.

Regards,

Hans

