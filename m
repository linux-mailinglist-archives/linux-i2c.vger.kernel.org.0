Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCFE41C6C3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 16:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245348AbhI2OhM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 10:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343496AbhI2OhK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 10:37:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9A2C06161C;
        Wed, 29 Sep 2021 07:35:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so11749117lfu.5;
        Wed, 29 Sep 2021 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d2YTnDgoR24F1yuMZN9skVYxWk5/aXABL1u136srtfs=;
        b=E5wQkpl5HTStrjVQfZxwnoOPCSwr11KdXa+CsjADAX+Lo8pQ+SNYN8inM/jAkDv529
         tIN4SjLFLbETQdFGHd7AoNU+K21+n3nXoCqd6ikmtZ6gJPRgfkKJXelibNtPWL2P58Fs
         4vcfBgSGRhe46kcNR+Vws9j44u+tvagAxys68mb/ZUGp3XlOA6n3eQyBF45Os7Emrswn
         ixOJXPJNNx33R8sHEauKRauN49Jk4mCPaTOh4oQ+smiyWYEweNM8r65kM+U6eXPXecC1
         qNNL+gvFV2J/f1ivcyGA33oiza1Favc/VtNA525G8vneQCLTLkIRqgPunxxuLBCh8jtI
         CvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2YTnDgoR24F1yuMZN9skVYxWk5/aXABL1u136srtfs=;
        b=LmcaWu7IowxII6Eg/dpRH2krDLrYRv4kO0mIEB54jpP5lbrnL2X6e3khOsRq5MJP6b
         h0BJlwVknXhjcmxlg75ibBSPxYJFrconorhlNcAcfRhR2lQp1lOjWf+1yhFbPZLzCa+o
         9FvjWUPHpDpIcHBHPyKdgtA6McybMCRvEbu7sMyjooRu1Qne9lL3O/BLxM15MG47eRf9
         xZ7UsFtewhrfx1CRnYl0y09nlTYh2coPEEbS9KhRq2+cqW0ivijzQ72N6VXYT21SBm0Y
         PSH1yyegnc9Oylkquz2U/1ZHHvV9jsaGYvNSbRLoVzovo2NJeJj8PJd1O8RNHGt9hcfP
         Dpyw==
X-Gm-Message-State: AOAM531RegS0ZOe/L1funJ8YJ7YE38ace5BvlR2mxt85i1ghf4dPeJMX
        6Lufb3Z2m8AnzXv8GTYrFtBHgkXPHzE=
X-Google-Smtp-Source: ABdhPJw09WyOTBJbLbJEvvfHardkMvGhwKbMdt5i4c+5abfRgQaERclT6eZ/k+Zm9K8gWtHtapqb+A==
X-Received: by 2002:a2e:9e83:: with SMTP id f3mr243862ljk.309.1632926128146;
        Wed, 29 Sep 2021 07:35:28 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id s12sm9994lfr.76.2021.09.29.07.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:35:27 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
From:   Dmitry Osipenko <digetx@gmail.com>
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        treding@nvidia.com, mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
Message-ID: <775e00e3-e204-7138-9648-7551098968b8@gmail.com>
Date:   Wed, 29 Sep 2021 17:35:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.09.2021 10:18, Dmitry Osipenko пишет:
> +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> +{
> +	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> +
> +	pci1xxxx_i2c_shutdown(i2c);
> +	i2c_del_adapter(&i2c->adap);

The order is wrong. Adapter must be removed first, then hardware can be
disabled.

> +}

