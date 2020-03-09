Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AAA17E844
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 20:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCITXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 15:23:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46618 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgCITXW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 15:23:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id w12so4380730pll.13
        for <linux-i2c@vger.kernel.org>; Mon, 09 Mar 2020 12:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bUDv61FxDNyUIEi1DDKnjttcR5xO35qmOSPZ57xlRHg=;
        b=UNxumjzoF026slxgDJhs/adJokllgZyNp2Xp2ENJbz92zJ4Q+eoU98JIH+07lCJavf
         uMKkMGrOWhVFG9QPJoL2ywrL98uXiHiQHyQb2fz8A8tdi1nmYRF4qlc2bz1rVStwQwjq
         QDc3moczkhptq/1pg9Bk2IMo179nzsa4JKcSxkCN/NgvP1HFN9XrkyjoFsHYwtWRBljH
         5trfaugCwjL0rK5HSqsV4lSt5NpSkurjGEetR1g1KcmCpf0cDgWHdtWP6ae0Ffd7JHTc
         0W/khfee4hUuqNSyT9kJevNtQWQLq3ZHDsePElnp91irGiQaAPnVy0xhJRUMXxyh7OlW
         FDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bUDv61FxDNyUIEi1DDKnjttcR5xO35qmOSPZ57xlRHg=;
        b=pO72ZZsiyoognRkYsjh6Oi1TFFFeFwPnudgb2FZ2lZgD+KExLsCk1frSTAF5ihnbu1
         0Y10kYnwnGiL/BoVRumrHpC9FIxmYzP/EcxDZY+LyzoFuEFHMf49hF1V5iWRLmajDUVC
         HBPc355H/Y2HUy6S6xM0IcgDAvHw4w6Wc+4ZuTkndzBzPla1me2gh6X5kRcPn5mNw9wE
         YfBj66ePmHtKJICBRa/epPCTv2haW9KKIET4EDyZ5KmStAgb+JfkuZQgAkUX+m10tM0T
         wKs3wvqBrntJVemkKE/mZlcNeMOs+B1hiFGRaGvwoAkkPulgy9pWzLk0/CLOpk916VO9
         8Hcg==
X-Gm-Message-State: ANhLgQ2JTJpAgPml71Jcg8W8WFOMxa+IozQ7374lYjoO5RC1IZGuhn7k
        yXv4KET4TABJebagFxgNWtrg8Q==
X-Google-Smtp-Source: ADFU+vuWYQzv3fzAJ3xUpeKgNbDaOmQiuZsW+ZQI9NcswqBszz/D+sXxbrbdDIhHGhfj+x902OSpqw==
X-Received: by 2002:a17:902:b909:: with SMTP id bf9mr16397813plb.96.1583781799788;
        Mon, 09 Mar 2020 12:23:19 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 136sm44747184pgh.26.2020.03.09.12.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:23:19 -0700 (PDT)
Date:   Mon, 9 Mar 2020 12:23:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org, robert.foss@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH v5 1/3] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20200309192316.GD1098305@builder>
References: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 09 Mar 09:23 PDT 2020, Loic Poulain wrote:
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
[..]
> +static int cci_probe(struct platform_device *pdev)
> +{
[..]
> +	for_each_available_child_of_node(dev->of_node, child) {
> +		u32 idx;
> +
> +		ret = of_property_read_u32(child, "reg", &idx);
> +		if (ret) {
> +			dev_err(dev, "%pOF invalid 'reg' property", child);
> +			continue;
> +		}
> +
> +		if (idx >= cci->data->num_masters) {
> +			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
> +				child, idx, cci->data->num_masters - 1);
> +			continue;
> +		}
> +
> +		cci->master[idx].adap.quirks = &cci->data->quirks;
> +		cci->master[idx].adap.algo = &cci_algo;
> +		cci->master[idx].adap.dev.parent = dev;
> +		cci->master[idx].adap.dev.of_node = child;
> +		cci->master[idx].master = idx;
> +		cci->master[idx].cci = cci;
> +
> +		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> +		snprintf(cci->master[idx].adap.name,
> +			 sizeof(cci->master[idx].adap.name),
> +			 "Qualcomm Camera Control Interface: %d", idx);
> +
> +		cci->master[idx].mode = I2C_MODE_STANDARD;
> +		ret = of_property_read_u32(child, "clock-frequency", &val);
> +		if (!ret) {
> +			if (val == 400000)
> +				cci->master[idx].mode = I2C_MODE_FAST;
> +			else if (val == 1000000)
> +				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
> +		}
> +
> +		init_completion(&cci->master[idx].irq_complete);
> +	}

Nice, this looks good now.

[..]
> +	ret = cci_enable_clocks(cci);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Interrupt */
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "missing IRQ: %d\n", ret);

goto disable_clocks;

> +		return ret;
> +	}
> +	cci->irq = ret;
> +
> +	ret = devm_request_irq(dev, cci->irq, cci_isr, 0, dev_name(dev), cci);
> +	if (ret < 0) {
> +		dev_err(dev, "request_irq failed, ret: %d\n", ret);

goto disable_clocks;

> +		return ret;
> +	}
> +
> +	val = readl(cci->base + CCI_HW_VERSION);
> +	dev_dbg(dev, "CCI HW version = 0x%08x", val);
> +
> +	ret = cci_reset(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	ret = cci_init(cci);
> +	if (ret < 0)
> +		goto error;
> +
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		if (!cci->master[i].cci)
> +			continue;
> +
> +		ret = i2c_add_adapter(&cci->master[i].adap);
> +		if (ret < 0)
> +			goto error_i2c;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +error_i2c:
> +	for (; i >= 0; i--) {
> +		if (cci->master[i].cci)
> +			i2c_del_adapter(&cci->master[i].adap);
> +	}
> +error:
> +	disable_irq(cci->irq);

disable_clocks:

> +	cci_disable_clocks(cci);
> +
> +	return ret;
> +}

With that

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
