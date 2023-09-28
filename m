Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526F67B1C18
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 14:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjI1MU7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 08:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjI1MU6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 08:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00DE19F
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695903610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l3smEwL+UI6+Q/2dCb7QvgQWyJ40TpMV2o0vHCJMrgA=;
        b=BiSkhXMQHbVg3Yv4HOz0uhaHZA98FvKgvVyJZz+TMwVmcLOyOF2RQbrXoQKYX8D3sTHIgi
        74HZ7IYg0j8a4GAwq9t3mG070sXmnkYAL2HV1wwT1OcJslCKnLPPmJc95LBxcRYokTPhwb
        T+CDJ2I2DW3lMzvkhbMLl6fKnatl8s8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-X1_D3zBfPbG5I8tOZXVvsQ-1; Thu, 28 Sep 2023 08:20:09 -0400
X-MC-Unique: X1_D3zBfPbG5I8tOZXVvsQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-53464f1f055so4442675a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 05:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695903608; x=1696508408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3smEwL+UI6+Q/2dCb7QvgQWyJ40TpMV2o0vHCJMrgA=;
        b=hetDXv60NGv9iaDAoXPi1JxDfSWym3SrF89lvpCzwgg0v4+EC+GQbm9zTEykRG2zqi
         ADoHR3FW14i2SBhtpkTwLn8QO36dWH/0Ku9U88fn/wbhXn9DjyxZGHl1tig69R28dFj8
         IfCPfXIxgoMQT1y24hOmCGLCfRP2CZNA8R9FFWHN9HTF9HxdZkf6l5TWT/Oc73fwFh78
         Ew0f3PshnB1eotNYKVQmUQxG+YXvQ/l1vsZYYUJJ28AXDfEhN7VYHeRq1SeTpXW/aMIz
         tfSXpyYkNFBT1j5LEHvgeaAsqTdseK9wGYUdX1yFKmyA8hFnaVnJcOez/uyWZ2gAmvkd
         rHFA==
X-Gm-Message-State: AOJu0YzRCa2gUVqn4zlgmWqXb8yOhz4Otm4tNOMS3F0jp+2G9o1J3VMq
        ysrG6EXfIA5F6d/5QYpeN0PoVrM9cq9i7HT6gl+OJH1qgqBPB1TpwKoHjUVzwvjjbFJ3RunLc5K
        B3nZfnI5Qj4YQh9S8V1Ct
X-Received: by 2002:a05:6402:164a:b0:52f:a44e:601d with SMTP id s10-20020a056402164a00b0052fa44e601dmr1096057edx.9.1695903608315;
        Thu, 28 Sep 2023 05:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyO5ErgFLWf8MDBzpoDNHA/Wzf+KuJdstEciFIl3FORrSyJ3myzBVY3wU2I8qm2ccDL23Nsw==
X-Received: by 2002:a05:6402:164a:b0:52f:a44e:601d with SMTP id s10-20020a056402164a00b0052fa44e601dmr1096041edx.9.1695903608017;
        Thu, 28 Sep 2023 05:20:08 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d6d2000000b0052febc781bfsm9608018edr.36.2023.09.28.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:20:07 -0700 (PDT)
Message-ID: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
Date:   Thu, 28 Sep 2023 14:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
To:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Content-Language: en-US
In-Reply-To: <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/28/23 12:18, Oliver Neukum wrote:
> On 17.09.23 13:26, Hans de Goede wrote:
>  
>> Note I did not ask for a new version to be send right away, but
>> I'm afraid there has been a bit of miscommunication and instead
>> of rebasing the next version based on further review Wentong has
>> send out a new rebased version immediately, sorry about that.
> 
> Hi,
> 
> what to do now? It's been ten days.
> I am sure this driver has been very thoroughly reviewed by now.
> We are dragging this out. Do we want the developer to do another release
> or do we ask Greg to take it as is?
> This is becoming almost comical, but that is not what we want driver
> submission to be.
> 
> As far as I am concerned on the USB side everything is fine now.
> Hans? Greg?

Note I have been mostly involved in testing these patches I have
*not* thoroughly reviewed them. I have taken a quick(ish) look
which did not find anything obviously wrong.

I agree that at least patch 1/4 is ready for merging. I'm
not sure if Greg should pick-up the entire series or if
the rest should be merged through there relevant subsystems
to also give the relevant subsys maintainer tree.

For the series:

Acked-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

