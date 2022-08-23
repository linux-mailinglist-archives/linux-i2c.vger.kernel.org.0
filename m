Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E6859E484
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 15:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242560AbiHWNdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 09:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243986AbiHWNba (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 09:31:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1581631D2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 03:32:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id s6so7826157lfo.11
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Nn4yg27RpfUKH0YwS0M7KTMeTIZP8soc1NaWLCIj4V8=;
        b=gkDFGfVmjxorFP0c8X8RqzS6sIe38tA8r5/IRMeJD58cuS654rYWUc0VUpTgkQsX6D
         oC5y6aFltTHtCfp7gWAu0dVG3v+vvjlTMXsMhnYVenk42cE1/C1FmZbiUfcWCSJ3oiza
         tZaFzvpe7KIIwM3G2VxVyR1Xae5YWI0FxkpvTb+1J0fISLkxbqWnUF/qEq+xmuvLhHRC
         ARQCtQeK00NcVks36jyX9RiVypEIK9iNk27XMriXHTjK2k4G/lp3CAZm/6GuAply/rNJ
         Fzjafy7WN5H0uDU3jDwjFiopKU2J1wOguxA+9/V5Ql6F189yfsiXdXUzIxAIznQOwYxj
         L7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Nn4yg27RpfUKH0YwS0M7KTMeTIZP8soc1NaWLCIj4V8=;
        b=lqJ6BRcNmQKiCpVLTJd50m00EPU3noQQOJkTXjtzL4EaiZIfq3Vdnyebvp/l7JCGiD
         Djuq3Xae2Gw3wX3HzM1DIA51GOveg4S+d6pVBYu0nHvVRBCaVVfYDdD1kpvl/7b5j8to
         mfVX2l8jN+8H4TdFwFtKo7A04zUxFmEW+HPhiERf9nhSuQE8JK84/4jU7xnay0KxDS04
         ihfPNK2Yi9WeiYyX6fWVpLjl7oAVBcB+jIXAdYxGRF949EiIErwDeAU3NlFRo0eH6V7J
         S3uEibC1KOb0tC15M0DJFBZ8cdqZYefJ2YXDU19prdgdCDgySDbJbhsG+ZyX84tL2pKf
         O8zA==
X-Gm-Message-State: ACgBeo3Vv0G4rXucWQbFCcEQw+mzJPXJ9Ib5VBikQyKgZhVUfJYTaVCK
        solDGRAYP3ZVLkXU58wZxBmzsLVgGwoqoVzx
X-Google-Smtp-Source: AA6agR6ZRkMVMh+0YxEKZ+XwxyYWZ3pJDxMNBgaSOGfr08HN4I6//S4wDDlMs98filiwjQ7OQ3HNrg==
X-Received: by 2002:a19:4903:0:b0:492:e648:5bc0 with SMTP id w3-20020a194903000000b00492e6485bc0mr2531218lfa.288.1661250664301;
        Tue, 23 Aug 2022 03:31:04 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id 6-20020a2e1646000000b0025e2c5a12b6sm2271863ljw.129.2022.08.23.03.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:31:03 -0700 (PDT)
Message-ID: <8712b866-af22-d9ac-fd84-7d77c2628682@linaro.org>
Date:   Tue, 23 Aug 2022 13:31:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Content-Language: en-US
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/08/2022 17:56, Tharun Kumar P wrote:
> Microchip PCI1XXXX is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C endpoint
> of the switch.

(...)

> +static int pci1xxxx_i2c_suspend(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	while ((i2c->i2c_xfer_in_progress))
> +		msleep(20);
> +
> +	pci1xxxx_i2c_config_high_level_intr(i2c,
> +					    SMBALERT_WAKE_INTR_MASK,
> +					    true);
> +
> +	/*Enable the PERST_DIS bit to mask the PERST from
> +	 *resetting the core regs
> +	 */

Use Linux coding style comments. Everywhere...

(...)

> +
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

That's not a helpful print. Don't pollute dmesg.

> +
> +	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*Register the isr. we are not using any isr flags here.*/

Use Linux coding style comments. Everywhere...

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

Why do you call here pci1xxxx_i2c_shutdown() but not in previous error path?

> +		goto err_free_region;
> +	}
> +
> +	return 0;
> +
> +err_free_region:
> +	pci_free_irq_vectors(pdev);
> +	return ret;
> +}
> +
> +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> +{
> +	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);

No need for pci_free_irq_vectors()?

> +
> +	i2c_del_adapter(&i2c->adap);
> +	pci1xxxx_i2c_shutdown(i2c);
> +}
> +

Best regards,
Krzysztof
