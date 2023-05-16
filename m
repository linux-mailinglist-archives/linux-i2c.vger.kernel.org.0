Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA7A7058DD
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 22:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjEPU3Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 16:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjEPU3Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 16:29:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658B7D1
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 13:29:13 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3078c092056so7974907f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 13:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684268952; x=1686860952;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pV3wsfLj4fCvqz4jn5neaJnVD2zXKHXU3n5Hwd+QuTQ=;
        b=Ycn10cpcGUXm34WSVYTsGFggi004en+CQALpfXqQe+xgh07D7VBri6/CnpFfo1wW/E
         dljibmocgXVjoyw340nbtBAlkOj+dpl0nMiyMuVsYeDn2qwsKzkTdAB6/96wDzui7GZY
         Y+EWXLUJJo71ryBMAyPDb/AOvoSzHsKpnVFv3s5JHlPkQKOGygP+PXd6MrUhuHbtgRU3
         71zjky/FiwsgP/UARZNZgk+fkY3dO1UiZU2sPT8V6MtWCU0N+BJ7rr9tAaGAnKs9k/dI
         mzTtTT9b4R+Yjj71kgIdwbaji7DGsmV5YdOQd0eZm/1gLcitpwJR/HEV4WGR0N854twy
         H2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684268952; x=1686860952;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pV3wsfLj4fCvqz4jn5neaJnVD2zXKHXU3n5Hwd+QuTQ=;
        b=UE/56WJCNPjuYa6LdTw5+JdmVb2rUsZWq8C7CrCq59pywxcpeqNlF87qirCBeJtPyK
         wp7iigjTXC/6O//OfoFIJW7N81aZ8vz9RQxCjlIdIGjq+QognKgjrmdrExNZDlHS479Q
         5iqTzp41452eouSCWNmbPBJG41X8InVppsnxjAAIo0V9TjsLPWk4nn+64d/Xk97o4Fyz
         13Z0X+4HdhZ3ArmQMtsPyaswdQ55J22LgnOndW1z7Sd44jHiMpSIw30SuYYgRD6dtLOC
         Pk5RRsi3U+s9HL3AarkZyFLVe1lijY/VZFkGmccQMbqOOT0RvCnk/D1YlkXXl4CuLNxp
         CAGQ==
X-Gm-Message-State: AC+VfDxdrPDOoY7piJb58i+6CK91mXMFgKX6ecsBCq1oYyszaLSlO5Z2
        C+mJAKxBGuzCzCUckhmzd999aSdTpjI=
X-Google-Smtp-Source: ACHHUZ4k+ho85hP2K4Y8sLujJVEUmCjiXipRIu4qt1kivBslrJ02qdhpui8+diPUEO1aom4J8uFxiQ==
X-Received: by 2002:a5d:5191:0:b0:306:2a21:b5ff with SMTP id k17-20020a5d5191000000b003062a21b5ffmr23355308wrv.17.1684268951514;
        Tue, 16 May 2023 13:29:11 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9071:700:e9b8:e93:a667:edcd? (dynamic-2a02-3100-9071-0700-e9b8-0e93-a667-edcd.310.pool.telefonica.de. [2a02:3100:9071:700:e9b8:e93:a667:edcd])
        by smtp.googlemail.com with ESMTPSA id r5-20020a5d4e45000000b002f28de9f73bsm393265wrt.55.2023.05.16.13.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 13:29:10 -0700 (PDT)
Message-ID: <a60178ab-effc-6602-202a-d2e89c3e9d29@gmail.com>
Date:   Tue, 16 May 2023 22:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] i2c: i801: next set of improvements
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
Content-Language: en-US
In-Reply-To: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04.03.2023 22:30, Heiner Kallweit wrote:
> Next set of improvements.
> 
> Heiner Kallweit (4):
>   i2c: i801: Use i2c_mark_adapter_suspended/resumed
>   i2c: i801: Replace acpi_lock with I2C bus lock
>   i2c: i801: Improve i801_block_transaction_byte_by_byte
>   i2c: i801: Switch to new macro DEFINE_SIMPLE_DEV_PM_OPS
> 
>  drivers/i2c/busses/i2c-i801.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
Jean, any chance to have a look at it?

