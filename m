Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B12425822
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242660AbhJGQmB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242297AbhJGQmB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:42:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A673C061570;
        Thu,  7 Oct 2021 09:40:07 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so27252969lfa.9;
        Thu, 07 Oct 2021 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IkiYESUwPuOAhc/9Tu+J/TkjYtnEJg1nTu4gW+TNm28=;
        b=S0Wej+NiSR7tu3xAmGqeGsTwG2U0U8SPQm0Z1R3fQVUn/2Vy7jIId541l1EbkuIgnv
         +3LKLSh7iQtNtFKTXmsQteXU1olfcagzamtFxFf4bBSJWdDUYdU30xxNG3vzoU+xFnty
         yZBZFZS9qWZm9XXl53ZL9Z3XCIKB/GV39LvUvRGsGvlMhCoLWJ65cFj4pasH+z6oQAyO
         LjMeEB139hQ9uI63xhQ3WeEVSSjzL/ePvb8eTG5uKUK5qyd6jNQgYE+BfL/ju6mk2TYz
         Dn8gNHgyA+0A+YuInKoNrqH32fgdONht86QNRKDcza1EnNgwZY4sPPU1XVGv3DOgidNI
         g64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IkiYESUwPuOAhc/9Tu+J/TkjYtnEJg1nTu4gW+TNm28=;
        b=i+pT9Wr0unj4a2Sp74zoipzVZi1+A3YDKFOoTjEKXshHDJ5PG2UvmbgRCgunV1HfMA
         Ja8e1qxFCzGS530grNrijYVYSKmncqxVKmsQcs9qthcJaKjaNgdCRyWTGu7C9V+GHhda
         3R/Jw5VgysAGBlY8VhRpA40GfvNEhAe+JGOZHv/3wYJgG132l8HPil2Ai/oe9i+PvtQS
         8EJo1Vdovz/ARoTk5HXL8UPLphzW/3Yjw6CajWU0U76ZQ/IH8xuEEA/bmHy7gARrKmSn
         ahe3GyUqR3m/ocSNiVojbVNzptIf3t+u7MdUNO/VdZl/NnxFDauu2D8tPxeqU2LmaadU
         7H3g==
X-Gm-Message-State: AOAM530CcSXybmRTSpSHdqJMjCaL6Ds4Eztr3IdaDPOdDGlDa1g/+48v
        PXgRbkeOh10qYJuwaxari4hjWvMHRqg=
X-Google-Smtp-Source: ABdhPJx9C6dMgdo8FF7weruHR8bHFZH5KVNJJyGprjjGHakjPpRF/TfFZ+9CKEhsNcmHpq5YT9Znqg==
X-Received: by 2002:a19:f805:: with SMTP id a5mr4995816lff.483.1633624805753;
        Thu, 07 Oct 2021 09:40:05 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id e25sm5594lfn.82.2021.10.07.09.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:40:05 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        treding@nvidia.com, mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a63bbad2-b7b4-47da-93bd-4152a2c8b93f@gmail.com>
Date:   Thu, 7 Oct 2021 19:40:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
> +static int pci1xxxx_i2c_suspend(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	pci1xxxx_ack_high_level_intr(i2c, ALL_HIGH_LAYER_INTR);
> +	pci1xxxx_i2c_config_high_level_intr(i2c, ALL_HIGH_LAYER_INTR, false);
> +
> +	/*
> +	 * Enable the PERST_DIS bit to mask the PERST from
> +	 * resetting the core regs
> +	 */
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval |= PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> +
> +	return 0;
> +}
> +
> +static int pci1xxxx_i2c_resume(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_resumed(&i2c->adap);
> +
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval &= ~PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
> +			 pci1xxxx_i2c_resume);

Can you move suspend/resume to NOIRQ level? Device drivers may require
to access I2C early on resume (or late on suspend), it's a common
trouble for bus drivers.
