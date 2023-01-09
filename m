Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F350E6624F7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbjAIMDx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237083AbjAIMDv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13B41A060
        for <linux-i2c@vger.kernel.org>; Mon,  9 Jan 2023 04:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673265783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q4zLyIG7p1EQVcpYB9xbouaznWvWNmBJl4w7V/27n8I=;
        b=MIgIj38q9BE+zsfFArVUsyt4kSw1e+/Kk/41BaBxHQAi0OmvxpJSrVrtjqlGqdcDmNuFy2
        EchyNf4CDVA1/s72T4o7L37e6B84rgGg6/85PXOQxZsA6p56wPbp83OvVdcMpgOWaoVII5
        KHASUvWge7ghoQ1A5n/QH6zIkTY2Xng=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-FPS8Lo_lP1SIWWoBrLOzcQ-1; Mon, 09 Jan 2023 07:03:00 -0500
X-MC-Unique: FPS8Lo_lP1SIWWoBrLOzcQ-1
Received: by mail-ed1-f69.google.com with SMTP id h18-20020a05640250d200b004758e655ebeso5106156edb.11
        for <linux-i2c@vger.kernel.org>; Mon, 09 Jan 2023 04:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4zLyIG7p1EQVcpYB9xbouaznWvWNmBJl4w7V/27n8I=;
        b=rB1utXgtZUNL78Bn5zoFO8xEU8IqXDkWlAqqfVUKQr3mhxnDIIcE1DBPQwQqlFb4bG
         Ic47wei4YEZWvYGP32YSsvk0rww3MW9DFXXIVWr1st3a2QicBUvgRMVs9EDJsBOWu8PG
         SSaDvTUPEzBY40ayGY0TLDQp5cBy/rQ30cvYCWCXuygx7myFPNiBrxeQinQ/jNVEKjP3
         ppz8IG1ypZ0kP7BRAFPxwyVF0dhlZutHpRgclO2/hRQ0yHMwJJY/42HQSOskJdhoRtQy
         9kxFG4V/E79ByFjIAatxxfFxMVFjUaF4HVq5Kajm8qMN5kd5OpuqsfxPbt/JkyBYGvxl
         knSA==
X-Gm-Message-State: AFqh2kr2cFE+K+tNqZ8g8OELHcs1EQx7IUQebJ5Vc99PkWug5snndAh9
        FMetdae1XosIf+U3BtAoCq8hTtRdlcmby0IFfvfhoSmnOM4Bf7qj/Yptl0kIowgJkgJRmjb68Zv
        fHXRJi5gyjWv2eHsNWFQW
X-Received: by 2002:a17:907:a0cc:b0:78d:f455:b5fa with SMTP id hw12-20020a170907a0cc00b0078df455b5famr54858188ejc.58.1673265779403;
        Mon, 09 Jan 2023 04:02:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXunflF7rFCOUFP3DL+Uc+xS5o03+N3JiS2BecKqY3RR6YoRGrgqnfqDT/Z6AlX9El9oeWoAvA==
X-Received: by 2002:a17:907:a0cc:b0:78d:f455:b5fa with SMTP id hw12-20020a170907a0cc00b0078df455b5famr54858176ejc.58.1673265779238;
        Mon, 09 Jan 2023 04:02:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c39-20020a509faa000000b00483cccdfeaesm3712742edf.38.2023.01.09.04.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 04:02:58 -0800 (PST)
Message-ID: <ab037c11-b0d3-96fc-46cc-858cce6eb35c@redhat.com>
Date:   Mon, 9 Jan 2023 13:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US, nl
To:     Wolfram Sang <wsa@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221219130145.883309-1-rf@opensource.cirrus.com>
 <Y7wCLAJxuR38qJNI@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y7wCLAJxuR38qJNI@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/9/23 13:01, Wolfram Sang wrote:
> On Mon, Dec 19, 2022 at 01:01:45PM +0000, Richard Fitzgerald wrote:
>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>> i2c_mark_adapter_resumed().
>>
>> dw_i2c_plat_resume() must always be called, so that
>> i2c_mark_adapter_resumed() is called. This is not compatible with
>> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
>>
>> Since the controller is always resumed on system resume the
>> dw_i2c_plat_complete() callback is redundant and has been removed.
>>
>> The unbalanced suspended flag was introduced by commit c57813b8b288
>> ("i2c: designware: Lock the adapter while setting the suspended flag")
>>
>> Before that commit, the system and runtime PM used the same functions. The
>> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
>> had been in runtime-suspend. If system resume was skipped, the suspended
>> flag would be cleared by the next runtime resume. The check of the
>> suspended flag was _after_ the call to pm_runtime_get_sync() in
>> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
>> the flag before it was checked.
>>
>> Having introduced the unbalanced suspended flag with that commit, a further
>> commit 80704a84a9f8
>> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")
>>
>> changed from using a local suspended flag to using the
>> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
>> checked by I2C core code before issuing the transfer to the bus driver, so
>> there was no opportunity for the bus driver to runtime resume itself before
>> the flag check.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Does this fix a bug when runtime resuming? This is not clear to me. I
> tend to put it to for-next rather than for-current.

This fixes a system suspend/resume bug, so this really should go
to for-current.

Regards,

Hans


