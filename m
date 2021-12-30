Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B9648209E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 23:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhL3W0o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 17:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhL3W0m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 17:26:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984F3C061574;
        Thu, 30 Dec 2021 14:26:41 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id i31so56981027lfv.10;
        Thu, 30 Dec 2021 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1di8ReGKGpe6wTyJlHRA91kyA5EtT09EyzM1i1JSesI=;
        b=kGPiTfc9BTvy9hv0qYytNhuaT143hcwfOU0ah5wJshyWvKBEf4yOHo6HvesY3Btojr
         hErGqs1rojh84bLFxtyUjrIttZ1/EFrYKtbfEOuMkJfOCsfVN9Id/axMhF+FpouQTR4N
         wUGEYTJf8qVT520rOYT68VauvARbKfYVZsP3vZUpXuvXHM7UKQofPF+PsVeTF1JM9qXd
         385r1H+Ib+RCZeEMJwwD20aPbNWNWfTqPYI1fiadIhpDlApms86VNa+j1BgWiTkR760n
         wd8OmglL+V6OGot24y8QW0uDsEgm9pNUALreV8RYyryPPmz0xGvgIMb1+ddGLCMQ06PR
         KBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1di8ReGKGpe6wTyJlHRA91kyA5EtT09EyzM1i1JSesI=;
        b=kj/1++EMGymTjgJKNkV24rBihZL3wMNMlE+WZzXt8kTo9JsCbblTYYL9vwf8EwXQY0
         Pf4J/tvyX9GtdmSh+hC4CckTHi9bXJmh8xA55zMIhSFXWme5+v/2FNmTAtHLUgGNYwOU
         llpueyAR/9xXZ05SdgwaPcvH3NG5agsq7RFqa34oXJbLngUW2r2TRAfBvwzA+kWwKsWS
         evZnskMZwzmtgFM3SC3AH0Zid27uqR/pFkMlhLPvSVszb5VIRRJABrH5vtfkKhyaVRlZ
         lHDqLN3r3gDumRlWIpc1582SGoi4hQO7Tcd+qzz5/wW1nvcTi/Og/e6YKuHBmvs000V1
         gP3g==
X-Gm-Message-State: AOAM531vFKve3z/jYy1TljJiC49yaKMkTKsCPeDgDWyCmpGiugHokK6R
        KfQEBFDVilrm6fWBpMQlc2QEBPrJWIY=
X-Google-Smtp-Source: ABdhPJz1JuL5I2tfM2wIX/uhmyzBvzpgivawGIPpJzZGC6tdMucVDKJeU/MJDeJTs76aag/3fc31uA==
X-Received: by 2002:a05:6512:32c1:: with SMTP id f1mr27813710lfg.42.1640903199818;
        Thu, 30 Dec 2021 14:26:39 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id i24sm1588142ljm.13.2021.12.30.14.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 14:26:38 -0800 (PST)
Message-ID: <f21f8437-dc20-452a-d4cd-2ffa3f031df1@gmail.com>
Date:   Fri, 31 Dec 2021 01:26:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] i2c: don't pass 0 nmsgs to i2c_transfer
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, viro@zeniv.linux.org.uk,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
References: <20211225142816.6255-1-paskripkin@gmail.com>
 <20211225182418.26839-1-paskripkin@gmail.com> <Yc4wkyr7QTs8ao5x@kunai>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <Yc4wkyr7QTs8ao5x@kunai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/31/21 01:20, Wolfram Sang wrote:
>> -		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
>> +		if (!rdwr_arg.nmsgs || rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
>>  			return -EINVAL;
> 
> Shouldn't we check the msgs pointer as well while we are here? Like in
> the non-compat IOCTL code:
> 
> 443  if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
> 444          return -EINVAL;
> 
> 

Sure! Will prepare v2, thanks for review


With regards,
Pavel Skripkin
