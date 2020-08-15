Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2CA245283
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Aug 2020 23:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgHOVw0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Aug 2020 17:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgHOVwY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Aug 2020 17:52:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41C3C09B04B;
        Sat, 15 Aug 2020 08:28:31 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f10so5443988plj.8;
        Sat, 15 Aug 2020 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rTPW4Vgi6J6sb3NDeTJ+AxP/fbIZYazNxG03Qo5ugNw=;
        b=WXvmttykvtH6fdjtYt1TnuIlBjfutXTOyRQkbpvtBvRbapvHWJajQuEt2vYmCiNuZs
         yfKZbyRjKMsvOGhGQra+YWXaPdT7eY7sTeDS2ZwIsCYEBZ3wf5dm0WTK4/Ov/swSkqGk
         oVcGJSKySWigCkr5GE2+D0GTlxHxP9O+IxUlzPkTyyXn/ahZ7MXlz9gswiGk6Zo0odaX
         TwNW/AR5BJ8WTKWTPsbohx45YC9mV26A8FylnxjjxDzbn5OJmPJtqrXO+KdvldxCUdeV
         VGKUzr+J+B5wasUz+T6nWANs75ufIgARSM+M6v2uLlrTx+ydzTPBYhYIRMDRCX7iXGjb
         aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rTPW4Vgi6J6sb3NDeTJ+AxP/fbIZYazNxG03Qo5ugNw=;
        b=PZ+j7oPPZvuqajxenEg/Cppb1mc3tJAzkRcfOSrfbRREGfzgpqTFGyT1NuWn5b0Zob
         yowVec0jczbloZQRo1FwgtlkvnKOoD5E1RTZCv3iRKxF++SAyM7lrKJUOrT6hQqpCgO0
         gwKQoSGz+RWAgWfQ4MmX9j7AILn018p1XP8fscnsN0b12gYKxVnZlFUOIaBkCBpho6x7
         /9YTM2paCihWF5DodcmEZuuKJxX+l0//t1zj67XcxzheCjIJzxwKJSH6hmsafwW+X7LU
         X8zw9KYPWpQRF4sVlMQh8luASnNlyRitJrnjLErI+eyoiQ1YZBlU2ExBhvVPxTOQMr2D
         eIlw==
X-Gm-Message-State: AOAM5305CPs/zF02W6RvvtQcJGuLqI6ATPLSaLTNpjJf9qoSIwkBUQrM
        pkv5Y9O/taKYoRIieuZshSU=
X-Google-Smtp-Source: ABdhPJyKy5EqG8dNFaxmbWpREVyRWCTdpDXJADHemeJefvOP2cfgXhiEcBNUPorWbShOHPm+DXEPzg==
X-Received: by 2002:a17:90a:f481:: with SMTP id bx1mr6304176pjb.172.1597505311100;
        Sat, 15 Aug 2020 08:28:31 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id js19sm11107958pjb.33.2020.08.15.08.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2020 08:28:30 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: Fix checkpatch warnings by using 'BIT' macro
To:     Ray Jui <ray.jui@broadcom.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
References: <20200814224008.107430-1-ray.jui@broadcom.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c2c1b5e7-37a0-39fe-5bad-36ddcff9d389@gmail.com>
Date:   Sat, 15 Aug 2020 08:28:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200814224008.107430-1-ray.jui@broadcom.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/14/2020 3:40 PM, Ray Jui wrote:
> Fix additional checkpatch warnings in the iProc I2C driver by using
> 'BIT' marcro.
> 
> Reported-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
