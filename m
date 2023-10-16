Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42D07CB3AA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 22:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjJPUF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 16:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjJPUFz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 16:05:55 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3214583;
        Mon, 16 Oct 2023 13:05:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53e16f076b3so9063810a12.0;
        Mon, 16 Oct 2023 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697486750; x=1698091550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4IqfvB7H++yj6LU7WyVnQBYT1ct4eOQQ+UC3kf23M1E=;
        b=YWVEQTkJDimURFwnzJjK3PQ4BnyHyLIYKoCUtWS9+qiulNzQUIcCJ8rhU2gw5NWF/2
         cIfS0WTwqGuSiIG5jiosPgk5ZXW7aMo8TLkOwFJsuTsuFIpxou1UgKXx5xi6JBvUeWNN
         yNQr8/b4WBs2cTEPOgcWqorDnpj0Bc11BsFM02RsTRjnZVzS+R0MzCXyoJ4aIQTy7dmY
         nptV8D92TExQ68Aci4LUUfpbwqcjFGK3gt8hhoYRRt9cGHTG1Ck0FJEmNL0Ve2QO8tCV
         M23vSRLbNSH87x7shFQ1ksF0BgJnQI0oynJHuNGS4lmfcTOdFFfGlG+c3A5fnxtVswQ9
         BCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697486750; x=1698091550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IqfvB7H++yj6LU7WyVnQBYT1ct4eOQQ+UC3kf23M1E=;
        b=S/FAxBU2tjVbfDOFjXLzNnQzmjGaGr18lYLOJR+cfhUd7j/+yGMtcYCnmRPRVccbUh
         shgcWsHAf7T2R67VM9tsBoQbyllZd1Cx0u+SHkNJDxBsB/XidhYWss8lneHiPW+MTDT7
         GL//FY4XTefAAYzuXFDnMXoRL3N5ezU0IzT0tXf3YL+gQ+N6dYTbE0jmNbU/AaZByvkA
         4XMAO3akHZry72UjXDCnIQu26tKKdtQXkj2YExmcM0xKDEeMJhAnup8eU3I+XVDSecz7
         zvx+1Yg/7dbeTGp6WaDVQUHR6wzSTKGlL8xN4IRQLMTonqBnJeiuFnWTFxXsNvWMSD1y
         O06Q==
X-Gm-Message-State: AOJu0YxlTlgRBK8pPDAfZ8rvRFkU4scuh8LHIDi1xK2C/JF2ZtzbU+oP
        A2bvsDqgL5XPSuBG90RklN0=
X-Google-Smtp-Source: AGHT+IH+Q03ZtpFJ3YQHvuJptbQmUzkC1G3i77eefPuM5EgevWhhKmud38F3URRR0+xOo97g+wgWlg==
X-Received: by 2002:a17:907:7fa8:b0:9aa:206d:b052 with SMTP id qk40-20020a1709077fa800b009aa206db052mr9044737ejc.27.1697486750249;
        Mon, 16 Oct 2023 13:05:50 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b992:7400:784b:452:609b:48ee? (dynamic-2a01-0c23-b992-7400-784b-0452-609b-48ee.c23.pool.telefonica.de. [2a01:c23:b992:7400:784b:452:609b:48ee])
        by smtp.googlemail.com with ESMTPSA id a11-20020a170906670b00b009ae3d711fd9sm4612590ejp.69.2023.10.16.13.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 13:05:49 -0700 (PDT)
Message-ID: <e86fb57b-afc6-478b-9a9d-543b87bc8d3d@gmail.com>
Date:   Mon, 16 Oct 2023 22:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Wilczynski, Michal" <michal.wilczynski@intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
 <66418e44-6862-4555-9280-2633ffb34d23@intel.com>
 <CAJZ5v0hfSZCgoW1mq=jeqjMBtsr=6JJaG8OWfUkAW80KF509Nw@mail.gmail.com>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAJZ5v0hfSZCgoW1mq=jeqjMBtsr=6JJaG8OWfUkAW80KF509Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.10.2023 19:32, Rafael J. Wysocki wrote:
> On Mon, Oct 16, 2023 at 6:10 PM Wilczynski, Michal
> <michal.wilczynski@intel.com> wrote:
>>
>> Hi,
>>
>> On 10/15/2023 11:36 PM, Heiner Kallweit wrote:
>>> Use new helper acpi_use_parent_companion to simplify the code.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-i801.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>> index a41f5349a..ac223146c 100644
>>> --- a/drivers/i2c/busses/i2c-i801.c
>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>> @@ -1620,7 +1620,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>       priv->adapter.class = I2C_CLASS_HWMON;
>>>       priv->adapter.algo = &smbus_algorithm;
>>>       priv->adapter.dev.parent = &dev->dev;
>>> -     ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
>>> +     acpi_use_parent_companion(&priv->adapter.dev);
>>
>> I think this case is a bit too trivial for a helper, it's one line before, and
>> one line after, so it doesn't really save much.
> 
> If this pattern is repeated in multiple places, the helper makes sense IMO.
> 

I didn't check each usage in detail, but this should be the places where the new
helper can be used.
Another advantage IMO is that the helper, being a function instead of a macro,
is type-safe.

drivers/usb/common/ulpi.c:      ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
drivers/usb/dwc3/dwc3-pci.c:    ACPI_COMPANION_SET(&dwc->dwc3->dev, ACPI_COMPANION(dev));
drivers/usb/core/message.c:             ACPI_COMPANION_SET(&intf->dev, ACPI_COMPANION(&dev->dev));
drivers/tty/serial/8250/8250_exar.c:    ACPI_COMPANION_SET(&pdev->dev, ACPI_COMPANION(&pcidev->dev));
drivers/i2c/busses/i2c-imx.c:   ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-kempld.c:        ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-virtio.c:        ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(vdev->dev.parent));
drivers/i2c/busses/i2c-dln2.c:  ACPI_COMPANION_SET(&dln2->adapter.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-i801.c:     ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
drivers/i2c/busses/i2c-ismt.c:  ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-cros-ec-tunnel.c:        ACPI_COMPANION_SET(&bus->adap.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-synquacer.c:     ACPI_COMPANION_SET(&i2c->adapter.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-designware-pcidrv.c:     ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-qup.c:           ACPI_COMPANION_SET(&qup->adap.dev, ACPI_COMPANION(qup->dev));
drivers/i2c/busses/i2c-designware-platdrv.c:    ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-qcom-geni.c:             ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
drivers/i2c/busses/i2c-amd-mp2-plat.c:  ACPI_COMPANION_SET(&i2c_dev->adap.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-xgene-slimpro.c: ACPI_COMPANION_SET(&adapter->dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-tegra.c: ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
drivers/i2c/busses/i2c-xlp9xx.c:        ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&pdev->dev));


>>
>>>       priv->adapter.retries = 3;
>>>
>>>       priv->pci_dev = dev;
>>

