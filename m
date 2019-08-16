Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC70902E6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 15:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfHPNYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 09:24:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40653 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfHPNYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 09:24:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so2463503pla.7;
        Fri, 16 Aug 2019 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tC49zy0gLeREUmV7Q3rlhH7zDHvWELxtBRJYJGrHB+M=;
        b=rqAUctF9pMEPICkmbGSGtkwoxRzQic6V3Ticu6ptNAxbt4itrEumYnQmAOX1xpNc6D
         I1gz5uNAPTRfAeNbiHSL87+B3Cy8LhXIrVWNX8MiDJitPS5q2PlMJrAYr3EGunrBv+9Z
         D00EWI9gbRnoGkfYLxUgIXA/wT82w4g5i3qtMuobms2dpoqmfuvnlNDry+kFGFmM+zmQ
         opCl4cq0UH4rrGgL5TTKVZ250UmvLohfRsMYfR4QDPYajkC2+bTp5sjZr64N06ZszPPI
         9mAaAGWqqlCWNCdZTp8AE3qNykByCieOmknw9MAa0CFRxb1Q8Q+IppHcVv1HtI18kzTO
         EjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tC49zy0gLeREUmV7Q3rlhH7zDHvWELxtBRJYJGrHB+M=;
        b=fTnvdClWgAg0KSicPkUVH5CvW6rMgsQbXVdQOLqW0B4t88xv5YhzZPO5jWbkW6Wstd
         3t2ZOGpPuinwqXOa2Hv0neQFaTdpHc71Z2qFpHuZJFXxhGYm4nqKShUNor7KR73dsO4v
         dywv6Jjqu+Oze0B5u6zUoAAxwDtVmlm8ar+pOJcKZ0J1HY0sRGMeRca/TANurf+uUp3l
         laFM6Fk8QfKOA8EYMGWFum1q5lGPyd+p7hnCvcR3h5hRB+t+VGWB+VyL/C7LtOG4Fo+o
         sMX5Z/dt1SCejBk6JBHN4AkmjYzOFQoOwVOnaczTu2fsjclMBpGxA/fPO8B0XEKOG01K
         So4g==
X-Gm-Message-State: APjAAAUqGMSUOTqFiCJcuJH0iBB889p9IkETgBHuZG//6I6/iilJS+/W
        pJppzfB0UTl7F+b1Np3SIaQ=
X-Google-Smtp-Source: APXvYqwQBV+QnykPaP/kje1lDxW5OwAU0xoAQ4dfpjAW/dKqQ6u+lVWw+RnnehpTX0d3stBnjvviMA==
X-Received: by 2002:a17:902:a70c:: with SMTP id w12mr9437627plq.288.1565961860252;
        Fri, 16 Aug 2019 06:24:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4sm5388315pgp.80.2019.08.16.06.24.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Aug 2019 06:24:19 -0700 (PDT)
Subject: Re: [PATCH] hwmon/ltc2990: Generalise DT to fwnode support
To:     Max Staudt <max@enpas.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <5b9b4383-c1e9-91a6-8ab6-8f831b362dca@enpas.org>
 <20190816090731.12809-1-max@enpas.org>
 <CAMuHMdUE_3UEzOv3pmryMwuMRF7RC9-xTG8sXUbpR=r5fKUjrg@mail.gmail.com>
 <79f1e829-8fd4-6690-e429-f5b3d1a7c0bd@enpas.org>
 <CAMuHMdVBviJgxnzLbJJO8ap+=SiiN+wGOsRg4kvnV6eGpnAxKg@mail.gmail.com>
 <a44f4444-3ca5-2f63-68a5-14dc7561ce5e@enpas.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <330d6d9d-cb5e-80d3-a58d-42a8d598c7eb@roeck-us.net>
Date:   Fri, 16 Aug 2019 06:24:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a44f4444-3ca5-2f63-68a5-14dc7561ce5e@enpas.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/16/19 5:43 AM, Max Staudt wrote:
> On 08/16/2019 02:36 PM, Geert Uytterhoeven wrote:
>> Hi Max,
>>
>> On Fri, Aug 16, 2019 at 2:25 PM Max Staudt <max@enpas.org> wrote:
>>> On 08/16/2019 01:07 PM, Geert Uytterhoeven wrote:
>>>> One minor nit: as the driver no longer uses any of_*() symbols, you can replace
>>>> #include <linux/of.h> by #include <linux/property.h>.
>>>
>>> I should have thought of that, sorry.
>>>
>>> Another patch, or will you do it?
>>
>> As the patch won't go through my tree, I cannot, but the hwmon maintainer
>> might do.
> 
> As I'll be fixing one of the I2C patches, I'll send an updated hwmon patch with it.
> 

Ok, I'll wait for that patch.

Guenter

