Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75748125FEA
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 11:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfLSKvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 05:51:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37569 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfLSKvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 05:51:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so5113689wmf.2
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AHcgDnG+4B/fOMPXVM0OtdDtgVdqPAu1gFVGhHkedBU=;
        b=PIJVkAgYzurVsLG3CEij7N7uAfX13xHLy2HMwTEJiCPq8Yy5pa+gzMqZIZ+TWTWkID
         yHDOqbLx/tDPUD4vpQaLUfEJVvPLuVurrHvNpZp0ilbSb002pfJimB5X2sj2Qm22iNHo
         w4ZC5MI9/fmDuogZxRIX+m0lWFzByaDrTiOrRMl153CSR8cH5KyT/IMo8MOUhPygw8Xv
         pTdFAVokgRAnby2N1PKD2KnzJIK/nJnuor1TRj4crxBsab+GSlALSxduWjB5JljQc2sF
         T77SzliNPAnS+gW1VxJWSUIyQivodEQo0K9Z/Qlcqvde7wquuoqCdb/yTncJdtbqi8Qi
         hFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AHcgDnG+4B/fOMPXVM0OtdDtgVdqPAu1gFVGhHkedBU=;
        b=cdDlkTiULsNuoVbuLtkL/uo44Wbojuxh1wHEcz8IzwFvkFIzLUCJ8hteGWDLOwLKsp
         3DzRoG/HdSYNeH32mts3smrQq6GAC1GgYKoqzu3LTGhUPJtak6cmuS4iBPDSDpUuaAnR
         GEvka0H5DyFRupaP5JQ5z37bCyhutCY4bzyjivEgiGvjjbQ0qH5HZXs5tUubAZy9X6qK
         ySxMOgMs48XQBzawOILjWRERBz3pAvXPkq47D1unIKqNfARWQCdciYYDNXG9QAYjXglt
         BAdL6Om1E7AYQu0US4omscJiUPkBtUWVfisrGJi5yx1C+4DxgcESlknTOQ7FTpPON4jx
         ik6g==
X-Gm-Message-State: APjAAAUUUH31bDm/2W5k9WhE4a7xrTpQn6nnnM00YvaHIE3GDsgo0ieh
        kQ5BqooolSB+S1/N5aV5NBtkWihYfkU=
X-Google-Smtp-Source: APXvYqzUppHZ9MXvAXF3lT0iqwtk0JC3H7rxAWOmJlNvqgo86afcy2yRnfh3wV8+oXtWOB9cM9MAWQ==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr9596970wmj.54.1576752703724;
        Thu, 19 Dec 2019 02:51:43 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y20sm5528069wmi.25.2019.12.19.02.51.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 02:51:43 -0800 (PST)
Subject: Re: [PATCH v2 0/4] at24: move write-protect pin handling to nvmem
 core
To:     Khouloud Touil <ktouil@baylibre.com>, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
References: <20191210154157.21930-1-ktouil@baylibre.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cd9f342c-5576-57f5-c62d-a78c5876a7fd@linaro.org>
Date:   Thu, 19 Dec 2019 10:51:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191210154157.21930-1-ktouil@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/12/2019 15:41, Khouloud Touil wrote:
> The write-protect pin handling looks like a standard property that
> could benefit other users if available in the core nvmem framework.
>      
> Instead of modifying all the drivers to check this pin, make the
> nvmem subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
> 
> This patchset:
> 
> - adds support for the write-protect pin split into two parts.
> The first patch modifies modifies the relevant binding document,
> while the second modifies the nvmem code to pull the write-protect
> GPIO low (if present) during write operations.
> 
> - removes support for the write-protect pin split into two parts.
> The first patch modifies the relevant binding document to remove
> the wp-gpio, while the second removes the relevant code in the
> at24 driver.
> 
> Changes since v1:
> -Add an explenation on how the wp-gpios works
> -keep reference to the wp-gpios in the at24 binding
> 
> Khouloud Touil (4):
>    dt-bindings: nvmem: new optional property write-protect-gpios
>    nvmem: add support for the write-protect pin
>    dt-bindings: at24: remove the optional property write-protect-gpios
>    eeprom: at24: remove the write-protect pin support
> 

Thanks Khouloud for this patchset,

I can take this via nvmem tree once we get an ack on dt bindings from DT 
maintainers.


--srini
>   .../devicetree/bindings/eeprom/at24.yaml      |  6 +-----
>   .../devicetree/bindings/nvmem/nvmem.yaml      |  9 +++++++++
>   drivers/misc/eeprom/at24.c                    |  9 ---------
>   drivers/nvmem/core.c                          | 19 +++++++++++++++++--
>   drivers/nvmem/nvmem.h                         |  2 ++
>   include/linux/nvmem-provider.h                |  3 +++
>   6 files changed, 32 insertions(+), 16 deletions(-)
> 
