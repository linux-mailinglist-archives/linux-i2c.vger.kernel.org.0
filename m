Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201172BD35
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 04:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfE1C0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 22:26:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41929 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727342AbfE1C0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 22:26:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id q17so5636404pfq.8
        for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 19:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=PbAlnbMG3ZQsuTiPzcj5dR2K8h+JQcEEAbcsQKzHrp8=;
        b=VTiNwQT9ngEv4fGQldDwmwNpeLWpsu6SR50x7OfHNIq+PZbu2FxUchJjUWpV1KG9W7
         +O09yXGsURhBHPPerTLS84kxR/Ze8kuYI75fVsmtS0eaDe9+r+frVodGkjQ/XNg27AZm
         Q5Ojd70jtTWIhCAD1gkxDMePKzeKRwyRrUmuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=PbAlnbMG3ZQsuTiPzcj5dR2K8h+JQcEEAbcsQKzHrp8=;
        b=DeIxg/W12Chay8MDpI/cfIKjH4h1CW+m7k5CnImAAXAGC+slU5oLR4JkiAReedvXOf
         UfJRTsykDbWCtVPTJbHitqdlijjY/0ttDEY4GRtQl9/s6AnmTWWvmPwX141La5VuzKcw
         5QuKVFsjPNrvhnfjkoC2hlDtVMKi301EwVDdc02SUSBT39yiAhgFeaSihObAKJ9vBoP4
         k7rjKZMIxrzR5HRPrYMg51dY/jMQ9JqH3Ikwdh+SZPVJGGpnV7qtsNzfTsxenIDmGbl4
         u6ad+cKoVSulaTaLW+GBml+PAG6fafpM0Klvg4lkAAT2YRXf3ur355jfPjn4VOn8Nron
         srHA==
X-Gm-Message-State: APjAAAVW4lrlT/xirbYHL9PvyHBdO8TcEwIQChXbY8bc+S5C0tn9s2/Z
        VxN42h1/9fw9x44kMcZrxd9qBQ==
X-Google-Smtp-Source: APXvYqx+VY3FarvHW7iBaypvG6dz7YPmC7OnZveSMATrcMjnfNcPSxPUaSYfs1JcSyOp5shSR2CCYA==
X-Received: by 2002:a17:90a:bb8d:: with SMTP id v13mr2260630pjr.79.1559010414042;
        Mon, 27 May 2019 19:26:54 -0700 (PDT)
Received: from localhost ([128.107.241.177])
        by smtp.gmail.com with ESMTPSA id l38sm720404pje.12.2019.05.27.19.26.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 19:26:53 -0700 (PDT)
References: <20190505193435.3248-1-ruslan@babayev.com> <20190525005302.27164-1-ruslan@babayev.com> <20190527083943.GX2781@lahna.fi.intel.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Ruslan Babayev <ruslan@babayev.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Ruslan Babayev <ruslan@babayev.com>,
        Wolfram Sang <wsa@the-dreams.de>, xe-linux-external@cisco.com,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] i2c: acpi: export i2c_acpi_find_adapter_by_handle
In-reply-to: <20190527083943.GX2781@lahna.fi.intel.com>
Date:   Mon, 27 May 2019 19:26:53 -0700
Message-ID: <8736kz9uvm.fsf@babayev.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Mika Westerberg writes:

> On Fri, May 24, 2019 at 05:53:01PM -0700, Ruslan Babayev wrote:
>> +struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>>  #else
>>  static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>>  					     struct acpi_resource_i2c_serialbus **i2c)
>> @@ -996,6 +998,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>>  {
>>  	return NULL;
>>  }
>> +struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>
> This should be static inline, I think.
>
>> +{
>> +	return NULL;
>> +}
>>  #endif /* CONFIG_ACPI */
>>  
>>  #endif /* _LINUX_I2C_H */
>> -- 
>> 2.17.1

Thanks Mika, will make the change and repost the patches.
