Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72592FA08B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391784AbhARM4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391680AbhARMgJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 07:36:09 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70667C061573;
        Mon, 18 Jan 2021 04:35:28 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d26so16289092wrb.12;
        Mon, 18 Jan 2021 04:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dDqpVUDIXcJxr0nlcBjerifvUAz/3KcnYbeDUROK8QQ=;
        b=fl6qCPK0st1ldqXiDkQnc419pVnLOQ0MSAIv9SHxcspuyM8ZHmzNgoJAbRlU10C3A6
         5+R4zmEEDlO3BLLTeWgkqnwbPdrskLCiiMZO3P3TtdOMzGrZC33Rt0fYfVfly0H+xZ3S
         xHRzv87/bSu4nxCaNTgZ6VYZKlg3BBZKDEPa3dXMdKdO9i7l5A+LQ8XXprPDaDLIlTQT
         upgEumMBp6yh2r41woGp62z1C4Qgb7yzBbF4ZyOYVisRvcaOBFc/aqBHMPTmh3dyJV5+
         UVMEOHk9VWtz2x1WtOYCl0P7D45S8ow0FmRCW3fRH2pFRfsyhca3LCXxI/Cv0yqIOQDs
         nQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dDqpVUDIXcJxr0nlcBjerifvUAz/3KcnYbeDUROK8QQ=;
        b=bOEPeV3nA3/Vs353xeclKBlzvDR7w3qcBWP6Te3AbULgMfriWygnBGcdL69Wj+CIgu
         /VExGcIe9Wxk6FzypF29pK882p/cbqvYXxhVd76pFOG6bYR6hkDyn5NAC1rZVRXtqqs4
         Py5ADsVG7c0gdjYMwdBaWwmh8PuBsiG6U36o5JDqZ1wPcyvL6cwjSWHoaaPAqtmgv0qt
         4sZfz2T5XcXBVbQNyDurW3DoyUqw54X8ohVn2Onp4aeXsPElPC5Xy4FFxdy8b6WH15NN
         QsxOv4pmBZ7f1V8kJZOyB67Ho4UAtSudJ13rKroVZ2sHCFgfpBcCqlz68kWt9q3Xra6R
         /nkg==
X-Gm-Message-State: AOAM533T9L/FpePYPBPk6FE0wCppe7o3XL6XUG11McLziDnxUAdVHcGc
        ExlhFhNkFVGspRqSFU27XBQ=
X-Google-Smtp-Source: ABdhPJz6TFx4ZcRZ3wBY64+lquhHyb/9EVGtIBxJImQ9wVhyzU+A7KvmYddJtho3ZOk+pbS8rdhD9Q==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr25832729wrn.99.1610973327263;
        Mon, 18 Jan 2021 04:35:27 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id 33sm32880949wrn.35.2021.01.18.04.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 04:35:26 -0800 (PST)
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
 <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
 <20210118122950.GE4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a0e3cc39-c497-5fab-947e-e47d44509b9f@gmail.com>
Date:   Mon, 18 Jan 2021 12:35:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118122950.GE4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 18/01/2021 12:29, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 09:24:10AM +0200, Laurent Pinchart wrote:
>> On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:
> ...
>
>>> +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle);
>> "lpss" stands for low power subsystem, an Intel device within the PCH
>> that handles I2C, SPI, UART, ... I think the function should be renamed,
>> as it's now generic. acpi_dev_has_dep() is a potential candidate, I'm
>> sure better ones exist. A bit of kerneldoc would also not hurt.
> Actually a good suggestions. Please apply my tag after addressing above.


Will do, thanks

