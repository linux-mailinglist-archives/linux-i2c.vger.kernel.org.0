Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46352414F6
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 04:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgHKCbE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 22:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHKCbE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 22:31:04 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12ADBC06174A;
        Mon, 10 Aug 2020 19:31:04 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c10so829667pjn.1;
        Mon, 10 Aug 2020 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YrmOd6VYsBxeA4HmWkdR0wsjfu5WqCWHq6heMSIzewU=;
        b=GLjyr0HEEMeYzfZLEfs8euboLxhX2h8WIBGawhdJ0Wmj2roVLiobjEzTA334o655qd
         +Lf8QaFDWSj8mEP75Lb/S2JAAkMvY1pMR6plideMThmJJb3BNBs1zmZYdMA6CoXHXLXN
         RLDjFoziTcD6ar4Blq3TWEsdd1c68I5AxSPJZ9OA/s521gtI2f8OZm/Fx/9NZLMueWSG
         B1HSsaiPi45OkNJppZ+JSLWILklcT2lmpJy8Cb2lNKpknuvIa1z+aiehOPGIesFx+KmO
         tdqERmaxDPJsb4QEGXTylUAQxPto7MrqZ4ifIgnfPFCuO2lzLBK/2IhFKULfP0bGwBAv
         Geaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YrmOd6VYsBxeA4HmWkdR0wsjfu5WqCWHq6heMSIzewU=;
        b=tEa9jSBEZuGu241JN2bE0sEkvyCWUudQ37WHyO8VXXzxsNC90EuVtUXTW9CgN2kh8P
         OW2bbnPVAMO/uKzMKKrohfg/6rPSHf6RseFYB/jvlH1IwFyqiTmdfgmjy0LlqtULnSE4
         oN591TyvY4Q+A+YRne7FEdMcvytU10o/q1sahfrmZ0iqaNjcKtlddIM3AsIUdHu14qgP
         4SH8bukU+aWbF7XkaallkvbwfY/U9dqt87+JJ7Xq95eBOjljBlxbI5u/OrZz/rP7zjMV
         k03RUpNmXhZ8+TFgJyJnf/MEE2ghnyi3BwxA+rPiZiE3zxpB7Pvfn6VumYUgSZrG1vRt
         QEUQ==
X-Gm-Message-State: AOAM533ooQFLxwY2DQlMph1l5Gjggj5b2OpH/h/sScYmWXIogpAIk79k
        lcFFIBkX0/FSw0Imbo5y19A=
X-Google-Smtp-Source: ABdhPJwOaUJin4V1AXI+DSZIrGGA9wu2kqfhZ9JqLdXn1nINUwvApruRO3Y5B/8wB/C8Cu1O0rSiJg==
X-Received: by 2002:a17:90a:2224:: with SMTP id c33mr2285430pje.56.1597113063374;
        Mon, 10 Aug 2020 19:31:03 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h5sm23666430pfq.146.2020.08.10.19.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 19:31:02 -0700 (PDT)
Subject: Re: [PATCH v3] i2c: iproc: fix race between client unreg and isr
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <69576821-1e8e-51c2-6c15-5774ca598c36@gmail.com>
Date:   Mon, 10 Aug 2020 19:30:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/10/2020 5:42 PM, Dhananjay Phadke wrote:
> When i2c client unregisters, synchronize irq before setting
> iproc_i2c->slave to NULL.
> 
> (1) disable_irq()
> (2) Mask event enable bits in control reg
> (3) Erase slave address (avoid further writes to rx fifo)
> (4) Flush tx and rx FIFOs
> (5) Clear pending event (interrupt) bits in status reg
> (6) enable_irq()
> (7) Set client pointer to NULL
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000318
> 
> [  371.020421] pc : bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.025098] lr : __handle_irq_event_percpu+0x6c/0x170
> [  371.030309] sp : ffff800010003e40
> [  371.033727] x29: ffff800010003e40 x28: 0000000000000060
> [  371.039206] x27: ffff800010ca9de0 x26: ffff800010f895df
> [  371.044686] x25: ffff800010f18888 x24: ffff0008f7ff3600
> [  371.050165] x23: 0000000000000003 x22: 0000000001600000
> [  371.055645] x21: ffff800010f18888 x20: 0000000001600000
> [  371.061124] x19: ffff0008f726f080 x18: 0000000000000000
> [  371.066603] x17: 0000000000000000 x16: 0000000000000000
> [  371.072082] x15: 0000000000000000 x14: 0000000000000000
> [  371.077561] x13: 0000000000000000 x12: 0000000000000001
> [  371.083040] x11: 0000000000000000 x10: 0000000000000040
> [  371.088519] x9 : ffff800010f317c8 x8 : ffff800010f317c0
> [  371.093999] x7 : ffff0008f805b3b0 x6 : 0000000000000000
> [  371.099478] x5 : ffff0008f7ff36a4 x4 : ffff8008ee43d000
> [  371.104957] x3 : 0000000000000000 x2 : ffff8000107d64c0
> [  371.110436] x1 : 00000000c00000af x0 : 0000000000000000
> 
> [  371.115916] Call trace:
> [  371.118439]  bcm_iproc_i2c_isr+0x530/0x11f0
> [  371.122754]  __handle_irq_event_percpu+0x6c/0x170
> [  371.127606]  handle_irq_event_percpu+0x34/0x88
> [  371.132189]  handle_irq_event+0x40/0x120
> [  371.136234]  handle_fasteoi_irq+0xcc/0x1a0
> [  371.140459]  generic_handle_irq+0x24/0x38
> [  371.144594]  __handle_domain_irq+0x60/0xb8
> [  371.148820]  gic_handle_irq+0xc0/0x158
> [  371.152687]  el1_irq+0xb8/0x140
> [  371.155927]  arch_cpu_idle+0x10/0x18
> [  371.159615]  do_idle+0x204/0x290
> [  371.162943]  cpu_startup_entry+0x24/0x60
> [  371.166990]  rest_init+0xb0/0xbc
> [  371.170322]  arch_call_rest_init+0xc/0x14
> [  371.174458]  start_kernel+0x404/0x430
> 
> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> 
> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
