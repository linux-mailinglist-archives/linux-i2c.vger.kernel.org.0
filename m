Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50FDD797415
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 17:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjIGPfd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 11:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbjIGPXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 11:23:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B57CA
        for <linux-i2c@vger.kernel.org>; Thu,  7 Sep 2023 08:23:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-501cba1ec0aso1790834e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 07 Sep 2023 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694100212; x=1694705012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TqHuijRTV4ZXbGmA9Qo1TZ/hd25rU6hxNZVpjlkkc4=;
        b=N078cGAgE9HJ17nR06tOzebPIAjjCHQyHZMsptfanVxcIpVwRFDK2nIVqe57OcPPu1
         gMKXuaqgczGioOAERXEDepc5rbttZbhj5PR6aLC+mjCA9PqsRiS8xpQNL+sSdQDUwT5Z
         3GdLiiceyn0/gjq4usNWJsXeP7XBrgLfMLajdImfukVyqCb6YkX7/C1LoH3r6CHRHCwg
         Pw0fZ+mIC/EZBaTLOA8h2bLUdEpeiVOTvPWJAYAPdQtLYduEVc9lIQAfG/vZz9iFpasq
         EzhWLr3EO2PAOSf6sGb97VRFErY+MK/UhfQyqxZ6l+RHKi9U82R2jLYhE3YLRxDgxiTL
         KNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100212; x=1694705012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TqHuijRTV4ZXbGmA9Qo1TZ/hd25rU6hxNZVpjlkkc4=;
        b=CkFYcotO7OoP8JQrThV/h4fqf68F3DGXiqKi6B2v6cXa4iD1VqW7QpG6XyFMS+LEL3
         S0U/R2v1GiWtWkmn7vFD+ucHUqLNzNIUuoyaI029oA4Bylz4Wz3CzytrejqACIOsjZEj
         ypTQA7h32va+CIaRlAcA+QDFeR/v+UvCcqWhNfPy7zmBiIwcAkvnDevEJtq5D0x5PwWf
         v6GbReWix9hQlZzrjkXR2ONyCuzCXBELa4kdf38sEDbAoo3ll9OJTuNY3cpZBNj7EGgm
         oiZ5cqry7I+r5bn9devQIyojJ4nNHUn991rw2YtkIujfXBC0q8pn4vNwr+7g69mFbZyQ
         VdWg==
X-Gm-Message-State: AOJu0Yz9NmmLSq0z3S+/D7OHezjMr5fb/bp5qkCq39X7QtWjOZ+VGHiC
        zqe8CyuI5Z6EVin2tpNbcr7rMPL95tQ=
X-Google-Smtp-Source: AGHT+IHvxz0Q4jnpx0E7fHkSopKytW4tFxiOp4e3+qDLAKjQLJiACWSe4Xh7qCxgTKaUnCpliwC6kA==
X-Received: by 2002:a17:907:788c:b0:9a5:846d:d820 with SMTP id ku12-20020a170907788c00b009a5846dd820mr4430437ejc.16.1694065513631;
        Wed, 06 Sep 2023 22:45:13 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd38:3b00:5015:efc2:9f2d:63f5? (dynamic-2a01-0c23-bd38-3b00-5015-efc2-9f2d-63f5.c23.pool.telefonica.de. [2a01:c23:bd38:3b00:5015:efc2:9f2d:63f5])
        by smtp.googlemail.com with ESMTPSA id lj17-20020a170906f9d100b009829dc0f2a0sm9930573ejb.111.2023.09.06.22.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 22:45:13 -0700 (PDT)
Message-ID: <439f1a0b-363e-90ff-b5b3-cb0b290df258@gmail.com>
Date:   Thu, 7 Sep 2023 07:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error path
 of probe()
To:     Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
 <20230906134745.24dfa076@endymion.delvare>
 <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
 <20230906174739.499ab821@endymion.delvare>
 <20230906182523.sncigwwmbifm4gpn@zenone.zhora.eu>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230906182523.sncigwwmbifm4gpn@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06.09.2023 20:25, Andi Shyti wrote:
> Hi Jean,
> 
>>>> I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
>>>> actually bothers people. Error paths are rarely taken, and driver
>>>> removal isn't that frequent either. Consequences are also rather
>>>> harmless (one-time resource leak, race condition which is quite
>>>> unlikely to trigger).  
>>>
>>> we are having this same discussion in another thread: if a bug is
>>> unlikely to happen, doesn't mean that there is no bug. A fix is a
>>> fix and should be backported to stable kernels.
>>
>> No. Please read:
>>
>>   https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>>
>> There is clearly a list of conditions for a commit to be eligible for
>> stable kernel trees. It's not "every fix".
> 
> I think you are putting these fixes into the ""This could be a
> problem..." type of things".
> 
> But as I see these fixes don't belong to this category, as they
> are clearing the exit path. This is a kind of fixes I want to see
> going to stable.
> 
> Which means that if we exit through that path, do we exit
> cleanly, e.g., without leaking? If the answer is "no", then this
> is a fix and should go to stable.
> 
> It belongs to "This could be a problem..." type, things like
> dev_err/dev_warn (first thing coming to my mind) or other non
> functional fixes.
> 
> Maybe this is a matter of opinion and different background. For
> the i2c side I'm in peace :-)
> 
> For the stable backport I'd love to hear another opinion.
> 
> Thanks, Jean!
> Andi

Please let me know once you come to an agreement, then I'll
submit a (hopefully) final version.

