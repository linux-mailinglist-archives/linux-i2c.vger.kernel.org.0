Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87DD7098CE
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 15:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjESN4v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 09:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjESN4u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 09:56:50 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DABCA;
        Fri, 19 May 2023 06:56:49 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ae4e49727eso32998045ad.1;
        Fri, 19 May 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684504609; x=1687096609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kjx7zMz+PLPU+vzhqT3/wZhMtjfZaSMHpTNHBjtGTg=;
        b=TY0wzD3Ohj62PidnLZ6GCyPoGXmHT9H61FisfKB8pOlFmjjl7lwc9XDc/UHqskBmJI
         +Xj8P4zGVUm+NYxFx208kbFWhctob1zWwcmqjgoVvCUdmKFE7DT/jR2q/cDGEpT6moCy
         eH/qAhfDvMox23rE5PBXKbQhfvJ1sUv5tvglgARQjAN7zdA5frzbcrVTqy+SBOwoovOg
         ftmWWSoyUDcA701elQBPYi80uxeSN7SmT+BU97P3qUm/I/j9Ye4ugH7x6hcR+7CcMqlk
         V9RCHT59kv7CFHujZsFctv/jDp+LZQ+zQOLZskcktdDc1egMrH70GWVuFBEOt3ZojE6U
         QH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684504609; x=1687096609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kjx7zMz+PLPU+vzhqT3/wZhMtjfZaSMHpTNHBjtGTg=;
        b=BxPtlTcyZlSjmwE/OGluG/raH8MLeellBKdqMxNGxhAQNxhz+crBA3/U67cTMWmX7e
         4Ic6/OdsuCLNrWhIc6fJfdN/i9fMrxlnpZysenM0dPyaVDZtIS/UTY+r8HVt+f3ZjkpA
         V05nXfftkoNZn1wUIcqRI/Q0lttIB+Lrewc38LaM0ZVSvhgdt+AYZRdHGopXvcd1TAOL
         AsP9eFxUmzWuIOcNvU+LQyjvOEIX3NquIjpyljUULna0+YCHCT1xBum9uc+RSJvIBFPV
         Pdr7n3Ick5q/NaiI6d9f+WkRu9h7V2UfRI3UHj5rFgqw8h5TiE3XJkY4gbHXsTON/gfh
         /NFQ==
X-Gm-Message-State: AC+VfDyxBwYWibE/swoIlhwWCWltFNzXsDMjVSWvP4isLdqLNUB/84at
        blWVZqZS0/bCVgKSnvT3Fro=
X-Google-Smtp-Source: ACHHUZ4XUvfR0MKHNn2zDk9Z/od/cQuR/IYdbqtjUpVefshpyTjYXUPEYg3O7tq74M8KzWJhUV/5dQ==
X-Received: by 2002:a17:902:ecd0:b0:1a1:b3bb:cd5b with SMTP id a16-20020a170902ecd000b001a1b3bbcd5bmr2662421plh.62.1684504608941;
        Fri, 19 May 2023 06:56:48 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-19.three.co.id. [116.206.28.19])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c21300b001ae626afed4sm1467376pll.220.2023.05.19.06.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:56:48 -0700 (PDT)
Message-ID: <31454cb5-0ca9-2179-f9da-02a18722eb8b@gmail.com>
Date:   Fri, 19 May 2023 20:56:43 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
To:     Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux i2c Devices <linux-i2c@vger.kernel.org>,
        Benjamin Tissoires <btissoir@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kolAflash@kolahilft.de
References: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
 <2d7ee116-5985-021f-0dfb-b0485a465c86@redhat.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2d7ee116-5985-021f-0dfb-b0485a465c86@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/19/23 20:46, Hans de Goede wrote:
> Hi All,
> 
> This looks like something for Benjamin Tissoires (who will
> be available to look at this in 2 weeks or so) to look at.
> 
> Adding Benjamin to the Cc.
> 
> In the mean time passing psmouse.synaptics_intertouch=0 on the
> kernel commandline should restore the old 4.19 kernel behavior
> of simply using the touchpad in ps/2 mode.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

