Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346A146EB39
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbhLIPeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbhLIPeR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:34:17 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24656C061746;
        Thu,  9 Dec 2021 07:30:44 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c32so12727338lfv.4;
        Thu, 09 Dec 2021 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=n03DnVuGqtUKblp9GdOtMgVqcgHTNdmSEFo9Z6egz50=;
        b=LmuxhZEUso1R9uNF7JbaQIkwqm99F85FCEwbxLc6/6pZD7EHlCNysvMhxTaftqa1sg
         5sc0wkARbsXvmAcsVbhQ8e8aKcj+n2MBO29/IrAjpidp3lhRkIhfcnWz3EKzbif71Y24
         eORBpO8v9qwgqv3/j2AaqII34dt4hyPVz37jzTI2WfkKcMogTbhgA2Nphg8A63erE5WQ
         v5lF3TnorfgXHi0doJv2MdglI1J5gZc28QJDLeuZvb/v2HpNsyBFqnMYYDi5DtSuKVBC
         vCv8b1V2Kf5oH8yjnQM9BijQDWWzM3ezD3mJCtcbQh5V1uG8d2Y2eRDuI6kutrdTJrUQ
         +4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n03DnVuGqtUKblp9GdOtMgVqcgHTNdmSEFo9Z6egz50=;
        b=Eud48eb1XubNOREOGltyvpBhUolz839tJOI6nZWlNMWxmanCusijqmj7c9OXdGEtAl
         fbYORF30z0yWzkmvDryJDL0csC9ohxLcIqVBLkdlZTi4MXVrYmAXB7T+siUk0BK1XDOI
         Rs2MYycRu+MA/za27csBQ8iKZ9k3XPNe/K8sQ8obMDsD0olLrGkdtdLsrAg84pQbY+yE
         mlKPZaR+PWcv7w3X+iWoAZZjArsUEzBexCLfL6pPlpafOTVMrleBqFXqg+zjzYiowL5j
         iV+Ufd1fMP2CuVC5AdBODojLCIxcvOySjRN6rQkGb/31F1zmveQEXL9uex2sFak6cALV
         iHoQ==
X-Gm-Message-State: AOAM533sltZverzu0Cp0g9ZOaN9jOJGYlLpoENC2H5sXLOZbPEN24bP8
        Q1PlLLt1pt7IHkl4eZ05R3MpVAwLVrE=
X-Google-Smtp-Source: ABdhPJxfU4AVMuK0id7yHKzhZjDqNHaXB0zMqpbZuvEyhiPtZc56jINzQj9tLVUTAtYm0jUAeDMu7Q==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr6560957lfu.18.1639063842155;
        Thu, 09 Dec 2021 07:30:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id z23sm12126ljn.23.2021.12.09.07.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:30:41 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
Date:   Thu, 9 Dec 2021 18:30:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.12.2021 18:05, Akhil R пишет:
> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
> +	struct gpio_desc *alert_gpiod;
> +	struct i2c_client *ara;
> +
> +	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
> +	if (IS_ERR(alert_gpiod))
> +		return PTR_ERR(alert_gpiod);
> +
> +	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
> +	if (smbalert->alert_data.irq <= 0)
> +		return smbalert->alert_data.irq;

0 is the error condition.
