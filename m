Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA324FB4D5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Apr 2022 09:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245431AbiDKHdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Apr 2022 03:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245508AbiDKHcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Apr 2022 03:32:53 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2AB2707
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:30:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u17-20020a05600c211100b0038eaf4cdaaeso2809312wml.1
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=uISV79NvLNC/cTXlwSWYKI9FmQgaA5KuUdHffG+BjtM=;
        b=xtJTG2AyZ6TVnMvpiP9AMoK5zkE2H+zCJg/Qzf9fsJJ5h/R7PHZJ/Vh+O78/tzzdav
         TsCBWxEN2UPcJNv8FVsNrnIzbzW/I0SoDjM3UCIDH+I5xr8VFlHXhKrJ+mznSvMWKP8v
         jVALcDYUM8PZRLkZlr3FiizhOmdQv69f8PbY/FhL1dzfnHjptOlVuwvABUbYk4KbrFFD
         jDLP3/zMWYap/myIa+OYEq2OeT44nB18NGMtSGz028/ppvYUV3xjKWoMnCdtemqITLa1
         aZG8MnDrSLBMSF7OEhbXsSqKsdSxdHA0FYztkyicfofIZbUe7XNoaZaSWCc3lA2vAwhS
         UGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=uISV79NvLNC/cTXlwSWYKI9FmQgaA5KuUdHffG+BjtM=;
        b=J8dK5TdxbyngiJtlmrnA+SHdj5yUFxjE9lzfHQTIEcoQ3JM2+zXfskuKCn7ZJAFb1/
         SfRMyR+xqWGoHIJgZzKPtE3oS/020mqQSr2zf2lwlVpbo03akBh8Wt+UVMyKztNwxjd3
         64cKRPvx3xiwo1Ui7wrb88b3RnoCP56mnRfY4M6e7ZaaOu8KPM5MbX5Npe1XkbVSZS0K
         k3hMXC1ksOB96Q9yo5QiOMT4wmthIGNBl7it3BrF1+40xGQfrUb/jHcS/z0QCZZ/On63
         kedsVzRLPCh5XsyDm9RQKKOTCTLeL65qds07Jmy3UJb10PLiSjf9HDqpQysYGYSEhSq+
         nSZg==
X-Gm-Message-State: AOAM530EwM6IA98Ynopll4hk+k/znCFRKiUn8U2Rc8n2MICBIGtjNC+w
        dwrJfANWy5PwVa1mNp8q3ZhLcw==
X-Google-Smtp-Source: ABdhPJwOXW+WzVKvrz3aqfcwW9FTHjL6+X6jqzSqvA+Ks+EoDztLWLgGezxyGTYlTNb1sSKh7vawwA==
X-Received: by 2002:a7b:c155:0:b0:38e:b840:c99e with SMTP id z21-20020a7bc155000000b0038eb840c99emr5336807wmi.201.1649662238098;
        Mon, 11 Apr 2022 00:30:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5? ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d5888000000b002079f95ca87sm5593940wrf.68.2022.04.11.00.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 00:30:37 -0700 (PDT)
Message-ID: <7458df77-2721-71a5-893f-8247f05be765@baylibre.com>
Date:   Mon, 11 Apr 2022 09:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] Ensure High and Low periods of SCL are correct
Content-Language: en-US
To:     Lucas Tanure <tanure@linux.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-1-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 09/04/2022 18:43, Lucas Tanure wrote:
> The default duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL clock at
> 100KHz bus speed.
> 
> So, for 100Khz or less, use 50%H/50%L duty cycle, and
> for the clock above 100Khz, use 40%H/60%L duty cycle.
> That ensures the low period of SCL is always more than
> the minimum required by the specs at any given frequency.
> 
> I did a few measures on the Khadas Vim3 board:
> 
> i2c_AO (i2c@5000):
> 
> Before the patchset, I got:
> - 100KHz: 3.338us HIGH, 6.746us LOW, 33%/67%, Freq 99KHz (Not Valid tHIGH < 4.0us)
> - 400KHz: 860ns HIGH, 1.734us LOW, 33.15%/62.85%, Freq 385.505KHz (Valid)
> - 1000KHz: 362ns HIGH, 732ns LOW, 33.09%/66.91%, Freq 914.077KHz (Valid)
> 
> With the patchset
> - 100KHz: 4.952us HIGH, 5.134us LOW, 49%/51%, Freq 99KHz (Valid)
> - 400KHz: 966ns HIGH, 1.628us LOW, 37.24%/62.76%, Freq 385.505KHz (Valid)
> - 1000KHz: 372ns HIGH, 720ns LOW, 34.07%/65.93%, Freq 915.741KHz (Valid)
> 
> i2c3 (i2c@1c000):
> 
> Before the patchset, I got:
> - 100KHz: 3.348us HIGH, 6.704us LOW, 33%/67%, Freq 99.5KHz (Not Valid tHIGH < 4.0us)
> - 400KHz: 864ns HIGH, 1.69us LOW, 33.83%/62.17%, Freq 391.543KHz (Valid)
> - 1000KHz: 360ns HIGH, 690ns LOW, 34.29%/65.71%, Freq 952.381KHz (Valid)
> 
> With the patchset
> - 100KHz: 4.958us HIGH, 5.092us LOW, 49%/51%, Freq 99KHz (Valid)
> - 400KHz: 970ns HIGH, 1.582us LOW, 38%/62%, Freq 391.85KHz (Valid)
> - 1000KHz: 370ns HIGH, 680ns LOW, 35.24%/64.76%, Freq 952.57KHz (Valid)
> 
> v2 changelog:
>   - Keep the previous calculation for Meson6
>   - Use I2C_MAX_STANDARD_MODE_FREQ
>   - move the comment before the if()
>   - use FIELD_PREP for setting div_l
>   - Drop removal of meson_i2c_data
> 
> Previous versions:
>   V1: https://lkml.org/lkml/2022/3/26/109
> 
> Lucas Tanure (2):
>    i2c: meson: Use _SHIFT and _MASK for register definitions
>    i2c: meson: Use 50% duty cycle for I2C clock
> 
>   drivers/i2c/busses/i2c-meson.c | 111 ++++++++++++++++++++++++---------
>   1 file changed, 82 insertions(+), 29 deletions(-)
> 

Thanks a lot for the timings !

I think it's ok to be applied,

Neil
