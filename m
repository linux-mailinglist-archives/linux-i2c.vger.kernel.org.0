Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1042234EDEB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 18:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC3QcI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 12:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbhC3QcH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 12:32:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205FDC061574;
        Tue, 30 Mar 2021 09:32:07 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u9so20557884ljd.11;
        Tue, 30 Mar 2021 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GPAcV11R/L+P1u9b3RSmVrWfaWEqoVvG9J5nxbf+QEo=;
        b=XM9NK3722R7qywh4wVdtcG8OqORAz6OscdXHBm7UUi9jr9HW0vZuqEllp+kirld5mo
         lfbr+wePX5lj/IWLqNRUPkbWc/YeOAhrWYhxvOBJulZL39OE4d3sTQuDScaKEIPOFubL
         rHx9RIeiKgeN4JmTKzu33Z/UtmPRq6Bao+LOYRNb3UjQnrO57k0BtJjOoGGrHefeRPVo
         wIoNn6E8CeUGgFHaRT28NW3eOXwpasjFRm1ppOOWV6FWPzyZXZklG2iEeYqzbXD/Yn4N
         pnmHW1ZW/iCavkoU9cIblmr3aYHf9quhLZ51Sw9RaZS5fU+wkcpdmSCUXEzSQlK0FQxn
         5htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GPAcV11R/L+P1u9b3RSmVrWfaWEqoVvG9J5nxbf+QEo=;
        b=adt6BiTD9Qh/YcFA31/GQK/8HhyO5NhEOgrQUnyTZwtpR1aNvX8KndyEMpvsYj/aON
         FU7DlBmOxc3DCC/Iu6v8zN9rvG9YNl7RE9Xj1FIZeowA+CBZuAnXxmH5Kg4xMzuSeFoE
         XZ4v0YBhJlYxwXVUFhtXi+RYlhcAS2pVKdCv58doeixKpU8c8n0/nd7CqO8BKSAih96G
         dE3Ah5d05+cm1XyjNRcpoeo+tvQ7M4b/ubBxRbv17ZBIX4CVRIYoPJ2XRQyjIi7mQhBq
         9DdMoNo3N/GfsKiEy9ZsSrUNV9yuAcxga5C4FTR143GSIi7BGZ+kjBU1z01jpmemP30i
         boMg==
X-Gm-Message-State: AOAM531rjpIT6L6zn36BUl6U5CisWHZX3gOOj4PXQmR3XEXOYee5R4WY
        puWnPjHME73GWDuv8v7GTII=
X-Google-Smtp-Source: ABdhPJyTksEHvYP2eK7/ntlIbgSJQKHIuIIIyn81/lVP4fpIKYG2V2yUtOhA9SPfdGO78vOYkMvFDw==
X-Received: by 2002:a2e:9f45:: with SMTP id v5mr21265637ljk.183.1617121925711;
        Tue, 30 Mar 2021 09:32:05 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id u9sm2949917ljj.0.2021.03.30.09.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 09:32:05 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] i2c: add support for HiSilicon I2C controller
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
 <b761fa05-1bf9-ce4c-e2b5-f39b418f0da9@gmail.com>
Message-ID: <7efac5e2-aa1c-0575-0e9e-ca4eb659ed3f@gmail.com>
Date:   Tue, 30 Mar 2021 19:32:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b761fa05-1bf9-ce4c-e2b5-f39b418f0da9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.03.2021 19:24, Dmitry Osipenko пишет:
>> +struct hisi_i2c_controller {
>> +	struct i2c_adapter adapter;
>> +	void __iomem *iobase;
>> +	struct device *dev;
>> +	int irq;
>> +
>> +	/* Intermediates for recording the transfer process */
>> +	struct completion *completion;
>> +	struct i2c_msg *msgs;
>> +	int msg_num;
>> +	int msg_tx_idx;
>> +	int buf_tx_idx;
>> +	int msg_rx_idx;
>> +	int buf_rx_idx;
>> +	u16 tar_addr;
>> +	u32 xfer_err;
>> +
>> +	/* I2C bus configuration */
>> +	struct i2c_timings t;
>> +	u64 clk_rate_khz;
> Looks like the u64 is overkill here and it doesn't allow you to use
> COMPILE_TEST because 32bit arches can divide u64 only using the
> do_div(), please fix this.

I see now that the value isn't divided anywhere directly in the code, my
bad. Looks good then.
