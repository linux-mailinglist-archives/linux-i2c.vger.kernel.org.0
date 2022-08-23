Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8DE59E568
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 16:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240407AbiHWOzS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 10:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241119AbiHWOzA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 10:55:00 -0400
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr [80.12.242.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2EEB30092F
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 05:20:04 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id QSOUozmIH9qatQSOUobcah; Tue, 23 Aug 2022 13:48:33 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 23 Aug 2022 13:48:33 +0200
X-ME-IP: 90.11.190.129
Message-ID: <667f1658-cf29-6b19-fd57-0c62f625d536@wanadoo.fr>
Date:   Tue, 23 Aug 2022 13:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Content-Language: fr
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org
Cc:     andriy.shevchenko@linux.intel.com, krzk@kernel.org,
        jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 23/08/2022 à 16:56, Tharun Kumar P a écrit :
> Microchip PCI1XXXX is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C endpoint
> of the switch.
> 
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> ---
>   MAINTAINERS                            |    8 +
>   drivers/i2c/busses/Kconfig             |   10 +
>   drivers/i2c/busses/Makefile            |    1 +
>   drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 1123 ++++++++++++++++++++++++
>   4 files changed, 1142 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-mchp-pci1xxxx.c


> +static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
> +				  const struct pci_device_id *ent)
> +{
> +	struct pci1xxxx_i2c *i2c;
> +	int ret;
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	pci_set_drvdata(pdev, i2c);
> +
> +	i2c->i2c_xfer_in_progress = false;
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	pci_set_master(pdev);
> +
> +	/* we are getting the base address of the SMB core. SMB core uses
> +	 * BAR0 and 32K is the size here pci_resource_len returns 32K by
> +	 * reading BAR0
> +	 */
> +
> +	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> +	if (ret < 0)
> +		return -ENOMEM;
> +
> +	i2c->i2c_base =	pcim_iomap_table(pdev)[0];
> +
> +	init_completion(&i2c->i2c_xfer_done);
> +
> +	pci1xxxx_i2c_init(i2c);
> +
> +	dev_info(&pdev->dev, "i2c clock freq: %d\n", i2c->freq);
> +
> +	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*Register the isr. we are not using any isr flags here.*/
> +	ret = devm_request_irq(&pdev->dev, pci_irq_vector(pdev, 0),
> +			       pci1xxxx_i2c_isr, PCI1XXXX_IRQ_FLAGS,
> +			       pci_name(pdev), i2c);
> +	if (ret)
> +		goto err_free_region;
> +
> +	i2c->adap = pci1xxxx_i2c_ops;
> +	i2c->adap.class = I2C_CLASS_SPD;
> +	i2c->adap.dev.parent = &pdev->dev;
> +
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> +		 "MCHP PCI1xxxx i2c adapter at %s", pci_name(pdev));
> +
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	ret = i2c_add_adapter(&i2c->adap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "i2c add adapter failed = %d\n", ret);
> +		pci1xxxx_i2c_shutdown(i2c);
> +		goto err_free_region;
> +	}
> +
> +	return 0;
> +
> +err_free_region:
> +	pci_free_irq_vectors(pdev);

Should this also be part of the .remove function?

CJ

> +	return ret;
> +}
> +
> +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> +{
> +	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adap);
> +	pci1xxxx_i2c_shutdown(i2c);
> +}
> +
